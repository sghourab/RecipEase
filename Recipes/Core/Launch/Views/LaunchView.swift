//
//  LaunchView.swift
//  Recipes
//
//  Created by Summer Crow on 2022-07-25.
//

import SwiftUI

struct LaunchView: View {
    @State private var loadingText: String = "Loading..."
    @State var degrees = 0.0
    @State private var isRotating = false
    @State private var isShowingHomeView = false
    private var zAxis: CGFloat = 1.0
    

    var body: some View {
        
        ZStack {
            Color.launch.background
                .ignoresSafeArea()
        
                    Image("Logo")
                        .resizable()
                        .frame(width: 155, height: 155, alignment: .center)
                        .scaledToFill()
                        .rotation3DEffect(.degrees(isRotating ? 20 : 0), axis: (x: 0, y: 0, z:  zAxis))
                            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true).delay(1.0), value: isRotating)
                            .onAppear { isRotating.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                                              
                                            self.isShowingHomeView = true
                                                     }
                            }
  
            ZStack {
                Text(loadingText)
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.launch.accent)
            }.offset(y: 90)
                
        }
        .background(
            NavigationLink(isActive: $isShowingHomeView, destination: {
               HomeView()
            }, label: {
                EmptyView()
            }).navigationBarHidden(true)
        )

            }
                
            
        
    
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
