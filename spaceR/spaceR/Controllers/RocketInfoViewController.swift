//
//  RocketInfoViewController.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/04/01.
//

import UIKit

class RocketInfoViewController: UIViewController {
    
    @IBOutlet private weak var rocketImage: UIImageView!
    @IBOutlet private weak var rocketName: UILabel!
    @IBOutlet private weak var location: UILabel!
    @IBOutlet weak var rocketCollectionView: UICollectionView!
    @IBOutlet private weak var rocketDescription: UILabel!
    private lazy var rocketInfoViewModel = RocketInfoViewModel(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
        setUILabels()
    }
    
    func set(rocket: Rocket) {
        rocketInfoViewModel.set(rocket: rocket)
    }
    
    private func setCollectionView() {
        rocketCollectionView.delegate = self
        rocketCollectionView.dataSource = self
    }
    
    private func setUILabels() {
        self.rocketName.text = rocketInfoViewModel.rocketName
        self.location.text = rocketInfoViewModel.country
        self.rocketDescription.text = rocketInfoViewModel.rocketDescription
        if let url = rocketInfoViewModel.image {
            self.rocketImage.getImagesFromURL(imageURL: url )
        }
    }
}

extension RocketInfoViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rocketInfoViewModel.headingsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = rocketCollectionView.dequeueReusableCell(withReuseIdentifier: "RocketInfoCollectionViewCell",
                                                                  for: indexPath) as? UIRocketInfoCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.setRocketCell(headings: rocketInfoViewModel.setHeadings(indexPath: indexPath.item))
        return cell
    }
}
extension RocketInfoViewController: ViewModelDelegate {
    
    func reloadView() {
        self.rocketCollectionView.reloadData()
    }
    
    func show(error: CustomError) {
        self.displayErrorAlert(title: error, errorMessage: error, buttonTitle: "OK")
    }
}
