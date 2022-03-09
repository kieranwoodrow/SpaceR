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
        getAllRockets()
    }
    
    private func setCollectionView() {
        
        rocketCollectionView.delegate = self
        rocketCollectionView.dataSource = self
    }
    
    func getAllRockets() {
        
        URLSession.shared.getAllRocketsEndpointURL(url: Constants.getAllRocketsUrl, model: [Rocket].self){ [weak self]result in
            switch result {
            case .success(let rocketsArray):
                self?.rockets.setAllRockets(rockets: rocketsArray)
                DispatchQueue.main.async {
                    self?.setCollectionView()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension RocketsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rockets.getRocketCount()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = rocketCollectionView.dequeueReusableCell(withReuseIdentifier: "RocketCell", for: indexPath) as? CustomCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        setRocketCell(image: rockets.getRocketImage(index: indexPath.item), title: rockets.getRocketTitle(index: indexPath.item), rocketCell: cell, index: indexPath.item)
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width/1.2, height: collectionView.frame.size.height/2)
    }
    
    func setRocketCell(image: String, title: String, rocketCell: CustomCollectionViewCell, index: Int){
        
        //rocketCell.rocketTitle.text = title
        rocketCell.setRocketTitle(title: title)
        if let image = URL(string: image){
            rocketCell.rocketImage.convertImageFromStringToURL(imageString: image)
            rocketCell.test()
        }
    }
}



