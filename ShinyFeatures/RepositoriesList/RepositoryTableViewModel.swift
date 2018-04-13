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

    // Since this is a stored closure everything that this closure
    // Captures will be retained during the lifetime of an instance of this class.
    var changeHandler: ChangeHandler?

    init(apiService: GithubAPIService = GithubAPIService()) {
        self.apiService = apiService
    }

    func loadRepositories(feature: String) {
        /*
         This closure is an escaping closure which means we we do not know when this
         closure will be called. In this case it is escaping because it gets captured (retained)
         by the URLSession datatask which means this closure will be called a the time this
         network request finishes. If self is strongly referenced from inside of this closure we have
         a strong strong referemce cucle between APISerbice and RepositoryView<odel, which means
         RepositoryViewModel will stay allive until this closure has been executed.
         Sometimes this is exactly what you want for example when you want to save the response to the database
         it doesn't matter if the screen you were going to show this data in is not there anymore because now the
         next time you show this screen the data can be retrieved from the database instead of from the network.
         */
        apiService.loadRepositories(searchTerm: feature) { [weak self] result in
            guard let strongSelf = self else { return }

            DispatchQueue.main.async {
                switch result {
                case .success(let repositories):
                    // Since we using MVVM here in real life we would transform our
                    // repository models to viewModels to nicely decouple our model from our views.
                    strongSelf.repositories = repositories
                case .error:
                    // Handle error
                    break
                }
            }
        }
    }
}
