//
//  JoinViewController.swift
//  OurBiz
//
//  Created by 김건우 on 11/19/23.
//

import RxCocoa
import RxSwift
import SnapKit
import Then
import UIKit

class JoinViewController: UIViewController {
    
    private let logoLabel = UILabel().then {
        $0.text = "OurBiz"
        $0.font = UIFont.boldSystemFont(ofSize: 25)
        $0.textColor = .white
        $0.textAlignment = .center
    }
    
    private let idText = UILabel().then {
        $0.text = "이름을 입력해주세요"
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = .black
    }
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .black
        $0.layer.backgroundColor = UIColor(named: "DarkMode")?.cgColor
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
    }
    
    private let passwordText = UILabel().then {
        $0.text = "사용하실 비밀번호를 입력해주세요"
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = .black
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .black
        $0.layer.backgroundColor = UIColor(named: "DarkMode")?.cgColor
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
    }
    
    private let telText = UILabel().then {
        $0.text = "전화번호를 입력해주세요"
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = .black
    }
    
    private let telTextField = UITextField().then {
        $0.placeholder = "전화번호"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .black
        $0.layer.backgroundColor = UIColor(named: "DarkMode")?.cgColor
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
    }
    
    private let emailText = UILabel().then {
        $0.text = "이메일을 입력해주세요"
        $0.font = UIFont.systemFont(ofSize: 10)
        $0.textColor = .black
    }
    
    private let emailTextField = UITextField().then {
        $0.placeholder = "이메일"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textColor = .black
        $0.layer.backgroundColor = UIColor(named: "DarkMode")?.cgColor
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOpacity = 0.5
    }
    
    private let nextStepBtn = UIButton().then {
        $0.setImage(UIImage(named: "NextBtn"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
        setupConstraints()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setupSubviews() {
        [logoLabel,idTextField,passwordTextField,idText,passwordText,nextStepBtn,telText,telTextField,emailText,emailTextField].forEach {
            view.addSubview($0)
        }
        nextStepBtn.addTarget(self, action: #selector(nextStepButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
            $0.height.equalTo(40)
        }
        
        idText.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(logoLabel.snp.bottom).offset(70)
        }
        
        idTextField.snp.makeConstraints {
            $0.top.equalTo(idText.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(idText.snp.bottom).offset(40)
        }
        
        passwordText.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(idTextField.snp.bottom).offset(50)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordText.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(passwordText.snp.bottom).offset(40)
        }
        
        telText.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(passwordTextField.snp.bottom).offset(50)
        }
        
        telTextField.snp.makeConstraints {
            $0.top.equalTo(telText.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(telText.snp.bottom).offset(40)
        }
        
        emailText.snp.makeConstraints {
            $0.top.equalTo(telTextField.snp.bottom).offset(30)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(telTextField.snp.bottom).offset(50)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(emailText.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(emailText.snp.bottom).offset(40)
        }
        
        nextStepBtn.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-70)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    }
    
    @objc private func nextStepButtonTapped() {
        guard let username = idTextField.text, !username.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let email = emailTextField.text, !email.isEmpty,
              let phoneNumber = telTextField.text, !phoneNumber.isEmpty
        else {
            // 사용자가 필요한 정보를 입력하지 않은 경우 처리
            return
        }
        UserInfo.save(.username, username)
        UserInfo.save(.password, password)
        UserInfo.save(.email, email)
        UserInfo.save(.tel, phoneNumber)
        UserInfo.save(.username, username)
        
        let userInfo = UserInfo.get(.email)
        print(userInfo)
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
}
