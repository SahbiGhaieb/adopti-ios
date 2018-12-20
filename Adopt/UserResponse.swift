//
//  UserResponse.swift
//  Adopt
//
//  Created by mmi on 20/12/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import ObjectMapper

class UserResponse: Mappable {
    var token:String?
    var user:User?
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        token <- map["token"]
        user <- map["user"]
    }
}

class User: Mappable {
    var firstName:String?
    var lastName:String?
    var email:String?
    var password:String?
    var photo:String?
    var phone:String?
    var createdAt:String?
    var updatedAt:String?
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        firstName <- map["firstName"]
        lastName <- map["lastName"]
        email <- map["email"]
        password <- map["password"]
        phone <- map["phone"]
        photo <- map["photo"]
        createdAt <- map["createdAt"]
        updatedAt <- map["updatedAt"]
        
    }
}
