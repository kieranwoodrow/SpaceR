//
//  LaunchpadViewController.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/18.
//

import Foundation
import UIKit

class LaunchpadViewController: UIViewController {
    
    @IBOutlet private weak var launchpadTableView: UITableView!
    private lazy var launchpadViewModel = LaunchpadViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllLaunchpadsFromAPI()
        setTableView()
    }
    
    private func setTableView() {
        launchpadTableView.delegate = self
        launchpadTableView.dataSource = self
    }
    
    private func getAllLaunchpadsFromAPI() {
        URLSession.shared.getDataFromApi(url: Constants.getAllLaunchpadsUrl, model: [Launchpads].self) {[weak self]result in
            switch result {
            case .success(let launchpadsArray):
                self?.launchpadViewModel.setAllLaunchpads(launchpads: launchpadsArray)
                DispatchQueue.main.async {
                    self?.launchpadTableView.reloadData()
                }
            case .failure:
                self?.displayErrorAlert(title: .unsuccessfulLaunchpadApiCall,
                                        errorMessage: .unsuccessfulLaunchpadApiCall,
                                        buttonTitle: "Ok")
            }
        }
    }
}

extension LaunchpadViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        launchpadViewModel.launchpadCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = launchpadTableView.dequeueReusableCell(withIdentifier: "LaunchpadTableViewCell",
                                                                for: indexPath) as? UILaunchpadTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.setLaunchpadCell(image: launchpadViewModel.getLaunchpadImage(index: indexPath.item),
                              title: launchpadViewModel.getLaunchpadTitle(index: indexPath.item),
                              atIndex: indexPath.item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
