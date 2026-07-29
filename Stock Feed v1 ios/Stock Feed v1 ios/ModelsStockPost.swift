//
//  StockPost.swift
//  Stock Feed v1 ios
//
//  Created by Matthew Freeman on 7/29/26.
//

import Foundation

struct StockPost: Codable, Identifiable {
    let ticker: String
    let company_name: String
    let current_price: Double
    let history: [PricePoint]
    
    // Computed property for Identifiable conformance
    var id: String { ticker }
    
    struct PricePoint: Codable, Identifiable {
        let date: String
        let close: Double
        
        // Computed property for Identifiable conformance (needed for Charts)
        var id: String { date }
    }
}

// MARK: - Mock Data for Previews

extension StockPost {
    static let mockUptrend = StockPost(
        ticker: "AAPL",
        company_name: "Apple Inc.",
        current_price: 231.45,
        history: [
            PricePoint(date: "2025-07-28", close: 180.50),
            PricePoint(date: "2025-08-04", close: 185.20),
            PricePoint(date: "2025-08-11", close: 190.15),
            PricePoint(date: "2025-08-18", close: 195.80),
            PricePoint(date: "2025-08-25", close: 200.30),
            PricePoint(date: "2025-09-01", close: 205.60),
            PricePoint(date: "2025-09-08", close: 210.10),
            PricePoint(date: "2025-09-15", close: 215.45),
            PricePoint(date: "2025-09-22", close: 220.80),
            PricePoint(date: "2025-09-29", close: 225.20),
            PricePoint(date: "2025-10-06", close: 231.45)
        ]
    )
    
    static let mockDowntrend = StockPost(
        ticker: "TSLA",
        company_name: "Tesla, Inc.",
        current_price: 245.80,
        history: [
            PricePoint(date: "2025-07-28", close: 320.50),
            PricePoint(date: "2025-08-04", close: 315.20),
            PricePoint(date: "2025-08-11", close: 305.15),
            PricePoint(date: "2025-08-18", close: 295.80),
            PricePoint(date: "2025-08-25", close: 285.30),
            PricePoint(date: "2025-09-01", close: 275.60),
            PricePoint(date: "2025-09-08", close: 270.10),
            PricePoint(date: "2025-09-15", close: 265.45),
            PricePoint(date: "2025-09-22", close: 255.80),
            PricePoint(date: "2025-09-29", close: 250.20),
            PricePoint(date: "2025-10-06", close: 245.80)
        ]
    )
    
    static let mockVolatile = StockPost(
        ticker: "NVDA",
        company_name: "NVIDIA Corporation",
        current_price: 485.60,
        history: [
            PricePoint(date: "2025-07-28", close: 450.00),
            PricePoint(date: "2025-08-04", close: 470.20),
            PricePoint(date: "2025-08-11", close: 455.15),
            PricePoint(date: "2025-08-18", close: 480.80),
            PricePoint(date: "2025-08-25", close: 465.30),
            PricePoint(date: "2025-09-01", close: 490.60),
            PricePoint(date: "2025-09-08", close: 475.10),
            PricePoint(date: "2025-09-15", close: 495.45),
            PricePoint(date: "2025-09-22", close: 480.80),
            PricePoint(date: "2025-09-29", close: 500.20),
            PricePoint(date: "2025-10-06", close: 485.60)
        ]
    )
    
    static let mockPosts = [mockUptrend, mockDowntrend, mockVolatile]
}
