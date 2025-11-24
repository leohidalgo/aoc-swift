import Testing

@testable import AOC2025

struct AOC2025Tests {
    @Test
    func day01() throws {
        let sut = Day01()

        #expect(try sut.part1() == -1, "Part 1")
        #expect(try sut.part2() == -1, "Part 2")
    }
}
