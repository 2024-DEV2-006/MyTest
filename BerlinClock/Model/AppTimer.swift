//
//  AppTimer.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 18/01/24.
//

import Foundation

protocol AppTimerProtocol {
    func startTimer(secondChangeCallback: @escaping (Date) -> Void)
    func stopTimer()
}
class AppTimer: AppTimerProtocol{
    
    private var timer: Timer?
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func startTimer(secondChangeCallback: @escaping (Date) -> Void) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            secondChangeCallback(Date())
        }
    }
}
