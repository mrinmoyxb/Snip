//
//  SearchScreen.swift
//  Snip
//
//  Created by Mrinmoy Borah on 17/08/24.
//

import SwiftUI

struct SearchScreen: View {
    
    @StateObject var snipViewModel: SnipViewModel = SnipViewModel()
    
    var body: some View {
        ScrollView(.vertical){
            LazyVStack{
                ZStack{
                    // Top card
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(maxWidth: .infinity)
                        .frame(height: (UIScreen.main.bounds.height)/2+30)
                        .foregroundColor(Color("PrimaryGreen"))
                        .cornerRadius(0)
                    
                    
                    // heaidng and textfield
                    VStack(spacing: 20){
                        // heading and subheading
                        Spacer().frame(height: 80)
                        HStack{
                            VStack(alignment: .leading){
                                Text("Analytics")
                                    .font(.system(size: 40))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                                
                                Text("Detail analysis of short url")
                                    .font(.system(size: 18))
                                    .fontWeight(.regular)
                                    .foregroundColor(.white)
                                
                            }.padding([.leading, .trailing], 20)
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        // url textfield
                        VStack {
                            TextField("", text: $snipViewModel.inputUrl, prompt: Text("Enter the short URL").foregroundColor(.black)).fontWeight(.regular)
                                .padding([.leading,.trailing], 20)
                                .frame(height: 70)
                                .font(.system(size: 20))
                                .background(Color("PrimaryYellow"))
                                .foregroundColor(.black)
                                .cornerRadius(40)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                                .padding()
                            
                            Button(action: {Task {
                                await snipViewModel.sendPostRequest()
                            }}, label: {
                                Text("Analyse")
                                    .frame(width: 100, height: 45)
                                    .fontWeight(.regular)
                                    .foregroundColor(.black)
                                    .background(Color(.white))
                                    .cornerRadius(30)
                            })
                        }
                        
                    }
                    
                }.background(Color("PrimaryGreen"))
                Spacer()
                
                // Second Section
                FetchedURL(shortURL: <#T##String#>, noOfVisit: <#T##Int#>)
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    SearchScreen()
}
