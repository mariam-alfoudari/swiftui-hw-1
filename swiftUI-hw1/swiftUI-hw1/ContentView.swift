//
//  ContentView.swift
//  swiftUI-hw1
//
//  Created by mariam alfoudari on 27/12/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    VStack {
                        Image(systemName: "1.circle")
                        Text("calculator")
                    }
            }.tag(1)
            
            AboutView()
                .tabItem {
                    VStack {
                        Image(systemName: "2.circle")
                        Text("Weather")
                    }
            }.tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
