//
//  BerlinClockViewModelTest.swift
//  BerlinClockTests
//
//  Created by 2024-DEV2-006 on 17/01/24.
//

import Foundation
import XCTest
@testable import BerlinClock

final class BerlinClockViewModelTest: XCTestCase {
    
    let berlinClockViewModel = BerlinClockViewModel()
    
    func testLamps_AllOff(){
        let date = Date.getDateFrom(hour: 00, minute: 00, second: 01)
        
        berlinClockViewModel.convertToBerlinTime(date)
        let updatedLamps = berlinClockViewModel.berlinClockLamps
        
        XCTAssertEqual(updatedLamps.seconds, .off)
        XCTAssertEqual(updatedLamps.fiveHours, [.off, .off, .off, .off])
        XCTAssertEqual(updatedLamps.oneHours, [.off, .off, .off, .off])
        XCTAssertEqual(updatedLamps.fiveMinutes, [.off, .off, .off, .off, .off, .off, .off, .off, .off, .off, .off])
        XCTAssertEqual(updatedLamps.oneMinutes, [.off, .off, .off, .off])
    }

}
    
