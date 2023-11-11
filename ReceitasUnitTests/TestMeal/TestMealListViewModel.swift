//
//  TestMealListViewModel.swift
//  ReceitasUnitTests
//
//  Created by Marcelo de Araújo on 07/11/2023..
//

import XCTest
@testable import Receitas

final class TestMealListViewModel: XCTestCase {

    func testTestMealListViewModelFailure() async {
        let mockFetchData = MockFetchMealData()
        mockFetchData.mockError = NetworkError.dataNotFound

        let viewModel = MealListViewModel(fetchData: mockFetchData)

        let expectation = self.expectation(description: "Fetch Data is failed because of invalidUrl")
        await viewModel.fetchMeals()

        DispatchQueue.main.async {
            XCTAssertEqual(true, viewModel.loadDataFailed)
            expectation.fulfill()
        }

        await self.fulfillment(of: [expectation], timeout: 10)
    }
    
    func testTestMealListViewModelSuccess() async {
        let mealList = [Meal(id: "1", name: "1", image: "http:/sample.com")]
        let mockData = MealList(meals: mealList)

        let mockFetchData = MockFetchMealData()
        mockFetchData.mockData = mockData

        let viewModel = MealListViewModel(fetchData: mockFetchData)

        let expectation = self.expectation(description: "Fetch Data is failed because of invalidUrl")
        await viewModel.fetchMeals()

        DispatchQueue.main.async {
            XCTAssertEqual(mealList, viewModel.mealList)
            expectation.fulfill()
        }

        await self.fulfillment(of: [expectation], timeout: 10)
    }

}
