//
//  UIFont+.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/19.
//

import UIKit

enum AppFontName: String {
    case body = "SFProDisplay-Regular"
    case headline = "SFProDisplay-Heavy"
    case title = "SFProText-Bold"
}

extension UIFont {
    static func font(_ style: AppFontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }

    // MARK: - HeadLine
    static var headLine: UIFont {
        return font(.headline, ofSize: 28)
    }
    static var score: UIFont {
        return font(.headline, ofSize: 170)
    }
    // MARK: - Title
    static var titleLarge: UIFont {
        return font(.title, ofSize: 22)
    }
    static var titleMedium: UIFont {
        return font(.title, ofSize: 16)
    }
    static var titleSmall: UIFont {
        return font(.title, ofSize: 14)
    }
    //MARK: - Body
    static var bodyLarge: UIFont {
        return font(.body, ofSize: 16)
    }
    static var bodyMedium: UIFont {
        return font(.title, ofSize: 14)
    }
    static var bodySmall: UIFont {
        return font(.title, ofSize: 12)
    }
    
}

