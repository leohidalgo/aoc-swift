import Foundation

public extension Array where Element: RandomAccessCollection, Element.Index == Int, Element.Element: Equatable {

    subscript(key: Point) -> Element.Element? {
        guard
            0..<self.count ~= key.y,
            0..<self[key.y].count ~= key.x
        else { return nil }

        return self[key.y][key.x]
    }

    func find(element: Element.Element) -> Position? {
        for (y, row) in self.enumerated() {
            if let x = row.firstIndex(of: element) {
                return Position(y: y, x: x)
            }
        }

        return nil
    }
}
