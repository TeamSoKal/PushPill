//
//  Patient.swift
//  PushPill
//
//  Created by LeeSunhyoup on 2016. 4. 17..
//  Copyright © 2016년 Kim Ga-eun. All rights reserved.
//

import Foundation
import ObjectMapper

class Patient: Mappable {
    var id: Int?
    var email: String?
    var name: String?
    var age: Int?
    var pills: [Pill]?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        email <- map["email"]
        name <- map["name"]
        age <- map["age"]
        pills <- map["pills"]
    }
}