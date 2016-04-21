//
//  Config.swift
//  PushPill
//
//  Created by LeeSunhyoup on 2016. 4. 17..
//  Copyright © 2016년 Kim Ga-eun. All rights reserved.
//

import Foundation

class Config {
    static let baseURL: String = "http://52.79.49.59:3000"
//    static let baseURL: String = "http://127.0.0.1:3000"
    static var mode: Int = 0 // 0 logout, 1 patient, 2 doctor
    static var token: String = ""
}