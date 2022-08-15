//
//  HomeViewModel_Tests.swift
//  Recipes_Tests
//
//  Created by Summer Crow on 2022-08-04.
//

import XCTest
import SwiftUI
import Combine
@testable import Recipes

class HomeViewModel_Tests: XCTestCase {
    
    var vm: HomeViewModel?
    var cancellables = Set<AnyCancellable>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = HomeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
    }

    func test_HomeViewModel_loadMealFiltersFromAppStorage_retrievesMealAndMenuTypesSavedToAppStorage(){
        //Given
        guard let vm = vm else {
            XCTFail()
            return
        }
       // let vm = HomeViewModel()
        
        //when
        vm.loadMealFiltersFromAppStorage()
        
        //then
        XCTAssertTrue(!vm.mealType.isEmpty)
        XCTAssertTrue(!vm.menuType.isEmpty)
        
    }
    
    func test_HomeViewModel_upDateMealTagsForURL_StringGeneratedWithCorrectMealAndMenuTypes(){

      //  let vm = HomeViewModel()
        guard let vm = vm else {
            XCTFail()
            return
        }
        //when
        vm.upDateMealTagsForURL()
        //then
        let mealTypesToIncludeInSearch = vm.mealType.filter { $0.include }
        let mealTypesToExcludeInSearch = vm.mealType.filter { !$0.include }
        for meal in mealTypesToIncludeInSearch {
            XCTAssertTrue(vm.mealTags.contains(meal.mealTag.lowercased()))
        }
        for meal in mealTypesToExcludeInSearch {
            XCTAssertFalse(vm.mealTags.contains(meal.mealTag.lowercased()))
        }
    
    }
    
    func test_HomeViewModel_upDateURL_URLUpdatedCorrectly(){
        //given
        guard let vm = vm else {
            XCTFail()
            return
        }
      //  let vm = HomeViewModel()
        vm.mealTags = ""
        //when
        vm.upDateURL()
        //then
        XCTAssertTrue(vm.dataService.urlString == "https://tasty.p.rapidapi.com/recipes/list?from=0&size=100&tags=")
        
        vm.mealTags = "lunch"
        //when
        vm.upDateURL()
        //then
        XCTAssertTrue(vm.dataService.urlString == "https://tasty.p.rapidapi.com/recipes/list?from=0&size=100&tags=lunch")
        
        vm.mealTags = " lunch keto"
        //when
        vm.upDateURL()
        //then
        XCTAssertTrue(vm.dataService.urlString == "https://tasty.p.rapidapi.com/recipes/list?from=0&size=100&tags=%20lunch%20keto")
    
        
        vm.mealTags = " lunch keto sides"
        //when
        vm.upDateURL()
        //then
        XCTAssertTrue(vm.dataService.urlString == "https://tasty.p.rapidapi.com/recipes/list?from=0&size=100&tags=%20lunch%20keto%20sides")
    }
    
    func test_HomeViewModel_addSubscribers_shouldReturnRecipes() {
        //given
//        guard let vm = vm else {
//            XCTFail()
//            return
//        }
        let vm1 = HomeViewModel()
        //when
        let expectation = XCTestExpectation(description: "Should return items after a few seconds")
       // let expectation = self.expectation(description: "should return recipes after a few seconds")
    
        vm1.$allRecipes
            .dropFirst()
            .sink{ returnedRecipes in
                print("count 1 \(returnedRecipes.count)")
                expectation.fulfill()
                print("count 2 \(returnedRecipes.count)")
            }
            .store(in: &cancellables)
        vm1.upDateURL()
        vm1.addSubscribers()
        
        //then
        wait(for: [expectation], timeout: 5)
        
        
        
        XCTAssertEqual(vm1.allRecipes.count, 0)
        
    }
    

}
