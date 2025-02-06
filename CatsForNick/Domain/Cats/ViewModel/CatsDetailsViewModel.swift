//
//  CatsDetailsViewModel.swift
//  CatsForNick
//
//  Created by Leonardo Saganski on 05/02/25.
//

import SwiftUI

class CatsDetailsViewModel: ObservableObject {
    let cat: Cat
    @Binding var isDetailsViewVisible: Bool
    
    init(cat: Cat, isDetailsViewVisible: Binding<Bool>) {
        self.cat = cat
        self._isDetailsViewVisible = isDetailsViewVisible
    }
}
