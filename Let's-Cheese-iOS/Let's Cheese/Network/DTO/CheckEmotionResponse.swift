//
//  CheckEmotionResponse.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/03/20.
//

import Foundation

struct CheckEmotionResponse: Codable {
    let emotion: String
    var confidence: Double? = nil
    var is_higher_than_half: Bool? = nil
}
