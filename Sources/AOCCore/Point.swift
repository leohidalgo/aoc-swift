import Foundation

public typealias Direction = Point
public typealias Position = Point

public struct Point: Sendable, Hashable {

    public let y: Int
    public let x: Int

    public init(y: Int, x: Int) {
        self.y = y
        self.x = x
    }

    public func offset(dy: Int, dx: Int) -> Self {
        Self(y: y + dy, x: x + dx)
    }

    public func offset(_ point: Point) -> Self {
        offset(dy: point.y, dx: point.x)
    }

    public func offset(_ tuple: (Int, Int)) -> Self {
        offset(dy: tuple.0, dx: tuple.1)
    }
}

public extension Point {

    static let up = Self(y: -1, x: 0)
    static let down = Self(y: 1, x: 0)
    static let left = Self(y: 0, x: -1)
    static let right = Self(y: 0, x: 1)

    static let upLeft = Self(y: -1, x: -1)
    static let upRight = Self(y: -1, x: 1)
    static let downLeft = Self(y: 1, x: -1)
    static let downRight = Self(y: 1, x: 1)
}
