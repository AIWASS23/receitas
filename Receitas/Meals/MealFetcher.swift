//
//  MealFetcher.swift
//  Receitas
//
//  Created by Marcelo de Araújo on 08/11/2023.
//

import Foundation

protocol FetchMealsProtocol {
    func fetchData() async -> Result<MealList?, NetworkError>
    
}

struct MealAPIFetcher: FetchMealsProtocol {
    
    private var fetchDataGeneric: FetchDataGeneric<MealList>
    
    init (urlSession: URLSession)
    {
        fetchDataGeneric = FetchDataGeneric<MealList>(urlSession: urlSession, urlApi: APIEndpoint.getDeserts)
    }
    
    func fetchData() async -> Result<MealList?, NetworkError> {
        await fetchDataGeneric.fetchData()
    }
}

struct MealCoreDataFetcher: FetchMealsProtocol {
    
    private let persistence = PersistenceController.instance
    
    func fetchData() async -> Result<MealList?, NetworkError> {
        let result = persistence.fetchData()
        switch result {
        case .success(let res):
            if res.count > 0 {
                let meal = res.map { Meal(id: $0.id, name: $0.name, image: $0.image) }
                return .success(MealList(meals: meal))
            }
            return .failure(NetworkError.dataNotFound)
        case .failure(let err):
            return .failure(err)
        }
    }
}
