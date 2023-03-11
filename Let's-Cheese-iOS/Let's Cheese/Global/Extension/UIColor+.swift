//
//  UIColor+.swift
//  Let's Cheese
//
//  Created by 박윤빈 on 2023/02/19.
//

import UIKit

extension UIColor {
    
    // MARK: - Brand Color / Yellow
    static var primary1: UIColor {
        return UIColor(hex: "#FFC01E")
    }
    static var primary2: UIColor {
        return UIColor(hex: "#FFE350")
    }
    static var primary3: UIColor {
        return UIColor(hex: "#FFEE93")
    }
    static var primary4: UIColor {
        return UIColor(hex: "#FFFAE1")
    }
    // MARK: - Brand Color / Purple
    static var secondary1: UIColor {
        return UIColor(hex: "#7F82EF")
    }
    static var secondary2: UIColor {
        return UIColor(hex: "#A4A7FF")
    }
    static var secondary3: UIColor {
        return UIColor(hex: "#C9CBFF")
    }
    static var secondary4: UIColor {
        return UIColor(hex: "#E6EDFF")
    }
    // MARK: - Background
    static var background1: UIColor {
        return UIColor(hex: "#FFFFFF")
    }
    static var background2: UIColor {
        return UIColor(hex: "#F2F3F7")
    }
    static var background3: UIColor {
        return UIColor(hex: "#E5E6EB")
    }
    // MARK: - Text Color
    static var text1: UIColor {
        return UIColor(hex: "#1A1A1B")
    }
    static var text2: UIColor {
        return UIColor(hex: "#6E6D73")
    }
    static var text3: UIColor {
        return UIColor(hex: "#B3B4BC")
    }
    static var text4: UIColor {
        return UIColor(hex: "#FFFFFF")
    }
    
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}


