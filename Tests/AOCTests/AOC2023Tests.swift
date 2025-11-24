import Testing

@testable import AOC2023

struct AOC2023Tests {
    @Test
    func day01() throws {
        var sut = Day01()

        sut.rawInput = """
        1abc2
        pqr3stu8vwx
        a1b2c3d4e5f
        treb7uchet
        """
        #expect(try sut.part1() == 142, "Part 1")

        sut.rawInput = """
        two1nine
        eightwothree
        abcone2threexyz
        xtwone3four
        4nineeightseven2
        zoneight234
        7pqrstsixteen
        """
        #expect(try sut.part2() == 281, "Part 2")

        sut.rawInput = """
        twone
        """
        #expect(try sut.part2() == 21, "Part 2b")
    }
}
