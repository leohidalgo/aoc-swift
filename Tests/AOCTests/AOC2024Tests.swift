import AOC2024
import Testing

@testable import AOC2024

struct AOC2024Tests {

    @Test
    func day01() throws {
        var sut = Day01()
        sut.rawInput = """
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
        """

        #expect(try sut.part1() == 11, "Part 1")
        #expect(try sut.part2() == 31, "Part 2")
    }
}
