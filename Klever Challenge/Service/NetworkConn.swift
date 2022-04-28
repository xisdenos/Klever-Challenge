//
//  NetworkConn.swift
//  Klever Challenge
//
//  Created by Lucas Pinto on 20/04/22.
//

import Foundation

protocol NetworkConnectionProtocol {
    
    func makeRequest(completion: @escaping (Data?, Error?) -> ())
    func postRequest(beer: Data, completion: @escaping (Error?) -> ())
    func deleteRequest(beerId: String, completion: @escaping(Error?) -> ())
    func updateBeer(beerId: String, beer: Data, completion: @escaping (Error?) -> ())
}

enum ApiNetWorkError: Error {
    case invalidURL
    case InvalidSession
    case invalidDataType
    case invalidPostRequisition
    case invalidDeleteRequisition
    case invalidPutRequisition
}

class NetworkConnection: NetworkConnectionProtocol {
    
    private let base_URL:String = "https://6269eced737b438c1c3f6090.mockapi.io/beerlist"
    
    func makeRequest(completion: @escaping (Data?, Error?) -> ()) {
        
        guard let url = URL(string: base_URL) else {
            completion(nil, ApiNetWorkError.invalidURL)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                completion(nil, ApiNetWorkError.InvalidSession)
            }
            
            guard let data = data else {
                completion(nil, ApiNetWorkError.invalidDataType)
                return
            }
            
            completion(data, nil)
        }
        task.resume()
    }
    
    
    func postRequest(beer: Data, completion: @escaping (Error?) -> ()) {
        
        guard let url = URL(string: "\(base_URL)") else {
            completion(ApiNetWorkError.invalidURL)
            return
        }
        
        var requisition = URLRequest(url: url)
        requisition.httpMethod = "POST"
        requisition.setValue("application/json", forHTTPHeaderField: "Content-Type")
        requisition.httpBody = beer
        
        let task = URLSession.shared.dataTask(with: requisition) { _ , _ , error in
            
            if error != nil {
                completion(ApiNetWorkError.invalidPostRequisition)
            }
            
            completion(nil)
        }
        task.resume()
    }
    
    func deleteRequest(beerId: String, completion: @escaping(Error?) -> ()) {
        
        guard let url = URL(string: "\(base_URL)/\(beerId)") else {
            completion(ApiNetWorkError.invalidURL)
            return
        }
        
        var requisition = URLRequest(url: url)
        requisition.httpMethod = "DELETE"
        
        let task = URLSession.shared.dataTask(with: requisition) { _ , _ , error in
            
            if error != nil {
                completion(ApiNetWorkError.invalidDeleteRequisition)
            }
            
            completion(nil)
        }
        task.resume()
        
    }
    
    func updateBeer(beerId: String, beer: Data, completion: @escaping (Error?) -> ()) {
        
        guard let url = URL(string: "\(base_URL)/\(beerId)") else {
            completion(ApiNetWorkError.invalidURL)
            return
        }
        
        var requisition = URLRequest(url: url)
        requisition.httpMethod = "PUT"
        requisition.setValue("application/json", forHTTPHeaderField: "Content-Type")
        requisition.httpBody = beer
        
        let task = URLSession.shared.dataTask(with: requisition) { _ , _ , error in
            
            if error != nil {
                completion(ApiNetWorkError.invalidPutRequisition)
            }
            
            completion(nil)
        }
        task.resume()
    }
}
