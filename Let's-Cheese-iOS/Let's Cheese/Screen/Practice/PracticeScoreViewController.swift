//
//  PracticeScoreViewController.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/27.
//

import Foundation
import UIKit
import SnapKit

class PracticeScoreViewController:UIViewController {
    
    //MARK: - UIComponent
    private let myScoreLabel : UILabel = {
        let label = UILabel()
        label.text = "내 점수는?"
        label.font = .titleLarge
        label.textColor = .secondary1
        return label
    }()
    
    private let scoreNumLabel : UILabel = {
        let label = UILabel()
        label.text = "10"
        label.textColor = .secondary1
        label.font = .score
        return label
    }()
    
    private let retryButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("다시하기", for: .normal)
        btn.titleLabel?.font = .bodyLarge
        btn.setTitleColor(.text4, for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .secondary1
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let stopButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("그만하기", for: .normal)
        btn.titleLabel?.font = .bodyLarge
        btn.setTitleColor(.text4, for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .secondary1
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var buttonStackView : UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [retryButton,stopButton])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fillEqually
        return stackView
    }()

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
        view.addSubview(myScoreLabel)
        view.addSubview(scoreNumLabel)
        view.addSubview(buttonStackView)
    }
    
    func setLayout(){
        myScoreLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(96)
            make.centerX.equalToSuperview()
        }
        
        scoreNumLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-20)
        }
        
        retryButton.snp.makeConstraints { make in
            make.height.equalTo(73)
//            make.width.equalTo(164)
        }
        
        stopButton.snp.makeConstraints { make in
            make.height.equalTo(73)
//            make.width.equalTo(164)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-133)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
    
    func setNavigationController(){
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func setButtonEvent(){
        retryButton.addTarget(self, action: #selector(retryButtonTapEvent), for: .touchUpInside)
        stopButton.addTarget(self, action: #selector(stopButtonTapEvent), for: .touchUpInside)
    }
    
    //MARK: - @objc
    @objc func retryButtonTapEvent(){
        let nextVC = PracticeStartViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func stopButtonTapEvent(){
        let nextVC = TabBarController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

