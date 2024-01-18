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
        
        let time = date.getTimeComponents()

        berlinClockLamps = BerlinClockLamps()

        updateSecondsLamp(seconds: time.seconds)
        updateOneMinutes(onLamps: (time.minutes % 5))
        updateFiveMinutes(onLamps: (time.minutes / 5))
        berlinClockLamps.oneHours = checkOneHoursLamp(hour: time.hours)
        berlinClockLamps.fiveHours = checkFiveHoursLamp(hour: time.hours)

        return berlinClockLamps
    }
}

extension BerlinClockModel {
    private func updateSecondsLamp(seconds: Int){
        berlinClockLamps.seconds = ((seconds % AppConstants.secondsLampBlinkPer) == 0) ?  .yellow : .off
    }
    
    private func updateOneMinutes(onLamps: Int){
        berlinClockLamps.oneMinutes[..<onLamps] = ArraySlice(repeating: .yellow, count: onLamps)
    }
    
    private func isQuarterMinute(_ minute: Int) -> Bool {
        (minute % AppConstants.quartersInFiveMinutesLamp) == 0
    }
    private func updateFiveMinutes(onLamps: Int){
        let onLight: [Lamp] = (0..<onLamps).map { index in
            isQuarterMinute(index + 1) ? .red : .yellow
        }
        berlinClockLamps.fiveMinutes[..<onLamps] = ArraySlice(onLight)
    }
    
    private func checkOneHoursLamp(hour: Int) -> [Lamp]{
        (0..<AppConstants.numberOfOneHourLamp).map { $0 < (hour % 5) ? .red : .off}
    }
    private func checkFiveHoursLamp(hour: Int) -> [Lamp]{
        (0..<AppConstants.numberOfFiveHourLamp).map { $0 < (hour / 5) ? .red : .off}
    }
    
}
