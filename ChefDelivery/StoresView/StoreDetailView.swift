//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 09/06/25.
//

import SwiftUI

struct StoreDetailView: View {
    
    let store: StoreType
    
    var body: some View {
        Text(store.name)
    }
}

#Preview {
    StoreDetailView(store: storesMock[0])
}
