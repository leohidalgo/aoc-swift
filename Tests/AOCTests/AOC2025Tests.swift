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
}
