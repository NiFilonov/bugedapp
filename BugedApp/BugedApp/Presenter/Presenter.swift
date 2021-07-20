//
//  Presenter.swift
//  BugedApp
//
//  Created by Daryna Polevyk on 19.07.2021.
//

import Foundation

class Presenter {
    var view: ViewController?

    func networkManager() {
        let networkmanager = NetworkManager()
        networkmanager.get { json in
            SingleTon.shared.quotes = json.quotesList
            DispatchQueue.main.async {
                print(SingleTon.shared.quotes)
                self.view?.tableView.reloadData()
            }
        }
    }

}


