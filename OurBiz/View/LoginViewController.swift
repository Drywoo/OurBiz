//
//  LoginViewController.swift
//  OurBiz
//
//  Created by 김건우 on 11/18/23.
//

import RxCocoa
import RxSwift
import SnapKit
import Then
import UIKit

class LoginViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    private let logoLabel = UILabel().then {
        $0.text = "OurBiz"
        $0.font = UIFont.boldSystemFont(ofSize: 35)
        $0.textColor = UIColor(named: "DarkMode")
        $0.textAlignment = .center
    }
    
    private let idTextField = UITextField().then {
        $0.placeholder = "아이디"
        $0.backgroundColor = UIColor(named: "DarkMode")
        $0.borderStyle = .roundedRect
        $0.textColor = .black
        $0.setPlaceholderColor(.systemGray)
        $0.keyboardType = .emailAddress
    }
    
    private let passwordTextField = UITextField().then {
        $0.placeholder = "비밀번호"
        $0.backgroundColor = UIColor(named: "DarkMode")
        $0.borderStyle = .roundedRect
        $0.textColor = .black
        $0.setPlaceholderColor(.systemGray)
        $0.isSecureTextEntry = true
    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor(named: "DarkMode_Reverse"), for: .normal)
        $0.backgroundColor = UIColor(named: "DarkMode")
        $0.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupSubviews()
        setupConstraints()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func setupSubviews() {
        
        loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        
        [logoLabel,idTextField,passwordTextField,loginButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
            $0.height.equalTo(40)
        }
        
       idTextField.snp.makeConstraints {
           $0.top.equalTo(logoLabel.snp.bottom).offset(80)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(44)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-120)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
        
    }
    
    @objc func didTapLoginButton() {
        self.dismiss(animated: true) {
            UIApplication.shared.windows.first?.rootViewController = TabBarViewController()
        }
    }

}
