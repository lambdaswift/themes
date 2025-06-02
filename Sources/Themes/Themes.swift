import SwiftUI

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
