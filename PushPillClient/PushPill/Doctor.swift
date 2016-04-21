//
//  Doctor.swift
//  PushPill
//
//  Created by Gaeun Kim on 2016. 4. 17..
//  Copyright © 2016 Kim Ga-eun. All rights reserved.
//

import Foundation
import ObjectMapper

class Doctor: Mappable {
    var id: Int?
    var email: String?
    var name: String?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        email <- map["email"]
        name <- map["name"]
    }
}