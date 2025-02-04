import AOCCore
import Foundation

public struct AOC2024 {

    private static let days: [Int: any Day] = [
        1: Day01(),
        2: Day02(),
        3: Day03(),
        4: Day04(),
        5: Day05(),
        6: Day06(),
        7: Day07(),
        9: Day09(),
        10: Day10(),
        11: Day11(),
        12: Day12(),
        16: Day16()
    ]
}

extension AOC2024: Year {

    public static func day(_ day: Int) -> (any Day)? {
        days[day]
    }
}
