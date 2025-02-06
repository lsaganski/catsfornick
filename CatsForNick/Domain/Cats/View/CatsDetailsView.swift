//
//  CatsDetailsView.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import SwiftUI

struct CatsDetailsView: View {
    
    let viewModel: CatsDetailsViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImageWithCache(urlString: viewModel.cat.url ?? "")
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 350, height: 225)
                    .clipped()
                VStack {
                    Text(viewModel.cat.breeds?.first?.name ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.textPrimary)
                        .padding(10)
                    Text(viewModel.cat.breeds?.first?.description ?? "")
                        .accessibilityIdentifier(Constants.Testing.description)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .foregroundStyle(.textSecondary)
                        .padding(10)

                    VStack(alignment: .leading) {
                        Info(title: "Origin: ", value: viewModel.cat.breeds?.first?.origin ?? "")
                        Info(title: "Temperament: ", value: viewModel.cat.breeds?.first?.temperament ?? "")
                        Info(title: "Life Span: ", value: viewModel.cat.breeds?.first?.life_span ?? "")
                        Info(title: "Weight: ", value: viewModel.cat.breeds?.first?.weight?.imperial ?? "")
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 10)

                    infoRatings
                }
                .frame(maxWidth: .infinity)
                Spacer()
            }
        }
        .frame(width: 350, height: UIScreen.main.bounds.height - 150)
        .background(Color(.background))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(
            Button {
                viewModel.isDetailsViewVisible = false
            } label: {
                DismissButton()
            }, alignment: .topTrailing
        )
    }
    
    var infoRatings: some View {
        VStack {
            Ratings(title: "Adaptability" ,value: viewModel.cat.breeds?.first?.adaptability ?? 0)
            Ratings(title: "Affection level" ,value: viewModel.cat.breeds?.first?.affection_level ?? 0)
            Ratings(title: "Child friendly" ,value: viewModel.cat.breeds?.first?.child_friendly ?? 0)
            Ratings(title: "Dog friendly" ,value: viewModel.cat.breeds?.first?.dog_friendly ?? 0)
            Ratings(title: "Energy level" ,value: viewModel.cat.breeds?.first?.energy_level ?? 0)
            Ratings(title: "Grooming" ,value: viewModel.cat.breeds?.first?.grooming ?? 0)
            Ratings(title: "Health issues" ,value: viewModel.cat.breeds?.first?.health_issues ?? 0)
            Ratings(title: "Intelligence" ,value: viewModel.cat.breeds?.first?.intelligence ?? 0)
            Ratings(title: "Social needs" ,value: viewModel.cat.breeds?.first?.social_needs ?? 0)
            Ratings(title: "Stranger friendly" ,value: viewModel.cat.breeds?.first?.stranger_friendly ?? 0)
        }
        .padding(10)
    }
}

struct Info: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .bold()
                .foregroundStyle(.textPrimary)
            Spacer()
            Text(value)
                .foregroundStyle(.textSecondary)
        }
        .frame(maxWidth: .infinity)
    }
}
                    
#Preview {
    CatsDetailsView(viewModel: CatsDetailsViewModel(cat: CatMock.sample,
                                                    isDetailsViewVisible: .constant(true)))
}
