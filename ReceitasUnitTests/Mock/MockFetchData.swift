//
//  MockFetchData.swift
//  ReceitasUnitTests
//
//  Created by Marcelo de Araújo on 07/11/2023..
//

import Foundation
@testable import Receitas

class MockFetchMealData: FetchMealsProtocol {
    
    var mockData: Receitas.MealList?
    var mockError: NetworkError?
    
    func fetchData() async -> Result<Receitas.MealList?, Receitas.NetworkError> {
        if let err = mockError {
            return Result.failure(err)
        } else {
            return Result.success(mockData)
        }
    }
}
