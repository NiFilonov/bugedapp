//
//  ViewController.swift
//  BugedApp
//
//  Created by Никита Филонов on 17.07.2021.
//

import UIKit

class Quote: Codable {
    
     let symbol: String
         let description: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
       var quotes: [Quote] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quotes.count
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
            guard let url = URL(string: "https://quotes.instaforex.com/api/quotesList") else {
                return
                
                
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                let quotes = try! JSONDecoder().decode([Quote].self, from: data!)
        self.quotes = quotes
                self.tableView.reloadData()
            }.resume()
    }
    
        override func viewWillAppear(_ animated: Bool) {
        tableView = UITableView(frame: self.view.frame)
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Cell
        cell.label.text = quotes[indexPath.row].symbol
        
        
        
        
        
        return cell
    }
    var tableView: UITableView = UITableView(frame: .zero)

}

