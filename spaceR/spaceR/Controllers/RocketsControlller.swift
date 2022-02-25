//
//  RocketsControlller.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/02/25.
//

import Foundation


import UIKit

class ViewController: UIViewController {
    
    //Creates an array of rockets. This will be populatted by api call
    private var rockets: [Rocket] = []
    //private var launches: [Launch] = []
    @IBOutlet private var tableView: UITableView!
    var viewModel :Rocket?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        //Calls the function that will perform API call for all rockets
        getAllRockets()
        //getAllLaunches()
        
    }
    private func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}
    
    //Function that will process the population of the rockets variable
    func getAllRockets(){
        
        //Use heper function from Endpoint.swift file
        URLSession.shared.getAllRocketsEndpointURL(url: Constants.getAllRocketsUrl, model: [Rocket].self){ result in
            
            //Swift the state of the result
            switch result{
            case .success(let userArray):
                print("--------ALL AVAILABLE ROCKET NAMES-------------------")
                for rocket in userArray{
                    if let rocketName = rocket.name{
                        print(rocketName)
                    }
                }
             
            case .failure(let error):
                print(error)
            }
        }
    }
    
//    func getAllLaunches(){
//
//        //Use heper function from Endpoint.swift file
//        URLSession.shared.getAllLaunchesEndpointURL(url: Constants.getAllLaunchesUrl, model: [Launch].self){ result in
//
//            //Swift the state of the result
//            switch result{
//            case .success(let launchArray):
//
//                print("--------ALL MISSION LAUNCH NAMES-------------------")
//                for launch in launchArray{
//                    if let launchName = launch.name{
//                        print("This was launch " + launchName )
//                    }
//                }
//
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }


