//
//  APIViewModel.swift
//  Snip
//
//  Created by Mrinmoy Borah on 15/08/24.
//

import Foundation
import SwiftUI

struct InputPost: Codable{
    let msg: String
}

struct OutputPost: Codable{
    let msg: String
}

class APIService {
    
    // GET: return all url details
    func getAllUrls() async throws -> [URLModel]{
        let urlString = "http://localhost:8000/api/url"
        guard let url = URL(string: urlString) else{
            throw URLError(.badURL)
        }

        let(data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse =  response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            dump(response)
            throw URLError(.badServerResponse)
        }
        
        let urlData = try JSONDecoder().decode(AllURLModel.self, from: data)
        let fetchedUrls: [URLModel] = urlData.msg.flatMap{ msg -> [URLModel] in
            return [msg]
        }
        return fetchedUrls
    }
    
    // POST: send URL and receive short URL
    func postUrl(requestUrl: String) async throws -> String {
        guard let url = URL(string: "http://localhost:8000/api/url/") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try JSONEncoder().encode(PostRequestModel(url: requestUrl))
        let (data, response) = try await URLSession.shared.data(for: request)
        

        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            throw URLError(.badServerResponse)
        }
        
        let responseData = try JSONDecoder().decode(PostResponseModel.self, from: data)
        print("\(responseData.short_url)")
        return responseData.short_url
    }
    
}


