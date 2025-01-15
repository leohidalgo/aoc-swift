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

    @Test
    func day05() throws {
        var sut = Day05()

        sut.rawInput = """
        47|53
        97|13
        97|61
        97|47
        75|29
        61|13
        75|53
        29|13
        97|29
        53|29
        61|53
        97|53
        61|29
        47|13
        75|47
        97|75
        47|61
        75|61
        47|29
        75|13
        53|13

        75,47,61,53,29
        97,61,53,29,13
        75,29,13
        75,97,47,61,53
        61,13,29
        97,13,75,29,47
        """
        #expect(try sut.part1() == 143, "Part 1")
        #expect(try sut.part2() == 123, "Part 2")
    }

    @Test
    func day10() throws {
        var sut = Day10()

        sut.rawInput = """
        89010123
        78121874
        87430965
        96549874
        45678903
        32019012
        01329801
        10456732
        """
        #expect(try sut.part1() == 36, "Part 1")
        #expect(try sut.part2() == 81, "Part 2")
    }

    @Test
    func day11() throws {
        var sut = Day11()

        sut.rawInput = "125 17"
        #expect(try sut.part1() == 55312, "Part 1")
        #expect(try sut.part2() == 65601038650482, "Part 2")
    }
}
