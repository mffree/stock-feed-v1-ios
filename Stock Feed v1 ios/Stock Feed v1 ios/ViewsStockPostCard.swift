//
//  StockPostCard.swift
//  Stock Feed v1 ios
//
//  Created by Matthew Freeman on 7/29/26.
//

import SwiftUI
import Charts

struct StockPostCard: View {
    let post: StockPost
    
    // Helper computed properties
    private var firstDate: String {
        post.history.first?.date ?? ""
    }
    
    private var lastDate: String {
        post.history.last?.date ?? ""
    }
    
    private var minPrice: Double {
        post.history.map(\.close).min() ?? 0
    }
    
    private var maxPrice: Double {
        post.history.map(\.close).max() ?? 100
    }
    
    private func monthAbbreviation(from dateString: String) -> String {
        // Parse date string (format: "2025-07-28")
        let components = dateString.split(separator: "-")
        guard components.count == 3,
              let month = Int(components[1]) else {
            return ""
        }
        
        let monthNames = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                         "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
        return monthNames[month - 1]
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header row: ticker/company on left, price on right
            HStack(alignment: .top, spacing: 12) {
                // Ticker and company name stack
                VStack(alignment: .leading, spacing: 2) {
                    Text(post.ticker)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.primary)
                    
                    Text(post.company_name)
                        .font(.system(size: 13))
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                }
                
                Spacer()
                
                // Price moved to header, aligned with ticker
                Text("$\(post.current_price, specifier: "%.2f")")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.primary)
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 12)
            
            // Chart with visible axes
            Chart {
                ForEach(Array(post.history.enumerated()), id: \.element.id) { index, point in
                    LineMark(
                        x: .value("Date", index),
                        y: .value("Price", point.close)
                    )
                    .foregroundStyle(.blue)
                    .lineStyle(StrokeStyle(lineWidth: 2))
                }
            }
            .chartXAxis {
                AxisMarks(values: [0, post.history.count - 1]) { value in
                    if let index = value.as(Int.self),
                       index >= 0 && index < post.history.count {
                        AxisValueLabel {
                            Text(monthAbbreviation(from: post.history[index].date))
                                .font(.system(size: 12))
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .chartYAxis {
                AxisMarks(position: .trailing) { value in
                    if let price = value.as(Double.self) {
                        AxisValueLabel {
                            Text("\(Int(price))")
                                .font(.system(size: 12))
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .chartYScale(domain: minPrice...maxPrice)
            .frame(height: 180)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            
            // Centered time period label
            Text("1 year")
                .font(.system(size: 12))
                .foregroundStyle(.secondary)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.top, 4)
                .padding(.bottom, 16)
        }
        .background(Color(.systemBackground))
        .cornerRadius(14)
        .overlay(
            RoundedRectangle(cornerRadius: 14)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
    }
}

// MARK: - Preview

#Preview("Single Card - Uptrend") {
    ZStack {
        Color(.systemGroupedBackground)
            .ignoresSafeArea()
        
        StockPostCard(post: .mockUptrend)
            .padding(.horizontal, 16)
    }
}

#Preview("Single Card - Downtrend") {
    ZStack {
        Color(.systemGroupedBackground)
            .ignoresSafeArea()
        
        StockPostCard(post: .mockDowntrend)
            .padding(.horizontal, 16)
    }
}

#Preview("Multiple Cards") {
    ScrollView {
        VStack(spacing: 12) {
            ForEach(StockPost.mockPosts) { post in
                StockPostCard(post: post)
                    .padding(.horizontal, 16)
            }
        }
        .padding(.vertical, 16)
    }
    .background(Color(.systemGroupedBackground))
}
