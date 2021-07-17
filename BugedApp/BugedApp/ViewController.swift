//
//  ViewController.swift
//  BugedApp
//
//  Created by Никита Филонов on 17.07.2021.
//

import UIKit

struct Welcome: Codable {
    let quotesList: [Quote]
}

// MARK: - QuotesList
struct Quote: Codable {
    let symbol, quotesListDescription: String
    let digits, trade, type: Int

    enum CodingKeys: String, CodingKey {
        case symbol
        case quotesListDescription = "description"
        case digits, trade, type
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var quotes: [Quote] = []
    var tableView: UITableView = UITableView()
 //   var cellForReuse: UITableViewCell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let url = URL(string: "https://quotes.instaforex.com/api/quotesList") else {
            return
            
            
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let quotes = try? JSONDecoder().decode(Welcome.self, from: data!) {// try 3 sostojania: try! - prinuditelno, padajet, , try do catch, try? - nil
                self.quotes = quotes.quotesList //nebezopasnyj
                DispatchQueue.main.async {
                   // print(quotes)
                    self.tableView.reloadData()
                }
            }
        }.resume()
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView = UITableView(frame: self.view.frame)
        setTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(quotes.count)
        return quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Cell
       // cell.backgroundColor = .blue
        cell.make(with: quotes[indexPath.row].symbol)
        
        //  cell.label = CGRect ()
        //cell.label.text = quotes[indexPath.row].symbol
        
      
        return cell
    }
   
    
    func  setTableView() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .red
        tableView.register(Cell.self, forCellReuseIdentifier: "cell") // !!!!!
        view.addSubview(tableView)
       // tableView.addSubview(<#T##view: UIView##UIView#>)
    }

}

