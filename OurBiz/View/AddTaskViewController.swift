//
//  AddTaskViewController.swift
//  OurBiz
//
//  Created by 김건우 on 11/22/23.
//

import UIKit

protocol AddTaskDelegate: class {
    func addTask(_ task: String)
}

class AddTaskViewController: UIViewController {
    
    let taskTextField = UITextField()
    weak var delegate: AddTaskDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        taskTextField.borderStyle = .roundedRect
        taskTextField.placeholder = "Enter a new task"
        taskTextField.frame = CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: 40)
        view.addSubview(taskTextField)

        let saveButton = UIButton(type: .system)
        saveButton.setTitle("Save", for: .normal)
        saveButton.frame = CGRect(x: 20, y: 150, width: view.bounds.width - 40, height: 40)
        saveButton.addTarget(self, action: #selector(saveTask), for: .touchUpInside)
        view.addSubview(saveButton)
    }

    @objc func saveTask() {
        if let newTask = taskTextField.text, !newTask.isEmpty {
            delegate?.addTask(newTask)
            navigationController?.popViewController(animated: true)
        }
    }
}
