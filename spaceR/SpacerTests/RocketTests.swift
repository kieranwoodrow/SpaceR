//
//  RocketTests.swift
//  SpaceRTests
//
//  Created by Kieran Woodrow on 2022/04/11.
//

import XCTest
@testable import spaceR

class RocketTests: XCTestCase {
    
    private var viewModel: RocketViewModel!
    private var delegate: MockDelegate!
    private var repository: MockRepository!
    
    override func setUp() {
        delegate = MockDelegate()
        repository = MockRepository()
        viewModel = RocketViewModel(repository: repository, delegate: delegate)
    }
    
    func testRocketCountReturnsCorrectNumberOfRockets() {
        repository.failed = false
        repository.selectedEmptyRocket = false
        viewModel.allRockets()
        XCTAssertEqual(viewModel.rocketCount, 1)
    }
    
    func testRocketCountReturnsZeroIfApiCallFailsToPopulateRocketArray() {
        repository.failed = true
        repository.selectedEmptyRocket = true
        viewModel.allRockets()
        XCTAssertEqual(viewModel.rocketCount, 0)
    }
    
    func testRocketTitleReturnsCorrectTitle() {
        repository.failed = false
        repository.selectedEmptyRocket = false
        viewModel.allRockets()
        XCTAssertEqual(viewModel.rocketTitle(index: 0), "Test Rocket Name" )
    }
    
    func testRocketTitleReturnsEmptyStringIfTitleIsNil() {
        repository.failed = false
        repository.selectedEmptyRocket = true
        viewModel.allRockets()
        XCTAssertEqual(viewModel.rocketTitle(index: 0), "" )
    }
    
    func testRocketImageReturnsCorrectRandomImage() {
        repository.failed = false
        repository.selectedEmptyRocket = false
        viewModel.allRockets()
        let images = ["testImage1.png", "testImage2.png2", "testImage3.png"]
        let randomImage = viewModel.rocketImage(index: 0)
        var index = 0
        for (indexAt, image) in images.enumerated() where image == randomImage {
            index = indexAt
        }
        XCTAssertEqual(images[index], randomImage)
    }
    
    func testRocketImageReturnsEmptyStringIfImageArrayIsNil() {
        repository.failed = false
        repository.selectedEmptyRocket = true
        viewModel.allRockets()
        XCTAssertEqual(viewModel.rocketImage(index: 0), "")
    }
    
    func testGetRocketReturnsCorrectRocket() {
        repository.failed = false
        repository.selectedEmptyRocket = false
        viewModel.allRockets()
        XCTAssertEqual(viewModel.rocket(atIndex: 0)?.id, "11001100" )
    }
    
    func testGetAllRocketsSuccess() {
        repository.failed = false
        viewModel.allRockets() 
        XCTAssert(delegate.reloadViewCalled)
        XCTAssertFalse(delegate.showErrorCalled)
    }
    
    func testGetAllRocketsFailure() {
        repository.failed = true
        viewModel.allRockets()
        XCTAssert(delegate.showErrorCalled)
        XCTAssertFalse(delegate.reloadViewCalled)
    }
    
    class MockRepository: RocketRepositoryType {
        var failed = false
        var selectedEmptyRocket = false
        func fetchRockets(completion: @escaping (RocketResult)) {
            if failed {
                completion(.failure(.unsuccessfulRocketApiCall))
            } else {
                completion(.success(mockData(selectedEmptyRocket: selectedEmptyRocket)))
            }
        }
        
        private func mockData(selectedEmptyRocket: Bool) -> [Rocket] {
            
            let emptyRocket = selectedEmptyRocket
            
            let rocket1 = Rocket(height: nil, diameter: nil , mass: nil, firstStage: nil,
                                 secondStage: nil, engines: nil , landingLegs: nil,
                                 payloadWeights: [nil], images: [nil],
                                 name: nil, type: nil, firstFlight: nil,
                                 country: nil, company: nil, wikipedia: nil,
                                 description: nil, id: nil, active: false,
                                 stages: nil, boosters: nil, costPerLaunch: nil, successRatePercentage: nil)
            
            let rocket2 = Rocket(height: nil, diameter: nil , mass: nil, firstStage: nil,
                                 secondStage: nil, engines: nil , landingLegs: nil,
                                 payloadWeights: [nil], images: ["testImage1.png", "testImage2.png2", "testImage3.png"],
                                 name: "Test Rocket Name", type: "Falcon", firstFlight: "2006-03-02",
                                 country: "USA", company: "Nasa", wikipedia: "www.wiki.com",
                                 description: "Test rockets", id: "11001100", active: false,
                                 stages: 2, boosters: 2, costPerLaunch: 2000000, successRatePercentage: 80)
            
            if emptyRocket {
                return [rocket1]
            } else {
                return [rocket2]
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
