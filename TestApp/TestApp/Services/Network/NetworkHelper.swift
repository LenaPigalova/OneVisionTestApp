//
//  NetworkHelper.swift
//  TestApp
//
//  Created by Пигалова Елена on 05/11/24.
//

import Foundation

struct NetworkHelper {
    let baseURL = "https://base_url.com/api"
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case json = "application/json"
    case urlrncoder = "application/x-www-form-urlencoded"
    case encodingType = "gzip, deflate, br"
    case acceptLangiage = "Accept-Language"
}
