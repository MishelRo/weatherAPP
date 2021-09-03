//
//  WeatherImage.swift
//  weatherAPP
//
//  Created by User on 03.09.2021.
//

import UIKit
class WeatherImage {
    
    func searchImageFromId(id: Int) -> UIImage {
        switch id {
        case 200...250:
            return UIImage(named: "rain")!
        case 300...350:
            return UIImage(named: "clouds")!
        case 500...550:
            return UIImage(named: "rain")!
        case 600...650:
            return UIImage(named: "snow")!
        case 700...790:
            return UIImage(named: "clouds")!
        case 800:
            return UIImage(named: "sun")!
        case 801...810:
            return UIImage(named: "cloud")!
        default:
            break
        }
        return UIImage()
    }
}
