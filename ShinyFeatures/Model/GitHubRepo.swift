//
//  GitHubRepo.swift
//  ShinyFeatures
//
//  Created by Kaira Diagne on 28-12-17.
//  Copyright © 2017 Kaira Diagne. All rights reserved.
//

import Foundation

struct GitHubRepo: Codable, Equatable {
    var id: Int
    var name: String
    var description: String
    var htmlUrl: URL
}
