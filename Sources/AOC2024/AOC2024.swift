import AOCCore
import Foundation

public struct AOC2024 {

    private static let days: [Int: any Day] = [
        1: Day01(),
        2: Day02()
    ]
}

extension AOC2024: Year {

    public static func day(_ day: Int) -> (any Day)? {
        days[day]
    }
}
