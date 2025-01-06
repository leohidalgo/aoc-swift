import Foundation

public extension Collection where Element == DateInterval {

    var average: TimeInterval {
        let totalDuration = self
            .map(\.duration)
            .reduce(0, +)

        return totalDuration / Double(count)
    }
}
