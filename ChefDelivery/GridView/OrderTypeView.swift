//
//  OrderTypeView.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 12/05/25.
//

import SwiftUI

struct OrderTypeView: View {
    
    let orderType: OrderType
    
    var body: some View {
        VStack(spacing: 5){
            Image(orderType.image)
                .resizable()
                .scaledToFit()
                .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            Text(orderType.name)
                .font(.system(size: 10))
        }
        .frame(width: 70, height: 100)
    }
}

/*#Preview {
    OrderTypeView()
}*/

struct OrderTypeView_Preview: PreviewProvider {
    static var previews: some View{
        OrderTypeView(orderType: OrderType(id: 1, name: "Restaurantes", image: "hamburguer"))
            .previewLayout(.sizeThatFits)
    }
}
