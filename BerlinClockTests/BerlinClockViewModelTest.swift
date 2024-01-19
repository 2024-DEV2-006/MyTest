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
        
    private var berlinClockViewModel: BerlinClockViewModel?
    private let timer = MockAppTimer()
    private let berlinClockModel = MockBerlinClockModel()
    
    override func setUp() {
        berlinClockViewModel = BerlinClockViewModel(berlinClockModel: berlinClockModel, timer: timer)
    }
    func testInitialState(){
        let berlinClockLamps = BerlinClockLamps(seconds: .off,
                                                oneMinutes: [.off, .off, .off, .off],
                                                fiveMinutes: [.off, .off, .off, .off, .off, .off, .off, .off, .off,.off,.off],
                                                oneHours: [.off, .off, .off, .off],
                                                fiveHours: [.off, .off, .off, .off])
        XCTAssertEqual(berlinClockViewModel?.berlinClockLamps, berlinClockLamps)
        XCTAssertEqual(berlinClockViewModel?.digitalTime, "00:00:00")
    }
    func testLampsUpdatedOnView(){
        let berlinClockLamps = BerlinClockLamps(seconds: .yellow,
                                                oneMinutes: [.yellow, .yellow, .yellow, .yellow],
                                                fiveMinutes: [.yellow, .yellow, .red, .yellow, .yellow, .off, .yellow, .yellow, .red,.yellow,.yellow],
                                                oneHours: [.red, .red, .red, .off],
                                                fiveHours: [.red, .red, .red, .red])
                                                
        berlinClockModel.mockBerlinClockLamps(berlinClockLamps:berlinClockLamps)
        berlinClockViewModel?.startTimer()
        timer.mockSecondChange(toDate: Date.getDateFrom(hour: 23, minute: 59, second: 58))
    
        XCTAssertEqual(berlinClockViewModel?.berlinClockLamps, berlinClockLamps)
        XCTAssertEqual(berlinClockViewModel?.digitalTime, "23:59:58")

    }
    func testStopTimer(){
        berlinClockViewModel?.stopTimer()
        
        XCTAssertTrue(timer.hasStoppedTimer)
    }
}
    
private final class MockAppTimer: AppTimerProtocol {
 
    var hasStoppedTimer = false
    private var secondChangeCallback:((Date) -> Void)?
    
    func startTimer (secondChangeCallback: @escaping (Date) -> Void) {
        self.secondChangeCallback = secondChangeCallback
    }
    func stopTimer() {
        hasStoppedTimer = true
        self.secondChangeCallback = nil
    }
    func mockSecondChange (toDate: Date) {
        secondChangeCallback?(toDate)
    }
}

private final class MockBerlinClockModel: BerlinClockModelProtocol {
    
    private var berlinClockLamps: BerlinClockLamps!
    
    func convertToBerlinTime (_ date: Date) -> BerlinClockLamps{
        return berlinClockLamps
    }
    func mockBerlinClockLamps(berlinClockLamps: BerlinClockLamps) {
        self.berlinClockLamps = berlinClockLamps
    }
}
