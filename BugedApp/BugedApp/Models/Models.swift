//
//  Models.swift
//  BugedApp
//
//  Created by Daryna Polevyk on 19.07.2021.
//

import Foundation

struct Welcome: Codable {
    let quotesList: [Quote]
}
struct Quote: Codable {
    let symbol, quotesListDescription: String
    let digits, trade, type: Int

    enum CodingKeys: String, CodingKey {
        case symbol
        case quotesListDescription = "description"
        case digits, trade, type
    }
}
