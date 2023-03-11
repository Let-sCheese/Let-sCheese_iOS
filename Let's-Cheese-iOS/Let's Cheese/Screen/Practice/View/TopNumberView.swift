//
//  TopNumberView.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/24.
//

import Foundation
import UIKit
import SnapKit

class TopNumberView: UIView {

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
    
    let topLabel : UILabel = {
        let label = UILabel()
        label.text = "단어에 제시된 표정처럼 사진을 찍어봐!"
        label.textColor = .text1
        label.font = .bodyLarge
        return label
    }()
    
    let emotionLabel : UILabel = {
        let label = UILabel()
        label.text = "웃다"
        label.textAlignment = .center
        label.backgroundColor = .primary2
        label.layer.cornerRadius = 10
        label.clipsToBounds = true
        label.font = .titleLarge
        label.textColor = .text1
        return label
    }()
    
    let photoView : UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "smilePicture.jpg")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.isHidden = true
        return imageView
    }()
    
    lazy var numStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [one,two,three,four,five,six,seven,eight,nine,ten])
        stackView.axis = .horizontal
        stackView.spacing = 25
        stackView.alignment = .fill
        return stackView
    }()
    
    lazy var textStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [numStackView,topLabel,emotionLabel])
        stackView.axis = .vertical
        stackView.spacing = 60
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var globalStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textStackView,photoView])
        stackView.axis = .vertical
        stackView.spacing = 24
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
    
    func setViewHierarchy(){
        self.addSubview(globalStackView)
    }
    
    func setLayout(){
        globalStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(26)
            make.centerX.equalToSuperview()
        }
        
        emotionLabel.snp.makeConstraints { make in
            make.height.equalTo(189)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
        }
        
        photoView.snp.makeConstraints { make in
            make.height.equalTo(326)
            make.width.equalTo(343)
        }
    }
}

