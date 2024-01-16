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
          XCTAssertEqual("O", berlinClock.convertToBerlinTime("00:00:01"))
      }
    func testSecondsLamp_On(){
        XCTAssertEqual("Y", berlinClock.convertToBerlinTime("00:00:02"))
    }

}
