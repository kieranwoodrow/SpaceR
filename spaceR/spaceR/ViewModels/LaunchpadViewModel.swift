//
//  LaunchpadViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/03/21.
//

import Foundation

class LaunchpadViewModel {
    
    private var repository: LaunchpadRepositoryType?
    private weak var delegate: ViewModelDelegate?
    private var allLaunchpads: [Launchpads]?
    
    init(repository: LaunchpadRepositoryType,
         delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
        self.allLaunchpads = []
    }
    
    var launchpadCount: Int {
        return allLaunchpads?.count ?? 0
    }
    
    func launchpadImage(index: Int) -> String {
        var launchpadImage = ""
        if let safeImage = allLaunchpads?[index].images?.largeImage.randomElement() {
            launchpadImage = safeImage ?? ""
        }
        return launchpadImage
    }
    
    func launchpadTitle(index: Int) -> String {
        return allLaunchpads?[index].lauchpadName ?? ""
    }
    
    func getAllLaunchpads() {
        repository?.fetchLaunchpads(completion: {[weak self] result in
            switch result {
            case .success(let launchpadArray):
                self?.allLaunchpads = launchpadArray
                self?.delegate?.reloadView()
            case .failure(let error):
                self?.delegate?.show(error: error)
            }
        })
    }
}
