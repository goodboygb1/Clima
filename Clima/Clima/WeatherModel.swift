//
//  WeatherModel.swift
//  Clima
//
//  Created by PMJs on 25/3/2563 BE.
//  Copyright © 2563 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    
    let id : Int
    let ciytName : String
    let temperature : Double
    var temperatureString : String {
        return String(format: "%.1lf", temperature)
    }
    
    var conditionName : String {
        switch id {
        case 200...232:
            return "cloud.bolt"
        case  300...321:
            return "cloud.drizzle"
        case  501...504:
            return "cloud.rain"
        case  511:
            return "cloud.snow"
        case  520...531:
            return "cloud.rain"
        case  600...622:
            return "snow"
        case  700...781:
            return "cloud.fox"
        case  800:
            return "sun.max"
        case  801:
            return "cloud.sun"
        case  802:
            return "cloud"
        case  803:
            return "cloud"
        case  804:
            return "cloud"
        default:
            return "cloud"
        }
    }
    
}
