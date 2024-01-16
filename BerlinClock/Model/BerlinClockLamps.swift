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
}

struct BerlinClockLamps {
    var seconds: Lamp
}
