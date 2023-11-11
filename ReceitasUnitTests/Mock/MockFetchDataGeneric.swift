//
//  MockFetchDataGeneric.swift
//  ReceitasUnitTests
//
//  Created by Marcelo de Araújo on 07/11/2023..
//

import Foundation

class MockFetchDataGeneric: URLProtocol {
    static var responseData: Data?
    static var responseError: Error?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class  func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        if let error = MockFetchDataGeneric.responseError {
            self.client?.urlProtocol(self, didFailWithError: error)
        } else {
            self.client?.urlProtocol(self, didLoad: MockFetchDataGeneric.responseData ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {
            
    }
}
