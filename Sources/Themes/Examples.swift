import SwiftUI

// MARK: - Example 1: Basic Light/Dark Theme
struct BasicTheme {
  let backgroundColor: Color
  let textColor: Color

  static let light = BasicTheme(
    backgroundColor: .white,
    textColor: .black
  )

  static let dark = BasicTheme(
    backgroundColor: .black,
    textColor: .white
  )
}

struct BasicThemeView: View {
  @State private var themes = Themes(current: BasicTheme.light)

  var body: some View {
    VStack {
      Text("Basic Theme Example")
        .foregroundColor(themes.textColor)

      Button("Toggle Theme") {
        themes.current =
          themes.current.backgroundColor == .white
          ? BasicTheme.dark
          : BasicTheme.light
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(themes.backgroundColor)
  }
}

// MARK: - Example 2: Custom Color Palette Theme
struct BrandTheme {
  let primary: Color
  let secondary: Color
  let accent: Color
  let background: Color

  static let spring = BrandTheme(
    primary: .green,
    secondary: .mint,
    accent: .yellow,
    background: .white
  )

  static let autumn = BrandTheme(
    primary: .orange,
    secondary: .brown,
    accent: .red,
    background: .white
  )
}

struct BrandThemeView: View {
  @State private var themes = Themes(current: BrandTheme.spring)

  var body: some View {
    VStack(spacing: 20) {
      Text("Brand Theme")
        .foregroundColor(themes.primary)
        .font(.title)

      RoundedRectangle(cornerRadius: 8)
        .fill(themes.secondary)
        .frame(width: 200, height: 100)
        .overlay(
          Text("Content Block")
            .foregroundColor(themes.accent)
        )

      Button("Switch Season") {
        themes.current =
          themes.current.primary == .green
          ? BrandTheme.autumn
          : BrandTheme.spring
      }
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(themes.background)
  }
}

// MARK: - Example 3: Typography Theme
struct TypographyTheme {
  let headingFont: Font
  let bodyFont: Font
  let captionFont: Font
  let textColor: Color

  static let classic = TypographyTheme(
    headingFont: .system(.title).weight(.bold),
    bodyFont: .system(.body),
    captionFont: .system(.caption),
    textColor: .black
  )

  static let modern = TypographyTheme(
    headingFont: .system(.title).monospaced(),
    bodyFont: .system(.body).monospaced(),
    captionFont: .system(.caption).monospaced(),
    textColor: .blue
  )
}

struct TypographyThemeView: View {
  @State private var themes = Themes(current: TypographyTheme.classic)

  var body: some View {
    VStack(spacing: 20) {
      Text("Typography Example")
        .font(themes.headingFont)
        .foregroundColor(themes.textColor)

      Text("This is body text that showcases the main content font.")
        .font(themes.bodyFont)
        .foregroundColor(themes.textColor)
        .multilineTextAlignment(.center)
        .padding()

      Text("Caption text example")
        .font(themes.captionFont)
        .foregroundColor(themes.textColor)

      Button("Switch Typography") {
        themes.current =
          themes.current.bodyFont == .system(.body)
          ? TypographyTheme.modern
          : TypographyTheme.classic
      }
    }
    .padding()
  }
}

// MARK: - Example 4: Complex Theme
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

  static let casual = ComplexAppTheme(
    backgroundColor: .mint.opacity(0.2),
    cardBackground: .white,
    primaryText: .black,
    secondaryText: .gray,
    accentColor: .mint,
    titleFont: .system(.title3).weight(.medium),
    bodyFont: .system(.body),
    cornerRadius: 12,
    spacing: 16
  )

  static let professional = ComplexAppTheme(
    backgroundColor: .indigo.opacity(0.1),
    cardBackground: .white,
    primaryText: .black,
    secondaryText: .gray,
    accentColor: .indigo,
    titleFont: .system(.title3).weight(.semibold),
    bodyFont: .system(.body).weight(.medium),
    cornerRadius: 8,
    spacing: 20
  )
}

struct ComplexThemeView: View {
  @State private var themes = Themes(current: ComplexAppTheme.casual)

  var body: some View {
    VStack(spacing: themes.spacing) {
      Text("Complex Theme Example")
        .font(themes.titleFont)
        .foregroundColor(themes.primaryText)

      VStack(spacing: themes.spacing) {
        ForEach(1...3, id: \.self) { index in
          CardView(index: index, theme: themes.current)
        }
      }
      .padding(themes.spacing)

      Button("Switch Style") {
        themes.current =
          themes.current.cornerRadius == 12
          ? ComplexAppTheme.professional
          : ComplexAppTheme.casual
      }
      .buttonStyle(.borderedProminent)
      .tint(themes.accentColor)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(themes.backgroundColor)
  }
}

struct CardView: View {
  let index: Int
  let theme: ComplexAppTheme

  var body: some View {
    VStack(alignment: .leading, spacing: theme.spacing / 2) {
      Text("Card \(index)")
        .font(theme.titleFont)
        .foregroundColor(theme.primaryText)

      Text(
        "This is a sample card showcasing various theme properties including fonts, colors, spacing, and corner radius."
      )
      .font(theme.bodyFont)
      .foregroundColor(theme.secondaryText)
    }
    .padding(theme.spacing)
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(theme.cardBackground)
    .cornerRadius(theme.cornerRadius)
    .shadow(radius: 2)
  }
}

#Preview("All Examples") {
  TabView {
    BasicThemeView()
      .tabItem {
        Label("Basic", systemImage: "circle.lefthalf.filled")
      }

    BrandThemeView()
      .tabItem {
        Label("Brand", systemImage: "paintpalette")
      }

    TypographyThemeView()
      .tabItem {
        Label("Typography", systemImage: "textformat")
      }

    ComplexThemeView()
      .tabItem {
        Label("Complex", systemImage: "square.stack.3d.up")
      }
  }
}

// MARK: - Preview Providers
#Preview("Basic Theme - Light") {
  BasicThemeView()
}

#Preview("Basic Theme - Dark") {
  BasicThemeView()
    .preferredColorScheme(.dark)
}

#Preview("Brand Theme - Spring") {
  BrandThemeView()
}

#Preview("Typography - Classic") {
  TypographyThemeView()
}

#Preview("Complex - Casual") {
  ComplexThemeView()
}
