//
//  ApiClient.swift
//  TestApp
//
//  Created by Пигалова Елена on 05/11/24.
//

import Foundation
import Alamofire

class ApiClient {
    @discardableResult
    private static func performRequest<T:Decodable>(
        route: ApiRouter,
        decoder: JSONDecoder = JSONDecoder(),
        completion:@escaping (Result<T, AFError>) -> Void
    ) -> DataRequest {
        return AF.request(route)
            .responseDecodable (decoder: decoder) {
                (response: DataResponse<T, AFError>) in
                print(response)
                completion(response.result)
               }
    }
    
    static func getItemList(
        completion: @escaping (Result<[NetworkItem], AFError>)->Void
                          
    ) {
        performRequest(route: ApiRouter.getItemList, completion: completion)
    }
    
    static func getItem(
        id: String,
        completion: @escaping (Result<NetworkItem, AFError>)->Void
    ) {
        performRequest(route: ApiRouter.getItem(id: id), completion: completion)
    }

    static func addItem(
        item: NetworkItem,
        completion: @escaping(Result<NetworkItem, AFError>) -> Void
    ) {
        performRequest(route: ApiRouter.addItem(item: item), completion: completion)
    }
}
