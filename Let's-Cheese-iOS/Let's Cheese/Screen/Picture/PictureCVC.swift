//
//  PictureCVC.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/24.
//

import Foundation
import UIKit
import SnapKit

class PictureCVC: UICollectionViewCell {
    
    static let identifier = "PictureCell"
    
    let editerChoiceImageView : UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        return img
    }()

    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        editerChoiceImageView.contentMode = .scaleAspectFill
        setLayout()
        editerChoiceImageView.layer.cornerRadius = 12
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLayout() {
        self.backgroundColor = .systemGroupedBackground
        addSubview(editerChoiceImageView)
    
        editerChoiceImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
