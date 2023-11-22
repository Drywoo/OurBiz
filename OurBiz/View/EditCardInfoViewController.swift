//
//  EditCardInfoViewController.swift
//  OurBiz
//
//  Created by 김건우 on 11/21/23.
//

import UIKit
import SnapKit
import Then


class EditCardInfoViewController: UIViewController {
    
    private let EditText = UILabel().then {
        $0.text = "명함 정보 수정"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    private let nameText = UILabel().then {
        $0.text = "이름"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    private let nameTextField = UITextField().then {
        $0.placeholder = "홍길동"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = UIColor(named: "DarkMode_Reverse")
        $0.layer.backgroundColor = UIColor(named: "DarkMode")?.cgColor
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
    }
    
    private let telText = UILabel().then {
        $0.text = "전화번호"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    private let telTextField = UITextField().then {
        $0.placeholder = "010-1234-5678"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = UIColor(named: "DarkMode_Reverse")
        $0.layer.backgroundColor = UIColor(named: "DarkMode")?.cgColor
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
    }
    
    private let emailText = UILabel().then {
        $0.text = "이메일"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textAlignment = .left
        $0.textColor = .black
    }
    
    private let emailTextField = UITextField().then {
        $0.placeholder = "hello@gmail.com"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = UIColor(named: "DarkMode_Reverse")
        $0.layer.backgroundColor = UIColor(named: "DarkMode")?.cgColor
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
    }
    
    private let saveButton = UIButton().then {
        $0.setTitle("저장하기", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        $0.setTitleColor(.black, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
    }
    
    func setup() {
        let email = CardInfo.get(.email)!
        let name = CardInfo.get(.username)!
        let tel = CardInfo.get(.tel)!
        
        emailTextField.text = "\(email)"
        nameTextField.text = "\(name)"
        telTextField.text = "\(tel)"
    }
    
    
    
    private func setupSubviews() {
        [EditText,nameText,nameTextField,telText,telTextField,emailText,emailTextField,saveButton].forEach {
            view.addSubview($0)
        }
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        
        EditText.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        
        nameText.snp.makeConstraints {
            $0.top.equalTo(EditText.snp.bottom).offset(80)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.bottom.equalTo(EditText.snp.bottom).offset(100)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameText.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(nameText.snp.bottom).offset(30)
        }
        
        telText.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(40)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.bottom.equalTo(nameTextField.snp.bottom).offset(60)
        }
        
        telTextField.snp.makeConstraints {
            $0.top.equalTo(telText.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(telText.snp.bottom).offset(30)
        }
        
        emailText.snp.makeConstraints {
            $0.top.equalTo(telTextField.snp.bottom).offset(40)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.bottom.equalTo(telTextField.snp.bottom).offset(60)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailText.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(emailText.snp.bottom).offset(30)
        }
        
        saveButton.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(emailTextField.snp.bottom).offset(70)
        }
    }
    
    @objc func saveButtonTapped() {
        
        CardInfo.save(.username, nameTextField.text! )
        CardInfo.save(.email, emailTextField.text!)
        CardInfo.save(.tel, telTextField.text!)

    }
}
