//
//  RocketsControlller.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/02/25.
//

import UIKit

class RocketsController: UIViewController {
    
    @IBOutlet private weak var rocketTableView: UITableView!
    private lazy var rocketViewModel = RocketViewModel(repository: RocketRepository(),
                                                       delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rocketViewModel.allRockets()
        setTableView()
    }
    
    private func setTableView() {
        rocketTableView.delegate = self
        rocketTableView.dataSource = self
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
        
        cell.setRocketCell(rocketImage: rocketViewModel.rocketImage(index: indexPath.item),
                           rocketTitle: rocketViewModel.rocketTitle(index: indexPath.item))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "RocketInfoViewControllerSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RocketInfoViewControllerSegue" {
            if let rocketInfoPage = segue.destination as? RocketInfoViewController {
                let row = self.rocketTableView?.indexPathForSelectedRow?.row ?? 0
                if let safeRocket = rocketViewModel.rocket(atIndex: row) {
                    rocketInfoPage.set(rocket: safeRocket)
                }
            }
        }
    }
}

extension RocketsController: ViewModelDelegate {
    
    func reloadView() {
        self.rocketTableView.reloadData()
    }
    
    func show(error: CustomError) {
        self.displayErrorAlert(title: error, errorMessage: error, buttonTitle: "OK")
    }
}
