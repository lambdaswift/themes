import SwiftUI
import Testing

@testable import Themes

// Test theme with minimal properties
struct MinimalTheme {
    let backgroundColor: Color
    let textColor: Color

    static let light = MinimalTheme(
        backgroundColor: .white,
        textColor: .black
    )

    static let dark = MinimalTheme(
        backgroundColor: .black,
        textColor: .white
    )
}

// Test theme with more complex properties
struct ComplexTheme {
    let backgroundColor: Color
    let textColor: Color
    let accentColor: Color
    let titleFont: Font
    let spacing: CGFloat

    static let light = ComplexTheme(
        backgroundColor: .white,
        textColor: .black,
        accentColor: .blue,
        titleFont: .system(.title),
        spacing: 16
    )
}

@MainActor
final class ThemesTests {
    @Test func testMinimalThemeInitialization() throws {
        let themes = Themes(current: MinimalTheme.light)
        #expect(themes.current.backgroundColor == .white)
        #expect(themes.current.textColor == .black)
    }

    @Test func testDynamicMemberLookup() throws {
        let themes = Themes(current: MinimalTheme.light)
        #expect(themes.backgroundColor == .white)
        #expect(themes.textColor == .black)
    }

    @Test func testThemeSwitching() throws {
        let themes = Themes(current: MinimalTheme.light)
        #expect(themes.backgroundColor == .white)

        themes.current = MinimalTheme.dark
        #expect(themes.backgroundColor == .black)
        #expect(themes.textColor == .white)
    }

    @Test func testComplexThemeProperties() throws {
        let themes = Themes(current: ComplexTheme.light)
        #expect(themes.backgroundColor == .white)
        #expect(themes.textColor == .black)
        #expect(themes.accentColor == .blue)
        #expect(themes.titleFont == .system(.title))
        #expect(themes.spacing == 16)
    }

    @Test func testSystemDefaultTheme() throws {
        let themes = Themes(current: SystemDefaultTheme())

        // Test fonts
        #expect(themes.current.fonts.largeTitle == .largeTitle)
        #expect(themes.current.fonts.body == .body)
        #expect(themes.current.fonts.caption == .caption)

        // Test colors
        #expect(themes.current.colors.primary == .primary)
        #expect(themes.current.colors.accent == .accentColor)
        #expect(themes.current.colors.blue == .blue)
    }
}
