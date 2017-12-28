//
//  GitHubPage.swift
//  ShinyFeatures
//
//  Created by Kaira Diagne on 28-12-17.
//  Copyright © 2017 Kaira Diagne. All rights reserved.
//

import Foundation

struct GitHubPage: Codable {
    var totalCount: Int
    var incompleteResults: Bool
    var items: [GitHubRepo]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}
