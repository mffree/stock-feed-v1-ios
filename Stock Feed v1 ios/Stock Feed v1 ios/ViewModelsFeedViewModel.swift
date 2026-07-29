//
//  FeedViewModel.swift
//  Stock Feed v1 ios
//
//  Created by Matthew Freeman on 7/29/26.
//

import Foundation

@MainActor
@Observable
class FeedViewModel {
    var posts: [StockPost] = []
    var isLoading = false
    var errorMessage: String?
    
    private let apiClient: APIClient
    
    init(apiClient: APIClient = APIClient()) {
        self.apiClient = apiClient
    }
    
    func loadFeed() async {
        isLoading = true
        errorMessage = nil
        
        do {
            posts = try await apiClient.fetchFeed()
            
            // Handle empty feed gracefully
            if posts.isEmpty {
                errorMessage = "No stocks available at the moment"
            }
        } catch {
            errorMessage = error.localizedDescription
            posts = []
        }
        
        isLoading = false
    }
    
    func refresh() async {
        // For pull-to-refresh, we don't show the loading spinner
        // but we still fetch new data
        errorMessage = nil
        
        do {
            posts = try await apiClient.fetchFeed()
            
            if posts.isEmpty {
                errorMessage = "No stocks available at the moment"
            }
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
