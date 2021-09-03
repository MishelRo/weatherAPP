//
//  DetailViewModel.swift
//  weatherAPP
//
//  Created by User on 02.09.2021.
//

import Foundation
class DetailViewModel{
    
 static var data = [ModelJSON]()
    var coreData = CoreDataManager()

    
    func getData(data : ModelJSON){
        DetailViewModel.data = [ModelJSON]()
        DetailViewModel.data.append(data)
    }
    
    func tempConvertor(temp: Double) -> String{
         let kelvinTemp = temp
        let celsiusTemp = kelvinTemp - 273.15
        let a = String(format: "%.0f", celsiusTemp)
        return a
    }
    
    
    func saveCity(city: String){
        coreData.saveCity(city: city)
    }
    
    
}
