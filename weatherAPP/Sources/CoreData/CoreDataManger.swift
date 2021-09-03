//
//  CoreDataManger.swift
//  weatherAPP
//
//  Created by User on 03.09.2021.
//

import UIKit
import CoreData
class CoreDataManager {
    
    var appdelegate = UIApplication.shared.delegate as! AppDelegate
    var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    func saveCity(city: String){
        let entity = CdEntity(context: context)
        entity.city = city
        try? context.save()
        print("saved")
    }
    
    
    func getSavedCity(complession: @escaping(String)->()){
        let fetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CdEntity")
        let result = try? context.fetch(fetch)
        for data in result as! [NSManagedObject] {
            let city = data.value(forKey: "city") as! String
            complession(city)
        }
    }
}
