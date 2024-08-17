//
//  URLModel.swift
//  Snip
//
//  Created by Mrinmoy Borah on 15/08/24.
//

import Foundation


// Model to fetch URL info
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
        case id = "urlId"
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


// Model to shortened URL
struct PostRequestModel: Codable{
    let url: String
}

struct PostResponseModel: Codable{
    let short_url: String
}


// Analytics model
struct AnalyticsModel: Codable{
    let originalUrl: String
    let totalVisit: Int
}
