//
//  SnipViewModel.swift
//  Snip
//
//  Created by Mrinmoy Borah on 13/08/24.
//

import Foundation

class SnipViewModel: ObservableObject{
    @Published var inputUrl: String = ""
    @Published var analyticsUrl: String = ""
    
    @Published var allUrls: [URLModel] = [URLModel]()
    @Published var postShortUrlResponse: String?
    @Published var errorMessage: String?
    @Published var analyticsResponse: AnalyticsModel?
    
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
    
    func sendPostRequest() async{
        do{
            let postURL = try await apiService.postUrl(requestUrl: inputUrl)
            DispatchQueue.main.async{
                self.postShortUrlResponse = postURL
            }
            inputUrl = ""
        }catch{
            self.errorMessage = error.localizedDescription
        }
    }
    
    func getAnalytics() async{
        do{
            let analyticsData = try await apiService.getAnalytics(requestUrl: analyticsUrl)
            DispatchQueue.main.async{
                self.analyticsResponse = analyticsData
            }
            analyticsUrl = ""
        }catch{
            self.errorMessage = error.localizedDescription
        }
    }
}
