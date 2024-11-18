//
//  NetworkManager.swift
//  SwiftUICombine
//
//  Created by Robson Cesar de Siqueira on 10/11/24.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}

    private func request<T: Decodable>(_ url: String, method: HTTPMethod, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, completion: @escaping (Result<T, AFError>) -> Void) {
        let encoding: ParameterEncoding = method == .get || method == .delete ? URLEncoding.default : JSONEncoding.default
        
        AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
            .validate()
            .responseDecodable(of: T.self) { response in
                completion(response.result)
            }
    }
    
    func getRequest<T: Decodable>(url: String, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, completion: @escaping (Result<T, AFError>) -> Void) {
        request(url, method: .get, parameters: parameters, headers: headers, completion: completion)
    }
    
    func postRequest<T: Decodable>(url: String, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, completion: @escaping (Result<T, AFError>) -> Void) {
        request(url, method: .post, parameters: parameters, headers: headers, completion: completion)
    }
    
    func putRequest<T: Decodable>(url: String, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, completion: @escaping (Result<T, AFError>) -> Void) {
        request(url, method: .put, parameters: parameters, headers: headers, completion: completion)
    }
    
    func deleteRequest<T: Decodable>(url: String, parameters: [String: Any]? = nil, headers: HTTPHeaders? = nil, completion: @escaping (Result<T, AFError>) -> Void) {
        request(url, method: .delete, parameters: parameters, headers: headers, completion: completion)
    }
}
