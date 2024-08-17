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
        ScrollView(.vertical){
            LazyVStack{
                ZStack{
                    // Top card
                    Rectangle()
                        .ignoresSafeArea()
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .frame(height: (UIScreen.main.bounds.height)/2+30)
                        .foregroundColor(Color("PrimaryGreen"))
                        .cornerRadius(0)
                       
                    
                    // heaidng and textfield
                    VStack(spacing: 20){
                        // heading and subheading
                        Spacer().frame(height: 80)
                        HStack{
                            VStack(alignment: .leading){
                                Text("Snip")
                                    .font(.system(size: 40))
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .foregroundColor(.white)
                                
                                Text("Shorten your links, lengthen your reach")
                                    .font(.system(size: 18))
                                    .fontWeight(.regular)
                                    .foregroundColor(.white)
                                
                            }.padding([.leading, .trailing], 20)
                        }.frame(maxWidth: .infinity, alignment: .leading)
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
                            
                            Button(action: {Task {
                                await snipViewModel.sendPostRequest()
                            }}, label: {
                                Text("Snip")
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
                ZStack {
                    Rectangle()
                        .foregroundColor(Color(.black))
                        .cornerRadius(10)
                        .frame(height: 80)
                        .frame(maxWidth: .infinity)
                        .padding()
                    
                    HStack {
                        Text(verbatim: "\(snipViewModel.postShortUrlResponse ?? "Your short url here")")
                            .frame(width: 280, alignment: .leading)
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .foregroundColor(.white)
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                    }
                }
                
                HStack{
                    Text("Previous URLs")
                        .padding(.horizontal)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                ForEach(snipViewModel.allUrls){url in
                    FetchedURL(shortURL: url.shortId, noOfVisit: url.noOfVisits)
                    Spacer().frame(height: 8)
                }
                
                Spacer()
                
            }.ignoresSafeArea()
        }.ignoresSafeArea()
    }
}

#Preview {
    HomeScreen()
}
