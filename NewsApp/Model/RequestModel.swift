//
//  RequestModel.swift
//  News
//
//  Created by TarıkOzturk on 2.08.2022.
//

import Foundation

enum RequestHTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

class RequestModel: NSObject {

    // MARK: Properties

    var path: String {
        ""
    }
    var parameters: [String: Any?] {
        [:]
    }
    var headers: [String: String] {
        [:]
    }
    var method: RequestHTTPMethod {
        .get
    }
    var body: [String: Any?] {
        [:]
    }

    // (request, response)
    var isLoggingEnabled: (Bool, Bool) {
        (true, true)
    }
}

// MARK: - Public Functions
extension RequestModel {

    func urlRequest() -> URLRequest {
        var endpoint: String = path

        for parameter in parameters {
            if let value = parameter.value as? String {
                endpoint.append("&\(parameter.key)=\(value)")
            }
        }
        // there is endpoint forcecast but URL string doesn't allow use it without force cast
        var request = URLRequest(
            url: URL(string: endpoint.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)!)!)
        request.httpMethod = method.rawValue

        for header in headers {
            request.addValue(header.value, forHTTPHeaderField: header.key)
        }

        if method == RequestHTTPMethod.post {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: body,
                                                              options: JSONSerialization.WritingOptions.prettyPrinted)
            } catch {
                print(error)
            }
        }

        return request
    }
}
