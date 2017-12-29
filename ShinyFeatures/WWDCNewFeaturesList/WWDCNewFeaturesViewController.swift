//
//  WWDCNewFeaturesViewController.swift
//  ShinyFeatures
//
//  Created by Kaira Diagne on 28-12-17.
//  Copyright © 2017 Kaira Diagne. All rights reserved.
//

import UIKit

final class WWDCNewFeaturesViewController: UITableViewController {

    private let newFeatures: [String] = ["ARKit", "CoreML", "WatchOS 4", "Password Autofill", "Swift 4 Keypaths"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ReusableCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newFeatures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
        let feature = newFeatures[indexPath.row]
        cell.textLabel?.text = feature
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let feature = newFeatures[indexPath.row]
        let repositoryTableViewController = RepositoryTableViewController(feature: feature, viewModel: RepositoryTableViewModel())
        navigationController?.pushViewController(repositoryTableViewController, animated: true)
    }
}
