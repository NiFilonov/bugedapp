//
//  Cell.swift
//  BugedApp
//
//  Created by Никита Филонов on 17.07.2021.
//

import UIKit

class Cell: UITableViewCell {
    var label: UILabel?
    
    func setLabelForCell(text: String) {
        if label == nil {
            self.label = UILabel(frame: self.frame)
            self.addSubview(label!)
        }
        self.label!.text = text
    }
}
