//
//  URLRequestConvertible.swift
//  ios-ui-kit-base
//
//  Created by Adam Zarn on 12/12/21.
//

import Foundation

protocol URLRequestConvertible {
    var baseUrl: String { get }
    var path: String? { get }
    var httpMethod: String { get }
    var allHTTPHeaderFields: [String: String] { get }
    var url: URL? { get }
    var urlRequest: URLRequest? { get }
}
