//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 16/01/24.
//

import Foundation

struct BerlinClockModel {
    
    func convertToBerlinTime(_ date: Date) -> BerlinClockLamps {
        let time = date.getTimeComponents()
        
        let secondsLamp = checkSecondsLamp(seconds: time.seconds)
        let oneMinutesLamp = checkOneMinuteLamp(minute: time.minutes)
        let fiveMinutesLamp = checkFiveMinuteLamp(minute: time.minutes)

        return BerlinClockLamps(seconds: secondsLamp, oneMinutes: oneMinutesLamp, fiveMinutes: fiveMinutesLamp)
    }
}
    
extension BerlinClockModel {
    private func checkSecondsLamp(seconds: Int) -> Lamp{
        ((seconds % 2) == 0) ?  .yellow : .off
    }
    
    private func checkOneMinuteLamp(minute: Int) -> [Lamp]{
        (0..<4).map { $0 < (minute % 5) ? .yellow : .off}
    }
    private func checkFiveMinuteLamp(minute: Int) -> [Lamp]{
        var lamps = Array<Lamp>(repeating: .off, count: 11)
        return lamps
    }
}
