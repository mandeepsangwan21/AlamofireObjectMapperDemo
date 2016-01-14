//
//  WeatherResponse.swift
//  AlamofireObjectMapperDemo
//
//  Created by SitesSimply PTY. LTD on 14/01/2016.
//  Copyright © 2016 SitesSimply PTY. LTD. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper
class WeatherResponse: Mappable {
    var location: String?
    var three_day_forecast: [Forecast]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        location <- map["location"]
        three_day_forecast <- map["three_day_forecast"]
    }
}
