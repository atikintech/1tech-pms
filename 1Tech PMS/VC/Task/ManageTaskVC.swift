//
//  ManageTaskVC.swift
//  1Tech PMS
//
//  Created by tejas chaudhari on 24/08/23.
//

import UIKit

class ManageTaskVC: UIViewController {

    @IBOutlet weak var manageTableview: UITableView!
    
    let reuseIdentifierTaskTitle = "TaskTitleCell"
    let reuseIdentifierTaskTodo = "TaskTodoCell"
    let reuseIdentifierTaskAttachments = "TaskAttachmentsCell"
    let reuseIdentifierTasks = "TasksCell"
    
    var titleMsg = [
        taskList.taskTitle,
        taskList.taskTodo,
        taskList.taskAttachments,
        taskList.taskIssueType,
        taskList.taskAssignee,
        taskList.taskReporter,
        taskList.taskPriority,
        taskList.taskActivity
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "TEAM MANAGEMENT"
        manageTableview.rounded(radius: 10.0)
        registerCell(cells: [reuseIdentifierTaskTitle, reuseIdentifierTaskTodo, reuseIdentifierTaskAttachments, reuseIdentifierTasks], tableView: self.manageTableview)
        // Do any additional setup after loading the view.
    }

}

extension ManageTaskVC: UITableViewDelegate, UITableViewDataSource{
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
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskAssignee {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTasks, for: indexPath) as? TasksCell
            cell?.lblTitle.text = taskList.taskAssignee.rawValue
            cell?.ImgType.isHidden = true
            cell?.txtField.placeholder = "Unassigned"
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskReporter {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTasks, for: indexPath) as? TasksCell
            cell?.lblTitle.text = taskList.taskReporter.rawValue
            cell?.ImgType.isHidden = false
            cell?.txtField.placeholder = "Aditya Gogomo"
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskPriority {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTasks, for: indexPath) as? TasksCell
            cell?.lblTitle.text = taskList.taskPriority.rawValue
            cell?.ImgType.isHidden = false
            cell?.txtField.placeholder = "Medium"
            return cell ?? UITableViewCell()
        }
        else if titleMsg[indexPath.row] == taskList.taskActivity{
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTasks, for: indexPath) as? TasksCell
            cell?.lblTitle.text = taskList.taskActivity.rawValue
            cell?.ImgType.isHidden = true
            cell?.txtField.placeholder = "Add a comment"
            return cell ?? UITableViewCell()
        }
        else{
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
        else if titleMsg[indexPath.row] == taskList.taskIssueType || titleMsg[indexPath.row] == taskList.taskAssignee || titleMsg[indexPath.row] == taskList.taskReporter || titleMsg[indexPath.row] == taskList.taskPriority || titleMsg[indexPath.row] == taskList.taskActivity {
            return 90
        }
        else{
            return 90
        }

    }
    
    
}
