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
    private lazy var launchpadViewModel = LaunchpadViewModel(repository: LaunchpadRepository(),
                                                             delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        launchpadViewModel.getAllLaunchpads()
        setTableView()
    }
    
    private func setTableView() {
        launchpadTableView.delegate = self
        launchpadTableView.dataSource = self
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
        
        cell.setLaunchpadCell(image: launchpadViewModel.launchpadImage(index: indexPath.item),
                              title: launchpadViewModel.launchpadTitle(index: indexPath.item),
                              atIndex: indexPath.item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension LaunchpadViewController: ViewModelDelegate {
    
    func reloadView() {
        DispatchQueue.main.async {
            self.launchpadTableView.reloadData()
        }
    }
    
    func show(error: CustomError) {
        self.displayErrorAlert(title: error, errorMessage: error, buttonTitle: "OK")
    }
}
