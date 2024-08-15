//
//  ContentView.swift
//  Snip
//
//  Created by Mrinmoy Borah on 13/08/24.
//

import SwiftUI

struct ContentView: View {
    var apiService = APIService()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button(action: {}, label: {
                Text("Button")
            })
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
