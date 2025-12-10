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

    @Test
    func day02() throws {
        var sut = Day02()
        // swiftlint:disable line_length
        sut.rawInput = """
        11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
        """
        // swiftlint:enable line_length

        #expect(try sut.part1() == 1_227_775_554, "Part 1")
        #expect(try sut.part2() == 4_174_379_265, "Part 2")
    }

    @Test
    func day03() throws {
        var sut = Day03()
        sut.rawInput = """
        987654321111111
        811111111111119
        234234234234278
        818181911112111
        """

        #expect(try sut.part1() == 357, "Part 1")
    }

    @Test
    func day04() throws {
        var sut = Day04()
        sut.rawInput = """
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
        """

        #expect(try sut.part1() == 13, "Part 1")
    }

    @Test
    func day05() throws {
        var sut = Day05()
        sut.rawInput = """
        3-5
        10-14
        16-20
        12-18

        1
        5
        8
        11
        17
        32
        """

        #expect(try sut.part1() == 3, "Part 1")
        #expect(try sut.part2() == 14, "Part 2")
    }

    @Test
    func day06() throws {
        var sut = Day06()
        sut.rawInput = """
        123 328  51 64
         45 64  387 23
          6 98  215 314
        *   +   *   +
        """

        #expect(try sut.part1() == 4_277_556, "Part 1")
        #expect(try sut.part2() == 3_263_827, "Part 2")
    }
}
