# Themes

A lightweight, flexible theming framework for iOS and macOS applications.

## Features
- Type-safe theme definitions
- Fully customizable theme properties
- Dynamic theme switching
- @Observable theme changes
- Generic theme types for maximum flexibility
- Comprehensive example implementations

## Installation

Add this package to your Xcode project using Swift Package Manager:

```swift
dependencies: [
    .package(url: "https://github.com/lambdaswift/Themes.git", from: "0.0.1")
]
```

## Usage

### Basic Implementation
```swift
// 1. Define your theme structure
struct AppTheme {
    let backgroundColor: Color
    let textColor: Color
}

// 2. Create theme variations
extension AppTheme {
    static let light = AppTheme(
        backgroundColor: .white,
        textColor: .black
    )
    
    static let dark = AppTheme(
        backgroundColor: .black,
        textColor: .white
    )
}

// 3. Use in your views
struct ContentView: View {
    @State private var themes = Themes(current: AppTheme.light)
    
    var body: some View {
        Text("Hello, World!")
            .foregroundColor(themes.textColor)
            .background(themes.backgroundColor)
    }
}
```

### Theme Switching
```swift
Button("Toggle Theme") {
    themes.current = themes.current.backgroundColor == .white 
        ? AppTheme.dark 
        : AppTheme.light
}
```

## Example Implementations

The package includes several example implementations:

### 1. Basic Light/Dark Theme
- Simple theme switching between light and dark modes
- Basic color properties
```swift
struct BasicTheme {
    let backgroundColor: Color
    let textColor: Color
}
```

### 2. Brand Theme
- Multiple color palettes (Spring/Autumn)
- Primary, secondary, and accent colors
```swift
struct BrandTheme {
    let primary: Color
    let secondary: Color
    let accent: Color
    let background: Color
}
```

### 3. Typography Theme
- Font management
- Text styling variations
```swift
struct TypographyTheme {
    let headingFont: Font
    let bodyFont: Font
    let captionFont: Font
    let textColor: Color
}
```

### 4. Complex Theme
- Comprehensive theme implementation
- Multiple properties including colors, fonts, and layout values
```swift
struct ComplexAppTheme {
    let backgroundColor: Color
    let cardBackground: Color
    let primaryText: Color
    let secondaryText: Color
    let accentColor: Color
    let titleFont: Font
    let bodyFont: Font
    let cornerRadius: CGFloat
    let spacing: CGFloat
}
```

## Best Practices

1. **Theme Structure**
   - Keep theme properties immutable
   - Use static properties for theme variations
   - Group related properties together

2. **Implementation**
   - Use @State for view-local themes
   - Use @Environment for app-wide themes
   - Leverage dynamic member lookup for clean syntax

3. **Maintenance**
   - Document theme properties
   - Keep theme variations consistent
   - Use semantic naming for colors and properties

## Requirements
- iOS 17.0+ / macOS 14.0+
- Swift 5.9+
- Xcode 15.0+

## License
This package is released under the MIT license. See [LICENSE](LICENSE) for details.
