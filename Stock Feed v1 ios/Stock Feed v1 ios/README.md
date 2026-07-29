# Stock Feed v1 - iOS Frontend

A SwiftUI-based Instagram-style feed for browsing random S&P 500 stocks with 1-year weekly line charts.

## Features

- **Clean, minimal feed UI**: Stock cards with ticker, company name, line chart, and current price
- **Pull-to-refresh**: Get a new random set of 10 stocks
- **Swift Charts integration**: Clean sparkline-style charts with no axes or gridlines
- **Robust error handling**: Loading, error, and empty states
- **Modern Swift patterns**: Uses @Observable, async/await, and Swift Concurrency

## Project Structure

```
StockFeedV1/
├── Models/
│   └── StockPost.swift              # Codable model matching /feed API response
├── Networking/
│   └── APIClient.swift              # URLSession-based API client
├── ViewModels/
│   └── FeedViewModel.swift          # @Observable view model with loading/error state
├── Views/
│   ├── FeedView.swift               # Main feed with pull-to-refresh
│   └── StockPostCard.swift          # Individual stock card component
├── Stock_Feed_v1_iosApp.swift       # App entry point
└── Info.plist                       # Includes ATS exception for localhost
```

## Backend Requirements

This app expects a FastAPI backend running at `http://localhost:8000` with the following endpoints:

### GET /feed
Returns an array of 10 random S&P 500 stocks:
```json
[
  {
    "ticker": "AAPL",
    "company_name": "Apple Inc.",
    "current_price": 231.45,
    "history": [
      {"date": "2025-07-28", "close": 210.10},
      {"date": "2025-08-04", "close": 215.45},
      ...
    ]
  }
]
```

### GET /health
Returns health check:
```json
{"status": "ok"}
```

## Setup Instructions

1. **Add files to Xcode project**: Make sure all files under `Models/`, `Networking/`, `ViewModels/`, and `Views/` are added to your Xcode project target.

2. **Configure Info.plist**: The provided `Info.plist` includes App Transport Security exceptions for localhost development. In Xcode:
   - Select your project in the navigator
   - Go to your app target's "Info" tab
   - If you don't see the ATS settings, you may need to merge or replace your existing Info.plist with the provided one

3. **Start your backend**: Make sure your FastAPI backend is running at `http://localhost:8000`

4. **Run in Simulator**: Build and run the app in the iOS Simulator (or a real device on the same network)

## Development Notes

- **Previews don't require backend**: All views include `#Preview` macros with mock data for fast UI iteration
- **Mock data included**: See `StockPost.mockUptrend`, `StockPost.mockDowntrend`, and `StockPost.mockVolatile` for preview examples
- **Plain HTTP warning**: The app currently uses `http://localhost:8000`. Before production deployment, change the base URL in `APIClient.swift` to HTTPS and remove the ATS exception from Info.plist

## v1 Scope

This is a minimal v1 with no:
- User authentication
- Watchlists or favorites (icons are decorative only)
- Persistent storage
- Stock detail views
- Real-time price updates

Pull-to-refresh fetches a new random set of 10 stocks from the backend.

## Next Steps

- Test with real backend data
- Adjust chart styling, spacing, or colors as needed
- Add actual functionality to heart/bookmark icons (future v2)
- Implement detail view navigation (future v2)
