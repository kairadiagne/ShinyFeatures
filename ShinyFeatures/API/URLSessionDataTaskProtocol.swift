//
//  URLSessionDataTaskProtocol.swift
//  ShinyFeatures
//
//  Created by Lehlohonolo Mbele on 2018/07/02.
//  Copyright © 2018 Kaira Diagne. All rights reserved.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol {}
