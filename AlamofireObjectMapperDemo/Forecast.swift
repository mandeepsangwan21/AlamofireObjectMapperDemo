//
//  Forecast.swift
//  AlamofireObjectMapperDemo
//
//  Created by SitesSimply PTY. LTD on 14/01/2016.
//  Copyright © 2016 SitesSimply PTY. LTD. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper
class Forecast: Mappable {
    var day: String?
    var temperature: Int?
    var conditions: String?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        day <- map["day"]
        temperature <- map["temperature"]
        conditions <- map["conditions"]        
    }
}