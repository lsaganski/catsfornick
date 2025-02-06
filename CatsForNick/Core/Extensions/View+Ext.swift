//
//  View+Ext.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import SwiftUI

extension View {
    @MainActor
    func render() -> UIImage? {
        let renderer = ImageRenderer(content: self)
        return renderer.uiImage
    }
    
    func navigationBarTitleTextColor(_ color: Color) -> some View {
        let uiColor = UIColor(color)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
        return self
    }
}
