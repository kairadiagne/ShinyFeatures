//
//  RepositoryDetailViewController.swift
//  ShinyFeatures
//
//  Created by Kaira Diagne on 28-12-17.
//  Copyright © 2017 Kaira Diagne. All rights reserved.
//

import UIKit

final class RepositoryDetailViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!

    private let repository: GitHubRepo

    init(repository: GitHubRepo) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let urlRequest = URLRequest(url: repository.htmlUrl)
        webView.loadRequest(urlRequest)
        webView.delegate = self
    }

    private func hideLoadingIndicator() {
        loadingIndicator.stopAnimating()
        loadingIndicator.alpha = 0
    }
}

extension RepositoryDetailViewController: UIWebViewDelegate {

    func webViewDidStartLoad(_ webView: UIWebView) {
        loadingIndicator.startAnimating()
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        hideLoadingIndicator()
    }

    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        hideLoadingIndicator()
    }
}
