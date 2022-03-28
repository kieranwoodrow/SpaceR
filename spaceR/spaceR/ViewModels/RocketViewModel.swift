//
//  RocketViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/08.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func reloadView()
    func show(error: String)
}

class RocketViewModel {
    
    private var repository: RocketRepositoryType?
    private weak var delegate: ViewModelDelegate?
    private var allRockets: [Rocket]?
    
    init(repository: RocketRepositoryType,
         delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
        self.allRockets = []
    }
    
    func setAllRockets(rockets: [Rocket]) {
        allRockets = rockets
    }
    
    var rocketList: [Rocket] { return allRockets ?? [] }
    
    var rocketCount: Int { return allRockets?.count ?? 0 }
    
    func getRocketImage(index: Int) -> String {
        var rocketImage = ""
        if let safeImage = allRockets?[index].images.randomElement() {
            rocketImage = safeImage ?? ""
        }
        return rocketImage
    }
    
    func getRocketTitle(index: Int) -> String {
        return allRockets?[index].name ?? ""
    }
    
    func getAllRocketsFromAPI() {
        repository?.fetchRockets(completion: {[weak self] result in
            switch result {
            case .success(let rocketsArray):
                self?.setAllRockets(rockets: rocketsArray)
                self?.delegate?.reloadView()
            case .failure(let error):
                self?.delegate?.show(error: error.rawValue)
            }
        })
    }
}
