//
//  BusinessCardListViewController.swift
//  OurBiz
//
//  Created by 김건우 on 11/20/23.
//

import UIKit

class BusinessCardListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var data = CardInfo.getAll()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // 테이블 뷰 설정
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MyTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = 150
        view.addSubview(tableView)
        view.backgroundColor = .white
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)

            // 뷰가 나타날 때마다 데이터 업데이트
            data = CardInfo.getAll()
            tableView.reloadData()
        }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell

        // 데이터 모델에서 정보 가져오기
        if let cardInfo = data?[indexPath.row] {
            // 이름, 이메일, 전화번호 표시
            cell.nameLabel.text = cardInfo.name
            cell.emailLabel.text = cardInfo.email
            cell.phoneLabel.text = cardInfo.phone
        }

        return cell
    }
}

class MyTableViewCell: UITableViewCell {
    let nameLabel = UILabel()
    let emailLabel = UILabel()
    let phoneLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            backgroundColor = .white
            nameLabel.textColor = .black
            emailLabel.textColor = .black
            phoneLabel.textColor = .black
            
        
        // 이름 레이블 설정
        nameLabel.frame = CGRect(x: 20, y: 10, width: contentView.bounds.width - 40, height: 20)
        contentView.addSubview(nameLabel)

        // 이메일 레이블 설정
        emailLabel.frame = CGRect(x: 20, y: 100, width: contentView.bounds.width - 40, height: 20)
        contentView.addSubview(emailLabel)

        // 전화번호 레이블 설정
        phoneLabel.frame = CGRect(x: 20, y: 120, width: contentView.bounds.width - 40, height: 20)
        contentView.addSubview(phoneLabel)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
