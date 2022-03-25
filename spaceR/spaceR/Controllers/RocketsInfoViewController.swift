//
//  RocketsInfoViewController.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/23.
//

import UIKit

class RocketsInfoViewController: UIViewController {

    @IBOutlet weak var rocketName: UILabel!
    @IBOutlet weak var rocketDescription: UILabel!
    
    private lazy var rocketInfoViewModel = RocketInfoViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Test implementation
        rocketDescription.text = rocketInfoViewModel.rocketDescription
        
        rocketName.text = rocketInfoViewModel.rocketName
        
        print(rocketDescription.text)
        

    }
    
    func set(rocketInfo: Rocket) {
        rocketInfoViewModel.set(rocket: rocketInfo)
    }
}
