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
        let oneHoursLamp = checkOneHoursLamp(hour: time.hours)
        let fiveHoursLamp = checkFiveHoursLamp(hour: time.hours)


        return BerlinClockLamps(seconds: secondsLamp,
                                oneMinutes: oneMinutesLamp,
                                fiveMinutes: fiveMinutesLamp,
                                oneHours: oneHoursLamp,
                                fiveHours: fiveHoursLamp)
    }
}

extension BerlinClockModel {
    private func checkSecondsLamp(seconds: Int) -> Lamp{
        ((seconds % 2) == 0) ?  .yellow : .off
    }
    
    private func checkOneMinuteLamp(minute: Int) -> [Lamp]{
        (0..<4).map { $0 < (minute % 5) ? .yellow : .off}
    }
    
    private func isQuarterMinute(_ minute: Int) -> Bool {
        (minute % 3) == 0
    }
    private func checkFiveMinuteLamp(minute: Int) -> [Lamp] {
        let onLamps: [Lamp] = (0..<(minute / 5)).map { index in
            isQuarterMinute(index + 1) ? .red : .yellow
        }
        
        let offLamps = Array<Lamp>(repeating: .off, count: 11 - onLamps.count)
        
        return onLamps + offLamps
    }
    
    private func checkOneHoursLamp(hour: Int) -> [Lamp]{
        (0..<4).map { $0 < (hour % 5) ? .red : .off}
    }
    private func checkFiveHoursLamp(hour: Int) -> [Lamp]{
        (0..<4).map { $0 < (hour / 5) ? .red : .off}
    }
    
}
