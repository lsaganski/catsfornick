//
//  LoadingView.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.background)
                .edgesIgnoringSafeArea(.all)
            ProgressView("Loading...")
                .foregroundColor(.textPrimary)
                .progressViewStyle(CircularProgressViewStyle(tint: .main))
                .scaleEffect(2)
        }
    }
}

#Preview {
    LoadingView()
}
