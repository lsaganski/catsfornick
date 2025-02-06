//
//  CatsListView.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import SwiftUI

@MainActor
struct CatsListView: View {
    
    @StateObject private var viewModel = CatsListViewModel(serviceManager: ServiceManager())
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    ForEach(viewModel.cats) { cat in
                        CatsListViewCell(cat: cat)
                            .listRowSeparator(.hidden)
                            .onTapGesture {
                                viewModel.selectedCat = cat
                                viewModel.isDetailsViewVisible = true
                            }
                    }
                    .listRowBackground(Color.background)
                    if viewModel.isThereMoreToFetch {
                        lastRowView
                    }
                }
                .background(Color.background)
                .accessibilityIdentifier(Constants.Testing.catList)
                .navigationTitle("Cats for Nick")
                .listStyle(.plain)
                .disabled(viewModel.isDetailsViewVisible)
            }
            .task {
                await viewModel.fetchCats()
            }
            .blur(radius: viewModel.isDetailsViewVisible ? 20 : 0)
            .navigationBarTitleTextColor(.textPrimary)
            
            if viewModel.isDetailsViewVisible, let cat = viewModel.selectedCat {
                let detailsViewModel = CatsDetailsViewModel(cat: cat,
                                                            isDetailsViewVisible: $viewModel.isDetailsViewVisible)
                CatsDetailsView(viewModel: detailsViewModel)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text("Try again"),
                  message: Text(viewModel.errorMessage),
                  dismissButton: .default(Text("OK")))
        }
    }
    
    var lastRowView: some View {
        ZStack(alignment: .center) {
            if viewModel.isLoadingMore {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .main))
                    .scaleEffect(2)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .task {
            await viewModel.loadMore()
        }
    }
}

#Preview {
    CatsListView()
}
