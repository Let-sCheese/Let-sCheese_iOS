//
//  PracticeViewController.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/19.
//

import Foundation
import UIKit
import SnapKit

class PracticeViewController:UIViewController {
    
    //MARK: - Properties
    static var countPage = 0
    static var isButtonTap = false
    static var isPictureTaken = false
    
    //MARK: - UI Component
    lazy var labelArr: [UILabel] = [
        topNumberView.one,
        topNumberView.two,
        topNumberView.three,
        topNumberView.four,
        topNumberView.five,
        topNumberView.six,
        topNumberView.seven,
        topNumberView.eight,
        topNumberView.nine,
        topNumberView.ten,
    ]
    
    private let takePhotoButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("촬영하러 가기", for: .normal)
        btn.setTitleColor(.text1, for: .normal)
        btn.backgroundColor = .primary1
        btn.layer.cornerRadius = 20
        btn.titleLabel?.font = .bodyLarge
        return btn
    }()
    
    lazy var camera : UIImagePickerController = {
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.allowsEditing = true
        camera.cameraDevice = .front
        camera.delegate = self
        return camera
    }()
    
    private let topNumberView = TopNumberView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setNavigationController()
        setViewHierarchy()
        setLayout()
        setButtonEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ifPhotoTaken()
    }
    
    //MARK: - Function
    
    func setViewHierarchy(){
        view.addSubview(topNumberView)
        view.addSubview(takePhotoButton)
    }
    
    func setLayout(){
        
        topNumberView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(106)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalTo(takePhotoButton).offset(-50)
        }
        
        takePhotoButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-143)
            make.height.equalTo(55)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func setButtonEvent(){
        takePhotoButton.addTarget(self, action: #selector(takePictureButtonTapEvent), for: .touchUpInside)
    }
    
    func setNavigationController(){
        let backButton = UIBarButtonItem()
        backButton.title = "감정학습 퀴즈"
        self.navigationController?.navigationBar.tintColor = UIColor.text1
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func ifPhotoTaken(){
        if(PracticeViewController.isPictureTaken){
            afterTakePictureLayout()
        }
    }
    
    func numberChange(){
        if(StudyViewController.countPage == 10){
            StudyViewController.countPage = 0
            submitQuiz()
        } else{
            labelArr[StudyViewController.countPage].textColor = .primary1
            labelArr[StudyViewController.countPage-1].textColor = .text1
            PracticeViewController.isButtonTap = false
        }
    }
    
    func beforeTakePictureLayout(){
        topNumberView.photoView.isHidden = true
        topNumberView.textStackView.spacing = 60
        topNumberView.topLabel.isHidden = false
        topNumberView.emotionLabel.snp.remakeConstraints { make in
            make.height.equalTo(189)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        takePhotoButton.setTitle("촬영하러 가기", for: .normal)
    }
    
    func afterTakePictureLayout(){
        topNumberView.photoView.isHidden = false
        topNumberView.textStackView.spacing = 30
        topNumberView.topLabel.isHidden = true
        topNumberView.emotionLabel.snp.remakeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(199)
        }
        takePhotoButton.setTitle("다음", for: .normal)
    }
    
    func submitQuiz(){
        let alert = UIAlertController(title: "퀴즈를 제출할까요?", message: "퀴즈를 제출하면 답안을 수정할 수 없어요. 제출하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
        
        let accecptAction = UIAlertAction(title: "네", style: .default, handler: { okAction in
            let nextVC = PracticeScoreViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        })
        
        let noAction = UIAlertAction(title: "아니오", style: .destructive, handler: { okAction in
            self.navigationController?.popViewController(animated: true)
        })
        
        alert.addAction(noAction)
        alert.addAction(accecptAction)
        present(alert, animated: true, completion: nil)
    }

    //MARK: - @objc
    @objc func takePictureButtonTapEvent(){
        if(!PracticeViewController.isPictureTaken){
            present(camera, animated: true, completion: nil)
            PracticeViewController.isPictureTaken = true
        } else{
            StudyViewController.countPage+=1
            beforeTakePictureLayout()
            numberChange()
            PracticeViewController.isPictureTaken = false
            UIView.animate(withDuration: 0.5, animations: {
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
    }
}
    //MARK: - UIImagePicker Extension
extension PracticeViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            topNumberView.photoView.image = image
            PracticeViewController.isPictureTaken = true
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        PracticeViewController.isPictureTaken = false
        picker.dismiss(animated: true, completion: nil)
    }
}

