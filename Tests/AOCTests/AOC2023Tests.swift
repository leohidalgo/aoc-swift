import Testing

@testable import AOC2023

struct AOC2023Tests {
    @Test
    func day01() throws {
        let sut = Day01()

        #expect(try sut.part1() == -1, "Part 1")
        #expect(try sut.part2() == -1, "Part 2")
    }
}
