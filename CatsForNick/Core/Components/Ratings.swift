//
//  Ratings.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 06/02/25.
//

import SwiftUI

struct Ratings: View {
    let title: String
    let value: Int
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundStyle(.textPrimary)
            Spacer()
            HStack {
                ForEach(1..<6, content: { index in
                    Image(systemName: index <= value ? "star.fill" : "star")
                        .foregroundColor(.main)
                })
            }
        }
    }
}

#Preview {
    Ratings(title: "Title", value: 3)
}
