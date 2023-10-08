import XCTest
@testable import ConsecutiveRecordCalculator

final class ConsecutiveRecordCalculatorTests: XCTestCase {
    var calculator: ConsecutiveRecordCalculator!
    var startOfDayTimeString: String!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        calculator = ConsecutiveRecordCalculator()
        startOfDayTimeString = "06:00"
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        calculator = nil
        startOfDayTimeString = nil
    }
    
    func testFindMaxConsecutiveDays() {
        // Test Case 1
        let dates1 = [
            calculator.date(year: 2023, month: 7, day: 10, hour: 1),
            calculator.date(year: 2023, month: 7, day: 11, hour: 4),
            calculator.date(year: 2023, month: 7, day: 12, hour: 5),
            calculator.date(year: 2023, month: 7, day: 14, hour: 6),
            calculator.date(year: 2023, month: 7, day: 15, hour: 3),
            calculator.date(year: 2023, month: 7, day: 17, hour: 7)
        ]
        let maxConsecutiveDays1 = calculator.findMaxConsecutiveDays(dates: dates1, startOfDayTimeString: startOfDayTimeString)
        XCTAssertEqual(maxConsecutiveDays1, 3, "Expected max consecutive days: 3")
        
        // Test Case 2
        let dates2: [Date] = []
        let maxConsecutiveDays2 = calculator.findMaxConsecutiveDays(dates: dates2, startOfDayTimeString: startOfDayTimeString)
        XCTAssertEqual(maxConsecutiveDays2, 0, "Expected max consecutive days: 0")
        
        // Test Case 3
        let dates3 = [
            calculator.date(year: 2023, month: 7, day: 10, hour: 8),
            calculator.date(year: 2023, month: 7, day: 11, hour: 8),
            calculator.date(year: 2023, month: 7, day: 11, hour: 8),
            calculator.date(year: 2023, month: 7, day: 11, hour: 8),
            calculator.date(year: 2023, month: 7, day: 15, hour: 8),
            calculator.date(year: 2023, month: 7, day: 16, hour: 8),
            calculator.date(year: 2023, month: 7, day: 17, hour: 8),
            calculator.date(year: 2023, month: 7, day: 18, hour: 8),
            calculator.date(year: 2023, month: 7, day: 18, hour: 8),
            calculator.date(year: 2023, month: 7, day: 20, hour: 8),
            calculator.date(year: 2023, month: 7, day: 21, hour: 8),
            calculator.date(year: 2023, month: 7, day: 22, hour: 8)
        ]
        let maxConsecutiveDays3 = calculator.findMaxConsecutiveDays(dates: dates3, startOfDayTimeString: startOfDayTimeString)
        XCTAssertEqual(maxConsecutiveDays3, 4, "Expected max consecutive days: 4")
    }
    
    func testFindCurrentConsecutiveDays() {
        // Test Case 1
        let dates1 = [
            calculator.date(year: 2023, month: 7, day: 10, hour: 8),
            calculator.date(year: 2023, month: 7, day: 11, hour: 8),
            calculator.date(year: 2023, month: 7, day: 12, hour: 8),
            calculator.date(year: 2023, month: 7, day: 13, hour: 8),
            calculator.date(year: 2023, month: 7, day: 14, hour: 8),
            calculator.date(year: 2023, month: 7, day: 15, hour: 8)
        ]
        let currentConsecutiveDays1 = calculator.findCurrentConsecutiveDays(dates: dates1, startOfDayTimeString: startOfDayTimeString)
        XCTAssertEqual(currentConsecutiveDays1, 6, "Expected current consecutive days: 6")
        
        // Test Case 2
        let dates2: [Date] = []
        let currentConsecutiveDays2 = calculator.findCurrentConsecutiveDays(dates: dates2, startOfDayTimeString: startOfDayTimeString)
        XCTAssertEqual(currentConsecutiveDays2, 0, "Expected current consecutive days: 0")
        
        // Test Case 3
        let dates3 = [
            calculator.date(year: 2023, month: 7, day: 10, hour: 1),
            calculator.date(year: 2023, month: 7, day: 11, hour: 4),
            calculator.date(year: 2023, month: 7, day: 12, hour: 5),
            calculator.date(year: 2023, month: 7, day: 13, hour: 6),
            calculator.date(year: 2023, month: 7, day: 15, hour: 3),
            calculator.date(year: 2023, month: 7, day: 17, hour: 7)
        ]
        let currentConsecutiveDays3 = calculator.findCurrentConsecutiveDays(dates: dates3, startOfDayTimeString: startOfDayTimeString)
        XCTAssertEqual(currentConsecutiveDays3, 3, "Expected current consecutive days: 3")
    }
    
    func testBetweenWeeks() {
        let weeksBetween1 = calculator.weeksBetween(
            calculator.date(year: 2023, month: 7, day: 7, hour: 8),
            calculator.date(year: 2023, month: 7, day: 14, hour: 8),
            calculator.getTimeComponents(from: startOfDayTimeString)
        )
        XCTAssertEqual(weeksBetween1, 1, "Expected weeks between: 1")

        let weeksBetween2 = calculator.weeksBetween(
            calculator.date(year: 2023, month: 7, day: 7, hour: 8),
            calculator.date(year: 2023, month: 7, day: 22, hour: 8),
            calculator.getTimeComponents(from: startOfDayTimeString)
        )
        XCTAssertEqual(weeksBetween2, 2, "Expected weeks between: 2")
        
        let weeksBetween3 = calculator.weeksBetween(
            calculator.date(year: 2023, month: 7, day: 7, hour: 8),
            calculator.date(year: 2023, month: 7, day: 23, hour: 3),
            calculator.getTimeComponents(from: startOfDayTimeString)
        )
        XCTAssertEqual(weeksBetween3, 2, "Expected weeks between: 2")
    }
    
    func testFindMaxConsecutiveWeeks() {
        // Test Case 1
        let dates1 = [
            calculator.date(year: 2023, month: 7, day: 10, hour: 1),
            calculator.date(year: 2023, month: 7, day: 17, hour: 4),
            calculator.date(year: 2023, month: 7, day: 24, hour: 5),
            calculator.date(year: 2023, month: 7, day: 31, hour: 6),
            calculator.date(year: 2023, month: 8, day: 7, hour: 3),
            calculator.date(year: 2023, month: 8, day: 14, hour: 7)
        ]
        let maxConsecutiveWeeks1 = calculator.findMaxConsecutiveWeeks(dates: dates1, startOfDayTimeString: startOfDayTimeString)
        XCTAssertEqual(maxConsecutiveWeeks1, 6, "Expected max consecutive weeks: 6")
        
        // Test Case 2
        let dates2: [Date] = []
        let maxConsecutiveWeeks2 = calculator.findMaxConsecutiveWeeks(dates: dates2, startOfDayTimeString: startOfDayTimeString)
        XCTAssertEqual(maxConsecutiveWeeks2, 0, "Expected max consecutive weeks: 0")
        
        // Test Case 3
        let dates3 = [
            calculator.date(year: 2023, month: 7, day: 10, hour: 1),
            calculator.date(year: 2023, month: 7, day: 11, hour: 4),
            calculator.date(year: 2023, month: 7, day: 12, hour: 5),
            calculator.date(year: 2023, month: 7, day: 14, hour: 6),
            calculator.date(year: 2023, month: 7, day: 15, hour: 3),
            calculator.date(year: 2023, month: 7, day: 17, hour: 7)
        ]
        let maxConsecutiveWeeks3 = calculator.findMaxConsecutiveWeeks(dates: dates3, startOfDayTimeString: startOfDayTimeString)
        XCTAssertEqual(maxConsecutiveWeeks3, 2, "Expected max consecutive weeks: 2")
    }
    
    func testFindCurrentConsecutiveWeeks() {
        // Test Case 1
        let dates1 = [
            calculator.date(year: 2023, month: 7, day: 10, hour: 1),
            calculator.date(year: 2023, month: 7, day: 17, hour: 4),
            calculator.date(year: 2023, month: 7, day: 24, hour: 5),
            calculator.date(year: 2023, month: 7, day: 31, hour: 6),
            calculator.date(year: 2023, month: 8, day: 14, hour: 3),
            calculator.date(year: 2023, month: 8, day: 15, hour: 7)
        ]
        let currentConsecutiveWeeks1 = calculator.findCurrentConsecutiveWeeks(dates: dates1, startOfDayTimeString: startOfDayTimeString)
        XCTAssertEqual(currentConsecutiveWeeks1, 4, "Expected current consecutive weeks: 4")
        
        // Test Case 2
        let dates2: [Date] = []
        let currentConsecutiveWeeks2 = calculator.findCurrentConsecutiveWeeks(dates: dates2, startOfDayTimeString: startOfDayTimeString)
        XCTAssertEqual(currentConsecutiveWeeks2, 0, "Expected current consecutive weeks: 0")
        
        // Test Case 3
        let dates3 = [
            calculator.date(year: 2023, month: 7, day: 10, hour: 1),
            calculator.date(year: 2023, month: 7, day: 11, hour: 4),
            calculator.date(year: 2023, month: 7, day: 12, hour: 5),
            calculator.date(year: 2023, month: 7, day: 14, hour: 6),
            calculator.date(year: 2023, month: 7, day: 15, hour: 3),
            calculator.date(year: 2023, month: 7, day: 17, hour: 7)
        ]
        let currentConsecutiveWeeks3 = calculator.findCurrentConsecutiveWeeks(dates: dates3, startOfDayTimeString: startOfDayTimeString)
        XCTAssertEqual(currentConsecutiveWeeks3, 2, "Expected current consecutive weeks: 2")
    }
}
