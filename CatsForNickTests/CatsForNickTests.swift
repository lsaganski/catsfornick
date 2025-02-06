//
//  CatsForNickTests.swift
//  CatsForNickTests
//
//  Created by Leonardo Saganski on 06/02/25.
//

import XCTest
import SwiftUI

@MainActor
final class CatsForNickTests: XCTestCase {
    func testFetchCats() throws {
        @StateObject var viewModel = CatsListViewModel(serviceManager: ServiceManagerMock())
        Task {
            await viewModel.fetchCats()
            
            XCTAssert(viewModel.cats.count == 10)
            XCTAssert(viewModel.cats.last?.breeds?.first?.name ?? "" == "American Bobtail")
        }
    }
}
