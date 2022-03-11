//
//  RocketsControlller.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/02/25.
//

import Foundation
import UIKit

class RocketsController: UIViewController {
    
    @IBOutlet weak var rocketTableView: UITableView!
    private lazy var rocketViewModel = RocketViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllRocketsFromAPI()
        setTableView()
    }
    
    func setTableView() {
        rocketTableView.delegate = self
        rocketTableView.dataSource = self
    }
    
    func getAllRocketsFromAPI() {
        URLSession.shared.getAllRocketsEndpointURL(url: Constants.getAllRocketsUrl, model: [Rocket].self) {[weak self]result in
            switch result {
            case .success(let rocketsArray):
                self?.rocketViewModel.setAllRockets(rockets: rocketsArray)
                DispatchQueue.main.async {
                    self?.rocketTableView.reloadData()
                }
            case .failure(let error):
                self?.displayErrorAlertForLogin(title: "Api did not find any rockets",
                                                errorMessage: error.localizedDescription,
                                                buttonTitle: "Ok")
                return
            }
        }
    }
}

extension RocketsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rocketViewModel.getRocketCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = rocketTableView.dequeueReusableCell(withIdentifier: "RocketTableViewCell", for: indexPath) as? UIRocketTableViewCell
        else {
            return UITableViewCell()
        }
        
        setRocketCell(rocketImage: rocketViewModel.getRocketImage(index: indexPath.item),                                            rocketTitle: rocketViewModel.getRocketTitle(index: indexPath.item),
                      rocketCell: cell, atIndex: indexPath.item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }
    
    func setRocketCell(rocketImage: String, rocketTitle: String, rocketCell: UIRocketTableViewCell, atIndex: Int) {
        rocketCell.setRocketTableViewTitle(rocketTitle: rocketTitle)
        rocketCell.setRocketTableViewImage(rocketImage: rocketImage)
        rocketCell.rocketImageStyling()
    }
}
