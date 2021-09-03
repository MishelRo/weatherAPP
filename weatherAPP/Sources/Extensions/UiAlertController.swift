//
//  UiAlertController.swift
//  weatherAPP
//
//  Created by User on 03.09.2021.
//

import UIKit
extension UIAlertController{

        
        
        func getNewComment(complession: @escaping (String)->())-> UIAlertController {
            let alarm = UIAlertController(title: "Add New City", message: " Enter New City", preferredStyle: .alert)
            alarm.addTextField { (idTF) in
                idTF.placeholder = "Enter City"
            }
            let action = UIAlertAction(title: "OK", style: .default) { _ in
                let firstTextField = alarm.textFields![0] as UITextField
                complession(firstTextField.getText())
            }
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
            alarm.addAction(action)
            alarm.addAction(cancel)
            return alarm
        }
        
}
