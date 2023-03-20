//
//  AnswerViewController.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/03/20.
//

import UIKit

import SnapKit

class AnswerViewController: UIViewController {
    
    //MARK: - Properties
    
    private let topNumberView = TopNumberView()
    
    //MARK: - UI Components
    
    private var answerLabel: UILabel = {
        let label = UILabel()
        label.text = "정답입니다!"
        label.font = .titleLarge
        label.textColor = .secondary1
        return label
    }()
    
    private let nextButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("다음 문제로", for: .normal)
        btn.titleLabel?.font = .bodyLarge
        btn.setTitleColor(.text4, for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .secondary1
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .primary2
        setViewHierarchy()
        setLayout()
        setButtonEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setResultValue(value: PracticeViewController.isAnswerRight)
    }
    
    func setViewHierarchy() {
        view.addSubviews(answerLabel,
                         nextButton
        )
    }
    
    func setLayout() {
        
        answerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-150)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(73)
        }
    }
    
    func setButtonEvent() {
        nextButton.addTarget(self, action: #selector(userTapNextButton), for: .touchUpInside)
    }
    
    func setResultValue(value: Int) {
        switch value {
        case -1:
            answerLabel.text = "얼굴이 제대로 안보여요!"
        case 0:
            answerLabel.text = "정답이 아니에요!"
        case 1:
            answerLabel.text = "정답이에요! 참 잘했어요!"
        default:
            answerLabel.text = "얼굴 분석에 실패했어요.. \n다음 문제를 풀어볼까요?"
        }
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
    
    @objc func userTapNextButton() {
        if(StudyViewController.countPage == 10) {
            StudyViewController.countPage = 0
            submitQuiz()
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
