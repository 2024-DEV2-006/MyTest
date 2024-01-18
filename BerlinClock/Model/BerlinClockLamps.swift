//
//  BerlinClockLamps.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 16/01/24.
//

import Foundation

struct BerlinClockLamps: Equatable {
    let seconds: Lamp
    let oneMinutes: [Lamp]
    let fiveMinutes: [Lamp]
    let oneHours: [Lamp]
    let fiveHours: [Lamp]
    
    static var emptyclock: BerlinClockLamps {
        BerlinClockLamps (seconds: .off,
                          oneMinutes: Array(repeating:.off, count: AppConstants .numberOfOneMinuteLamp),
                          fiveMinutes: Array (repeating: .off, count: AppConstants.numberOfFiveMinuteLamp),
                          oneHours: Array (repeating: .off, count: AppConstants.numberOfOneHourLamp),
                          fiveHours: Array (repeating: .off, count: AppConstants .numberOfFiveHourLamp))
    }
}
