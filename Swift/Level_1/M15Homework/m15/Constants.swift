//
//  Constants.swift
//  m15
//
//  Created by Al Pacino on 13.02.2023.
//

import Foundation
import UIKit

enum Constants {
    enum Fonts {
        static let interSemiBold = "Inter-SemiBold"
        static let interRegular = "Inter-Regular"
    }
    
    enum Text {
        static let mainHeader = "Header"
        static let secondaryText = "He'll want to use your yacht and I don't want this thing smelling like fish"
        static let time = "8m ago"
    }
    
    enum Images {
        static let mainImage = UIImage(systemName: "house")?.withRenderingMode(.alwaysOriginal)
    }
    
    enum Colors {
        static let colorOfTime = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1)
        static let colorOfHeader = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        static let colorOfText = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
