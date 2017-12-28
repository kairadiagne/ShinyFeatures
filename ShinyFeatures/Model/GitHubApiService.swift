//
//  GitHubApiService.swift
//  ShinyFeatures
//
//  Created by Kaira Diagne on 28-12-17.
//  Copyright © 2017 Kaira Diagne. All rights reserved.
//

import Foundation

enum Result<T: Codable> {
    case success(T)
    case error
}

final class GithubAPIService {

    func loadRepositories(searchTerm: String, completion: @escaping (Result<[GitHubRepo]>) -> Void) {

        let params: [String: String] = ["q": "\(searchTerm)+language:swift", "sort": "stars", "order": "desc"]

        var urlComponents = URLComponents(string: "https://api.github.com/search/repositories")
        urlComponents?.queryItems = params.flatMap { URLQueryItem(name: $0.key, value: $0.value) }

        guard let url = urlComponents?.url else {
            completion(.error)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let session = URLSession.shared

        let task = session.dataTask(with: request) { (data, response, error) in
            guard error == nil else {
                return completion(.error)
            }

            guard let data = data else {
                return completion(.error)
            }

            do {
                let page = try JSONDecoder().decode(GitHubPage.self, from: data)
                completion(.success(page.items))
            } catch {
                completion(.error)
            }
        }

        task.resume()
    }
}
