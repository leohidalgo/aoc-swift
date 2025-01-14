import Foundation

public extension Sequence where Element: AdditiveArithmetic {

    var sum: Element {
        self.reduce(.zero, +)
    }
}

public extension Sequence where Iterator.Element: Hashable {

    var unique: Set<Iterator.Element> {
        Set(self)
    }
}
