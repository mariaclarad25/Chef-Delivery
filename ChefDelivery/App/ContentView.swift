//
//  ContentView.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 11/05/25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Attributes
    
    private var service = HomeService()
    @State private var storesType: [StoreType] = []
    
    @State private var isLoading = true
    
    // MARK: - View
    var body: some View {
        NavigationView {
            VStack {
                if isLoading{
                    ProgressView()
                } else {
                    NavigationBar()
                        .padding(.horizontal, 15)
                        .padding(.top, 10)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 20){
                            OrderTypeGridView()
                            CarouselTabView()
                            StoresContainerView(stores: storesType)
                        }
                    }
                }
            }
        }
        .onAppear{
            Task {
                await getStores()
            }
        }
    }
    // MARK: - Methods
    
    func getStores() async {
        do {
            let result = try await service.fetchData()
            switch result {
            case .success(let stores):
                self.storesType = stores
                self.isLoading = false
            case .failure(let error):
                print (error.localizedDescription)
                self.isLoading = false
            }
        } catch {
            print (error.localizedDescription)
            self.isLoading = false
        }
    }
}
#Preview {
    ContentView()
}
