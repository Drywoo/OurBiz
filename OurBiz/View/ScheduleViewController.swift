//
//  ScheduleViewController.swift
//  OurBiz
//
//  Created by 김건우 on 11/21/23.
//

import UIKit

class ScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var tasks = ["3시에 거래처 만나기"]
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Navigation Bar에 추가 버튼 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))

        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "taskCell")
        
        // 테이블 뷰의 배경색 설정
        tableView.backgroundColor = .white

        view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]

        // 셀의 글자 색 설정
        cell.textLabel?.textColor = .black

        // 셀의 배경색 설정
        cell.backgroundColor = .white

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    @objc func addButtonTapped() {
        let addTaskVC = AddTaskViewController()
        addTaskVC.delegate = self
        navigationController?.pushViewController(addTaskVC, animated: true)
    }
}

extension ScheduleViewController: AddTaskDelegate {
    func addTask(_ task: String) {
        tasks.append(task)
        tableView.reloadData()
    }
}
