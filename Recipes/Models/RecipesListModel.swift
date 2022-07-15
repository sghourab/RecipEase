//
//  File.swift
//  Recipes
//
//  Created by Summer Crow on 2022-05-31.
//

import Foundation

// Tasty API Info
/*
base url: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=30"
+ tags: &tags=(insertTag1)%20(insertTag2)$20(insertTag3)
+q: &q=(insertIngredient1)$20(insertIngredient2)

 //////
 
 
 {
    "aspect_ratio":"16:9",
    "renditions":[
                  ],
    "country":"US",
    "nutrition":{
       "calories":576,
      "sugar":7,
      "carbohydrates":68,
      "fiber":3,
      "updated_at":"2022-05-21T08:10:44+02:00",
      "protein":23,
      "fat":22
      },
    "num_servings":6,
    "tips_and_ratings_enabled":true,
    "instructions":[
       {
          "start_time":0,
          "appliance":"oven",
          "end_time":0,
          "temperature":340,
          "id":71633,
          "position":1,
          "display_text":"Preheat the oven to 340° F (171° C). Skip this step if cooking on the stove top."
    },
  {
  "display_text":"Heat the oil in a Kazan or heavy-bottom dutch oven. Add cut-up meat into the oil and sauté until the meat is no longer red. Reduce heat to low and let cook, stirring periodically, until the water cooks out (about an hour). Then, add sliced onions to the meat and sauté until translucent.",
  "start_time":0,
  "appliance":null,
  "end_time":0,
  "temperature":null,
  "id":71634,
  "position":2
  },
  {
  "start_time":0,
  "appliance":null,
  "end_time":0,
  "temperature":null,
  "id":71635,
  "position":3,
  "display_text":"In the meantime, heat a separate skillet on medium-high heat and add a tablespoon of oil. Sauté carrots until slightly softened but still has a bite."
  },
 {
  "display_text":"When the onion is done cooking, add all the spices (cumin, garlic, black pepper, salt, bay leaf). Let cook for one minute. Add rice and water and bring to low boil.",
  "start_time":0,
  "appliance":null,
  "end_time":0,
  "temperature":null,
  "id":71636,
  "position":4
  },
  {
  "temperature":null,
  "id":71637,
  "position":5,
  "display_text":"Straighten out rice and add carrots on the top, spreading them out evenly. Cover with lid and bake in the oven for 40-45 minutes. If using the stove top, reduce heat to medium-low and cook for 40-45 minutes.",
  "start_time":0,
  "appliance":null,
  "end_time":0
  },
 {
  "start_time":0,
  "appliance":null,
  "end_time":0,
  "temperature":null,
  "id":71638,
  "position":6,
  "display_text":"Remove from the oven once cooked. Let sit for 15 minutes before opening."
  },
  {
  "start_time":0,
  "appliance":null,
  "end_time":0,
  "temperature":null,
  "id":71639,
  "position":7,
  "display_text":"Mix the carrots into the rice and serve."
  },
  {
  "end_time":0,
  "temperature":null,
  "id":71640,
  "position":8,
  "display_text":"Enjoy!",
  "start_time":0,
  "appliance":null
  }
  ],
  "keywords":"",
  "show_id":17,
  "updated_at":1654015457,
  "draft_status":"published",
  "thumbnail_url":"https://img.buzzfeed.com/tasty-app-user-assets-prod-us-east-1/recipes/87381c5f66b146c7ba489664ee95a7ee.jpeg",
  "total_time_minutes":null,
  "seo_title":"",
  "facebook_posts":[
  ],
  "sections":[
 {
  "position":1,
  "components":[
  {
  "measurements":[
  {
  "unit":{
  "name":"cup",
  "display_plural":"cups",
  "display_singular":"cup",
  "abbreviation":"c",
  "system":"imperial"
  },
  "quantity":"½",
  "id":692284
  },
 {
  "unit":{
  "system":"metric",
  "name":"milliliter",
  "display_plural":"mL",
  "display_singular":"mL",
  "abbreviation":"mL"
  },
  "quantity":"120",
  "id":692283
  }
  ],
  "raw_text":"½ cup corn oil",
  "extra_comment":"",
  "ingredient":{
  "display_singular":"corn oil",
  "updated_at":1537332325,
  "name":"corn oil",
  "created_at":1537332325,
  "display_plural":"corn oils",
  "id":4708
  },
  "id":94256,
  "position":1
  },
  {
  "raw_text":"1.1lb beef, cubed",
  "extra_comment":"cubed",
  "ingredient":{
  "display_plural":"beefs",
  "id":3284,
  "display_singular":"beef",
  "updated_at":1511837404,
  "name":"beef",
  "created_at":1511837404
  },
  "id":94257,
  "position":2,
  "measurements":[
  {
  "unit":{
  "name":"pound",
  "display_plural":"lb",
  "display_singular":"lb",
  "abbreviation":"lb",
  "system":"imperial"
  },
  "quantity":"1",
  "id":692271
  },
  {
  "unit":{
  "display_singular":"g",
  "abbreviation":"g",
  "system":"metric",
  "name":"gram",
  "display_plural":"g"
  },
  "quantity":"425",
  "id":692270
  }
  ]
  },
  {
  "measurements":[
  {
  "unit":{
  "system":"imperial",
  "name":"pound",
  "display_plural":"lb",
  "display_singular":"lb",
  "abbreviation":"lb"
  },
  "quantity":"1",
  "id":692287
  },
  {
  "id":692286,
  "unit":{
  "system":"metric",
  "name":"gram",
  "display_plural":"g",
  "display_singular":"g",
  "abbreviation":"g"
  },
  "quantity":"425"
  }
  ],
  "raw_text":"1.1lb carrots, peeled and julienned",
  "extra_comment":"peeled and julienned",
  "ingredient":{
  "display_plural":"carrots",
  "id":27,
  "display_singular":"carrot",
  "updated_at":1509035288,
  "name":"carrot",
  "created_at":1493314877
  },
  "id":94258,
  "position":3
  },
  {
  "measurements":[
  {
  "unit":{
  "name":"ounce",
  "display_plural":"oz",
  "display_singular":"oz",
  "abbreviation":"oz",
  "system":"imperial"
  },
  "quantity":"9",
  "id":692275
  },
  {
  "unit":{
  "name":"gram",
  "display_plural":"g",
  "display_singular":"g",
  "abbreviation":"g",
  "system":"metric"
  },
  "quantity":"265",
  "id":692274
  }
  ],
  "raw_text":"9 oz onions, julienned",
  "extra_comment":"julienned",
  "ingredient":{
  "created_at":1493311386,
  "display_plural":"onions",
  "id":17,
  "display_singular":"onion",
  "updated_at":1509035288,
  "name":"onion"
  },
  "id":94259,
  "position":4
  },
  {
  "position":5,
  "measurements":[
  {
  "unit":{
  "system":"imperial",
  "name":"cup",
  "display_plural":"cups",
  "display_singular":"cup",
  "abbreviation":"c"
  },
  "quantity":"2 ¾",
  "id":692279
  },
  {
  "unit":{
  "system":"metric",
  "name":"gram",
  "display_plural":"g",
  "display_singular":"g",
  "abbreviation":"g"
  },
  "quantity":"550",
  "id":692278
  }
  ],
  "raw_text":"2 ¾ cup Long-grain rice (rice to water ratio should be 1:1), rinsed",
  "extra_comment":"(rice to water ratio should be 1:1), rinsed",
  "ingredient":{
  "updated_at":1509035283,
  "name":"long grain rice",
  "created_at":1493906283,
  "display_plural":"long grain rices",
  "id":150,
  "display_singular":"long grain rice"
  },
  "id":94260
  },
 {
  "ingredient":{
  "updated_at":1509035280,
  "name":"water",
  "created_at":1494124627,
  "display_plural":"waters",
  "id":197,
  "display_singular":"water"
  },
  "id":94261,
  "position":6,
  "measurements":[
  {
  "unit":{
  "display_singular":"cup",
  "abbreviation":"c",
  "system":"imperial",
  "name":"cup",
  "display_plural":"cups"
  },
  "quantity":"2 ¾",
  "id":692277
  },
  {
  "unit":{
  "system":"metric",
  "name":"milliliter",
  "display_plural":"mL",
  "display_singular":"mL",
  "abbreviation":"mL"
  },
  "quantity":"180",
  "id":692276
  }
  ],
  "raw_text":"2 ¾ cup Water",
  "extra_comment":""
  },
  {
  "id":94262,
  "position":7,
  "measurements":[
 {
  "quantity":"½",
  "id":692280,
  "unit":{
  "system":"none",
  "name":"",
  "display_plural":"",
  "display_singular":"",
  "abbreviation":""
  }
  }
  ],
  "raw_text":"½ garlic bulb",
  "extra_comment":"",
  "ingredient":{
  "display_plural":"garlic bulbs",
  "id":9787,
  "display_singular":"garlic bulb",
  "updated_at":1652892275,
  "name":"garlic bulb",
  "created_at":1652892275
  }
  },
 {
  "measurements":[
 {
  "unit":{
  "abbreviation":"tsp",
  "system":"imperial",
  "name":"teaspoon",
  "display_plural":"teaspoons",
  "display_singular":"teaspoon"
  },
  "quantity":"1 ½",
  "id":692272
  }
  ],
  "raw_text":"1 ½ tsp cumin (whole)",
  "extra_comment":"whole",
  "ingredient":{
  "updated_at":1509035283,
  "name":"cumin",
  "created_at":1493906367,
  "display_plural":"cumins",
  "id":151,
  "display_singular":"cumin"
  },
  "id":94263,
  "position":8
  },
  {
  "measurements":[
  {
  "unit":{
  "display_singular":"",
  "abbreviation":"",
  "system":"none",
  "name":"",
  "display_plural":""
  },
  "quantity":"1",
  "id":692269
  }
  ],
  "raw_text":"1 small bay leaf",
  "extra_comment":"",
  "ingredient":{
  "display_plural":"small bay leaves",
  "id":7077,
  "display_singular":"small bay leaf",
  "updated_at":1602770790,
  "name":"small bay leaves",
  "created_at":1602770790
  },
  "id":94264,
  "position":9
  },
  {
  "raw_text":"⅛ tsp turmeric",
  "extra_comment":"",
  "ingredient":{
  "name":"turmeric",
  "created_at":1495313837,
  "display_plural":"turmerics",
  "id":571,
  "display_singular":"turmeric",
  "updated_at":1509035250
  },
  "id":94265,
  "position":10,
  "measurements":[
  {
  "unit":{
  "display_plural":"teaspoons",
  "display_singular":"teaspoon",
  "abbreviation":"tsp",
  "system":"imperial",
  "name":"teaspoon"
  },
  "quantity":"½",
  "id":692273
  }
  ]
  },
  {
  "id":94266,
  "position":11,
  "measurements":[
  {
  "quantity":"½",
  "id":692281,
  "unit":{
  "system":"imperial",
  "name":"cup",
  "display_plural":"cups",
  "display_singular":"cup",
  "abbreviation":"c"
  }
  }
  ],
  "raw_text":"⅛ tsp curry",
  "extra_comment":"",
  "ingredient":{
  "updated_at":1509035177,
  "name":"curry sauce",
  "created_at":1496881899,
  "display_plural":"curry sauces",
  "id":1614,
  "display_singular":"curry sauce"
  }
  },
  {
  "measurements":[
  {
  "unit":{
  "name":"teaspoon",
  "display_plural":"teaspoons",
  "display_singular":"teaspoon",
  "abbreviation":"tsp",
  "system":"imperial"
  },
  "quantity":"1",
  "id":692282
  }
  ],
  "raw_text":"1 tsp salt, or to taste (water should be salty)",
  "extra_comment":"or to ast",
  "ingredient":{
  "updated_at":1509035288,
  "name":"salt",
  "created_at":1493314644,
  "display_plural":"salts",
  "id":22,
  "display_singular":"salt"
  },
  "id":94267,
  "position":12
  },
  {
  "raw_text":"Black pepper, to taste",
  "extra_comment":"to taste",
  "ingredient":{
  "updated_at":1509035289,
  "name":"black pepper",
  "created_at":1493307183,
  "display_plural":"black peppers",
  "id":12,
  "display_singular":"black pepper"
  },
  "id":94268,
  "position":13,
  "measurements":[
  {
  "unit":{
  "display_singular":"",
  "abbreviation":"",
  "system":"none",
  "name":"",
  "display_plural":""
  },
  "quantity":"0",
  "id":692285
  }
  ]
  }
  ],
  "name":null
  }
  ],
  "tags":[
  {
  "display_name":"Fusion",
  "type":"cuisine",
  "name":"fusion",
  "id":65410
  },
  {
  "display_name":"Oven",
  "type":"appliance",
  "name":"oven",
  "id":65846
  },
  {
  "type":"meal",
  "name":"dinner",
  "id":64486,
  "display_name":"Dinner"
  },
  {
  "name":"dairy_free",
  "id":64463,
  "display_name":"Dairy-Free",
  "type":"dietary"
  }
  ],
  "show":{
  "name":"Tasty",
  "id":17
  },
  "credits":[
  {
  "name":"Marina Kirsch",
  "type":"community"
  }
  ],
  "topics":[
  ],
  "nutrition_visibility":"auto",
  "prep_time_minutes":null,
  "brand_id":null,
  "description":"",
  "beauty_url":null,
  "cook_time_minutes":null,
  "user_ratings":{
  "count_positive":0,
  "score":null,
  "count_negative":0
  },
  "name":"Kazakhh Beef Plov",
  "inspired_by_url":null,
  "servings_noun_plural":"servings",
  "video_ad_content":null,
  "original_video_url":null,
  "canonical_id":"recipe:8240",
  "promotion":"full",
  "brand":null,
  "slug":"kazakhh-beef-plov",
  "compilations":[
  ],
  "approved_at":1654015456,
  "is_one_top":false,
  "yields":"Servings: 6-10",
  "video_id":null,
  "language":"eng",
  "servings_noun_singular":"serving",
  "buzz_id":null,
  "created_at":1652826208,
  "total_time_tier":null,
  "id":8240,
  "thumbnail_alt_text":"",
  "video_url":null,
  "is_shoppable":true
  }
  
*/

// MARK: - Welcome
struct RecipeList: Codable {
    let count: Int?
    let results: [Recipe]
}

struct Recipe: Identifiable, Codable {
    
    
    let id: Int
    let name: String // NAME OF RECIPE - KEEP
    let aspectRatio: String?
    let country: String?
    let nutrition: Nutrition?
    let numServings: Int? // NUMBER OF SERVING - KEEP
    let tipsAndRatingsEnabled: Bool?
    let instructions: [Instruction]?
    let keywords: String?
    let showID, updatedAt: Int?
    let draftStatus: String?
    let thumbnailURL: String
    let totalTimeMinutes: Int?  //MIGHT NOT BE INT
    let seoTitle: String?

    let sections: [Section]?
    let tags: [Tag]?
    let show: Show?
    let credits: [Credit]?

    let nutritionVisibility: String?
    let prepTimeMinutes, brandID: Int?
    let description: String?
    let cookTimeMinutes: Int?
    let userRatings: UserRatings?
    let inspiredByURL: String?
    let servingsNounPlural, servingsNounSingular: String?

    let canonicalID, promotion: String?

    let slug: String?

    let approvedAt: Int?
    let isOneTop: Bool?
    let yields: String?

    let language: String?

    let createdAt: Int?
    let thumbnailAltText: String?

    let isShoppable: Bool?
    
    
    
    //  let renditions: [Any?]?
    //let facebookPosts: [Any?]?
    //let topics: [Any?]? //----> Go OVER
    //let videoAdContent, originalVideoURL: NSNull?
    //let brand: NSNull?
    //let compilations: [Any?]?
    //let videoID: NSNull?
    //let buzzID: NSNull?
    //let totalTimeTier: NSNull?
    //let videoURL: NSNull?
    
    
    enum CodingKeys: String, CodingKey {
        case id, name, country, nutrition, keywords, show, tags, instructions, sections, credits, description, promotion, slug, yields, language
        case aspectRatio = "aspect_ratio"
        case numServings = "num_servings"
        case tipsAndRatingsEnabled = "tips_and_ratings_enabled"
        case showID = "show_id"
        case updatedAt = "updated_at"
        case draftStatus = "draft_status"
        case thumbnailURL = "thumbnail_url"
        case totalTimeMinutes = "total_time_minutes"
        case seoTitle = "seo_title"
        case nutritionVisibility = "nutrition_visibility"
        case prepTimeMinutes = "prep_time_minutes"
        case brandID = "brand_id"
        case cookTimeMinutes = "cook_time_minutes"
        case userRatings = "user_ratings"
        case inspiredByURL = "inspired_by_url"
        case servingsNounPlural = "servings_noun_plural"
        case servingsNounSingular = "servings_noun_singular"
        case canonicalID = "canonical_id"
        case approvedAt = "approved_at"
        case isOneTop = "is_one_top"
        case createdAt = "created_at"
        case thumbnailAltText = "thumbnail_alt_text"
        case isShoppable = "is_shoppable"
        
        //sections, tags, instructions, credits,
    }
    
    
    var liked: Bool = false
    
    
    var prepTimeInMinsString: String {
        if let prepTimeMinutes = prepTimeMinutes {
            return "prep: \(prepTimeMinutes) min"
        } else {
            return ""
        }
    }
    var cookTimeInMinsString: String {
        if let cookTimeMinutes = cookTimeMinutes {
            return "cook: \(cookTimeMinutes) min"
        } else {
            return ""
        }
    }
    
    
//    var numServingsString: String {
//        if let numServings = numServings {
//            return "
//        }
//    }
}

// MARK: - Credit
struct Credit: Codable {
    let name, type: String?
}

// MARK: - Instruction
struct Instruction: Codable, Identifiable {
    let startTime: Int?
    let appliance: String?
    let endTime: Int?
    let temperature: Int?
    let id, position: Int?
    let displayText: String?
    
    enum CodingKeys: String, CodingKey {
        case appliance, temperature, id, position
        case startTime = "start_time"
        case endTime = "end_time"
        case displayText = "display_text"
    }
    
}

// MARK: - Nutrition // GOOD TO HAVE
struct Nutrition: Codable {
    let calories, sugar, carbohydrates, fiber: Int?
    let updatedAt: String?
    let protein, fat: Int?
    
    enum CodingKeys: String, CodingKey {
        case calories, sugar, carbohydrates, fiber, protein, fat
        case updatedAt = "updated_at"
        
    }
}

// MARK: - Section //NEED
struct Section: Codable {

   // var id = UUID()
    let position: Int?
    let components: [Component]?
    let name: String?
}

// MARK: - Component //NEED
struct Component: Codable, Identifiable {
    let measurements: [Measurement]?
    let rawText, extraComment: String?
    let ingredient: Ingredient?
    let id, position: Int?
    
    enum CodingKeys: String, CodingKey {
        case measurements, ingredient, id, position
        case rawText = "raw_text"
        case extraComment = "extra_comment"
       
    }
}

// MARK: - Ingredient //NEED
struct Ingredient: Codable {
    let displaySingular: String?
    let updatedAt: Int?
    let name: String?
    let createdAt: Int?
    let displayPlural: String?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case name, id
        case displaySingular = "display_singular"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case displayPlural = "display_plural"
       
    }

}

// MARK: - Measurement // NEED ALL
struct Measurement: Codable, Identifiable { //NEED THIS FOR QUANTITY AND UNIT
    let unit: Unit? //NEED
    let quantity: String? //NEED
    let id: Int? //NEED
}

// MARK: - Unit // NEED ALL
struct Unit: Codable {
    let name, displayPlural, displaySingular, abbreviation, system: String?
    //let system: System?
    
    enum CodingKeys: String, CodingKey {
        case name, abbreviation, system
        case displayPlural = "display_plural"
        case displaySingular = "display_singular"
                
    }
}

enum System: Codable { // NEED ALL
    case imperial
    case metric
    case none
    
    var description : String {
      switch self {
      // Use Internationalization, as appropriate.
      case .imperial: return "imperial"
      case .metric: return "metric"
      case .none: return "none "
      }
    }
}

// MARK: - Show
struct Show: Codable {
    let name: String?
    let id: Int?
}

// MARK: - Tag //NEED
struct Tag: Codable {
    let displayName, type, name: String?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case type, name, id
        case displayName = "display_name"
    }
}

// MARK: - UserRatings // NEED
struct UserRatings: Codable {
    let countPositive: Int?
    let score: Double?
    let countNegative: Int?
    
    enum CodingKeys: String, CodingKey {
        case score
        case countPositive = "count_positive"
        case countNegative = "count_negative"
       
    }
}

