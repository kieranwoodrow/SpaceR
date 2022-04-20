//
//  HomepageViewController.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/04/12.
//

import Foundation
import UIKit

class HomepageViewController: UIViewController {
    
    private lazy var homepageViewModel = HomepageViewModel(repository: HistoryRepository(),
                                                           delegate: self)
    @IBOutlet weak var historyCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homepageViewModel.historyList()
        setCollectionView()
    }
    
    private func setCollectionView() {
        historyCollectionView.delegate = self
        historyCollectionView.dataSource = self
    }
}

extension HomepageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homepageViewModel.historicEventsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = historyCollectionView.dequeueReusableCell(withReuseIdentifier: "HistoryCollectionViewCell",
                                                                   for: indexPath) as? UIHistoryCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        
        cell.setHistoryCell(title: homepageViewModel.historicEventTitle(index: indexPath.item),
                           date: homepageViewModel.historicEventDate(index: indexPath.item),
                           description: homepageViewModel.historicEventDescription(index: indexPath.item))
        return cell
    }
}

extension HomepageViewController: ViewModelDelegate {
    
    func reloadView() {
        self.historyCollectionView.reloadData()
    }
    
    func show(error: CustomError) {
        self.displayErrorAlert(title: error, errorMessage: error, buttonTitle: "OK")
    }
}
