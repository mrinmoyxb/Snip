//
//  URLModel.swift
//  Snip
//
//  Created by Mrinmoy Borah on 15/08/24.
//

import Foundation

struct AllURLModel: Codable{
    let msg: [URLModel]
}

struct URLModel: Codable, Identifiable{
    let id: Int
    let shortId: String
    let redirectUrl: String
    //let visitHistory: [VisitHistoryModel]
    
    enum CodingKeys: String, CodingKey{
        case shortId
        case redirectUrl
        case id = "__v"
    }
}

struct VisitHistoryModel: Codable{
    let timeStamp: Int32
    let id: String
    
    enum CodingKeys: String, CodingKey{
        case timeStamp
        case id = "_id"
    }
}
