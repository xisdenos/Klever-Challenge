//
//  NetworkConnectionMockError.swift
//  Klever ChallengeTests
//
//  Created by Lucas Pinto on 22/04/22.
//

import Foundation
@testable import Klever_Challenge

class NetworkConnectionMockNil: NetworkConnectionProtocol{
    func makeRequest(completion: @escaping (Data?, Error?) -> ()) {
    
    }
}
