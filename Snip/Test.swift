//
//  Test.swift
//  Snip
//
//  Created by Mrinmoy Borah on 14/08/24.
//

import Foundation
import SwiftUI

class Test: ObservableObject{
    @Published var num: Int = 0
    
    func increment(){
        num += 1
    }
}

class Test1: ObservableObject{
    @Published var num: Int = 0
    
    func increment(){
        num += 1
    }
}


struct Screen1: View{
    
    @StateObject var num: Test = Test()
    @ObservedObject var num1: Test1 = Test1()
    
    var body: some View{
        NavigationStack{
            Text("\(num.num)")
            
            Button(action: num.increment, label: {
                Text("Button -> State").foregroundColor(.green)
            })
            
            Spacer().frame(height: 50)
            
            Text("\(num1.num)")
            
            Button(action: num1.increment, label: {
                Text("Button -> Observed").foregroundColor(.red)
            })
            
            NavigationLink("Hello", destination: {Text("New screen")})
        }
    }
}

#Preview {
    Screen1()
}
