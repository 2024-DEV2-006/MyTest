//
//  BerlinClockLamps.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 16/01/24.
//

import Foundation

enum Lamp: String{
   case off = "O"
   case yellow = "Y"
   case red = "R"
}

struct BerlinClockLamps {
    var seconds: Lamp = .off
    var oneMinutes: [Lamp] = Array(repeating: .off, count: AppConstants.numberOfOneMinuteLamp)
    var fiveMinutes: [Lamp] = Array(repeating: .off, count: AppConstants.numberOfFiveMinuteLamp)
    var oneHours: [Lamp] = Array(repeating: .off, count: AppConstants.numberOfOneHourLamp)
    var fiveHours: [Lamp] = Array(repeating: .off, count: AppConstants.numberOfFiveHourLamp)
}
