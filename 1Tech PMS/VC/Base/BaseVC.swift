//
//  BaseVC.swift
//  Quicoon
//
//  Created by Bhavesh Gupta on 19/07/23.
//

import UIKit

class BaseVC: UIViewController {
    
    private lazy var backBtnItem: UIBarButtonItem = {
        UIBarButtonItem(image: UIImage(named: "back_btn"), style: .plain, target: self, action: #selector(goBack))
    }()
    
    private lazy var sideMenuBtn: UIBarButtonItem = {
        let barBtn = UIBarButtonItem(image: UIImage(named: "side_menu")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(revealSideMenu))
        return barBtn
    }()
    
    private lazy var rightBtnItem: UIBarButtonItem = {
        let btnIcon = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        btnIcon.backgroundColor = .primary()
        btnIcon.rounded()
        btnIcon.setTitle("BG", for: .normal)
        btnIcon.addTarget(self, action: #selector(showProfileView), for: .touchUpInside)
        return UIBarButtonItem(customView: btnIcon)
    }()
    
    private lazy var addBtnItem: UIBarButtonItem = {
        let btnIcon = UIButton(frame: CGRect(x: 0, y: 0, width: 35, height: 35))
        btnIcon.backgroundColor = .clear
        btnIcon.setTitle("+", for: .normal)
        btnIcon.addTarget(self, action: #selector(addClientClicked), for: .touchUpInside)
        return UIBarButtonItem(customView: btnIcon)
    }()
    
    private lazy var appearance: UINavigationBarAppearance = {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .navBarBackground()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        return appearance
    }()
        
    private var sideMenuVC: SideMenuVC!
    private var sideMenuShadowView: UIView!
    private let paddingForRotation: CGFloat = 0
    private var isExpanded = false
    private var draggingIsEnabled = false
    private var panBaseLocation: CGFloat = 0.0
    // Expand/Collapse the side menu by changing trailing's constant
    private var sideMenuTrailingConstraint: NSLayoutConstraint!
    private var revealSideMenuOnTop = true
    private lazy var sideMenuRevealWidth: CGFloat = view.bounds.width
    
    var hideSideMenu = false
    var showAddBtn = false
    var gestureEnabled: Bool = true
    
    override func viewDidLoad() {
        self.view.backgroundColor = .primary(light: true)
        self.setupSideMenu()
    }
    
    override func viewWillLayoutSubviews() {
        setupNavBar()
    }
    
    //MARK: NavigationBar Setup
    private func setupNavBar() {
        if let _ = self.navigationController {
            self.navigationController?.navigationBar.tintColor = .white
            self.navigationController?.navigationBar.barTintColor = .navBarBackground()
            self.navigationController?.navigationBar.backgroundColor = .navBarBackground()
            navigationController?.navigationBar.standardAppearance = appearance
            self.navigationItem.hidesBackButton = true
            
            //            var leftBarItems = [UIBarButtonItem]()
            //            if navVC.viewControllers.count > 1 {
            //                leftBarItems.append(backBtnItem)
            //            }
            //            else {
            //                leftBarItems.append(sideMenuBtn)
            //            }
            if !hideSideMenu {
                self.navigationItem.leftBarButtonItem = sideMenuBtn
            }
            else {
                self.navigationItem.hidesBackButton = false
            }
            if showAddBtn {
                self.navigationItem.rightBarButtonItems = [rightBtnItem, addBtnItem]
            }
            else {
                self.navigationItem.rightBarButtonItem = rightBtnItem
            }
            self.navigationItem.title = self.title
            
        }
    }
    
    private func setupSideMenu() {
        // Shadow Background View
        self.sideMenuShadowView = UIView(frame: self.view.bounds)
        self.sideMenuShadowView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.sideMenuShadowView.backgroundColor = .black
        self.sideMenuShadowView.alpha = 0.0
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TapGestureRecognizer))
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.delegate = self
        self.sideMenuShadowView.addGestureRecognizer(tapGestureRecognizer)
        if self.revealSideMenuOnTop {
            view.insertSubview(self.sideMenuShadowView, at: 1)
        }

        // Side Menu
        self.sideMenuVC = SideMenuVC.loadVC(role: .member)
        self.sideMenuVC.delegate = self
//        self.sideMenuViewController.defaultHighlightedCell = 0 // Default Highlighted Cell
        view.insertSubview(self.sideMenuVC!.view, at: self.revealSideMenuOnTop ? 2 : 0)
        addChild(self.sideMenuVC!)
        self.sideMenuVC!.didMove(toParent: self)

        // Side Menu AutoLayout
        self.sideMenuVC.view.translatesAutoresizingMaskIntoConstraints = false

        if self.revealSideMenuOnTop {
            self.sideMenuTrailingConstraint = self.sideMenuVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -self.sideMenuRevealWidth - self.paddingForRotation)
            self.sideMenuTrailingConstraint.isActive = true
        }
        
        NSLayoutConstraint.activate([
            self.sideMenuVC.view.widthAnchor.constraint(equalToConstant: self.sideMenuRevealWidth),
            self.sideMenuVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            self.sideMenuVC.view.topAnchor.constraint(equalTo: view.topAnchor)
        ])

        // Side Menu Gestures
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        panGestureRecognizer.delegate = self
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    private func setupTitleView() {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "logo_bold"))
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    @objc private func goBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func showProfileView() {
        let vc = ProfileVC.loadVC(role: .notLoggedIn)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func addClientClicked() {
        let vc = CreateClientVC.loadVC(role: .member)
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension BaseVC {
    @objc func keyboardWillAppear(_ notification: Notification) {
        let userInfo: NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (userInfo.object(forKey: UIResponder.keyboardFrameEndUserInfoKey)! as AnyObject).cgRectValue.size
        
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions(), animations: {
            self.view.frame.origin.y = -keyboardSize.height
        })
    }
    
    @objc func keyboardWillDisappear(_ notification: Notification) {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIView.AnimationOptions(), animations: {
            self.view.frame.origin.y = 0
        })
    }
}

extension BaseVC {
    
    // Keep the state of the side menu (expanded or collapse) in rotation
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate { _ in
            if self.revealSideMenuOnTop {
                self.sideMenuTrailingConstraint.constant = self.isExpanded ? 0 : (-self.sideMenuRevealWidth - self.paddingForRotation)
            }
        }
    }

    func animateShadow(targetPosition: CGFloat) {
        UIView.animate(withDuration: 0.5) {
            // When targetPosition is 0, which means side menu is expanded, the shadow opacity is 0.6
            self.sideMenuShadowView.alpha = (targetPosition == 0) ? 0.6 : 0.0
        }
    }

    // Call this Button Action from the View Controller you want to Expand/Collapse when you tap a button
    @objc func revealSideMenu() {
        self.sideMenuState(expanded: self.isExpanded ? false : true)
    }

    func sideMenuState(expanded: Bool) {
        if expanded {
            self.animateSideMenu(targetPosition: self.revealSideMenuOnTop ? 0 : self.sideMenuRevealWidth) { _ in
                self.isExpanded = true
            }
            // Animate Shadow (Fade In)
            UIView.animate(withDuration: 0.5) { self.sideMenuShadowView.alpha = 0.6 }
        }
        else {
            self.animateSideMenu(targetPosition: self.revealSideMenuOnTop ? (-self.sideMenuRevealWidth - self.paddingForRotation) : 0) { _ in
                self.isExpanded = false
            }
            // Animate Shadow (Fade Out)
            UIView.animate(withDuration: 0.5) { self.sideMenuShadowView.alpha = 0.0 }
        }
    }
    
    func animateSideMenu(targetPosition: CGFloat, completion: @escaping (Bool) -> ()) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: .layoutSubviews, animations: {
            if self.revealSideMenuOnTop {
                self.sideMenuTrailingConstraint.constant = targetPosition
                self.view.layoutIfNeeded()
            }
            else {
                self.view.subviews[1].frame.origin.x = targetPosition
            }
        }, completion: completion)
    }
}

extension BaseVC: SideMenuVCDelegate {

    func showVC(vc: UIViewController) {
        // Remove the previous View
        for subview in view.subviews {
            if subview.tag == 99 {
                subview.removeFromSuperview()
            }
        }
        vc.view.tag = 99
        view.insertSubview(vc.view, at: 1)
        addChild(vc)
        DispatchQueue.main.async {
            vc.view.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                vc.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                vc.view.topAnchor.constraint(equalTo: self.view.topAnchor),
                vc.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                vc.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
        }
        revealSideMenu()
        if !self.revealSideMenuOnTop {
            if isExpanded {
                vc.view.frame.origin.x = self.sideMenuRevealWidth
            }
            if self.sideMenuShadowView != nil {
                vc.view.addSubview(self.sideMenuShadowView)
            }
        }
        vc.didMove(toParent: self)
    }
}

extension BaseVC: UIGestureRecognizerDelegate {
    @objc func TapGestureRecognizer(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            if self.isExpanded {
                self.sideMenuState(expanded: false)
            }
        }
    }

    // Close side menu when you tap on the shadow background view
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.isDescendant(of: self.sideMenuVC.view))! {
            return false
        }
        return true
    }
    
    // Dragging Side Menu
    @objc private func handlePanGesture(sender: UIPanGestureRecognizer) {
        
        guard gestureEnabled == true else { return }

        let position: CGFloat = sender.translation(in: self.view).x
        let velocity: CGFloat = sender.velocity(in: self.view).x

        switch sender.state {
        case .began:

            // If the user tries to expand the menu more than the reveal width, then cancel the pan gesture
            if velocity > 0, self.isExpanded {
                sender.state = .cancelled
            }

            // If the user swipes right but the side menu hasn't expanded yet, enable dragging
            if velocity > 0, !self.isExpanded {
                self.draggingIsEnabled = true
            }
            // If user swipes left and the side menu is already expanded, enable dragging
            else if velocity < 0, self.isExpanded {
                self.draggingIsEnabled = true
            }

            if self.draggingIsEnabled {
                // If swipe is fast, Expand/Collapse the side menu with animation instead of dragging
                let velocityThreshold: CGFloat = 550
                if abs(velocity) > velocityThreshold {
                    self.sideMenuState(expanded: self.isExpanded ? false : true)
                    self.draggingIsEnabled = false
                    return
                }

                if self.revealSideMenuOnTop {
                    self.panBaseLocation = 0.0
                    if self.isExpanded {
                        self.panBaseLocation = self.sideMenuRevealWidth
                    }
                }
            }

        case .changed:

            // Expand/Collapse side menu while dragging
            if self.draggingIsEnabled {
                if self.revealSideMenuOnTop {
                    // Show/Hide shadow background view while dragging
                    let xLocation: CGFloat = self.panBaseLocation + position
                    let percentage = (xLocation * 150 / self.sideMenuRevealWidth) / self.sideMenuRevealWidth

                    let alpha = percentage >= 0.6 ? 0.6 : percentage
                    self.sideMenuShadowView.alpha = alpha

                    // Move side menu while dragging
                    if xLocation <= self.sideMenuRevealWidth {
                        self.sideMenuTrailingConstraint.constant = xLocation - self.sideMenuRevealWidth
                    }
                }
                else {
                    if let recogView = sender.view?.subviews[1] {
                        // Show/Hide shadow background view while dragging
                        let percentage = (recogView.frame.origin.x * 150 / self.sideMenuRevealWidth) / self.sideMenuRevealWidth

                        let alpha = percentage >= 0.6 ? 0.6 : percentage
                        self.sideMenuShadowView.alpha = alpha

                        // Move side menu while dragging
                        if recogView.frame.origin.x <= self.sideMenuRevealWidth, recogView.frame.origin.x >= 0 {
                            recogView.frame.origin.x = recogView.frame.origin.x + position
                            sender.setTranslation(CGPoint.zero, in: view)
                        }
                    }
                }
            }
        case .ended:
            self.draggingIsEnabled = false
            // If the side menu is half Open/Close, then Expand/Collapse with animation
            if self.revealSideMenuOnTop {
                let movedMoreThanHalf = self.sideMenuTrailingConstraint.constant > -(self.sideMenuRevealWidth * 0.5)
                self.sideMenuState(expanded: movedMoreThanHalf)
            }
            else {
                if let recogView = sender.view?.subviews[1] {
                    let movedMoreThanHalf = recogView.frame.origin.x > self.sideMenuRevealWidth * 0.5
                    self.sideMenuState(expanded: movedMoreThanHalf)
                }
            }
        default:
            break
        }
    }
}

extension UIViewController {
    
    // With this extension you can access the MainViewController from the child view controllers.
    func revealViewController() -> UIViewController {
//        var viewController: UIViewController? = self
        return self
//        if viewController != nil && viewController is BaseVC {
//            return viewController! //as? MainViewController
//        }
//        while (!(viewController is MainViewController) && viewController?.parent != nil) {
//            viewController = viewController?.parent
//        }
//        if viewController is BaseVC {
//            return viewController as? MainViewController
//        }
//        return nil
    }
}
