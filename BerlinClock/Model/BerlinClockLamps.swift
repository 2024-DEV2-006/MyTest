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
    var seconds: Lamp
    var oneMinutes: [Lamp]
    var fiveMinutes: [Lamp]
    var oneHours: [Lamp]

}
