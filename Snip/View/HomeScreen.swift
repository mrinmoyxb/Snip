//
//  HomeScreen.swift
//  Snip
//
//  Created by Mrinmoy Borah on 13/08/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var snipViewModel: SnipViewModel = SnipViewModel()
    
    var body: some View {
            VStack{
                ZStack{
                    // Top card
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width)
                        .frame(height: (UIScreen.main.bounds.height)/2+40)
                        .foregroundColor(Color("PrimaryGreen"))
                        .cornerRadius(0)
                        .ignoresSafeArea()
                    
                    // heaidng and textfield
                    VStack(spacing: 20){
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
                            TextField("", text: $snipViewModel.inputUrl, prompt: Text("Enter your URL").foregroundColor(.black)).fontWeight(.regular)
                                .padding([.leading,.trailing], 20)
                                    .frame(height: 70)
                                    .font(.system(size: 20))
                                    .background(Color("PrimaryYellow"))
                                    .foregroundColor(.black)
                                    .cornerRadius(40)
                                    .autocorrectionDisabled()
                                    .textInputAutocapitalization(.never)
                                    .padding()
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Text("Snip")
                                    .frame(width: 100, height: 45)
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                    .background(Color(.white))
                                    .cornerRadius(30)
                            })
                        }

                    }
                    
                }
                Spacer()
                
                ZStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(40)
                        .frame(height: 80)
                        .frame(maxWidth: .infinity)
                        .padding()

                    HStack {
                        Text(verbatim: "www.google.com")
                            .frame(width: 280, alignment: .leading)
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .foregroundColor(.white)

                        Image(systemName: "doc.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                    }
                }
                    
                Spacer()
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    HomeScreen()
}
