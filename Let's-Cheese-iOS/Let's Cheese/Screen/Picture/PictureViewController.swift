//
//  PictureViewController.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/19.
//

import Foundation
import UIKit
import SnapKit
import PhotosUI

class PictureViewController:UIViewController {
    //MARK: - Properties
    var itemProviders: [NSItemProvider] = []
    static var imageArray : [UIImage] = []

    //MARK: - UI Component
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "사진"
        label.textColor = .text1
        label.font = .titleMedium
        return label
    }()
    
    private let addPictureButton : UIButton = {
        let btn = UIButton()
        btn.setTitle("사진 추가하기", for: .normal)
        btn.setTitleColor(.text1, for: .normal)
        btn.titleLabel?.font = .bodyLarge
        btn.backgroundColor = .primary1
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    private var editorPhotoChoiceCV: UICollectionView = {
        let itemSize : CGFloat = UIScreen.main.bounds.width/3 - (15 + 7.5)
        let itemSpacing : CGFloat = 15
        
        //flowLayout의 인스턴스
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = itemSpacing
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        //collectionView의 인스턴스
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.isScrollEnabled = true
        cv.backgroundColor = .clear
        cv.clipsToBounds = true
        cv.backgroundColor = .clear
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        return cv
    }()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setCollectionView()
        setViewHierarchy()
        setLayout()
        setButtonEvent()
    }
    
    //MARK: - Function
    
    func setViewHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(addPictureButton)
        view.addSubview(editorPhotoChoiceCV)
    }
    
    func setLayout(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(40)
        }
        
        editorPhotoChoiceCV.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(53)
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().offset(-15)
            make.bottom.equalTo(addPictureButton.snp.top).offset(-10)
        }
        
        addPictureButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-111)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(55)
        }
    }
    
    func setButtonEvent(){
        addPictureButton.addTarget(self, action: #selector(selectImagePicker), for: .touchUpInside)
    }
    
    func setCollectionView(){
        editorPhotoChoiceCV.backgroundColor = .clear
        editorPhotoChoiceCV.register(PictureCVC.self, forCellWithReuseIdentifier: PictureCVC.identifier)
        editorPhotoChoiceCV.delegate = self
        editorPhotoChoiceCV.dataSource = self
        editorPhotoChoiceCV.showsHorizontalScrollIndicator = false
    }
    
    //MARK: - @objc
    @objc func selectImagePicker(){
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 10
        configuration.filter = .images
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
}

//MARK: - CollectionView Extension
extension PictureViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PictureViewController.imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = editorPhotoChoiceCV.dequeueReusableCell(withReuseIdentifier: PictureCVC.identifier, for: indexPath) as! PictureCVC
        cell.layer.cornerRadius = 10
        cell.layer.masksToBounds = true
        cell.backgroundColor = .clear
        cell.editerChoiceImageView.image = PictureViewController.imageArray[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = editorPhotoChoiceCV.dequeueReusableCell(withReuseIdentifier: PictureCVC.identifier, for: indexPath) as! PictureCVC
        PictureViewController.imageArray.remove(at: indexPath.row)
        collectionView.reloadData()
    }
}

//MARK: - PHPicker Extension
extension PictureViewController : PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        //PHPicker 닫기
        picker.dismiss(animated: true)
        itemProviders = results.map(\.itemProvider)
        for item in itemProviders {
            if item.canLoadObject(ofClass: UIImage.self) {
                item.loadObject(ofClass: UIImage.self) { image, error in
                    DispatchQueue.main.async {
                        guard let image = image as? UIImage else { return }
                        PictureViewController.imageArray.append(image)
                        self.editorPhotoChoiceCV.reloadData()
                    }
                }
            }
        }
    }
}
