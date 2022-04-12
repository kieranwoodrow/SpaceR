//
//  HomepageViewModel.swift
//  SpaceR
//
//  Created by Kieran Woodrow on 2022/04/12.
//

import Foundation

class HomepageViewModel {
    
    private var historyRepository: HistoryRepositoryType?
    private weak var delegate: ViewModelDelegate?
    private var historicEvents: [History]?
    
    init(repository: HistoryRepositoryType,
         delegate: ViewModelDelegate) {
        self.historyRepository = repository
        self.delegate = delegate
        self.historicEvents = []
    }
    
    var historicEventsCount: Int {
        return historicEvents?.count ?? 0
    }
    
    func historicEventTitle(index: Int) -> String {
        return historicEvents?[index].title ?? ""
    }
    
    func historicEventDate(index: Int) -> String {
        return historicEvents?[index].eventDate ?? ""
    }
    
    func historicEventDescription(index: Int) -> String {
        return historicEvents?[index].details ?? ""
    }
    
    func getAllHistory() {
        historyRepository?.fetchHistory(completion: { [weak self] result in
            switch result {
            case .success(let historyArray):
                self?.historicEvents = historyArray
                self?.delegate?.reloadView()
            case .failure(let error):
                self?.delegate?.show(error: error)
            }
        })
    }
}
