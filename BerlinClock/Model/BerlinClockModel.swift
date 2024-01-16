//
//  BerlinClockModel.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 16/01/24.
//

import Foundation

struct BerlinClockModel {
    
    func convertToBerlinTime(_ time: String) -> String {
        
        let components = time.components(separatedBy: ":")
        guard components.count == 3, let seconds = Int(components[2]) else {
            return "Invalid time format"
        }
        
        return checkSecondsLamp(seconds:seconds)
    }
    
    func checkSecondsLamp(seconds: Int) -> String{
        ((seconds % 2) == 0) ? "Y" : "O"
    }
    
}
