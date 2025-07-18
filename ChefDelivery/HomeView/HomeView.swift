//
//  HomeView.swift
//  ChefDelivery
//
//  Created by Maria Clara Dias on 27/06/25.
//

import SwiftUI

struct HomeView: View {
    
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    @State private var buttonOffSet: CGFloat = .zero
    @State private var showSecondScreen = false
    
    let buttonHeight: CGFloat = 80
    
    var body: some View {
        
        GeometryReader {geometry in
            ZStack {
                
                Circle()
                    .foregroundColor(.colorRed)
                    .frame(width: isAnimating ? 200 : 0)
                    .position(x: isAnimating ? 50 : -50, y: isAnimating ? 100 : -100)
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                Circle()
                    .foregroundColor(.colorRed)
                    .frame(width: isAnimating ? 200 : 0)
                
                    .position(
                        x: isAnimating ? (geometry.size.width - 50) : (geometry.size.width + 50),
                        y: isAnimating ? (geometry.size.height - 50) : (geometry.size.height + 50)
                    )
                
                    .blur(radius: 60)
                    .opacity(isAnimating ? 0.5 : 0)
                
                VStack{
                    Text("Chef Delivery")
                        .font(.system(size: 48))
                        .fontWeight(.heavy)
                        .foregroundColor(.colorRedDark)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Text("Faça seu pedido no conforto da sua casa.")
                        .font(.title2)
                        .padding()
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black.opacity(0.7))
                        .opacity(isAnimating ? 1 : 0)
                        .offset(y: isAnimating ? 0 : -40)
                    
                    Image("image")
                        .resizable()
                        .scaledToFit()
                        .shadow(radius: 60)
                        .padding(isAnimating ? 32 : 92)
                        .opacity(isAnimating ? 1 : 0)
                        .offset(x: imageOffset.width, y: imageOffset.height)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    withAnimation(.easeInOut(duration: 0.5)){
                                        imageOffset = gesture.translation
                                    }
                                })
                                .onEnded({ _ in
                                    withAnimation(.easeInOut(duration: 0.5)){
                                        imageOffset = .zero
                                    }
                                })
                        )
                    
                    ZStack{
                        Capsule()
                            .fill(Color.colorRed).opacity(0.2)
                        
                        Capsule()
                            .fill(Color.colorRed).opacity(0.2)
                            .padding(8)
                        
                        Text ("Descubra mais")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.colorRedDark)
                            .offset(x: 20)
                        
                        HStack {
                            Capsule()
                                .fill(Color("ColorRedDark"))
                                .frame(width: buttonOffSet + buttonHeight)
                            
                            Spacer()
                        }
                        
                        HStack {
                            ZStack {
                                Circle()
                                    .fill(Color("ColorRed"))
                                
                                Circle()
                                    .fill(Color("ColorRedDark"))
                                    .padding(8)
                                
                                Image(systemName: "chevron.right.2")
                                    .font(.system(size: 24))
                                    .bold().foregroundColor(.white)
                                
                            }
                            Spacer()
                        }
                        .offset(x: buttonOffSet)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    
                                    if gesture.translation.width >= 0 && buttonOffSet <= (geometry.size.width - 60) - buttonHeight {
                                        withAnimation(.easeInOut(duration: 0.25)){
                                            buttonOffSet = gesture.translation.width
                                        }
                                    }
                                })
                                .onEnded{ _ in
                                    
                                    if buttonOffSet > (geometry.size.width - 60) / 2 {
                                        showSecondScreen = true
                                    } else {
                                        withAnimation(
                                            .easeInOut(duration: 0.25)){
                                                buttonOffSet = 0
                                            }
                                    }
                                })
                    }
                    .frame(width: geometry.size.width - 60, height: buttonHeight)
                    .opacity(isAnimating ? 1 : 0)
                    .offset(y: isAnimating ? 0 : 100)
                }
                .onAppear{
                    withAnimation(.easeInOut(duration:1.5)) {
                        isAnimating = true
                    }
                }
            }
            .fullScreenCover(isPresented: $showSecondScreen, content: {
                ContentView()
            })
        }
    }
}

#Preview {
    HomeView()
}
