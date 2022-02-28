//
//  RocketsControlller.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/02/25.
//


import Foundation
import UIKit

class RocketsController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var emailIdLabel: UILabel!
    var emailText = ""
    private var rockets: [Rocket] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailIdLabel.text = self.emailText
        getAllRockets()
        setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func getAllRockets() {
        URLSession.shared.getAllRocketsEndpointURL(url: Constants.getAllRocketsUrl, model: [Rocket].self){ [weak self]result in
            switch result {
            case .success(let userArray):
                self?.rockets = userArray
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension RocketsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "basic") else{
            return UITableViewCell()
        }
        cell.textLabel?.text = rockets[indexPath.item].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rockets.count
    }
}


