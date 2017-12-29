//
//  RepositoryListViewModel.swift
//  ShinyFeatures
//
//  Created by Kaira Diagne on 28-12-17.
//  Copyright © 2017 Kaira Diagne. All rights reserved.
//

import Foundation

final class RepositoryTableViewModel {

    typealias ChangeHandler = (() -> Void)

    var repositories: [GitHubRepo] = [] {
        didSet {
            self.changeHandler?()
        }
    }

    private let apiService: GithubAPIService

    var changeHandler: ChangeHandler?

    init(apiService: GithubAPIService = GithubAPIService()) {
        self.apiService = apiService
    }

    func loadRepositories(feature: String) {
        apiService.loadRepositories(searchTerm: feature) { [weak self] result in
            guard let strongSelf = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let repositories):
                    // Since we using MVVM here in real life we would transform our
                    // repository models to viewModels to nicely decouple our model from our views.
                    strongSelf.repositories = repositories
                case .error:
                    // TODO: - Handle Error
                    break
                }
            }
        }
    }
}
