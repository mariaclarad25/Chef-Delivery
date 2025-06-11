//
//  ProductDetailQuantityView.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 11/06/25.
//

import SwiftUI

struct ProductDetailQuantityView: View {
    
    @State var productQuantity: Int
    
    var body: some View {
        VStack (spacing: 16){
            Text("Quantidade")
                .bold()
                .font(.title3)
            
            HStack {
                Button {
                    if productQuantity > 1{
                        productQuantity -= 1
                    }
                } label: {
                    Image(systemName: "minus.circle.fill")
                        .font(.title)
                        .bold()
                }
                Text("\(productQuantity)")
                    .font(.title2)
                    .bold()
                
                Button {
                    productQuantity += 1
                } label: {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .bold()
                }
            }
        }
    }
}

#Preview {
    ProductDetailQuantityView(productQuantity: 1)
}
