//
//  ViewController.swift
//  AlamofireObjectMapperDemo
//
//  Created by SitesSimply PTY. LTD on 14/01/2016.
//  Copyright © 2016 SitesSimply PTY. LTD. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let URL1 = "https://raw.githubusercontent.com/tristanhimmelman/AlamofireObjectMapper/f583be1121dbc5e9b0381b3017718a70c31054f7/sample_array_json"
//        Alamofire.request(.GET, URL1).responseArray { (response: Response<[Forecast], NSError>) in
//            let forecastArray = response.result.value
//            if let forecastArray = forecastArray {
//                for forecast in forecastArray {
//                    self.label.text = forecast.day
//                    print(forecast.day)
//                    print(forecast.temperature)
//                }
//            }
//            }.responseString { response in
//                print("Success: \(response.result.isSuccess)")
//                print("Response String: \(response.result.value)")
//        }
        
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
                print(user?.location)
                self.label.text = user?.location
                print(user?.three_day_forecast)
                for forecast in user!.three_day_forecast! {
                  print(forecast.day)
                  print(forecast.temperature)
                  print(forecast.conditions)
                        }
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

    
        
        

//        Alamofire.request(.GET, URL).responseObject("data") {
//            (response: Response<WeatherResponse, NSError>) in
//            switch response.result {
//            case .Success:
//                if response.response?.statusCode == 200 || response.response?.statusCode == 201 {
//                    let weatherResponse = response.result.value
//                    print(weatherResponse?.location)
//                    
//                    if let threeDayForecast = weatherResponse?.three_day_forecast {
//                        for forecast in threeDayForecast {
//                            let demo  = forecast.day
//                            print(demo)
//                            print(forecast.day)
//                            print(forecast.temperature)
//                        }
//                    }
//                }
//                else {
//                    if let _ = response.result.value as? ErrorType {
//                    
//                    }
//                }
//            case .Failure(let error):
//                debugPrint("getEvents error: \(error)")
//            }
//            
//            }.responseString { response in
////                print("Success: \(response.result.isSuccess)")
////                print("Response String: \(response.result.value)")
//        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

