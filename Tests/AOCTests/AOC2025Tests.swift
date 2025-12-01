import Testing

@testable import AOC2025

struct AOC2025Tests {
    @Test
    func day01() throws {
        var sut = Day01()
        sut.rawInput = """
        L68
        L30
        R48
        L5
        R60
        L55
        L1
        L99
        R14
        L82
        """

        #expect(try sut.part1() == 3, "Part 1")
        #expect(try sut.part2() == 6, "Part 2")
    }
}
