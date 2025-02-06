//
//  CatsListViewModel.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import SwiftUI

@MainActor
class CatsListViewModel: ObservableObject {
    @Published var cats: [Cat] = []
    @Published var isLoading: Bool = false
    @Published var isLoadingMore: Bool = false
    @Published var isDetailsViewVisible: Bool = false
    @Published var hasError = false
    @Published var selectedCat: Cat?
    
    var errorMessage: String = ""
    private var page: Int = 0
    private var serviceManager: ServiceManagerProtocol
    var isThereMoreToFetch = false
    
    init(serviceManager: ServiceManagerProtocol) {
        self.serviceManager = serviceManager
    }
    
    func fetchCats() async {
        isLoading = !isLoadingMore
        let urlString = String(format: Constants.Service.imageSearch, page, Constants.Service.numberOfResults)

        defer {
            self.isLoading = false
            self.isLoadingMore = false
        }

        do {
            let result: [Cat] = try await serviceManager.fetch(urlString: urlString)
            isThereMoreToFetch = !result.isEmpty
            cats.append(contentsOf: result)
        } catch {
            if let error = error as? ServiceError {
                switch error {
                case .invalidURL:
                    errorMessage = Constants.ErrorMessage.invalidURL
                case .invalidResponse:
                    errorMessage = Constants.ErrorMessage.invalidResponse
                case .invalidData:
                    errorMessage = Constants.ErrorMessage.invalidData
                }
            } else {
                errorMessage = Constants.ErrorMessage.invalidResponse
            }
            hasError = true
        }
    }
    
    func loadMore() async {
        isLoadingMore = true
        page += 1
        await fetchCats()
    }
}
