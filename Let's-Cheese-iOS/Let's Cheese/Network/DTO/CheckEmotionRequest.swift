//
//  checkEmotionModel.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/03/07.
//
import Foundation

struct checkEmotionRequest: Codable {
    var file: String
    
    init(file: String) {
        self.file = file
    }
}
