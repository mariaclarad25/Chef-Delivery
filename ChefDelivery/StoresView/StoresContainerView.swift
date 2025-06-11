//
//  StoresConteinerView.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 13/05/25.
//

import SwiftUI

struct StoresContainerView: View {
    
    let title = "Lojas"
    @State private var ratingFilter = 0
    @State private var minDistance: Double? = nil
    @State private var maxDistance: Double? = nil
    
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= ratingFilter &&
            // condição para distância mínima
            (minDistance == nil || store.distance >= minDistance!) &&
            // condição para distância máxima
            (maxDistance == nil || store.distance <= maxDistance!)
        }
    }
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack {
                Text(title)
                    .font(.headline)
                
                Spacer()
                
                Menu("Estrelas"){
                    
                    Button {
                        ratingFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
                    
                    ForEach(1...5, id: \.self){ rating in
                        Button {
                            ratingFilter = rating
                        } label: {
                            if rating > 1 {
                                Text ("\(rating) estrelas ou mais")
                            } else {
                                Text ("\(rating) estrela ou mais")
                            }
                        }
                    }
                }
                .foregroundColor(.black)
                
               Menu("Distância"){
                    
                    Button {
                        minDistance = nil
                        maxDistance = nil
                    } label: {
                        Text("Limpar filtro")
                    }
                    
                    Divider()
                    
                   let distanceRanges: [(Double, Double)] = [
                       (0, 5),
                       (5, 10),
                       (10, 20)
                   ]

                   ForEach(distanceRanges, id: \.0) { range in
                       Button {
                           minDistance = range.0
                           maxDistance = range.1
                       } label: {
                           Text("De \(Int(range.0))km até \(Int(range.1))km")
                       }
                   }
                }
                .foregroundColor(.black)            }
            
            VStack(alignment:.leading, spacing: 30) {
                
                if filteredStores.isEmpty {
                    Text("Nenhum resultado encontrado.")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                } else {
                    ForEach(filteredStores){mock in
                        NavigationLink {
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(store: mock)}
                    }
                }
                
            }
            .foregroundColor(.black)
        }
        .padding(20)
    }
}
    #Preview {
        StoresContainerView()
    }
