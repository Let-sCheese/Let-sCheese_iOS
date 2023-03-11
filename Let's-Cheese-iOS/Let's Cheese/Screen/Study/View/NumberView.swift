//
//  numberView.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/20.
//

import Foundation
import UIKit
import SnapKit

class NumberView: UIView {

    let one : UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = .bodyLarge
        label.textColor = .primary1
        return label
    }()
    let two : UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = .bodyLarge
        label.textColor = .text1
        return label
    }()
    let three : UILabel = {
        let label = UILabel()
        label.text = "3"
        label.font = .bodyLarge
        label.textColor = .text1
        return label
    }()
    let four : UILabel = {
        let label = UILabel()
        label.text = "4"
        label.font = .bodyLarge
        label.textColor = .text1
        return label
    }()
    let five : UILabel = {
        let label = UILabel()
        label.text = "5"
        label.font = .bodyLarge
        label.textColor = .text1
        return label
    }()
    let six : UILabel = {
        let label = UILabel()
        label.text = "6"
        label.font = .bodyLarge
        label.textColor = .text1
        return label
    }()
    let seven : UILabel = {
        let label = UILabel()
        label.text = "7"
        label.font = .bodyLarge
        label.textColor = .text1
        return label
    }()
    let eight : UILabel = {
        let label = UILabel()
        label.text = "8"
        label.font = .bodyLarge
        label.textColor = .text1
        return label
    }()
    let nine : UILabel = {
        let label = UILabel()
        label.text = "9"
        label.font = .bodyLarge
        label.textColor = .text1
        return label
    }()
    let ten : UILabel = {
        let label = UILabel()
        label.text = "10"
        label.font = .bodyLarge
        label.textColor = .text1
        return label
    }()
    private let quizLabel : UILabel = {
        let label = UILabel()
        label.text = "이 인물의 감정은 어때 보여?"
        label.font = .bodyLarge
        label.textColor = .text1
        return label
    }()
    
    lazy var numStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [one,two,three,four,five,six,seven,eight,nine,ten])
        stackView.axis = .horizontal
        stackView.spacing = 25
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var textStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [numStackView,quizLabel])
        stackView.axis = .vertical
        stackView.spacing = 27
        stackView.alignment = .center
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(corners: [.topLeft, .topRight], radius: 20)
    }
    
    func setViewHierarchy(){
        self.addSubview(textStackView)
    }
    
    func setLayout(){
        textStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(26)
            make.centerX.equalToSuperview()
        }
    }
}
