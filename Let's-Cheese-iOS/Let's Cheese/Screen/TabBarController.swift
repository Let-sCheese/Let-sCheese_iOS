//
//  ViewController.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/19.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    let homeVC = HomeViewController()
    let studyVC = StudyStartViewController()
    let practiceVC = PracticeStartViewController()
    let pictureVC = PictureViewController()
    
    // 탭바 터치 바운스 이벤트
    private var bounceAnimation: CAKeyframeAnimation = {
        let bounceAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        bounceAnimation.values = [1.0, 1.1, 0.9, 1.02, 1.0]
        bounceAnimation.duration = TimeInterval(0.3)
        bounceAnimation.calculationMode = CAAnimationCalculationMode.cubic
        return bounceAnimation
    }()
    
    // 탭바 터치 바운스 이벤트
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let idx = tabBar.items?.firstIndex(of: item), tabBar.subviews.count > idx + 1, let imageView = tabBar.subviews[idx + 1].subviews.first as? UIImageView else {
            return
        }
        imageView.layer.add(bounceAnimation, forKey: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        setUpTabBar()
    }
    
    fileprivate lazy var defaultTabBarHeight = { tabBar.frame.size.height }()
    
    func setUpTabBar(){
        self.tabBar.tintColor = UIColor.secondary1
        self.tabBar.unselectedItemTintColor = .gray
        self.tabBar.backgroundColor = .systemBackground
        
        homeVC.title = "홈"
        studyVC.title = "감정학습"
        practiceVC.title = "연습하기"
        pictureVC.title = "사진"
        
        let ViewControllers:[UIViewController] = [homeVC,studyVC,practiceVC,pictureVC]
        self.setViewControllers(ViewControllers, animated: true)
        
        homeVC.tabBarItem.image = UIImage(named: "home.svg")
        studyVC.tabBarItem.image = UIImage(named: "happyEmoji.svg")
        practiceVC.tabBarItem.image = UIImage(named: "camera.svg")
        pictureVC.tabBarItem.image = UIImage(named: "gallery.svg")
        self.hidesBottomBarWhenPushed = false
        viewWillLayoutSubviews()
    }
    
}

