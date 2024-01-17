//
//  BerlinClockView.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 16/01/24.
//

import SwiftUI

struct BerlinClockView: View {
    @ObservedObject var viewModel = BerlinClockViewModel()
    var body: some View {
        VStack {
            DigitalClockView(digitalTime: viewModel.digitalTime)
        }.onAppear {
            viewModel.startTimer()
        }
        .onDisappear {
            viewModel.stopTimer()
        }
        .padding()

    }
}

struct BerlinClockView_Previews: PreviewProvider {
    static var previews: some View {
        BerlinClockView()
    }
}
