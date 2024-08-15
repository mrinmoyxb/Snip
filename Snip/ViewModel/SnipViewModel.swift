//
//  SnipViewModel.swift
//  Snip
//
//  Created by Mrinmoy Borah on 13/08/24.
//

import Foundation

class SnipViewModel: ObservableObject{
    @Published var inputUrl: String = ""
    @Published var allUrls: [URLModel] = [URLModel]()
    @Published var errorMessage: String?
    
    let apiService = APIService()
    
    init(){
        Task{
            do{
                let fetchedURLs = try await apiService.getAllUrls()
                DispatchQueue.main.async{
                    self.allUrls = fetchedURLs
                }
            }catch{
                DispatchQueue.main.async{
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
