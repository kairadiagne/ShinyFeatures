//
//  GitHubRepoViewController.swift
//  ShinyFeatures
//
//  Created by Kaira Diagne on 28-12-17.
//  Copyright © 2017 Kaira Diagne. All rights reserved.
//

import UIKit

final class RepositoryTableViewController: UITableViewController {

    private let feature: String

    private let viewModel: RepositoryTableViewModel

    init(feature: String, viewModel: RepositoryTableViewModel) {
        self.feature = feature
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "RepositoryCell")
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension

         viewModel.changeHandler = {
             self.tableView.reloadData()
         }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.loadRepositories(feature: feature)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell", for: indexPath)
        let repository = viewModel.repositories[indexPath.row]
        cell.textLabel?.text = repository.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let repository = viewModel.repositories[indexPath.row]
        navigationController?.pushViewController(RepositoryDetailViewController(repository: repository), animated: true)
    }
}
