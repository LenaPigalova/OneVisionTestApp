//
//  File.swift
//  TestApp
//
//  Created by Пигалова Елена on 05/11/24.
//

import Foundation
import Alamofire

enum ApiRouter : URLRequestConvertible {
    
    
    case getItemList
    case getItem(id: String)
    case addItem(item: NetworkItem)
    
    private var path: String {
        switch self {
        case .getItemList:
            return "/get_item_list"
        case .getItem(id: _):
            return "/get_item"
        case .addItem(item: _):
            return "/add_item"
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .addItem(item: _):
            return .post
        default:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getItemList:
            return [:]
        case.getItem(id: let id):
            return ["id": id]
        case .addItem(item: let item):
            return ["id": item.id, "name": item.name, "description": item.description]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try NetworkHelper().baseURL.asURL()
        
        var urlRequest: URLRequest
        urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue(
                HTTPHeaderField.json.rawValue,
                forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(
                HTTPHeaderField.json.rawValue,
                forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        return urlRequest
    }
    
}

