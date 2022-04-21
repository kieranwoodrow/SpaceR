//
//  HomepageTests.swift
//  SpaceRTests
//
//  Created by Kieran Woodrow on 2022/04/20.
//

import XCTest
@testable import spaceR

class HomepageTests: XCTestCase {
    
    private var viewModel: HomepageViewModel!
    private var delegate: MockDelegate!
    private var repository: MockRepository!
    
    override func setUp() {
        delegate = MockDelegate()
        repository = MockRepository()
        viewModel = HomepageViewModel(repository: repository, delegate: delegate)
    }
    
    func testHistoryCountReturnsCorrectNumberOfHistoricEvents() {
        repository.failed = false
        repository.selectedEmptyHistoryEvent = false
        viewModel.historyList()
        XCTAssertEqual(viewModel.historicEventsCount, 1)
    }
    
    func testHistoryCountReturnsZeroIfApiCallFailsToPopulateHistoryArray() {
        repository.failed = true
        repository.selectedEmptyHistoryEvent = true
        viewModel.historyList()
        XCTAssertEqual(viewModel.historicEventsCount, 0)
    }
    
    func testHistoryTitleReturnsCorrectTitle() {
        repository.failed = false
        repository.selectedEmptyHistoryEvent = false
        viewModel.historyList()
        XCTAssertEqual(viewModel.historicEventTitle(index: 0), "This is an historic event for spaceR" )
    }
    
    func testRocketTitleReturnsEmptyStringIfTitleIsNil() {
        repository.failed = false
        repository.selectedEmptyHistoryEvent = true
        viewModel.historyList()
        XCTAssertEqual(viewModel.historicEventTitle(index: 0), "" )
    }
    
    func testHistoryEventDateReturnsCorrectDate() {
        repository.failed = false
        repository.selectedEmptyHistoryEvent = false
        viewModel.historyList()
        XCTAssertEqual(viewModel.historicEventDate(index: 0), "2011-01-01" )
    }
    
    func testHistoryEventDateReturnsEmptyStringIfDateIsNil() {
        repository.failed = false
        repository.selectedEmptyHistoryEvent = true
        viewModel.historyList()
        XCTAssertEqual(viewModel.historicEventDate(index: 0), "" )
    }
    
    func testHistoryEventDetailsReturnsCorrectDescription() {
        repository.failed = false
        repository.selectedEmptyHistoryEvent = false
        viewModel.historyList()
        XCTAssertEqual(viewModel.historicEventDescription(index: 0), "We have found what is inside a black hole" )
    }
    
    func testHistoryEventDescriptionReturnsEmptyStringIfDescriptionIsNil() {
        repository.failed = false
        repository.selectedEmptyHistoryEvent = true
        viewModel.historyList()
        XCTAssertEqual(viewModel.historicEventDescription(index: 0), "" )
    }
    
    func testHistoricEventListSuccess() {
        repository.failed = false
        viewModel.historyList()
        XCTAssert(delegate.reloadViewCalled)
        XCTAssertFalse(delegate.showErrorCalled)
    }
    
    func testHistoricEventListFailure() {
        repository.failed = true
        viewModel.historyList()
        XCTAssert(delegate.showErrorCalled)
        XCTAssertFalse(delegate.reloadViewCalled)
    }
    
    class MockRepository: HistoryRepositoryType {
        var failed = false
        var selectedEmptyHistoryEvent = false
        func fetchHistory(completion: @escaping (HistoryResult)) {
            if failed {
                completion(.failure(.unsuccessfulRocketApiCall))
            } else {
                completion(.success(mockData(selectedEmptyHistoryEvent: selectedEmptyHistoryEvent)))
            }
        }
        
        private func mockData(selectedEmptyHistoryEvent: Bool) -> [History] {
            
            let emptyHistoryEvent = selectedEmptyHistoryEvent
            
            let history1 = History(title: nil, eventDate: nil, details: nil, links: nil)
            
            let history2 = History(title: "This is an historic event for spaceR", eventDate: "2011-01-01",
                                   details: "We have found what is inside a black hole", links: nil)
            
            if emptyHistoryEvent {
                return [history1]
            } else {
                return [history2]
            }
        }
    }
    
    class MockDelegate: ViewModelDelegate {
        
        var showErrorCalled = false
        var reloadViewCalled = false
        
        func reloadView() {
            reloadViewCalled = true
        }
        
        func show(error: CustomError) {
            showErrorCalled = true
        }
    }
}
