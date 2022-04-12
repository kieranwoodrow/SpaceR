//
//  UIRocketInfoCollectionViewCell.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/04/01.
//

import Foundation
import UIKit

class UIRocketInfoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var rocketCollectionViewTitle: UILabel!
    @IBOutlet private weak var rocketCollectionViewInfo: UILabel!
    private var heading = ""
    private var info = ""
    
    func set(rocketTitle: String) {
        self.rocketCollectionViewTitle.text = rocketTitle
    }
    
    func set(rocketInfo: String) {
        self.rocketCollectionViewInfo.text = rocketInfo
    }
    
    func setRocketCell(viewModel: RocketInfoViewModel, indexPath: Int) {
        setHeadings(viewModel: viewModel, indexPath: indexPath)
        set(rocketTitle: heading)
        set(rocketInfo: info)
        self.layer.borderColor = UIColor(red: 1, green: 0.557, blue: 0.447, alpha: 100).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
    }
    
    func setHeadings(viewModel: RocketInfoViewModel, indexPath: Int) {
        switch indexPath {
        case indexPath where indexPath == 0:
            heading = "First Flight"
            info = viewModel.firstFlight
        case indexPath where indexPath == 1:
            heading = "Cost Per Launch"
            info = "$" + String(viewModel.launchCost)
        case indexPath where indexPath == 2:
            heading = "Success Rate"
            info = String(viewModel.successRate) + "%"
        case indexPath where indexPath == 3:
            heading = "Fuel Type A"
            info = viewModel.fuelTypeA
        case indexPath where indexPath == 4:
            heading = "Fuel Type B"
            info = viewModel.fuelTypeB
        case indexPath where indexPath == 5:
            heading = "Mass"
            info = String(viewModel.mass) + "kg"
        case indexPath where indexPath == 6:
            heading = "Height"
            info = String(viewModel.height) + "m"
        case indexPath where indexPath == 7:
            heading = "Diameter"
            info = String(viewModel.diameter) + "m"
        case indexPath where indexPath == 8:
            heading = "Active"
            info = String(viewModel.status)
        default:
            heading = ""
            info = ""
        }
    }
}
