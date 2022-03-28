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
    private var allLaunchpads: [Launchpads]
    
    init(repository: LaunchpadRepositoryType,
         delegate: ViewModelDelegate) {
        self.repository = repository
        self.delegate = delegate
        self.allLaunchpads = []
    }
    
    func setAllLaunchpads(launchpads: [Launchpads]) {
        allLaunchpads = launchpads
    }
    var launchpadCount: Int { return allLaunchpads.count }
    
    func getLaunchpadImage(index: Int) -> String {
        var launchpadImage = ""
        if let safeImage = allLaunchpads[index].images?.largeImage.randomElement() {
            launchpadImage = safeImage ?? ""
        }
        return launchpadImage
    }
    
    func getLaunchpadTitle(index: Int) -> String {
        return allLaunchpads[index].lauchpadName ?? ""
    }
    
    func getAllLaunchpadsFromAPI() {
        repository?.fetchLaunchpads(completion: {[weak self] result in
            switch result {
            case .success(let launchpadArray):
                self?.setAllLaunchpads(launchpads: launchpadArray)
                self?.delegate?.reloadView()
            case .failure(let error):
                self?.delegate?.show(error: error.rawValue)
            }
        })
    }
}
