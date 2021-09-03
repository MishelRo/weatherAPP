//
//  UITextField.swift
//  weatherAPP
//
//  Created by User on 03.09.2021.
//

import UIKit

extension UITextField{
    func getText()-> String{
        guard  let unrapedT = text else {return ""}
        return unrapedT
    }
}
