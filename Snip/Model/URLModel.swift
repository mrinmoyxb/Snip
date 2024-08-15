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
    let noOfVisits: Int
    //let visitHistory: VisitHistoryModel
    
    enum CodingKeys: String, CodingKey{
        case shortId
        case redirectUrl
        //case visitHistory
        case noOfVisits
        case id = "__v"
    }
}

struct VisitHistoryModel: Codable, Identifiable{
    var id: Int
    let timeStamp: Int64
    
    enum CodingKeys: String, CodingKey{
        case timeStamp
        case id = "docId"
    }
}
