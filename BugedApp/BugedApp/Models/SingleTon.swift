//
//  SingleTon.swift
//  BugedApp
//
//  Created by Daryna Polevyk on 19.07.2021.
//

import Foundation

class SingleTon {
    static var shared = SingleTon()
    var quotes: [Quote] = []
    
    private init() {
    }
}
