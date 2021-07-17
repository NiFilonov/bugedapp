//
//  Cell.swift
//  BugedApp
//
//  Created by Никита Филонов on 17.07.2021.
//

import UIKit

class Cell: UITableViewCell {
    
    var label: UILabel = UILabel(frame: .zero)
    
    func make(with name: String) {
        self.label = UILabel(frame: self.frame)
        self.label.text = name
    }
    
}
