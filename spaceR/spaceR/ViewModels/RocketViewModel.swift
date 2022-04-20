//
//  RocketViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/08.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func reloadView()
    func show(error: CustomError)
}

class RocketViewModel {
    
    private var repository: RocketRepositoryType?
    private weak var delegate: ViewModelDelegate?
    private var rockets: [Rocket]?
    
    init(repository: RocketRepositoryType,
         delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
        self.rockets = []
    }
    
    var rocketCount: Int {
        return rockets?.count ?? 0
    }
    
    func rocket(atIndex: Int) -> Rocket? {
        return rockets?[atIndex]
    }
    
    func rocketImage(index: Int) -> String {
        var rocketImage = ""
        if let safeImage = rockets?[index].images.randomElement() {
            rocketImage = safeImage ?? ""
        }
        return rocketImage
    }
    
    func rocketTitle(index: Int) -> String {
        return rockets?[index].name ?? ""
    }
    
    func rocketList() {
        repository?.fetchRockets(completion: { [weak self] result in
            switch result {
            case .success(let rocketsArray):
                self?.rockets = rocketsArray
                self?.delegate?.reloadView()
            case .failure(let error):
                self?.delegate?.show(error: error)
            }
        })
    }
}
