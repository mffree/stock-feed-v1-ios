//
//  APIClient.swift
//  Stock Feed v1 ios
//
//  Created by Matthew Freeman on 7/29/26.
//

import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case networkError(Error)
    case invalidResponse
    case decodingError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid API URL"
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidResponse:
            return "Invalid response from server"
        case .decodingError(let error):
            return "Failed to decode response: \(error.localizedDescription)"
        }
    }
}

@MainActor
class APIClient {
    // WARNING: This is plain HTTP for local development only!
    // Replace with HTTPS URL before production deployment.
    // Requires App Transport Security exception in Info.plist.
    private let baseURL = "http://localhost:8000"
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func fetchFeed() async throws -> [StockPost] {
        guard let url = URL(string: "\(baseURL)/feed") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let posts = try decoder.decode([StockPost].self, from: data)
            return posts
        } catch {
            throw APIError.decodingError(error)
        }
    }
    
    func checkHealth() async throws -> Bool {
        guard let url = URL(string: "\(baseURL)/health") else {
            throw APIError.invalidURL
        }
        
        let (data, response) = try await session.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            return false
        }
        
        if let json = try? JSONSerialization.jsonObject(with: data) as? [String: String],
           json["status"] == "ok" {
            return true
        }
        
        return false
    }
}
