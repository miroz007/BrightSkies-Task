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
    var isFav = false

    
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
