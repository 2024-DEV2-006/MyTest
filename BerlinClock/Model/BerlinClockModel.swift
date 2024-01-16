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

        return BerlinClockLamps(seconds: secondsLamp, oneMinutes: oneMinutesLamp)
    }
}
    
extension BerlinClockModel {
    private func checkSecondsLamp(seconds: Int) -> Lamp{
        ((seconds % 2) == 0) ?  .yellow : .off
    }
    
    private func checkOneMinuteLamp(minute: Int) -> [Lamp]{
        
        if (minute % 5) == 1 {
            return [.yellow,.off,.off,.off]
        }
        if (minute % 5) == 2 {
            return [.yellow,.yellow,.off,.off]
        }
        if (minute % 5) == 3 {
            return [.yellow,.yellow,.yellow,.off]
        }
        if (minute % 5) == 4 {
            return [.yellow,.yellow,.yellow,.yellow]
        }
       return [.off,.off,.off,.off]
    }
}
