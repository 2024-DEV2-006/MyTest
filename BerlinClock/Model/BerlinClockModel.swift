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
        
        return BerlinClockLamps(seconds: secondsLamp)
    }
    
    func checkSecondsLamp(seconds: Int) -> Lamp{
        ((seconds % 2) == 0) ?  .yellow : .off
    }
    
}
