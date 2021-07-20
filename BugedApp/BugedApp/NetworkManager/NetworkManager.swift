//
//  NetworkManager.swift
//  BugedApp
//
//  Created by Daryna Polevyk on 19.07.2021.
//

import Foundation

class NetworkManager {

    func get(complitionHandler: @escaping (Welcome) -> ()) {
        let task = URLSession.shared.dataTask(with: URL(string: "https://quotes.instaforex.com/api/quotesList")!) { data, response, error in
            do {
                let json = try JSONDecoder().decode(Welcome.self, from: data!)
                complitionHandler(json)
            } catch {
                print("Error")
            }
        }
        task.resume()
    }
}
