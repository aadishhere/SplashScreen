//
//  ContentView.swift
//  SplashScreen
//
//  Created by Aadish Jain on 15/05/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true

    var body: some View {
        ZStack {
            if showSplash {
                SplashScreenView {
                    withAnimation {
                        showSplash = false
                    }
                }
                .transition(.opacity)
            } else {
                HomeView()
                    .transition(.opacity)
            }
        }
    }
}

// MARK: splashScreenView

struct SplashScreenView: View {
    let onFinish: () -> Void
    @State private var logoScale: CGFloat = 0.6
    @State private var fadeIn = false

    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            VStack(spacing: 20) {
                GIFView(gifName: "splashLogo")
                    .frame(width: 300, height: 300)
                    .padding(.all)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 7.5) {
                onFinish()
            }
        }
    }
}

// MARK: homeScreenView

struct HomeView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                Text("Home Screen")
                    .font(.largeTitle.bold())
                    .foregroundColor(.primary)
            }
        }
    }
}

#Preview {
    ContentView()
}
