//
//  ContentView.swift
//  Snip
//
//  Created by Mrinmoy Borah on 13/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            HomeScreen()
                .tabItem {
                    Image(systemName: "house.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    Text("Home")
                }
            
            SearchScreen()
                .tabItem {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                    Text("Search")
                }
        }
    }
}

#Preview {
    ContentView()
}
