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

    @Test
    func day02() throws {
        var sut = Day02()

        sut.rawInput = """
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        """
        #expect(try sut.part1() == 8, "Part 1")

        sut.rawInput = """
        Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
        Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
        Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
        Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
        Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
        """
        #expect(try sut.part2() == 2286, "Part 2")
    }
}
