//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 16/01/24.
//

import Foundation

final class BerlinClockModel {
    
    private var berlinClockLamps: BerlinClockLamps!

    func convertToBerlinTime(_ date: Date) -> BerlinClockLamps {
        
        berlinClockLamps = BerlinClockLamps()

        let time = date.getTimeComponents()
        updateSecondsLamp(seconds: time.seconds)
        berlinClockLamps.oneMinutes = checkOneMinuteLamp(minute: time.minutes)
        berlinClockLamps.fiveMinutes = checkFiveMinuteLamp(minute: time.minutes)
        berlinClockLamps.oneHours = checkOneHoursLamp(hour: time.hours)
        berlinClockLamps.fiveHours = checkFiveHoursLamp(hour: time.hours)

        return berlinClockLamps
    }
}

extension BerlinClockModel {
    private func updateSecondsLamp(seconds: Int){
        berlinClockLamps.seconds = ((seconds % AppConstants.secondsLampBlinkPer) == 0) ?  .yellow : .off
    }
    
    private func checkOneMinuteLamp(minute: Int) -> [Lamp]{
        (0..<AppConstants.numberOfOneMinuteLamp).map { $0 < (minute % 5) ? .yellow : .off}
    }
    
    private func isQuarterMinute(_ minute: Int) -> Bool {
        (minute % AppConstants.quartersInFiveMinutesLamp) == 0
    }
    private func checkFiveMinuteLamp(minute: Int) -> [Lamp] {
        let onLamps: [Lamp] = (0..<(minute / 5)).map { index in
            isQuarterMinute(index + 1) ? .red : .yellow
        }
        
        let offLamps = Array<Lamp>(repeating: .off, count: AppConstants.numberOfFiveMinuteLamp - onLamps.count)
        
        return onLamps + offLamps
    }
    
    private func checkOneHoursLamp(hour: Int) -> [Lamp]{
        (0..<AppConstants.numberOfOneHourLamp).map { $0 < (hour % 5) ? .red : .off}
    }
    private func checkFiveHoursLamp(hour: Int) -> [Lamp]{
        (0..<AppConstants.numberOfFiveHourLamp).map { $0 < (hour / 5) ? .red : .off}
    }
    
}
