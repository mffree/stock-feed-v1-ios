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
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            // Header row
            HStack(alignment: .center, spacing: 12) {
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
                
                // Three-dot menu (decorative only)
                Image(systemName: "ellipsis")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundStyle(.secondary)
                    .padding(8)
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            .padding(.bottom, 12)
            
            // Chart
            Chart {
                ForEach(post.history) { point in
                    LineMark(
                        x: .value("Date", point.date),
                        y: .value("Price", point.close)
                    )
                    .foregroundStyle(.blue)
                    .lineStyle(StrokeStyle(lineWidth: 2))
                }
            }
            .chartXAxis(.hidden)
            .chartYAxis(.hidden)
            .frame(height: 180)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            
            // Bottom row: price and action icons
            HStack(alignment: .bottom, spacing: 0) {
                // Price and period label
                VStack(alignment: .leading, spacing: 4) {
                    Text("$\(post.current_price, specifier: "%.2f")")
                        .font(.system(size: 20, weight: .semibold))
                        .foregroundStyle(.primary)
                    
                    Text("1 year")
                        .font(.system(size: 12))
                        .foregroundStyle(.secondary)
                }
                
                Spacer()
                
                // Action icons (decorative only)
                HStack(spacing: 16) {
                    Image(systemName: "heart")
                        .font(.system(size: 20))
                        .foregroundStyle(.secondary)
                    
                    Image(systemName: "bookmark")
                        .font(.system(size: 20))
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 12)
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
