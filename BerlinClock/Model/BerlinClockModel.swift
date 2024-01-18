//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 16/01/24.
//

import Foundation

protocol BerlinClockModelProtocol {
    func convertToBerlinTime (_ date: Date) -> BerlinClockLamps
}

struct BerlinClockModel:BerlinClockModelProtocol {
    
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
        retrieveLamps(totalLamps: AppConstants.numberOfOneMinuteLamp,
                      onLamp: minute % 5,
                      onLampColor: .yellow)
    }
        
    private func checkOneHoursLamp(hours: Int) -> [Lamp]{
        retrieveLamps(totalLamps: AppConstants.numberOfOneHourLamp,
                      onLamp: hours % 5,
                      onLampColor: .red)
    }
    
    private func checkFiveHoursLamp(hours: Int) -> [Lamp]{
        retrieveLamps(totalLamps: AppConstants.numberOfFiveHourLamp,
                      onLamp: hours / 5,
                      onLampColor: .red)
    }
    
    private func checkFiveMinuteLamp(minute: Int) -> [Lamp] {
        let onLamps = minute / 5
        let onLights: [Lamp] = (0..<onLamps).map { index in
            isQuarterMinute(index + 1) ? .red : .yellow
        }
        let offLights = Array<Lamp>(repeating: .off, count: AppConstants.numberOfFiveMinuteLamp - onLamps)
        
        return onLights + offLights
    }
    
    private func isQuarterMinute(_ minute: Int) -> Bool {
        (minute % AppConstants.quartersInFiveMinutesLamp) == 0
    }

    private func retrieveLamps(totalLamps: Int, onLamp: Int, onLampColor: Lamp) -> [Lamp]{
        let onLamps = Array<Lamp>(repeating: onLampColor, count: onLamp)
        let offLamps = Array<Lamp>(repeating: .off, count: totalLamps - onLamp)
                
        return onLamps + offLamps
    }
}
