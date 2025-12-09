import Foundation

public extension Collection where Element: Hashable {
    var allSame: Bool {
        Set(self).count == 1
    }
}

public extension Collection where Element == DateInterval {
    var average: TimeInterval {
        let totalDuration = self
            .map(\.duration)
            .reduce(0, +)

        return totalDuration / Double(count)
    }
}

public extension Collection where Element: RandomAccessCollection {
    var columns: [[Element.Element]] {
        guard
            let firstRow = self.first
        else { return [] }

        return (0..<firstRow.count)
            .map { column in
                self.map { row in
                    row[row.index(row.startIndex, offsetBy: column)]
                }
            }
    }
}
