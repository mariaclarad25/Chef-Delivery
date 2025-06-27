//
//  ProductDetailView.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 10/06/25.
//

import SwiftUI

struct ProductDetailView: View {
    
    let product: ProductType
    @State private var productQuantity = 1
    
    var body: some View {
        
        ProductDetailHeaderView(product: product)
        
        Spacer()
        
        ProductDetailQuantityView(productQuantity: productQuantity)
        
        Spacer()
        
        Button {
            print ("O botão foi pressionado")
        } label: {
            HStack {
                Image(systemName: "cart")
                
                ProductDetailButtonView()
            }
            .padding(.horizontal, 32)
            .padding(.vertical, 16)
            .font(.title3)
            .bold()
            .background(Color("ColorRed"))
            .foregroundColor(.white)
            .cornerRadius(32)
            .shadow(color: Color("ColorRedDark").opacity(0.5), radius: 10, x: 6, y:8)
        }
    }
}

#Preview {
    ProductDetailView(product: storesMock[0].products[0])
}

struct ProductDetailButtonView: View {
    var body: some View {
        Text("Adicionar ao carrinho")
    }
}
