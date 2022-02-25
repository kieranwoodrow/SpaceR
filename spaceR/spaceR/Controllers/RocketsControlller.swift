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
    //Creates an array of rockets.
    private var rockets: [Rocket] = []
    //private var launches: [Launch] = []
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //Calls the function that will perform API call for all rockets
        getAllRockets()
        //getAllLaunches()
        setupTableView()
        print(rockets)
    }
    
    private func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    //Function that will process the population of the rockets variable
    func getAllRockets(){
        //Use heper function from Endpoint.swift file
        URLSession.shared.getAllRocketsEndpointURL(url: Constants.getAllRocketsUrl, model: [Rocket].self){ result in
            //Swift the state of the result
            switch result{
            case .success(let userArray):
                //set rockets array to userarray
                self.rockets = userArray
                //Recall tablevview to reload data
                self.tableView.reloadData()
               // print(userArray)
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


