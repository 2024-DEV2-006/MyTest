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
    
}

extension BerlinClockTests {
    func getDate(hour: Int, minute: Int, second: Int, from date: Date = Date()) -> Date{
        let calendar = Calendar.init(identifier: .gregorian)
        let date = calendar.date(bySettingHour: hour, minute: minute, second: second, of: date)!
        
        return date
    }
}
