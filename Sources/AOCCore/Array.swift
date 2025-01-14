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

    func findAll(element: Element.Element) -> Set<Position> {
        var result: Set<Position> = []

        for (y, row) in self.enumerated() {
            for (x, item) in row.enumerated() where item == element {
                result.insert(.init(y: y, x: x))
            }
        }

        return result
    }
}
