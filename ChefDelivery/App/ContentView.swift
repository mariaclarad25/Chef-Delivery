//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 11/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            NavigationBar()
                .padding(.horizontal, 15)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    OrderTypeGridView()
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider{
        static var previews: some View{
            ContentView()
                .previewLayout(.sizeThatFits)
        }
    }
}
/*#Preview {
    ContentView()
}*/
