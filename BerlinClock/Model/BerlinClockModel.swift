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
        
        return BerlinClockLamps(seconds: checkSecondsLamp(seconds: time.seconds),
                                oneMinutes: checkOneMinuteLamp(minute: time.minutes),
                                fiveMinutes: checkFiveMinuteLamp(minute: time.minutes),
                                oneHours: checkOneHoursLamp(hours: time.hours),
                                fiveHours: checkFiveHoursLamp(hours: time.hours))
    }
}

extension BerlinClockModel {
    private func checkSecondsLamp(seconds: Int) -> Lamp{
        ((seconds % AppConstants.secondsLampBlinkPer) == 0) ?  .yellow : .off
    }
    
    private func checkOneMinuteLamp(minute: Int) -> [Lamp]{
        let onLamps = minute % 5
        var oneMinutesLamps = Array<Lamp>(repeating: .off, count: AppConstants.numberOfOneMinuteLamp)
        oneMinutesLamps[..<onLamps] = ArraySlice(repeating: .yellow, count: onLamps)
        
        return oneMinutesLamps
    }
    
    private func isQuarterMinute(_ minute: Int) -> Bool {
        (minute % AppConstants.quartersInFiveMinutesLamp) == 0
    }
    private func checkFiveMinuteLamp(minute: Int) -> [Lamp] {
        let onLamps = minute / 5
        let onLight: [Lamp] = (0..<onLamps).map { index in
            isQuarterMinute(index + 1) ? .red : .yellow
        }
        
        let offLight = Array<Lamp>(repeating: .off, count: AppConstants.numberOfFiveMinuteLamp - onLamps)
        
        return onLight + offLight
    }
    
    private func checkOneHoursLamp(hours: Int) -> [Lamp]{
        let onLamps = hours % 5
        var oneHoursLamps = Array<Lamp>(repeating: .off, count: AppConstants.numberOfOneHourLamp)
        oneHoursLamps[..<onLamps] = ArraySlice(repeating: .red, count: onLamps)
        
        return oneHoursLamps
    }
    private func checkFiveHoursLamp(hours: Int) -> [Lamp]{
        let onLamps = hours / 5
        var fiveHoursLamps = Array<Lamp>(repeating: .off, count: AppConstants.numberOfFiveHourLamp)
        fiveHoursLamps[..<onLamps] = ArraySlice(repeating: .red, count: onLamps)
        
        return fiveHoursLamps
    }
    
}
