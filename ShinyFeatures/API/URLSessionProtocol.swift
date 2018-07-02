//
//  URLSessionProtocol.swift
//  ShinyFeatures
//
//  Created by Lehlohonolo Mbele on 2018/07/02.
//  Copyright © 2018 Kaira Diagne. All rights reserved.
//

import Foundation

protocol URLSessionProtocol {
    func dataTask(with request: URLRequest, completed: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol
}

extension URLSession: URLSessionProtocol {
    func dataTask(with request: URLRequest, completed: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTaskProtocol {
        return self.dataTask(with: request, completionHandler: completed)
    }
}
