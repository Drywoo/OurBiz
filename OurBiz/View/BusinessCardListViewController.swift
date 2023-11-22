//
//  BusinessCardListViewController.swift
//  OurBiz
//
//  Created by 김건우 on 11/20/23.
//

import UIKit
import SnapKit
import Then

class BusinessCardListViewController: UIViewController {
    
    var cardList = CardInfo.getAll()
    
    private let scrollView = UIScrollView()
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        scrollView.addSubview(stackView)
        
        
        
        cardList.forEach { cardInfoObject in
            
            let myBusinessCard = UIView().then {
                $0.backgroundColor = .white
                $0.layer.cornerRadius = 10
                $0.layer.shadowColor = UIColor.black.cgColor
            }
            
            let myBusinessCardLabel = UILabel().then {
                $0.text = cardInfoObject
                $0.textColor = .black
                $0.font = UIFont.boldSystemFont(ofSize: 20)
            }
            
            let takeAnotherUserBusinessCard = UIButton().then {
                $0.setImage(UIImage(systemName: "camera"), for: .normal)
                $0.tintColor = .black
                $0.contentMode = .scaleAspectFill
            }
            
            let myBusinessCardTel = UILabel().then {
                $0.text = "010-1234-5678"
                $0.textColor = .black
                $0.font = UIFont.boldSystemFont(ofSize: 20)
            }
            
            let myBusinessCardEmail = UILabel().then {
                $0.text = "hello@gmail.com"
                $0.textColor = .black
                $0.font = UIFont.boldSystemFont(ofSize: 20)
            }
            
            let myBusinessCardEditButton = UIButton().then {
                $0.setImage(UIImage(systemName: "pencil"), for: .normal)
                $0.tintColor = .black
                $0.contentMode = .scaleAspectFill
            }
            
            let myBusinessCardShareButton = UIButton().then {
                $0.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
                $0.tintColor = .black
                $0.contentMode = .scaleAspectFill
            }
           
            stackView.addArrangedSubview(<#T##view: UIView##UIView#>)
            
            
        }
        
    }
    
    private func setupSubviews() {
        view.addSubview(scrollView)
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }

}
