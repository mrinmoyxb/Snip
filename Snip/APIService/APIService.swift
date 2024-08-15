//
//  APIViewModel.swift
//  Snip
//
//  Created by Mrinmoy Borah on 15/08/24.
//

import Foundation
class APIService {
    
    func getAllUrls() async throws -> [URLModel]{
        let urlString = "http://localhost:8001/api/url/"
        guard let url = URL(string: urlString) else{
            throw URLError(.badURL)
        }
        print("START")
        let(data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse =  response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
            dump(response)
            throw URLError(.badServerResponse)
        }
        print("TEST")
        let urlData = try JSONDecoder().decode(AllURLModel.self, from: data)
        print("DONE")
        let fetchedUrls: [URLModel] = urlData.msg.flatMap{ msg -> [URLModel] in
            return [msg]
        }
        print("URLS: \(fetchedUrls)")
        return fetchedUrls
    }
    
}

