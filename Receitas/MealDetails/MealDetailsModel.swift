//
//  MealDetails.swift
//  Receitas
//
//  Created by Marcelo de Araújo on 06/11/2023..
//

import Foundation

struct MealDetails: Decodable, Equatable {
    var id: String?
    var name: String?
    var instructions: String?
    var image: String?
    var ingredients: Dictionary<String, String>?
    
}
extension MealDetails: DecodeDataProtocol
{
    typealias T = Self
    
    static func decodeData(data: Data) -> Result<MealDetails, NetworkError> {
        guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]  else {
            return Result.failure(NetworkError.decodedFailed)
        }
        
        guard let mealsArray = jsonObject["meals"] as? [[String: Any]]  else {
            return Result.failure(NetworkError.dataNotFound)
        }
        
        if let meal = mealsArray.first {
            
            let id = meal["idMeal"] as? String
            let mealName = meal["strMeal"] as? String
            let mealInstructions = meal["strInstructions"] as? String
            let mealImage = meal["strMealThumb"] as? String
            
            var mealIngredients: Dictionary<String, String> = [:]
            for i in 1...20 {
                let ingredientKey = "strIngredient\(i)"
                let measureKey = "strMeasure\(i)"
                
                if let ingredientItem = meal[ingredientKey] as? String, let measureItem = meal[measureKey] as? String {
                    mealIngredients.updateValue(measureItem, forKey: ingredientItem)
                }
            }
            let mealRes = MealDetails(id: id, name: mealName, instructions: mealInstructions, image: mealImage, ingredients: mealIngredients)
            return Result.success(mealRes)
        }
        return Result.failure(NetworkError.dataNotFound)
    }
}
