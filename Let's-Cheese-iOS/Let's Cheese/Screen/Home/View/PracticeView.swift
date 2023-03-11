//
//  PracticeView.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/20.
//

import Foundation
import UIKit

import SnapKit

class PracticeView:UIView {
    let practiceTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "표정 연습"
        label.font = .titleLarge
        label.textColor = .text4
        return label
    }()
    
    let practiceSubLabel : UILabel = {
        let label = UILabel()
        label.text = "제시된 사진에 보이는대로 표정을 지어봐!"
        label.font = .bodyLarge
        label.textColor = .text4
        return label
    }()
    
    lazy var labelStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [practiceTitleLabel,practiceSubLabel])
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
