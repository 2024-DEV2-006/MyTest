//
//  BerlinClockModelTests.swift
//  BerlinClockModelTests
//
//  Created by 2024-DEV2-006 on 16/01/24.
//

import XCTest
@testable import BerlinClock

final class BerlinClockModelTests: XCTestCase {
    
    let berlinClock = BerlinClockModel()
    
    func testSecondsLamp_Off(){
        let date = Date.getDateFrom(hour: 00, minute: 00, second: 01)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("O", lamps.seconds.rawValue)
    }
    
    func testSecondsLamp_On(){
        let date = Date.getDateFrom(hour: 00, minute: 00, second: 02)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("Y", lamps.seconds.rawValue)
    }
    
    func testOneMinutesLamp_AllOff(){
        let date = Date.getDateFrom(hour: 00, minute: 00, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("OOOO", lampsToString(lamps.oneMinutes))
    }
    func testOneMinutesLamp_FirstOn(){
        let date = Date.getDateFrom(hour: 00, minute: 01, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YOOO", lampsToString(lamps.oneMinutes))
    }
    func testOneMinutesLamp_FirstAndSecondOn(){
        let date = Date.getDateFrom(hour: 00, minute: 02, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYOO", lampsToString(lamps.oneMinutes))
    }
    func testOneMinutesLamp_FirstAndSecondAndThirdOn(){
        let date = Date.getDateFrom(hour: 00, minute: 03, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYYO", lampsToString(lamps.oneMinutes))
    }
    func testOneMinutesLamp_AllOn(){
        let date = Date.getDateFrom(hour: 00, minute: 04, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYYY", lampsToString(lamps.oneMinutes))
    }
    
    func testFiveMinutesLamp_AllOff(){
        let date = Date.getDateFrom(hour: 00, minute: 00, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("OOOOOOOOOOO", lampsToString(lamps.fiveMinutes))
    }
    func testFiveMinutesLamp_FirstOn(){
        let date = Date.getDateFrom(hour: 00, minute: 05, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YOOOOOOOOOO", lampsToString(lamps.fiveMinutes))
    }
    func testFiveMinutesLamp_FirstAndSecondOn(){
        let date = Date.getDateFrom(hour: 00, minute: 10, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYOOOOOOOOO", lampsToString(lamps.fiveMinutes))
    }
    func testFiveMinutesLamp_FirstQuarterOn(){
        let date = Date.getDateFrom(hour: 00, minute: 15, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYROOOOOOOO", lampsToString(lamps.fiveMinutes))
    }
    func testFiveMinutesLamp_AllQuarterOn(){
        let date = Date.getDateFrom(hour: 00, minute: 45, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYRYYRYYROO", lampsToString(lamps.fiveMinutes))
    }
    func testFiveMinutesLamp_AllOn(){
        let date = Date.getDateFrom(hour: 00, minute: 55, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYRYYRYYRYY", lampsToString(lamps.fiveMinutes))
    }
    
    func testOneHourLamp_AllOff(){
        let date = Date.getDateFrom(hour: 00, minute: 00, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("OOOO", lampsToString(lamps.oneHours))
    }
    func testOneHourLamp_FirstOn(){
        let date = Date.getDateFrom(hour: 01, minute: 00, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("ROOO", lampsToString(lamps.oneHours))
    }
    func testOneHourLamp_FirstAndSecondOn(){
        let date = Date.getDateFrom(hour: 02, minute: 00, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("RROO", lampsToString(lamps.oneHours))
    }
    func testOneHourLamp_AllOn(){
        let date = Date.getDateFrom(hour: 04, minute: 00, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("RRRR", lampsToString(lamps.oneHours))
    }
    
    func testFiveHourLamp_AllOff(){
        let date = Date.getDateFrom(hour: 00, minute: 00, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("OOOO", lampsToString(lamps.fiveHours))
    }
    func testFiveHourLamp_FirstOn(){
        let date = Date.getDateFrom(hour: 05, minute: 00, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("ROOO", lampsToString(lamps.fiveHours))
    }
    func testFiveHourLamp_FirstAndSecondOn(){
        let date = Date.getDateFrom(hour: 10, minute: 00, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("RROO", lampsToString(lamps.fiveHours))
    }
    func testFiveHourLamp_AllOn(){
        let date = Date.getDateFrom(hour: 20, minute: 00, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("RRRR", lampsToString(lamps.fiveHours))
    }
    
    func testintegrateSecondMinuteAndHourLamp_AllOff(){
        let date = Date.getDateFrom(hour: 00, minute: 00, second: 01)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("O OOOO OOOO OOOOOOOOOOO OOOO", integrateSecondMinuteAndHour(lamps: lamps))
    }
    func testIntegrateSecondMinuteAndHour_SecondsLampOn(){
        let date = Date.getDateFrom(hour: 00, minute: 00, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("Y OOOO OOOO OOOOOOOOOOO OOOO", integrateSecondMinuteAndHour(lamps: lamps))
    }
    func testIntegrateSecondMinuteAndHour_AllMinutesLampOn(){
        let date = Date.getDateFrom(hour: 00, minute: 59, second: 59)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("O OOOO OOOO YYRYYRYYRYY YYYY", integrateSecondMinuteAndHour(lamps: lamps))
    }
    func testIntegrateSecondMinuteAndHour_MaximumLampOn(){
        let date = Date.getDateFrom(hour: 23, minute: 59, second: 58)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("Y RRRR RRRO YYRYYRYYRYY YYYY", integrateSecondMinuteAndHour(lamps: lamps))
    }
    func testIntegrateSecondMinuteAndHour_MaximumTime(){
        let date = Date.getDateFrom(hour: 23, minute: 59, second: 59)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("O RRRR RRRO YYRYYRYYRYY YYYY", integrateSecondMinuteAndHour(lamps: lamps))
    }

}

extension BerlinClockModelTests {
    
    func lampsToString(_ lamp:[Lamp]) -> String{
        lamp.map({$0.rawValue}).joined()
    }
    func integrateSecondMinuteAndHour(lamps: BerlinClockLamps)-> String{
        let secondsLamp = lamps.seconds.rawValue
        let fiveHoursLamps = lampsToString(lamps.fiveHours)
        let oneHoursLamps = lampsToString(lamps.oneHours)
        let fiveMinutesLamps = lampsToString(lamps.fiveMinutes)
        let oneMinutesLamps = lampsToString(lamps.oneMinutes)
        
        return "\(secondsLamp) \(fiveHoursLamps) \(oneHoursLamps) \(fiveMinutesLamps) \(oneMinutesLamps)"
    }
}
