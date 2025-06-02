# Themes

A lightweight, flexible theming framework for iOS and macOS applications.

## Features
- Type-safe theme definitions
- Fully customizable theme properties
- Environment-based SwiftUI integration
- Generic theme types for maximum flexibility

## Usage

### Define Your Theme Properties
```swift
// Minimal theme with just colors
struct ColorTheme {
    let backgroundColor: Color
    let textColor: Color
}

// Full featured theme
struct CompleteTheme {
    // Colors
    let backgroundColor: Color
    let textColor: Color
    let accentColor: Color
    
    // Typography
    let titleFont: Font
    let bodyFont: Font
    
    // Custom app-specific values
    let animationDuration: Double
    let customSpacing: CGFloat
}
```

### Use Themes in SwiftUI
```swift
// Access theme through environment
struct ContentView: View {
    @Environment(Themes.self) var theme
    
    var body: some View {
        Text("Hello, World!")
            .font(theme.titleFont)
            .foregroundColor(theme.textColor)
            .background(theme.backgroundColor)
    }
}
```

### Configure Your App
```swift
@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(Themes(current: .light))
        }
    }
}
```

### Switch Themes
```swift
// Somewhere in your view
Button("Toggle Theme") {
    theme.current = theme.current == .light ? .dark : .light
}
```
