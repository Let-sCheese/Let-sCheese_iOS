//
//  GalleryView.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/20.
//

import Foundation
import UIKit

import SnapKit

class GalleryView:UIView {
    let galleryTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "사진첩"
        label.font = .titleLarge
        label.textColor = .text1
        return label
    }()
    
    let gallerySubLabel : UILabel = {
        let label = UILabel()
        label.text = "내가 찍은 사진을 저장해봐!"
        label.font = .bodyLarge
        label.textColor = .text1
        return label
    }()
    
    lazy var labelStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [galleryTitleLabel,gallerySubLabel])
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
