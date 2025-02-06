//
//  CatsListViewCell.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import SwiftUI

struct CatsListViewCell: View {
    
    let cat: Cat
    
    var body: some View {
        HStack {
            AsyncImageWithCache(urlString: cat.url ?? "")
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            VStack(alignment: .leading) {
                Text(cat.breeds?.first?.name ?? "")
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.textPrimary)
                Text(cat.breeds?.first?.origin ?? "")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
                    .foregroundStyle(.textSecondary)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(Color.background)
    }
}

#Preview {
    CatsListViewCell(cat: CatMock.sample)
}
