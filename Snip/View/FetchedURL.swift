//
//  SwiftUIView.swift
//  Snip
//
//  Created by Mrinmoy Borah on 15/08/24.
//

import SwiftUI

struct FetchedURL: View {
    
    var shortURL: String
    var noOfVisit: Int
    
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color("PrimaryGreen"))
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
                .padding([.leading, .trailing], 10)
            
            HStack{
                Text(verbatim: "http://localhost:8000/\(shortURL)")
                    .foregroundColor(.white)
                    .fontWeight(.medium)
                    .frame(width: 260)
                    .lineLimit(1)
                
                ZStack{
                    Rectangle()
                        .cornerRadius(10)
                        .foregroundColor(Color("PrimaryYellow"))
                        .frame( width: 70, height: 70)
                    
                    VStack(spacing: 6){
                        Text(String(noOfVisit))
                            .font(.system(size: 20))
                        Text("Total Visits")
                            .font(.system(size: 10))
                            .lineLimit(1)
                        
                    }
                    .frame(width: 70, height: 70)
                    .foregroundColor(.black)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}
