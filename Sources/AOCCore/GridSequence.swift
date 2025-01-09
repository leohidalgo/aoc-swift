import Foundation

public struct GridSequence: Sequence, IteratorProtocol {

    private var y: Int
    private var x: Int

    private let rangeY: Range<Int>
    private let rangeX: Range<Int>

    public init(_ raw: [[Any]]) {
        self.rangeY = 0..<raw.count
        self.rangeX = 0..<raw[0].count

        self.y = rangeY.startIndex
        self.x = rangeX.startIndex
    }

    mutating
    public func next() -> Point? {
        defer {
            x += 1

            if x >= rangeX.endIndex {
                y += 1
                x = rangeX.startIndex
            }
        }

        guard
            rangeY ~= y,
            rangeX ~= x
        else { return nil }

        return Point(y: y, x: x)
    }
}
