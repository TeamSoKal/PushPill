//
//  Pill.swift
//  PushPill
//
//  Created by Gaeun Kim on 2016. 4. 17..
//  Copyright © 2016 Kim Ga-eun. All rights reserved.
//

import Foundation
import ObjectMapper

class Pill: Mappable {
    var id: Int?
    var name: String?
    var number: Int?
    var daysOfWeek: String?
    var notes: String?
    var imagePath: String?
    var time: String = ""
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        number <- map["number"]
        daysOfWeek <- map["days_of_week"]
        notes <- map["notes"]
        imagePath <- map["image_path.url"]
        time <- map["time"]
    }
}