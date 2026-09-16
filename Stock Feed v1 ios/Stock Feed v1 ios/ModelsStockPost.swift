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
    
    static let mock52WeekUptrend = StockPost(
        ticker: "AAPL",
        company_name: "Apple Inc.",
        current_price: 231.45,
        history: [
            PricePoint(date: "2025-09-17", close: 150.00),
            PricePoint(date: "2025-09-24", close: 152.30),
            PricePoint(date: "2025-10-01", close: 154.80),
            PricePoint(date: "2025-10-08", close: 157.20),
            PricePoint(date: "2025-10-15", close: 159.50),
            PricePoint(date: "2025-10-22", close: 161.90),
            PricePoint(date: "2025-10-29", close: 164.10),
            PricePoint(date: "2025-11-05", close: 166.80),
            PricePoint(date: "2025-11-12", close: 169.20),
            PricePoint(date: "2025-11-19", close: 171.50),
            PricePoint(date: "2025-11-26", close: 173.90),
            PricePoint(date: "2025-12-03", close: 176.40),
            PricePoint(date: "2025-12-10", close: 178.60),
            PricePoint(date: "2025-12-17", close: 180.50),
            PricePoint(date: "2025-12-24", close: 182.70),
            PricePoint(date: "2025-12-31", close: 185.20),
            PricePoint(date: "2026-01-07", close: 187.40),
            PricePoint(date: "2026-01-14", close: 189.90),
            PricePoint(date: "2026-01-21", close: 192.30),
            PricePoint(date: "2026-01-28", close: 194.50),
            PricePoint(date: "2026-02-04", close: 196.80),
            PricePoint(date: "2026-02-11", close: 199.10),
            PricePoint(date: "2026-02-18", close: 201.60),
            PricePoint(date: "2026-02-25", close: 203.80),
            PricePoint(date: "2026-03-04", close: 206.20),
            PricePoint(date: "2026-03-11", close: 208.40),
            PricePoint(date: "2026-03-18", close: 210.90),
            PricePoint(date: "2026-03-25", close: 213.10),
            PricePoint(date: "2026-04-01", close: 215.50),
            PricePoint(date: "2026-04-08", close: 217.60),
            PricePoint(date: "2026-04-15", close: 219.90),
            PricePoint(date: "2026-04-22", close: 222.30),
            PricePoint(date: "2026-04-29", close: 224.40),
            PricePoint(date: "2026-05-06", close: 226.80),
            PricePoint(date: "2026-05-13", close: 229.10),
            PricePoint(date: "2026-05-20", close: 231.20),
            PricePoint(date: "2026-05-27", close: 233.50),
            PricePoint(date: "2026-06-03", close: 235.70),
            PricePoint(date: "2026-06-10", close: 237.90),
            PricePoint(date: "2026-06-17", close: 240.30),
            PricePoint(date: "2026-06-24", close: 242.40),
            PricePoint(date: "2026-07-01", close: 244.80),
            PricePoint(date: "2026-07-08", close: 247.10),
            PricePoint(date: "2026-07-15", close: 249.20),
            PricePoint(date: "2026-07-22", close: 251.60),
            PricePoint(date: "2026-07-29", close: 253.80),
            PricePoint(date: "2026-08-05", close: 256.10),
            PricePoint(date: "2026-08-12", close: 258.40),
            PricePoint(date: "2026-08-19", close: 260.50),
            PricePoint(date: "2026-08-26", close: 262.90),
            PricePoint(date: "2026-09-02", close: 265.10),
            PricePoint(date: "2026-09-09", close: 231.45)
        ]
    )
    
    static let mock52WeekDowntrend = StockPost(
        ticker: "TSLA",
        company_name: "Tesla, Inc.",
        current_price: 245.80,
        history: [
            PricePoint(date: "2025-09-17", close: 380.00),
            PricePoint(date: "2025-09-24", close: 377.50),
            PricePoint(date: "2025-10-01", close: 374.20),
            PricePoint(date: "2025-10-08", close: 371.80),
            PricePoint(date: "2025-10-15", close: 369.10),
            PricePoint(date: "2025-10-22", close: 366.40),
            PricePoint(date: "2025-10-29", close: 363.90),
            PricePoint(date: "2025-11-05", close: 361.20),
            PricePoint(date: "2025-11-12", close: 358.60),
            PricePoint(date: "2025-11-19", close: 355.80),
            PricePoint(date: "2025-11-26", close: 353.30),
            PricePoint(date: "2025-12-03", close: 350.50),
            PricePoint(date: "2025-12-10", close: 347.90),
            PricePoint(date: "2025-12-17", close: 345.20),
            PricePoint(date: "2025-12-24", close: 342.60),
            PricePoint(date: "2025-12-31", close: 339.80),
            PricePoint(date: "2026-01-07", close: 337.40),
            PricePoint(date: "2026-01-14", close: 334.70),
            PricePoint(date: "2026-01-21", close: 332.10),
            PricePoint(date: "2026-01-28", close: 329.50),
            PricePoint(date: "2026-02-04", close: 326.80),
            PricePoint(date: "2026-02-11", close: 324.20),
            PricePoint(date: "2026-02-18", close: 321.60),
            PricePoint(date: "2026-02-25", close: 318.90),
            PricePoint(date: "2026-03-04", close: 316.30),
            PricePoint(date: "2026-03-11", close: 313.70),
            PricePoint(date: "2026-03-18", close: 311.10),
            PricePoint(date: "2026-03-25", close: 308.50),
            PricePoint(date: "2026-04-01", close: 305.80),
            PricePoint(date: "2026-04-08", close: 303.20),
            PricePoint(date: "2026-04-15", close: 300.60),
            PricePoint(date: "2026-04-22", close: 297.90),
            PricePoint(date: "2026-04-29", close: 295.40),
            PricePoint(date: "2026-05-06", close: 292.80),
            PricePoint(date: "2026-05-13", close: 290.20),
            PricePoint(date: "2026-05-20", close: 287.50),
            PricePoint(date: "2026-05-27", close: 284.90),
            PricePoint(date: "2026-06-03", close: 282.30),
            PricePoint(date: "2026-06-10", close: 279.70),
            PricePoint(date: "2026-06-17", close: 277.10),
            PricePoint(date: "2026-06-24", close: 274.50),
            PricePoint(date: "2026-07-01", close: 271.90),
            PricePoint(date: "2026-07-08", close: 269.30),
            PricePoint(date: "2026-07-15", close: 266.70),
            PricePoint(date: "2026-07-22", close: 264.10),
            PricePoint(date: "2026-07-29", close: 261.50),
            PricePoint(date: "2026-08-05", close: 258.90),
            PricePoint(date: "2026-08-12", close: 256.30),
            PricePoint(date: "2026-08-19", close: 253.70),
            PricePoint(date: "2026-08-26", close: 251.10),
            PricePoint(date: "2026-09-02", close: 248.50),
            PricePoint(date: "2026-09-09", close: 245.80)
        ]
    )
    
    static let mock52WeekVolatile = StockPost(
        ticker: "NVDA",
        company_name: "NVIDIA Corporation",
        current_price: 485.60,
        history: [
            PricePoint(date: "2025-09-17", close: 450.00),
            PricePoint(date: "2025-09-24", close: 465.20),
            PricePoint(date: "2025-10-01", close: 442.30),
            PricePoint(date: "2025-10-08", close: 478.50),
            PricePoint(date: "2025-10-15", close: 455.80),
            PricePoint(date: "2025-10-22", close: 490.40),
            PricePoint(date: "2025-10-29", close: 468.90),
            PricePoint(date: "2025-11-05", close: 495.10),
            PricePoint(date: "2025-11-12", close: 472.60),
            PricePoint(date: "2025-11-19", close: 505.80),
            PricePoint(date: "2025-11-26", close: 480.20),
            PricePoint(date: "2025-12-03", close: 512.40),
            PricePoint(date: "2025-12-10", close: 487.90),
            PricePoint(date: "2025-12-17", close: 520.30),
            PricePoint(date: "2025-12-24", close: 498.70),
            PricePoint(date: "2025-12-31", close: 528.60),
            PricePoint(date: "2026-01-07", close: 502.40),
            PricePoint(date: "2026-01-14", close: 535.80),
            PricePoint(date: "2026-01-21", close: 510.20),
            PricePoint(date: "2026-01-28", close: 542.90),
            PricePoint(date: "2026-02-04", close: 518.50),
            PricePoint(date: "2026-02-11", close: 548.30),
            PricePoint(date: "2026-02-18", close: 525.70),
            PricePoint(date: "2026-02-25", close: 554.60),
            PricePoint(date: "2026-03-04", close: 532.10),
            PricePoint(date: "2026-03-11", close: 560.40),
            PricePoint(date: "2026-03-18", close: 538.90),
            PricePoint(date: "2026-03-25", close: 565.20),
            PricePoint(date: "2026-04-01", close: 543.80),
            PricePoint(date: "2026-04-08", close: 570.50),
            PricePoint(date: "2026-04-15", close: 548.30),
            PricePoint(date: "2026-04-22", close: 575.90),
            PricePoint(date: "2026-04-29", close: 552.60),
            PricePoint(date: "2026-05-06", close: 530.40),
            PricePoint(date: "2026-05-13", close: 558.70),
            PricePoint(date: "2026-05-20", close: 535.20),
            PricePoint(date: "2026-05-27", close: 563.80),
            PricePoint(date: "2026-06-03", close: 541.90),
            PricePoint(date: "2026-06-10", close: 520.60),
            PricePoint(date: "2026-06-17", close: 548.30),
            PricePoint(date: "2026-06-24", close: 525.70),
            PricePoint(date: "2026-07-01", close: 510.20),
            PricePoint(date: "2026-07-08", close: 538.50),
            PricePoint(date: "2026-07-15", close: 515.90),
            PricePoint(date: "2026-07-22", close: 498.60),
            PricePoint(date: "2026-07-29", close: 526.30),
            PricePoint(date: "2026-08-05", close: 503.80),
            PricePoint(date: "2026-08-12", close: 488.40),
            PricePoint(date: "2026-08-19", close: 515.70),
            PricePoint(date: "2026-08-26", close: 492.50),
            PricePoint(date: "2026-09-02", close: 508.90),
            PricePoint(date: "2026-09-09", close: 485.60)
        ]
    )
    
    static let mockPosts = [mock52WeekUptrend, mock52WeekDowntrend, mock52WeekVolatile]
}
