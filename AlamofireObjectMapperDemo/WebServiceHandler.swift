//
//  WebServiceHandler.swift
//  AlamofireObjectMapperDemo
//
//  Created by SitesSimply PTY. LTD on 20/01/2016.
//  Copyright © 2016 SitesSimply PTY. LTD. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

class WebServiceHandler : NSObject {
    
//    {(parameters) -> return type in
//    statements
//    }

//     var closure: (response : AnyObject , statuscode : Int) -> (NilLiteralConvertible)!
    
    override init() {
        // perform some initialization here
        
         }
    
    func fetchWeatherForecast (closure : (response : WeatherResponse ) -> Void)  {
        let URL = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/d8bb95982be8a11a2308e779bb9a9707ebe42ede/sample_json"
        Alamofire.request(.GET, URL , parameters: nil)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
                switch response.result {
                case .Success:
                    
                    if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
                        let user = Mapper<WeatherResponse>().map(response.result.value)
                        closure(response: user!)
                    }
                    else  {
                        if let _ = response.result.value as? ErrorType {
                            
                        }
                    }
                case .Failure(let error):
                    debugPrint("getEvents error: \(error)")
                }
            }.responseString { response in
                print("Success: \(response.result.isSuccess)")
                print("Response String: \(response.result.value)")
        }

        
    }
    
    
    
}