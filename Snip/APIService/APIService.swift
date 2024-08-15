//
//  APIViewModel.swift
//  Snip
//
//  Created by Mrinmoy Borah on 15/08/24.
//

import Foundation
import SwiftUI
class APIService {
    
    func getAllUrls() async throws -> [URLModel]{
        let urlString = "http://localhost:8001/api/url/"
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
        return urlData.msg
    }
    
}

