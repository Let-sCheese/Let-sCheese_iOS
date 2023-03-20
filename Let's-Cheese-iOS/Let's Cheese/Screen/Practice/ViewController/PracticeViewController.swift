//
//  PracticeViewController.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/19.
//

import Foundation
import UIKit

import Moya
import SnapKit

class PracticeViewController:UIViewController {
    
    //MARK: - Properties
    
    private let topNumberView = TopNumberView()
    private let emotionCheckProvider = MoyaProvider<EmotionCheckRouter>()
    private let emotionLabelList: [String] = ["슬픔", "기쁨", "분노", "놀람", "평온함"]
    private var isButtonTap = false
    private var isPictureTaken = false
    private var emotionLabel = ""
    static var isAnswerRight = 0
    static var countRightAnswer = 0
    
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
        
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setNavigationController()
        setViewHierarchy()
        setLayout()
        setButtonEvent()
        setEmotionRandomly()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        takePhotoButton.setTitle("촬영하러 가기", for: .normal)
        if(isPictureTaken) {
            afterTakePictureLayout()
        }
    }
    
    //MARK: - Essential Function
    
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
    
    //MARK: - Extra Function

    func numberChange(){
        if(StudyViewController.countPage < 10){
            labelArr[StudyViewController.countPage].textColor = .primary1
            labelArr[StudyViewController.countPage-1].textColor = .text1
            isButtonTap = false
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
    
    func setEmotionRandomly() {
        topNumberView.emotionLabel.text = emotionLabelList.randomElement()
        emotionLabel = topNumberView.emotionLabel.text ?? ""
    }
    
    ///사진 분석한 결과값 변환 -> int형으로 바꿔서 정답 표시
    func checkAnswer(answer: CheckEmotionResponse) -> Int {
        var emotionState: String
        switch answer.emotion {
        case "sadness":
            emotionState = "슬픔"
        case "happiness":
            emotionState = "기쁨"
        case "anger":
            emotionState = "분노"
        case "surprise":
            emotionState = "놀람"
        case "neutrality":
            emotionState = "평온함"
        default:
            return -1
        }
        
        ///문제와 사용자가 찍은 사진의 감정이 일치하는지 확인
        if(emotionState == topNumberView.emotionLabel.text) {
            PracticeViewController.countRightAnswer += 1
            return 1
        } else { return 0 }
    }
    
    //MARK: - @objc
    
    @objc func takePictureButtonTapEvent(){
        if(!isPictureTaken){
            present(camera, animated: true, completion: nil)
            isPictureTaken = true
        } else{
            StudyViewController.countPage+=1
            numberChange()
            beforeTakePictureLayout()
            isPictureTaken = false
            setEmotionRandomly()
            self.navigationController?.pushViewController(AnswerViewController(), animated: true)
        }
    }
}
    //MARK: - UIImagePicker Extension

extension PracticeViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage {
            topNumberView.photoView.image = image
            isPictureTaken = true
            postImage(image: image)
        }
        picker.dismiss(animated: true, completion: nil)
        LoadingView.showLoading()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        isPictureTaken = false
        picker.dismiss(animated: true, completion: nil)
    }
}
//MARK: - set Server

extension PracticeViewController {
    func postImage(image: UIImage) {
        emotionCheckProvider.request(.uploadFile(param: image)) { response in
            switch response{
            case .success(let moyaResponse):
                do{
                    let responseData = try moyaResponse.map(CheckEmotionResponse.self)
                    print(responseData)
                    PracticeViewController.isAnswerRight = self.checkAnswer(answer: responseData)
                    LoadingView.hideLoading()
                } catch(let err){
                    print(err.localizedDescription)
                }
            case .failure(let err):
                    print(err.localizedDescription)
            }
        }
    }
}
