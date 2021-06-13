//
//  RecipesModel.swift
//  BrightSkies-Task
//
//  Created by Amir on 6/12/21.
//  Copyright © 2021 Amir. All rights reserved.
//

import Foundation
import SwiftyJSON

struct RecipesModel {
    
    var calories : String!
    var carbos : String!
    var country : String!
    var deliverableIngredients : [String]!
    var descriptionField : String!
    var difficulty : Int!
    var fats : String!
    var favorites : Int!
    var fibers : String!
    var headline : String!
    var highlighted : Bool!
    var id : String!
    var image : String!
    var ingredients : [String]!
    var keywords : [String]!
    var name : String!
    var products : [String]!
    var proteins : String!
    var rating : Float!
    var ratings : Int!
    var time : String!
    var weeks : [String]!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        
        calories = json["calories"].stringValue
        carbos = json["carbos"].stringValue
        country = json["country"].stringValue
        
        deliverableIngredients = [String]()
        let deliverableIngredientsArray = json["deliverable_ingredients"].arrayValue
        for deliverableIngredientsJson in deliverableIngredientsArray{
            deliverableIngredients.append(deliverableIngredientsJson.stringValue)
        }
        
        descriptionField = json["description"].stringValue
        difficulty = json["difficulty"].intValue
        fats = json["fats"].stringValue
        favorites = json["favorites"].intValue
        fibers = json["fibers"].stringValue
        headline = json["headline"].stringValue
        highlighted = json["highlighted"].boolValue
        id = json["id"].stringValue
        image = json["image"].stringValue
        
        ingredients = [String]()
        let ingredientsArray = json["ingredients"].arrayValue
        for ingredientsJson in ingredientsArray{
            ingredients.append(ingredientsJson.stringValue)
        }
        
        keywords = [String]()
        let keywordsArray = json["keywords"].arrayValue
        for keywordsJson in keywordsArray{
            keywords.append(keywordsJson.stringValue)
        }
        
        name = json["name"].stringValue
        
        products = [String]()
        let productsArray = json["products"].arrayValue
        for productsJson in productsArray{
            products.append(productsJson.stringValue)
        }
        
        proteins = json["proteins"].stringValue
        rating = json["rating"].floatValue
        ratings = json["ratings"].intValue
        time = json["time"].stringValue
        
        weeks = [String]()
        let weeksArray = json["weeks"].arrayValue
        for weeksJson in weeksArray{
            weeks.append(weeksJson.stringValue)
        }
    }
}


//struct RootClass : Codable {
//
//    var calories : String?
//    var carbos : String?
//    var country : String?
//    var deliverableIngredients : [String]?
//    var descriptionField : String?
//    var difficulty : Int?
//    var fats : String?
//    var favorites : Int?
//    var fibers : String?
//    var headline : String?
//    var highlighted : Bool?
//    var id : String?
//    var image : String?
//    var incompatibilities : String?
//    var ingredients : [String]?
//    var keywords : [String]?
//    var name : String?
//    var products : [String]?
//    var proteins : String?
//    var rating : Float?
//    var ratings : Int?
//    var time : String?
//    var undeliverableIngredients : [String]?
//    var weeks : [String]?
//
//
//    enum CodingKeys: String, CodingKey {
//        case calories = "calories"
//        case carbos = "carbos"
//        case country = "country"
//        case deliverableIngredients = "deliverable_ingredients"
//        case descriptionField = "description"
//        case difficulty = "difficulty"
//        case fats = "fats"
//        case favorites = "favorites"
//        case fibers = "fibers"
//        case headline = "headline"
//        case highlighted = "highlighted"
//        case id = "id"
//        case image = "image"
//        case incompatibilities = "incompatibilities"
//        case ingredients = "ingredients"
//        case keywords = "keywords"
//        case name = "name"
//        case products = "products"
//        case proteins = "proteins"
//        case rating = "rating"
//        case ratings = "ratings"
//        case time = "time"
//        case undeliverableIngredients = "undeliverable_ingredients"
//        case weeks = "weeks"
//    }
//
//    init(response: [String: Any]?) {
//         guard let response = response else {
//             return
//         }
//         if let data = try? JSONSerialization.data(withJSONObject: response, options: []) {
//             let dataResponse = try? JSONDecoder().decode(RootClass.self, from: data)
//            self.calories = dataResponse?.calories
//            self.carbos = dataResponse?.carbos
//            self.country = dataResponse?.country
//            self.deliverableIngredients = dataResponse?.deliverableIngredients
//            self.descriptionField = dataResponse?.descriptionField
//            self.difficulty = dataResponse?.difficulty
//            self.fats = dataResponse?.fats
//            self.favorites = dataResponse?.favorites
//            self.fibers = dataResponse?.fibers
//            self.headline = dataResponse?.headline
//            self.highlighted = dataResponse?.highlighted
//            self.id = dataResponse?.id
//            self.image = dataResponse?.image
//            self.incompatibilities = dataResponse?.incompatibilities
//            self.ingredients = dataResponse?.ingredients
//            self.keywords = dataResponse?.keywords
//            self.name = dataResponse?.name
//            self.products = dataResponse?.products
//            self.proteins = dataResponse?.proteins
//            self.rating = dataResponse?.rating
//            self.ratings = dataResponse?.ratings
//            self.time = dataResponse?.time
//            self.undeliverableIngredients = dataResponse?.undeliverableIngredients
//            self.weeks = dataResponse?.weeks
//
//         }
//     }
//
//}
