//
//  RocketsControlller.swift
//  spaceR
//
//  Created by Kieran Woodrow on 2022/02/25.
//


import Foundation
import UIKit

class RocketsController: UIViewController {
    
    private lazy var rockets = RocketViewModel()
    @IBOutlet weak var rocketCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.emailIdLabel.text = self.emailText
        getAllRockets()
       // setCollectionView()
    }
    
    private func setCollectionView() {
        rocketCollectionView.delegate = self
        rocketCollectionView.dataSource = self
    }
    
    func getAllRockets() {
        print("------------------------------------")
        print("Entering getALLRockets function")
        URLSession.shared.getAllRocketsEndpointURL(url: Constants.getAllRocketsUrl, model: [Rocket].self){ [weak self]result in
            switch result {
            case .success(let rocketsArray):
                self?.rockets.setAllRockets(rockets: rocketsArray)
                print("Rocket Count")
                print(self?.rockets.getRocketCount())
                print("------------------------------------")
                
                print(self?.rockets.getAllRockets() ?? "no rockets populated")
                DispatchQueue.main.async {
                                   self?.setCollectionView()
                               }
                //self?.collectionView.
            case .failure(let error):
                print("Leaving success of getALLRockets function")
                print("------------------------------------")
                print(error)
            }
        }
    }
}

extension RocketsController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("------------------------------------")
//        print("Entering collectionView (1) function")
//        print(self.rockets)
//        print(rockets.getRocketCount())
//        print("Leaving collectionView (1) function")
//        print("------------------------------------")
//        return rockets.getRocketCount()
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print("------------------------------------")
        print("Entering collectionView (2) function")
        
        guard let cell = rocketCollectionView.dequeueReusableCell(withReuseIdentifier: "RocketCell", for: indexPath) as? CustomCollectionViewCell
        else{
            return UICollectionViewCell()
        }
        setRocketCell(image: rockets.getRocketImage(index: indexPath.item), title: rockets.getRocketTitle(index: indexPath.item), rocketCell: cell,
                   index: indexPath.item)
        print("Leaving collectionView (2) function")
        print("------------------------------------")
        
            return cell
    }
    
    func setRocketCell(image: String, title: String, rocketCell: CustomCollectionViewCell, index: Int){
        
        //do null testing here
        print("------------------------------------")
        print("Entering setRocketCell function")
        print(image)
        print(title)
        print(rocketCell)
        print(index)
        rocketCell.setRocketTitle(title: title)
        rocketCell.setRocketImage(image: image)
        //rocketCell.style()
        print("Leaving setRocketCellfunction")
        print("------------------------------------")
        
    }
    
}


