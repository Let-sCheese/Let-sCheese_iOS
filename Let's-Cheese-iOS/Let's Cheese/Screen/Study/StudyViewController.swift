//
//  StudyViewController.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/19.
//

import Foundation
import UIKit
import SnapKit

class StudyViewController:UIViewController {
    
    //MARK: - Properties
    static var countPage = 0
    private var isButtonTap = false
    lazy var labelArr: [UILabel] = [
        numView.one,
        numView.two,
        numView.three,
        numView.four,
        numView.five,
        numView.six,
        numView.seven,
        numView.eight,
        numView.nine,
        numView.ten,
    ]
    
    //MARK: - UI component
    let numView = NumberView()
    let emotionView = SelectView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .primary2
        setNavigationController()
        setViewHierarchy()
        setLayout()
        setButtonEvent()
    }
    
    //MARK: - Function
    func setViewHierarchy(){
        view.addSubview(numView)
        view.addSubview(emotionView)
        numView.backgroundColor = .background1
        emotionView.backgroundColor = .background1
    }
    
    func setLayout(){
        numView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(106)
            make.height.equalTo(100)
            make.leading.trailing.equalToSuperview()
        }
        emotionView.snp.makeConstraints { make in
            make.top.equalTo(numView.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func setButtonEvent(){
        emotionView.firstEmotionButton.addTarget(self, action: #selector(firstButtonTouchedEvent), for: .touchUpInside)
        emotionView.secondEmotionButton.addTarget(self, action: #selector(secondButtonTouchedEvent), for: .touchUpInside)
        emotionView.thirdEmotionButton.addTarget(self, action: #selector(thirdButtonTouchedEvent), for: .touchUpInside)
        emotionView.fourthEmotionButton.addTarget(self, action: #selector(fourthButtonTouchedEvent), for: .touchUpInside)
        emotionView.nextButton.addTarget(self, action: #selector(nextButtonTapEvent), for: .touchUpInside)
    }
    
    func buttonOn(button: UIButton){
        button.backgroundColor = .primary4
        button.layer.borderColor = UIColor.primary2.cgColor
        button.layer.borderWidth = 2
    }
    
    func buttonOff(button: UIButton){
        button.backgroundColor = .primary2
        button.layer.borderColor = UIColor.primary2.cgColor
    }
    
    func submitQuiz(){
        let alert = UIAlertController(title: "퀴즈를 제출할까요?", message: "퀴즈를 제출하면 답안을 수정할 수 없어요. 제출하시겠습니까?", preferredStyle: UIAlertController.Style.alert)

        let accecptAction = UIAlertAction(title: "네", style: .default, handler: { okAction in
            let nextVC = StudyScoreViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        })
        
        let noAction = UIAlertAction(title: "아니오", style: .destructive, handler: { okAction in
            self.navigationController?.popViewController(animated: true)
        })
        
        alert.addAction(noAction)
        alert.addAction(accecptAction)
        present(alert, animated: true, completion: nil)
    }
    
    func setNavigationController(){
        let backButton = UIBarButtonItem()
        backButton.title = "감정학습 퀴즈"
        self.navigationController?.navigationBar.tintColor = UIColor.text1
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func showToast(message : String, font: UIFont) {
            let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
            toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            toastLabel.textColor = UIColor.white
            toastLabel.font = font
            toastLabel.textAlignment = .center;
            toastLabel.text = message
            toastLabel.alpha = 1.0
            toastLabel.layer.cornerRadius = 10;
            toastLabel.clipsToBounds  =  true
            self.view.addSubview(toastLabel)
            UIView.animate(withDuration: 3.0, delay: 0.1, options: .curveEaseOut, animations: {
                 toastLabel.alpha = 0.0
            }, completion: {(isCompleted) in
                toastLabel.removeFromSuperview()
            })
        }
    
    //MARK: - @objc
    
    @objc func firstButtonTouchedEvent(){
        isButtonTap = true
        buttonOn(button: emotionView.firstEmotionButton)
        buttonOff(button: emotionView.secondEmotionButton)
        buttonOff(button: emotionView.thirdEmotionButton)
        buttonOff(button: emotionView.fourthEmotionButton)
    }
    
    @objc func secondButtonTouchedEvent(){
        isButtonTap = true
        buttonOn(button: emotionView.secondEmotionButton)
        buttonOff(button: emotionView.firstEmotionButton)
        buttonOff(button: emotionView.thirdEmotionButton)
        buttonOff(button: emotionView.fourthEmotionButton)
    }
    
    @objc func thirdButtonTouchedEvent(){
        isButtonTap = true
        buttonOn(button: emotionView.thirdEmotionButton)
        buttonOff(button: emotionView.secondEmotionButton)
        buttonOff(button: emotionView.firstEmotionButton)
        buttonOff(button: emotionView.fourthEmotionButton)
    }
    
    @objc func fourthButtonTouchedEvent(){
        isButtonTap = true
        buttonOn(button: emotionView.fourthEmotionButton)
        buttonOff(button: emotionView.secondEmotionButton)
        buttonOff(button: emotionView.thirdEmotionButton)
        buttonOff(button: emotionView.firstEmotionButton)
    }
    
    @objc func nextButtonTapEvent(){
        if(isButtonTap){
            StudyViewController.countPage+=1
            
            if(StudyViewController.countPage == 10){
                StudyViewController.countPage = 0
                submitQuiz()
            } else{
                labelArr[StudyViewController.countPage].textColor = .primary1
                labelArr[StudyViewController.countPage-1].textColor = .text1
                buttonOff(button: emotionView.fourthEmotionButton)
                buttonOff(button: emotionView.secondEmotionButton)
                buttonOff(button: emotionView.thirdEmotionButton)
                buttonOff(button: emotionView.firstEmotionButton)
                isButtonTap = false
            }
        } else{
            showToast(message: "선택지를 골라주세요!", font: .bodyLarge)
        }
    }
}

