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

    @Test
    func day03() throws {
        var sut = Day03()

        sut.rawInput = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
        #expect(try sut.part1() == 161, "Part 1")

        sut.rawInput = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
        #expect(try sut.part2() == 48, "Part 2")
    }

    @Test
    func day04() throws {
        var sut = Day04()

        sut.rawInput = """
        ....XXMAS.
        .SAMXMS...
        ...S..A...
        ..A.A.MS.X
        XMASAMX.MM
        X.....XA.A
        S.S.S.S.SS
        .A.A.A.A.A
        ..M.M.M.MM
        .X.X.XMASX
        """
        #expect(try sut.part1() == 18, "Part 1")

        sut.rawInput = """
        .M.S......
        ..A..MSMS.
        .M.S.MAA..
        ..A.ASMSM.
        .M.S.M....
        ..........
        S.S.S.S.S.
        .A.A.A.A..
        M.M.M.M.M.
        ..........
        """
        #expect(try sut.part2() == 9, "Part 2")
    }
}
