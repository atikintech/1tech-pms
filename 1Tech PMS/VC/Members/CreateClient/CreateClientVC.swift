//
//  CreateClientVC.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 19/08/23.
//

import UIKit

class CreateClientVC: UIViewController {
    
    @IBOutlet weak var btnBasicInfo: UIButton!
    @IBOutlet weak var btnContactData: UIButton!
    @IBOutlet weak var btnTemplates: UIButton!

    @IBOutlet weak var vewBanner: UIView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let tempArr: [String] = ["TEMP 1", "TEMP 2", "TEMP 3", "TEMP 4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBtnUI(isBasic: true, isContact: false, isTemplate: false)
        registerCollectionCell(cellArr: ["CreateClientTemplateCell"], collectionView: self.collectionView)
//        moveToScreen()
        // Do any additional setup after loading the view.
    }
    
    func updateBtnUI(isBasic: Bool, isContact: Bool, isTemplate: Bool) {
        btnBasicInfo.backgroundColor = isBasic ? .primary() : .clear
        btnContactData.backgroundColor = isContact ? .primary() : .clear
        btnTemplates.backgroundColor = isTemplate ? .primary() : .clear
        isBasic ? btnBasicInfo.setTitleColor(.white, for: .normal) : btnBasicInfo.setTitleColor(.accent(), for: .normal)
        isContact ? btnContactData.setTitleColor(.white, for: .normal) : btnContactData.setTitleColor(.accent(), for: .normal)
        isTemplate ? btnTemplates.setTitleColor(.white, for: .normal) : btnTemplates.setTitleColor(.accent(), for: .normal)
        vewBanner.isHidden = !isBasic
        
        var vc = UIViewController()
        
        if isBasic {
            containerView.isHidden = false
            collectionView.isHidden = true
            vc = self.storyboard?.instantiateViewController(withIdentifier: "BasicInfoVC") as! BasicInfoVC
        } else if isContact{
            containerView.isHidden = false
            collectionView.isHidden = true
            vc = self.storyboard?.instantiateViewController(withIdentifier: "ContactDataVC") as! ContactDataVC
        } else {
            containerView.isHidden = true
            collectionView.isHidden = false
        }
        
        vc.view.frame = containerView.bounds
        containerView.addSubview(vc.view)
        addChild(vc)
        vc.didMove(toParent: self)
    }

    @IBAction func btnAction(_ sender: UIButton) {
        
        switch sender.tag {
        case btnCreataClients.basic.rawValue:
            updateBtnUI(isBasic: true, isContact: false, isTemplate: false)
            
        case btnCreataClients.contact.rawValue:
            updateBtnUI(isBasic: false, isContact: true, isTemplate: false)
            
        case btnCreataClients.template.rawValue:
            updateBtnUI(isBasic: false, isContact: false, isTemplate: true)
            
        default:
            self.dismiss(animated: true)
        }
    }
    
}

extension CreateClientVC:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CreateClientTemplateCell", for: indexPath) as! CreateClientTemplateCell
        cell.lblTitle.text = tempArr[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wd = self.collectionView.frame.width/2 
        let ht = (wd * 2) / 1.7
        
        return CGSize(width: wd, height: ht)
    }
    
}
