//
//  SettingViewController.swift
//  OurBiz
//
//  Created by 김건우 on 11/21/23.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // 설정 항목 배열
    let settings = ["알림 설정", "다크모드", "로그아웃", "회원탈퇴"]

    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 테이블 뷰 초기화
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self

        // 테이블 뷰의 배경색 설정
        tableView.backgroundColor = .white

        // 테이블 뷰를 루트 뷰에 추가
        view.addSubview(tableView)
        


        // 테이블 뷰의 셀 등록
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingCell")
    }

    // MARK: - UITableViewDataSource 메서드

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        cell.textLabel?.text = settings[indexPath.row]

        // 셀의 글자 색 설정
        cell.textLabel?.textColor = .black

        // 셀의 배경색 설정
        cell.backgroundColor = .white

        return cell
    }

    // MARK: - UITableViewDelegate 메서드

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            let loginViewController = LoginViewController()
            UserInfo.remove(.username)
            UserInfo.remove(.password)
            UserInfo.remove(.email)
            // UserInfo.remove(.tel)
            navigationController?.pushViewController(loginViewController, animated: true)
        }
        print("선택된 설정: \(settings[indexPath.row])")
    }
}
