//
//  Model.swift
//  m18
//
//  Created by Al Pacino on 16.02.2023.
//

import Foundation
import UIKit

struct APIResponse: Codable {
    let expression: String?
    let results: [APIResponseResults]
}

struct APIResponseResults: Codable {
    let id: String
    let title: String
    let description: String
    let image: String
    enum CodingKeys: String, CodingKey {
        case id, title, image
        case description
    }
}

struct Images {
    let image: UIImage
}

