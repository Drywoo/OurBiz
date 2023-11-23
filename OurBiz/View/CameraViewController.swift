//
//  CameraViewController.swift
//  OurBiz
//
//  Created by 김건우 on 11/16/23.
//

import AVFoundation
import CoreData
import Lottie
import MLKitTextRecognitionKorean
import MLKitVision
import SnapKit
import Then
import UIKit

class CameraViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var cardInfoObject : CardInfoObject?
    
    private let scanLabel = UILabel().then {
        $0.text = "명함을 정확히 인식시켜주세요"
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    private let warningLabel = UILabel().then {
        $0.text = "너무 밝거나 어두운곳은 피해주세요"
        $0.font = UIFont.boldSystemFont(ofSize: 15)
        $0.textAlignment = .center
        $0.textColor = .black
    }
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let takePhotoButton = UIButton().then {
        $0.setImage(UIImage(named: "TakePhotoBtn"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let scanCardAnimation = LottieAnimationView(name: "ScanCard").then {
        $0.contentMode = .scaleAspectFit
        $0.loopMode = .loop
        $0.animationSpeed = 1
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.play()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let koreanOptions = KoreanTextRecognizerOptions()
        let koreanTextRecognizer = TextRecognizer.textRecognizer(options: koreanOptions)
        
        [takePhotoButton,imageView,scanCardAnimation,scanLabel,warningLabel].forEach {
            view.addSubview($0)
        }
        
        takePhotoButton.addTarget(self, action: #selector(takePhotoButtonTapped), for: .touchUpInside)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        scanLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(50)
            $0.trailing.equalToSuperview().offset(-50)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.top).offset(60)
        }
        
        warningLabel.snp.makeConstraints {
            $0.top.equalTo(scanLabel.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(30)
            $0.trailing.equalToSuperview().offset(-30)
            $0.bottom.equalTo(scanLabel.snp.bottom).offset(40)
        }
        
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        scanCardAnimation.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(300)
        }
        
        takePhotoButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-160)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-40)
        }
    }
    
    @objc func takePhotoButtonTapped() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            present(imagePicker, animated: true, completion: nil)
        } else {
            print("카메라 사용 불가능")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let visionImage = VisionImage(image: pickedImage)
            visionImage.orientation =
            imageOrientation(deviceOrientation: UIDevice.current.orientation,
                             cameraPosition: .back)
            
            koreanTextRecognizer.process(visionImage) { result, error in
                guard error == nil, let result = result else {
                    // Error handling
                    print("Error")
                    return
                }
                
                let resultText = result.text
                DispatchQueue.main.async {
                    self.extractInformation(from: resultText)
                    let vc = EditCardInfoViewController()
                    vc.cardInfoObject = self.cardInfoObject
                    self.navigationController?.pushViewController(vc, animated: true)
                    self.navigationController?.viewControllers.removeLast()
                }
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func extractInformation(from text: String) {
        // 정규 표현식 패턴 정의
        let namePattern = "\\b[가-힣]{3,4}\\b";
        let emailPattern = "\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}\\b"
        let phoneNumberPattern = "\\b(\\d{3}-\\d{4}-\\d{4})\\b"
        // 정규 표현식 매칭
        if let nameMatch = text.range(of: namePattern, options: .regularExpression) {
            let name = String(text[nameMatch])
            print("이름: \(name)")
            cardInfoObject = CardInfoObject()
            cardInfoObject!.name = name
            
//            CardInfo.save(.username, name)
            if let emailMatch = text.range(of: emailPattern, options: .regularExpression) {
                let email = String(text[emailMatch])
                cardInfoObject!.email = email
                print("이메일: \(email)")
//                CardInfo.save(.email, email)
                
                if let phoneNumberMatch = text.range(of: phoneNumberPattern, options: .regularExpression) {
                    let phoneNumber = String(text[phoneNumberMatch])
                    cardInfoObject!.phone = phoneNumber
//                    print("전화번호: \(phoneNumber)")
//                    CardInfo.save(.tel, phoneNumber)
                }
            }
            
//            CardInfo.save(cardInfoObject!)
        }
    }
    
    
    // 이미지 방향 설정 함수는 그대로 사용
    func imageOrientation(
        deviceOrientation: UIDeviceOrientation,
        cameraPosition: AVCaptureDevice.Position
    ) -> UIImage.Orientation {
        switch deviceOrientation {
        case .portrait:
            return cameraPosition == .front ? .leftMirrored : .right
        case .landscapeLeft:
            return cameraPosition == .front ? .downMirrored : .up
        case .portraitUpsideDown:
            return cameraPosition == .front ? .rightMirrored : .left
        case .landscapeRight:
            return cameraPosition == .front ? .upMirrored : .down
        case .faceDown, .faceUp, .unknown:
            return .up
        @unknown default:
            fatalError()
        }
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


