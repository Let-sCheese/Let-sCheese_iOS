//
//  HomeViewController.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/19.
//

import Foundation
import UIKit
import SnapKit

class HomeViewController:UIViewController {
    
    //MARK: - UIComponent
    
    private let logoImage : UIImageView =  {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "logoText.svg")
        return imgView
    }()
    
    private lazy var contentScrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = true
        scrollView.isUserInteractionEnabled = true
        return scrollView
    }()
    
    let quizButton = QuizView()
    
    let practiceButton = PracticeView()
    
    let galleryButton = GalleryView()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setViewHierarchy()
        setLayout()
        setButtonEvent()
    }
    
    //MARK: - Funtion
    func setViewHierarchy(){
        view.addSubview(logoImage)
        view.addSubview(contentScrollView)
        contentScrollView.addSubviews(
            quizButton,
            practiceButton,
            galleryButton
        )
        
        quizButton.backgroundColor = .secondary1
        practiceButton.backgroundColor = .secondary2
        galleryButton.backgroundColor = .secondary3
        
        quizButton.layer.cornerRadius = 20
        practiceButton.layer.cornerRadius = 20
        galleryButton.layer.cornerRadius = 20
    }
    
    func setLayout(){
        
        logoImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(24)
        }
        
        contentScrollView.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(39)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalToSuperview()
        }
        
        quizButton.snp.makeConstraints { make in
            make.height.equalTo(190)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-24)
            make.top.equalToSuperview()
        }
        
        practiceButton.snp.makeConstraints { make in
            make.height.equalTo(190)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-24)
            make.top.equalTo(quizButton.snp.bottom).offset(16)
        }
        
        galleryButton.snp.makeConstraints { make in
            make.height.equalTo(190)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(24)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-24)
            make.top.equalTo(practiceButton.snp.bottom).offset(16)
            make.bottom.equalToSuperview()

        }
    }
    
    func setButtonEvent(){
        let quizBtnTapGesture :UITapGestureRecognizer = UITapGestureRecognizer(target: self , action: #selector(quizButtonDidTap))
        let practiceBtnTapGesture :UITapGestureRecognizer = UITapGestureRecognizer(target: self , action: #selector(practiceButtonDidTap))
        let galleryBtnTapGesture :UITapGestureRecognizer = UITapGestureRecognizer(target: self , action: #selector(galleryButtonDidTap))
        quizButton.addGestureRecognizer(quizBtnTapGesture)
        practiceButton.addGestureRecognizer(practiceBtnTapGesture)
        galleryButton.addGestureRecognizer(galleryBtnTapGesture)
    }
    
    //MARK: - @objc
    
    @objc func quizButtonDidTap(){
        guard let tabBarController = self.tabBarController else { return }
        tabBarController.selectedIndex = 1
    }
    
    @objc func practiceButtonDidTap(){
        guard let tabBarController = self.tabBarController else { return }
        tabBarController.selectedIndex = 2
    }
    
    @objc func galleryButtonDidTap(){
        guard let tabBarController = self.tabBarController else { return }
        tabBarController.selectedIndex = 3
    }
}
