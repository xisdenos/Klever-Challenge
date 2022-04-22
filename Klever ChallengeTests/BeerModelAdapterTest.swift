//
//  BeerModelAdapterTest.swift
//  Klever ChallengeTests
//
//  Created by Lucas Pinto on 22/04/22.
//

import Foundation
import XCTest
@testable import Klever_Challenge

class BeerModelAdapterTest: XCTestCase {
    
    var BeerType = Beer(id: UUID().hashValue, name: "Antartica", tagline: "Generic", description: "Generic" , image_url: "https://images.punkapi.com/v2/keg.png")
    
    func test_BeerModelAdapter_ShouldReturn_NotNil() {
        let sut = BeerModelAdapter(networkConn: NetworkConnectionMockSucess())
        
        sut.fetchBeers { result, _ in
            XCTAssertNotNil(result)
        }
    }
    
    func test_BeerModelAdapter_WithValidNetWork_ShouldReturnBeerObject() {
        let sut = BeerModelAdapter(networkConn: NetworkConnectionMockSucess())
        
        sut.fetchBeers { result, _ in
            XCTAssertEqual(result?[0].name, "Itaipava")
            XCTAssertEqual(result?[1].name, "Skol")
        }
    }
        
    func test_BeerModelAdapter_ShouldReturn_Nil() {
        let sut = BeerModelAdapter(networkConn: NetworkConnectionMockNil())
            
        sut.fetchBeers { result, _ in
            XCTAssertNil(result)
        }
    }
    
    func test_BeerModelAdapter_WithInvalid() {
        let sut = BeerModelAdapter(networkConn: NetworkConnectionMockError())
            
        sut.fetchBeers { result, _ in
            XCTAssertNil(result)
        }
    }
}

