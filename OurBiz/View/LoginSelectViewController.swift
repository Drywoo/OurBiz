//
//  LoginSelectViewController.swift
//  OurBiz
//
//  Created by 김건우 on 11/8/23.
//

import RxCocoa
import RxSwift
import SnapKit
import Then
import UIKit

class LoginSelectViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    private let loginStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillEqually
    }
    
    private let logoLabel = UILabel().then {
        $0.text = "OurBiz"
        $0.font = UIFont.boldSystemFont(ofSize: 35)
        $0.textColor = .black
        $0.textAlignment = .center
    }
    
    private let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(UIColor(hexCode: "#FFFFFF"), for: .normal)
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
    }
    
    private let joinButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(UIColor(hexCode: "#000000"), for: .normal)
        $0.backgroundColor = UIColor(hexCode: "#D9D9D9")
        $0.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loginStackView.addArrangedSubview(loginButton)
        loginStackView.addArrangedSubview(joinButton)
        setupSubviews()
        setupConstraints()
        bindButtonActions()
    }
    
    private func setupSubviews() {
        [logoLabel,loginStackView].forEach {
            view.addSubview($0)
        }
    }
    
    private func bindButtonActions() {
        loginButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.loginButtonTapped()
            })
            .disposed(by: disposeBag)
        
        joinButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.joinButtonTapped()
            })
            .disposed(by: disposeBag)
    }
    
    private func setupConstraints() {
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(240)
            $0.trailing.equalToSuperview().offset(-20)
            $0.leading.equalToSuperview().offset(20)
            $0.height.equalTo(40)
        }
        
        loginStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-160)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
        }
    }
    private func loginButtonTapped() {
        self.navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    
    private func joinButtonTapped() {
        self.navigationController?.pushViewController(JoinViewController(), animated: true)
    }
}

