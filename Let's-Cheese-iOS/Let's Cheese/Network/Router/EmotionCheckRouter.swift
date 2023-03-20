//
//  EmotionCheckRouter.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/03/20.
//

import Foundation
import UIKit

import Moya

typealias parameter = (UIImage)

enum EmotionCheckRouter {
    case uploadFile(param: parameter)
}

extension EmotionCheckRouter: TargetType {
    
    public var baseURL: URL {
        return URL(string: BaseURL.BURL)!
    }
    
    var path: String {
        switch self {
        case .uploadFile:
            return "/uploadfile/"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .uploadFile:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .uploadFile(let param):
            let imageData = param.jpegData(compressionQuality: 1.0) ?? Data()
            let formData: [Moya.MultipartFormData] = [Moya.MultipartFormData(provider: .data(imageData),
                                                                             name: "file",
                                                                             fileName: "file.jpeg",
                                                                             mimeType: "image/jpeg")]
            return .uploadMultipart(formData)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
          return ["Content-Type": "application/json"]
        }
    }
    
    
}
