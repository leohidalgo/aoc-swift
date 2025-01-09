import Foundation

public extension Array where Element:RandomAccessCollection, Element.Index == Int {

    subscript(key: Point) -> Element.Element? {
        guard
            0..<self.count ~= key.y,
            0..<self[key.y].count ~= key.x
        else { return nil }

        return self[key.y][key.x]
    }
}
