//
//  CarouselTabView.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 12/05/25.
//

import SwiftUI

struct CarouselTabView: View {
    
    let ordersMock: [OrderType] = [
    OrderType(id: 1, name: "banner burguer", image: "barbecue-banner"),
    OrderType(id: 2, name: "banner poke", image: "pokes-banner"),
    OrderType(id: 3, name: "banner prato", image: "brazilian-meal-banner"),
    ]
                
    var body: some View {
        TabView { ForEach(ordersMock) { mock in
                CarouselItemView(order: mock)
                }
            }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
        }
    }
#Preview {
    CarouselTabView()
}
