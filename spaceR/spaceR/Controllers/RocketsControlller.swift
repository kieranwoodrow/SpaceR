//
//  RocketsControlller.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/02/25.
//

import Foundation
import UIKit

class RocketsController: UIViewController {
    
    @IBOutlet private weak var rocketTableView: UITableView!
    private lazy var rocketViewModel = RocketViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllRocketsFromAPI()
        setTableView()
    }
    
    private func setTableView() {
        rocketTableView.delegate = self
        rocketTableView.dataSource = self
    }
    
    private func getAllRocketsFromAPI() {
        URLSession.shared.getDataFromApi(url: Constants.getAllRocketsUrl, model: [Rocket].self) {[weak self]result in
            switch result {
            case .success(let rocketsArray):
                self?.rocketViewModel.setAllRockets(rockets: rocketsArray)
                DispatchQueue.main.async {
                    self?.rocketTableView.reloadData()
                }
            case .failure:
                self?.displayErrorAlert(title: .unsuccessfulRocketApiCall,
                                        errorMessage: .unsuccessfulRocketApiCall,
                                        buttonTitle: "Ok")
            }
        }
    }
}

extension RocketsController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rocketViewModel.rocketCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = rocketTableView.dequeueReusableCell(withIdentifier: "RocketTableViewCell", for: indexPath) as? UIRocketTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.setRocketCell(rocketImage: rocketViewModel.getRocketImage(atIndex: indexPath.item),
                           rocketTitle: rocketViewModel.getRocketTitle(atIndex: indexPath.item),
                           atIndex: indexPath.item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "RocketsInfoViewControllerSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RocketsInfoViewControllerSegue" {
            if let rocketInfoPage = segue.destination as? RocketsInfoViewController {
                let row = self.rocketTableView?.indexPathForSelectedRow?.row ?? 0

                rocketInfoPage.set(rocketInfo: rocketViewModel.getRocket(atIndex: row))
            }
        }
    }
}
