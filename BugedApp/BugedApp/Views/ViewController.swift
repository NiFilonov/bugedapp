//
//  ViewController.swift
//  BugedApp
//
//  Created by Никита Филонов on 17.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var presenter = Presenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // presenter.networkManager()
        setTableView()
        networkManager()
    }
    
  
}

//MARK: Extension
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(SingleTon.shared.quotes.count)
        return SingleTon.shared.quotes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! Cell
        cell.setLabelForCell(text: SingleTon.shared.quotes[indexPath.row].symbol)
        return cell
    }
    
    private func  setTableView() {
        tableView = UITableView(frame: self.view.frame)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(Cell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
    }
    
    private func networkManager() {
        let networkmanager = NetworkManager()
        networkmanager.get { json in
            SingleTon.shared.quotes = json.quotesList
            DispatchQueue.main.async { [self] in
                self.tableView.reloadData()
                print(SingleTon.shared.quotes)
            }
        }
    }
}
