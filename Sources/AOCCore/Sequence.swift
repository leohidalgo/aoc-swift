import Foundation

public extension Sequence where Element: AdditiveArithmetic {

    var sum: Element {
        self.reduce(.zero, +)
    }
}
