import SwiftUI

public struct SystemFonts {
  public let largeTitle: Font = .largeTitle
  public let title: Font = .title
  public let title2: Font = .title2
  public let title3: Font = .title3
  public let headline: Font = .headline
  public let subheadline: Font = .subheadline
  public let body: Font = .body
  public let callout: Font = .callout
  public let caption: Font = .caption
  public let caption2: Font = .caption2
  public let footnote: Font = .footnote
}

public struct SystemColors {
  public let primary: Color = .primary
  public let secondary: Color = .secondary
  public let accent: Color = .accentColor

  // Background colors
  public let background: Color = Color.systemBackground
  public let secondaryBackground: Color = Color.secondarySystemBackground

  // Foreground colors
  public let text: Color = .primary
  public let white: Color = .white
  public let black: Color = .black
  public let gray: Color = .gray

  // UI Colors
  public let red: Color = .red
  public let orange: Color = .orange
  public let yellow: Color = .yellow
  public let green: Color = .green
  public let mint: Color = .mint
  public let teal: Color = .teal
  public let cyan: Color = .cyan
  public let blue: Color = .blue
  public let indigo: Color = .indigo
  public let purple: Color = .purple
  public let pink: Color = .pink
  public let brown: Color = .brown
}

public struct SystemDefaultTheme {
  public let fonts: SystemFonts
  public let colors: SystemColors

  public init() {
    self.fonts = SystemFonts()
    self.colors = SystemColors()
  }
}

@MainActor
@Observable
@dynamicMemberLookup
public final class Themes<Theme> {
  public var current: Theme

  public init(current: Theme) {
    self.current = current
  }

  public subscript<T>(dynamicMember keyPath: KeyPath<Theme, T>) -> T {
    current[keyPath: keyPath]
  }
}
