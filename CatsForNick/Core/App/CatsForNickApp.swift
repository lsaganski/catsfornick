//
//  CatsForNickApp.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import SwiftUI

@main
struct CatsForNickApp: App {
    var body: some Scene {
        WindowGroup {
            CatsListView()
        }
        .environmentObject(AsyncImageViewModel())
    }
}
