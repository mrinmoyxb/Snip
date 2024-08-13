//
//  HomeScreen.swift
//  Snip
//
//  Created by Mrinmoy Borah on 13/08/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @State var temp: String = ""
    
    var body: some View {
            VStack{
                ZStack{
                    // Top card
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width)
                        .frame(height: (UIScreen.main.bounds.height)/2+40)
                        .foregroundColor(Color("PrimaryGreen"))
                        .ignoresSafeArea()
                    
                    // heaidng and textfield
                    VStack{
                        // heading and subheading
                        VStack(alignment: .leading){
                            Text("Snip")
                                .font(.system(size: 40))
                                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .foregroundColor(.white)
                            
                            Text("Shorten your links, lengthen your reach")
                                .font(.system(size: 18))
                                .fontWeight(.regular)
                                .foregroundColor(.white)
                            
                        }
                        // url textfield
                        VStack {
                            TextField("", text: $temp, prompt: Text("Enter your URL").foregroundColor(.black)).fontWeight(.regular)
                                .padding(.leading, 20)
                                .frame(height: 70)
                                .font(.system(size: 20))
                                .background(Color("PrimaryYellow"))
                                .foregroundColor(.black)
                                .cornerRadius(40)
                                .padding()
                        }

                    }
                    
                }
                Spacer()
                
                
                Spacer()
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    HomeScreen()
}
