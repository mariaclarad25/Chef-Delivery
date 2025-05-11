//
//  OrderTypeGridView.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 11/05/25.
//

import SwiftUI

struct OrderTypeGridView: View {
    
    
    
    var body: some View {
        LazyHGrid(rows: [
            GridItem(.fixed(100)),
            GridItem(.fixed(100))
        ]){
            ForEach(ordersMock) { orderItem in
                Text(orderItem.name)
              }
           }
        }
    }

/*#Preview {
    OrderTypeGridView()
}*/

struct OrderTypeGridView_Previews: PreviewProvider {
        static var previews: some View {
                OrderTypeGridView()
        }
}
