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

    @Test
    func day02() throws {
        var sut = Day02()
        sut.rawInput = """
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
        """

        #expect(try sut.part1() == 2, "Part 1")
        #expect(try sut.part2() == 4, "Part 2")
    }
}
