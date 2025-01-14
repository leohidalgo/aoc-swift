import Foundation

public struct Tuple<First: Hashable, Second: Hashable>: Hashable {

    public let first: First
    public let second: Second

    public init(_ first: First, _ second: Second) {
        self.first = first
        self.second = second
    }
}
