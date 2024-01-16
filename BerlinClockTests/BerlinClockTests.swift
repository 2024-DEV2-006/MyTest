//
//  BerlinClockTests.swift
//  BerlinClockTests
//
//  Created by 2024-DEV2-006 on 16/01/24.
//

import XCTest
@testable import BerlinClock

final class BerlinClockTests: XCTestCase {
    
    let berlinClock = BerlinClockModel()
    
    func testSecondsLamp_Off(){
        let date = getDate(hour: 00, minute: 00, second: 01)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("O", lamps.seconds.rawValue)
    }
    
    func testSecondsLamp_On(){
        let date = getDate(hour: 00, minute: 00, second: 02)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("Y", lamps.seconds.rawValue)
    }
    
    func testOneMinutesLamp_AllOff(){
        let date = getDate(hour: 00, minute: 00, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("OOOO", lampsToString(lamps.oneMinutes))
    }
    func testOneMinutesLamp_FirstOn(){
        let date = getDate(hour: 00, minute: 01, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YOOO", lampsToString(lamps.oneMinutes))
    }
    func testOneMinutesLamp_FirstAndSecondOn(){
        let date = getDate(hour: 00, minute: 02, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYOO", lampsToString(lamps.oneMinutes))
    }
    func testOneMinutesLamp_FirstAndSecondAndThirdOn(){
        let date = getDate(hour: 00, minute: 03, second: 00)
        let lamps = berlinClock.convertToBerlinTime(date)
        XCTAssertEqual("YYYO", lampsToString(lamps.oneMinutes))
    }

}

extension BerlinClockTests {
    func getDate(hour: Int, minute: Int, second: Int, from date: Date = Date()) -> Date{
        let calendar = Calendar.init(identifier: .gregorian)
        let date = calendar.date(bySettingHour: hour, minute: minute, second: second, of: date)!
        
        return date
    }
    
    func lampsToString(_ lamp:[Lamp]) -> String{
        lamp.map({$0.rawValue}).joined()
    }

}
