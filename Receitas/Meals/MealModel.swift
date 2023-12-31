//
//  MealModel.swift
//  Receitas
//
//  Created by Marcelo de Araújo on 06/11/2023..
//

import Foundation

struct Meal: Decodable, Equatable {
    let name: String?
    let image: String?
    let id: String?

    private enum CodingKeys: CodingKey {
        case strMeal
        case strMealThumb
        case idMeal
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .strMeal)
        self.image = try container.decode(String.self, forKey: .strMealThumb)
        self.id = try container.decode(String.self, forKey: .idMeal)
    }

    init(id: String?,name: String?, image: String?) {
        self.id = id
        self.name = name
        self.image = image
    }
}

struct MealList: Decodable, Equatable {
    let meals: [Meal]

    static func == (lhs: MealList, rhs: MealList) -> Bool {
        if lhs.meals.count != rhs.meals.count {
            return false
        }

        for item in lhs.meals {
            if !rhs.meals.contains(where: {$0 == item}) {
                return false
            }
        }
        return true
    }
}

extension MealList: DecodeDataProtocol {
    typealias T = Self
    static func decodeData(data: Data) -> Result<T, NetworkError> {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            let notNillList = decodedData.meals.filter({ $0.id != nil })
            return Result.success(MealList(meals: notNillList))

        } catch {
            return Result.failure(NetworkError.decodedFailed)
        }
    }
}

