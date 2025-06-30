//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 11/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack (spacing: 0){
                NavigationBar()
                    .padding(.horizontal, 15)
                    .padding(.top, 10)
                
                ScrollView(.vertical, showsIndicators: false){
                    VStack(spacing: 20){
                        OrderTypeGridView()
                        CarouselTabView()
                        StoresContainerView()
                    }
                }
            }
        }
        .onAppear{
            fetchData()
        }
    }
    // MARK: - Methods
    
    func fetchData() {
        guard let url = URL(string: "https://private-dcb9cd-mariaclaradias.apiary-mock.com/questions") else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print (error.localizedDescription)
            } else {
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data) as? [[String: Any]]
                        print (json)
                    } catch {
                        print (error.localizedDescription)
                    }
                }
            }
        }.resume()
    }
}
#Preview {
    ContentView()
}
