//
//  QuizView.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/20.
//

import Foundation
import UIKit

import SnapKit

class QuizView:UIView {
    let quizTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "감정학습 퀴즈"
        label.font = .titleLarge
        label.textColor = .text4
        return label
    }()
    
    let quizSubLabel : UILabel = {
        let label = UILabel()
        label.text = "인물의 감정이 어떨 것 같은지 맞춰볼까?"
        label.font = .bodyLarge
        label.textColor = .text4
        return label
    }()
    
    lazy var labelStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [quizTitleLabel,quizSubLabel])
        stackView.axis = .vertical
        stackView.spacing = 24
        stackView.alignment = .leading
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewHierarchy(){
        self.addSubview(labelStackView)
    }
    
    func setLayout(){
        labelStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(36)
            make.leading.equalToSuperview().offset(24)
        }
    }
}
