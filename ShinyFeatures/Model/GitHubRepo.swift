//
//  GitHubRepo.swift
//  ShinyFeatures
//
//  Created by Kaira Diagne on 28-12-17.
//  Copyright © 2017 Kaira Diagne. All rights reserved.
//

import Foundation

struct GitHubRepo: Codable {
    var id: Int
    var name: String
    var description: String
    var htmlURL: URL

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case htmlURL = "html_url"
    }
}
