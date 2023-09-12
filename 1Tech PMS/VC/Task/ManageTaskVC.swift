//
//  ManageTaskVC.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 24/08/23.
//

import UIKit

class ManageTaskVC: UIViewController {
    
    @IBOutlet weak var manageTableview: UITableView!
    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBOutlet weak var pickerToolbar: UIToolbar!
    
    let reuseIdentifierTaskTitle = "TaskTitleCell"
    let reuseIdentifierTaskTodo = "TaskTodoCell"
    let reuseIdentifierTaskAttachments = "TaskAttachmentsCell"
    let reuseIdentifierTasks = "TasksCell"
    let reuseIdentifierPlanning = "PlanningHeaderCell"
    let reuseDateCell = "DateCell"
    
    var titleMsg = [
        taskList.taskTitle,
        taskList.taskTodo,
        taskList.taskAttachments,
        taskList.taskIssueType,
        taskList.taskAssignee,
        //        taskList.taskReporter,
        taskList.headerPlanning,
        taskList.taskActivity
    ]
    
    var titleMsgCopy: [taskList] = []
    
    let planningCells = [taskList.taskPriority,
                         taskList.taskSeverity,
                         taskList.taskStartDate,
                         taskList.taskEndDate]
    
    var selectedTf: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TEAM MANAGEMENT"
        titleMsgCopy = titleMsg
        manageTableview.rounded(radius: 10.0)
        registerCell(cells: [reuseIdentifierTaskTitle, reuseIdentifierTaskTodo, reuseIdentifierTaskAttachments, reuseIdentifierPlanning,
                             reuseDateCell, reuseIdentifierTasks], tableView: manageTableview)
        datePickerView.backgroundColor = .primary()
    }
    
    @IBAction func doneClicked() {
//        self.view.endEditing(true)
        datePickerView.isHidden = true
        pickerToolbar.isHidden = true
        selectedTf?.text = datePickerView.date.description
    }
}

extension ManageTaskVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleMsg.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if titleMsg[indexPath.row] == taskList.taskTitle {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTaskTitle, for: indexPath) as? TaskTitleCell
            
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskTodo {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTaskTodo, for: indexPath) as? TaskTodoCell
            
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskAttachments {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTaskAttachments, for: indexPath) as? TaskAttachmentsCell
            
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskIssueType {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTasks, for: indexPath) as? TasksCell
            cell?.lblTitle.text = taskList.taskIssueType.rawValue
            cell?.ImgType.isHidden = false
            cell?.txtField.placeholder = "Task"
            cell?.txtField.delegate = self
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskAssignee {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTasks, for: indexPath) as? TasksCell
            cell?.lblTitle.text = taskList.taskAssignee.rawValue
            cell?.ImgType.isHidden = true
            cell?.txtField.placeholder = "Unassigned"
            cell?.txtField.delegate = self
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskReporter {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTasks, for: indexPath) as? TasksCell
            cell?.lblTitle.text = taskList.taskReporter.rawValue
            cell?.ImgType.isHidden = false
            cell?.txtField.placeholder = "Aditya Gogomo"
            cell?.txtField.delegate = self
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.headerPlanning {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierPlanning, for: indexPath) as? PlanningHeaderCell
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskPriority {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTasks, for: indexPath) as? TasksCell
            cell?.lblTitle.text = taskList.taskPriority.rawValue
            cell?.ImgType.isHidden = false
            cell?.txtField.placeholder = "Medium"
            cell?.txtField.delegate = self
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskSeverity {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTasks, for: indexPath) as? TasksCell
            cell?.lblTitle.text = taskList.taskSeverity.rawValue
            cell?.ImgType.isHidden = false
            cell?.txtField.placeholder = "2"
            cell?.txtField.delegate = self
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskStartDate {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseDateCell, for: indexPath) as? DateCell
            cell?.titleLbl.text = taskList.taskStartDate.rawValue
            cell?.dateTf.inputAccessoryView = datePickerView
            cell?.dateTf.tag = 10
            cell?.dateTf.delegate = self
            cell?.dateTf.placeholder = "10 - 7 - 2023"
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskEndDate {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseDateCell, for: indexPath) as? DateCell
            cell?.titleLbl.text = taskList.taskEndDate.rawValue
            cell?.dateTf.inputView = datePickerView
            cell?.dateTf.tag = 11
            cell?.dateTf.delegate = self
            cell?.dateTf.placeholder = "10 - 7 - 2024"
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskActivity {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTasks, for: indexPath) as? TasksCell
            cell?.lblTitle.text = taskList.taskActivity.rawValue
            cell?.ImgType.isHidden = true
            cell?.txtField.placeholder = "Add a comment"
            cell?.txtField.delegate = self
            return cell ?? UITableViewCell()
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTasks, for: indexPath) as? TasksCell
            return cell ?? UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if titleMsg[indexPath.row] == taskList.taskTitle {
            return 90
        }
        else if titleMsg[indexPath.row] == taskList.taskTodo {
            return 160
        }
        else if titleMsg[indexPath.row] == taskList.taskAttachments {
            return 100
        }
        else if titleMsg[indexPath.row] == taskList.headerPlanning  {
            return 60
        }
        else if titleMsg[indexPath.row] == taskList.taskIssueType || titleMsg[indexPath.row] == taskList.taskAssignee || titleMsg[indexPath.row] == taskList.taskReporter ||
                    titleMsg[indexPath.row] == taskList.taskPriority ||
                    titleMsg[indexPath.row] == taskList.taskSeverity || titleMsg[indexPath.row] == taskList.taskActivity {
            return 90
        }
        else {
            return 90
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? PlanningHeaderCell {
            if titleMsg.count == titleMsgCopy.count {
                cell.isExpanded = true
                titleMsg.insert(contentsOf: planningCells, at: 6)
                tableView.reloadData()
                tableView.scrollToRow(at: IndexPath(row: 10, section: 0), at: .middle, animated: true)
            }
            else {
                cell.isExpanded = false
                titleMsg.removeAll()
                titleMsg = titleMsgCopy
                tableView.reloadData()
            }
        }
    }
}

extension ManageTaskVC: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 10 || textField.tag == 11 {
            selectedTf = textField
            datePickerView.isHidden = false
            pickerToolbar.isHidden = false
            return false
        }
        datePickerView.isHidden = true
        pickerToolbar.isHidden = true
        return true
    }
}

extension ManageTaskVC {
    
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
