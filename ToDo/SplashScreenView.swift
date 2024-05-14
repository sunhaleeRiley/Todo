//
//  SplashScreenView.swift
//  ToDo
//
//  Created by Sunha on 4/18/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive: Bool = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Image("Splash")
                    .resizable()
                    .ignoresSafeArea()
                 
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

