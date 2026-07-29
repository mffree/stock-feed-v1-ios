//
//  FeedView.swift
//  Stock Feed v1 ios
//
//  Created by Matthew Freeman on 7/29/26.
//

import SwiftUI

struct FeedView: View {
    @State private var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                if viewModel.isLoading {
                    // Loading state on initial load
                    ProgressView()
                        .scaleEffect(1.2)
                } else if let errorMessage = viewModel.errorMessage {
                    // Error state
                    VStack(spacing: 16) {
                        Image(systemName: "exclamationmark.triangle")
                            .font(.system(size: 48))
                            .foregroundStyle(.secondary)
                        
                        Text("Something went wrong")
                            .font(.headline)
                        
                        Text(errorMessage)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                        
                        Button("Retry") {
                            Task {
                                await viewModel.loadFeed()
                            }
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 8)
                    }
                } else if viewModel.posts.isEmpty {
                    // Empty state (shouldn't happen often, but handle it)
                    VStack(spacing: 16) {
                        Image(systemName: "chart.line.uptrend.xyaxis")
                            .font(.system(size: 48))
                            .foregroundStyle(.secondary)
                        
                        Text("No stocks to show")
                            .font(.headline)
                        
                        Text("Pull to refresh and try again")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                } else {
                    // Feed content
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.posts) { post in
                                StockPostCard(post: post)
                                    .padding(.horizontal, 16)
                            }
                        }
                        .padding(.vertical, 16)
                    }
                    .refreshable {
                        await viewModel.refresh()
                    }
                }
            }
            .navigationTitle("Stock Feed")
            .navigationBarTitleDisplayMode(.large)
            .task {
                // Load feed on first appear
                if viewModel.posts.isEmpty && !viewModel.isLoading {
                    await viewModel.loadFeed()
                }
            }
        }
    }
}

// MARK: - Preview

#Preview("Feed with Data") {
    let mockClient = MockAPIClient()
    let viewModel = FeedViewModel(apiClient: mockClient)
    return FeedView()
}

#Preview("Loading State") {
    let viewModel = FeedViewModel()
    FeedView()
        .onAppear {
            viewModel.isLoading = true
        }
}

#Preview("Error State") {
    let viewModel = FeedViewModel()
    FeedView()
        .onAppear {
            viewModel.errorMessage = "Unable to connect to the server. Please check your connection and try again."
        }
}

// MARK: - Mock API Client for Previews

@MainActor
private class MockAPIClient: APIClient {
    override func fetchFeed() async throws -> [StockPost] {
        // Simulate network delay
        try await Task.sleep(for: .milliseconds(500))
        return StockPost.mockPosts
    }
}
