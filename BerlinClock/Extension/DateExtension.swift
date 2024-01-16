//
//  DateExtension.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 16/01/24.
//

import Foundation

extension Date {
    
    func getTimeComponents() -> (hours: Int, minutes: Int, seconds: Int) {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.hour, .minute, .second], from: self)
        
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0
        let seconds = components.second ?? 0
        
        return (hours, minutes, seconds)
    }
}
