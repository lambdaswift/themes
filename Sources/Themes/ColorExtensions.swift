import SwiftUI

/// Extensions for the SwiftUI `Color` type providing additional functionality and system color support.
extension Color {
  /// Returns the system background color appropriate for the current platform.
  ///
  /// On iOS/iPadOS, this returns `UIColor.systemBackground`.
  /// On macOS, this returns `NSColor.windowBackgroundColor`.
  public static var systemBackground: Color {
    #if canImport(UIKit)
      return Color(UIColor.systemBackground)
    #else
      return Color(NSColor.windowBackgroundColor)
    #endif
  }

  /// Returns the secondary system background color appropriate for the current platform.
  ///
  /// On iOS/iPadOS, this returns `UIColor.secondarySystemBackground`.
  /// On macOS, this returns `NSColor.windowBackgroundColor` (as there is no direct equivalent).
  public static var secondarySystemBackground: Color {
    #if canImport(UIKit)
      return Color(UIColor.secondarySystemBackground)
    #else
      return Color(NSColor.windowBackgroundColor)
    #endif
  }

  /// Returns the system grouped background color appropriate for the current platform.
  ///
  /// On iOS/iPadOS, this returns `UIColor.systemGroupedBackground`.
  /// On macOS, this returns `NSColor.windowBackgroundColor`.
  public static var systemGroupedBackground: Color {
    #if canImport(UIKit)
      return Color(UIColor.systemGroupedBackground)
    #else
      return Color(NSColor.windowBackgroundColor)
    #endif
  }

  /// Returns the system control background color appropriate for the current platform.
  ///
  /// On iOS/iPadOS, this returns `UIColor.systemGray6`.
  /// On macOS, this returns `NSColor.controlBackgroundColor`.
  public static var controlBackground: Color {
    #if canImport(UIKit)
      return Color(UIColor.systemGray6)
    #else
      return Color(NSColor.controlBackgroundColor)
    #endif
  }

  /// Creates a color from a hexadecimal string representation.
  ///
  /// The string can be prefixed with '#' and can contain whitespace.
  /// The string should represent a valid RGB color in hexadecimal format.
  ///
  /// - Parameter hex: A string containing the hexadecimal color value.
  ///   Example: "#FF0000" or "FF0000" for red.
  public init(hex: String) {
    let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines)
    let scanner = Scanner(string: hex)
    if hex.hasPrefix("#") {
      scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
    }
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
    let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
    let b = CGFloat(rgb & 0x0000FF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}
