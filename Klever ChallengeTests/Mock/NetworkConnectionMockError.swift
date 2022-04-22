//
//  NetworkConnectionMockError.swift
//  Klever ChallengeTests
//
//  Created by Lucas Pinto on 22/04/22.
//

import Foundation
@testable import Klever_Challenge

class NetworkConnectionMockError: NetworkConnectionProtocol {
    func makeRequest(completion: @escaping (Data?, Error?) -> ()) {
        let jsonModel: [[String: Any]] = [["id": 1,
                                        "kij": 02324,
                                        "tagline": "Itaipolvora",
                                        "description": "Muito ruim",
                                        "image_url": "https://images.punkapi.com/v2/keg.png"],
                                        ["id": 2,
                                         "name": "Skol",
                                         "tagline": "Desce quadrado",
                                         "description": "Muito ruim",
                                         "image_url": "https://images.punkapi.com/v2/keg.png"]]
        
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonModel)
        
        completion(jsonData, nil)
    }
}
