//
//  selectView.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/20.
//

import Foundation
import UIKit
import SnapKit

class SelectView: UIView {
    
    let quizImage : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "smilePicture.jpg")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let firstEmotionButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("감정 1", for: .normal)
        btn.titleLabel?.font = .bodyLarge
        btn.setTitleColor(.text1, for: .normal)
        btn.backgroundColor = .primary2
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    let secondEmotionButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("감정 2", for: .normal)
        btn.titleLabel?.font = .bodyLarge
        btn.setTitleColor(.text1, for: .normal)
        btn.backgroundColor = .primary2
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let thirdEmotionButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("감정 3", for: .normal)
        btn.titleLabel?.font = .bodyLarge
        btn.setTitleColor(.text1, for: .normal)
        btn.backgroundColor = .primary2
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let fourthEmotionButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("감정 4", for: .normal)
        btn.titleLabel?.font = .bodyLarge
        btn.setTitleColor(.text1, for: .normal)
        btn.backgroundColor = .primary2
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var buttonTopStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstEmotionButton,secondEmotionButton])
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var buttonBottomStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [thirdEmotionButton,fourthEmotionButton])
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let nextButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("다음", for: .normal)
        btn.titleLabel?.font = .bodyLarge
        btn.setTitleColor(.text1, for: .normal)
        btn.backgroundColor = .primary1
        btn.layer.cornerRadius = 20
        btn.translatesAutoresizingMaskIntoConstraints = false

        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewHierarchy()
//        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
    }
    
    func setViewHierarchy(){
        self.addSubview(quizImage)
        self.addSubview(buttonTopStackView)
        self.addSubview(buttonBottomStackView)
        self.addSubview(nextButton)
    }
    
    func setLayout(){
        
        quizImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(19)
            make.height.equalTo(200)
            make.width.equalTo(343)
            make.centerX.equalToSuperview()
        }
        
        firstEmotionButton.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(164)
        }

        secondEmotionButton.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(164)
        }

        thirdEmotionButton.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(164)
        }

        fourthEmotionButton.snp.makeConstraints { make in
            make.height.equalTo(90)
            make.width.equalTo(164)
        }
        
        buttonTopStackView.snp.makeConstraints { make in
            make.top.equalTo(quizImage.snp.bottom).offset(19)
            make.centerX.equalToSuperview()
        }
        
        buttonBottomStackView.snp.makeConstraints { make in
            make.top.equalTo(buttonTopStackView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        nextButton.snp.makeConstraints { make in
            make.height.equalTo(55)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalTo(buttonBottomStackView.snp.bottom).offset(20)
        }
    }
}
