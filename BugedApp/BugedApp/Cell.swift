//
//  Cell.swift
//  BugedApp
//
//  Created by Никита Филонов on 17.07.2021.
//

import UIKit

class Cell: UITableViewCell { // eto iest view
    
    var label: UILabel?
    
    func make(with name: String) {
        if label == nil {
            self.label = UILabel(frame: self.frame)
            self.addSubview(label!)
        }
        self.label!.text = name
       
    }
    
}
