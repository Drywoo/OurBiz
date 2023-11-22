//
//  HomeViewController.swift
//  OurBiz
//
//  Created by 김건우 on 11/16/23.
//

import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import Realm

class HomeViewController: UIViewController {

    let disposeBag = DisposeBag()
    
    private let myBusinessCard = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    
    private let myBusinessCardLabel = UILabel().then {
        $0.text = "내 명함"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private let takeAnotherUserBusinessCard = UIButton().then {
        $0.setImage(UIImage(systemName: "camera"), for: .normal)
        $0.tintColor = .black
        $0.contentMode = .scaleAspectFill
    }
    
    private let myBusinessCardTel = UILabel().then {
        $0.text = "010-1234-5678"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private let myBusinessCardEmail = UILabel().then {
        $0.text = "hello@gmail.com"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private let myBusinessCardEditButton = UIButton().then {
        $0.setImage(UIImage(systemName: "pencil"), for: .normal)
        $0.tintColor = .black
        $0.contentMode = .scaleAspectFill
    }
    
    private let myBusinessCardShareButton = UIButton().then {
        $0.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        $0.tintColor = .black
        $0.contentMode = .scaleAspectFill
    }
    
    private let mytoday = UIView().then {
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    
    private let logoLabel = UILabel().then {
        $0.text = "OurBiz"
        $0.font = UIFont.boldSystemFont(ofSize: 35)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.sizeToFit()
    }
    
    private let schaduleView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
    }
    
    private let schaduleLabel = UILabel().then {
        $0.text = "오늘의 일정"
        $0.textColor = .black
        $0.font = UIFont.boldSystemFont(ofSize: 20)
    }
    
    private let moreInfoButton = UIButton().then {
        $0.setTitle("더보기..", for: .normal)
        $0.setTitleColor(.gray, for: .normal)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexCode: "#b2dcd5")
        setup()
        setupSubviews()
        setupConstraints()
        bindButtonActions()
    }
    
    func setup() {
        let email = UserInfo.get(.email)!
        let name = UserInfo.get(.username)!
        let tel = UserInfo.get(.tel)!
        
        myBusinessCardEmail.text = "\(email)"
        myBusinessCardLabel.text = "\(name)"
        myBusinessCardTel.text = "\(tel)"
    }
    
    private func setupSubviews() {
        [myBusinessCard,logoLabel,takeAnotherUserBusinessCard,schaduleView].forEach {
            view.addSubview($0)
        }
        
       myBusinessCard.addSubview(myBusinessCardLabel)
       myBusinessCard.addSubview(myBusinessCardTel)
       myBusinessCard.addSubview(myBusinessCardEmail)
       myBusinessCard.addSubview(myBusinessCardEditButton)
       myBusinessCard.addSubview(myBusinessCardShareButton)
       schaduleView.addSubview(schaduleLabel)
       schaduleView.addSubview(moreInfoButton)
    }
    
    private func bindButtonActions() {
        takeAnotherUserBusinessCard.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.takeAnotherUserBusinessCardTapped()
            })
            .disposed(by: disposeBag)

        myBusinessCardEditButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.myBusinessCardEditButtonTapped()
            })
            .disposed(by: disposeBag)

        myBusinessCardShareButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.myBusinessCardShareButtonTapped()
            })
            .disposed(by: disposeBag)
    }

    
    private func setupConstraints() {
        
        logoLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(90)
            $0.trailing.equalToSuperview().offset(-90)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(50)
        }
        
        takeAnotherUserBusinessCard.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            $0.trailing.equalTo(logoLabel).offset(50)
            $0.width.equalTo(35)
            $0.height.equalTo(30)
        }
        
        myBusinessCard.snp.makeConstraints {
            $0.top.equalTo(logoLabel.snp.bottom).offset(50)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(160)
        }
        
        myBusinessCardLabel.snp.makeConstraints {
            $0.top.equalTo(myBusinessCard.snp.top).offset(20)
            $0.leading.equalTo(myBusinessCard.snp.leading).offset(20)
        }
        
        myBusinessCardTel.snp.makeConstraints {
            $0.top.equalTo(myBusinessCardLabel.snp.bottom).offset(40)
            $0.leading.equalTo(myBusinessCard.snp.leading).offset(20)
        }
        
        myBusinessCardEmail.snp.makeConstraints {
            $0.top.equalTo(myBusinessCardTel.snp.bottom).offset(10)
            $0.leading.equalTo(myBusinessCard.snp.leading).offset(20)
        }
        
        myBusinessCardEditButton.snp.makeConstraints {
            $0.top.equalTo(myBusinessCard.snp.top).offset(30)
            $0.trailing.equalTo(myBusinessCard.snp.trailing).offset(-20)
            $0.width.equalTo(30)
            $0.height.equalTo(30)
        }
        
        myBusinessCardShareButton.snp.makeConstraints {
            $0.top.equalTo(myBusinessCardEditButton.snp.bottom).offset(50)
            $0.trailing.equalTo(myBusinessCard.snp.trailing).offset(-20)
            $0.width.equalTo(27)
            $0.height.equalTo(27)
        }
        
        schaduleView.snp.makeConstraints {
            $0.top.equalTo(myBusinessCard.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(200)
        }
        
        schaduleLabel.snp.makeConstraints {
            $0.top.equalTo(schaduleView.snp.top).offset(20)
            $0.leading.equalTo(schaduleView.snp.leading).offset(20)
        }
        
        moreInfoButton.snp.makeConstraints {
            $0.top.equalTo(schaduleView.snp.top).offset(20)
            $0.trailing.equalTo(schaduleView.snp.trailing).offset(-20)
            $0.bottom.equalTo(schaduleView.snp.top).offset(50)
        }
        
        myBusinessCardEditButton.imageView?.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        myBusinessCardEditButton.imageView?.contentMode = .scaleAspectFill
        
        myBusinessCardShareButton.imageView?.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        myBusinessCardShareButton.imageView?.contentMode = .scaleAspectFill
        
        takeAnotherUserBusinessCard.imageView?.snp.makeConstraints {
            $0.edges.equalToSuperview() // 이미지 뷰의 크기를 버튼과 같게 설정
        }
    }
    
    private func takeAnotherUserBusinessCardTapped() {
        navigationItem.setHidesBackButton(true, animated: false)
        navigationController?.pushViewController(CameraViewController(), animated: true)
    }
    
    private func myBusinessCardEditButtonTapped() {
        let tel = CardInfo.get(.tel)!
        print(tel)
        
    }
    
    private func myBusinessCardShareButtonTapped() {
        print("2")
    }

}
