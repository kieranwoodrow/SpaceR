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
    
    private lazy var rockets = RocketViewModel()
//    @IBOutlet weak var rocketCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getAllRocketsFromAPI()
        //setTableView()
    }
    
    private func setTableView() {
        
        rocketTableView.delegate = self
        rocketTableView.dataSource = self
    }
    
    func getAllRocketsFromAPI() {
        
        URLSession.shared.getAllRocketsEndpointURL(url: Constants.getAllRocketsUrl, model: [Rocket].self){ [weak self]result in
            switch result {
            case .success(let rocketsArray):
                self?.rockets.setAllRockets(rockets: rocketsArray)
                print(self?.rockets.getAllRockets())
                DispatchQueue.main.async {
                    self?.setTableView()
                    self?.rocketTableView.reloadData()
//                    self?.rocketTableView.beginUpdates()
//                    self?.rocketTableView.endUpdates()
                    
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

//UICollectionViewDelegateFlowLayout
extension RocketsController: UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rockets.getRocketCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = rocketTableView.dequeueReusableCell(withIdentifier: "RocketTableViewCell", for: indexPath) as? UIRocketTableViewCell
        else {
            print("IN ELSE STATEMENT")
            return UITableViewCell()
        }
        
        print("AVOIDED ELSE STATEMENT")
        print(cell)
        print(rockets.getRocketImage(index: indexPath.item))
        print(rockets.getRocketTitle(index: indexPath.item))
    
        cell.rocketTableViewTitle.text = title
        //.rocketTableViewImage.
        
        
//        setRocketCell(rocketImage: rockets.getRocketImage(index: indexPath.item), rocketTitle: rockets.getRocketTitle(index: indexPath.item), rocketCell: cell, index: indexPath.item)
        
        return cell
    }
    
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return rockets.getRocketCount()
//
//    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        guard let cell = rocketCollectionView.dequeueReusableCell(withReuseIdentifier: "RocketCell", for: indexPath) as? CustomCollectionViewCell
//        else {
//            return UICollectionViewCell()
//        }
//        setRocketCell(image: rockets.getRocketImage(index: indexPath.item), title: rockets.getRocketTitle(index: indexPath.item), rocketCell: cell, index: indexPath.item)
//
//        return cell
//    }
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: collectionView.frame.size.width/1.2, height: collectionView.frame.size.height/2)
//    }
    
    func setRocketCell(rocketImage: String, rocketTitle: String, rocketCell: UIRocketTableViewCell, index: Int){
        
        print(rocketImage)
        print(rocketTitle)
        
        //rocketCell.rocketTableViewTitle.text = rocketTitle
        //rocketCell.setRocketTableViewTitle(rocketTitle: rocketTitle)
        
        rocketCell.setRocketTableViewTitle(rocketTitle: rocketTitle)
        rocketCell.setRocketTableViewImage(rocketImageAsString: rocketImage)
        
        
//        if let image = URL(string: image){
//            rocketCell.rocketImage.convertImageFromStringToURL(imageString: image)
//            rocketCell.test()
//        }
    }
}



