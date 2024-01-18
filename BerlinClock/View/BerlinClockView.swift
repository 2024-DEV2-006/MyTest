//
//  BerlinClockView.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 16/01/24.
//

import SwiftUI

enum Lamp: String{
   case off = "O"
   case yellow = "Y"
   case red = "R"
    
    var color: Color {
        switch self {
        case .off:
            return .gray
        case .yellow:
            return .yellow
        case .red:
            return .red
        }
    }
}

struct BerlinClockView: View {
    @ObservedObject var viewModel = BerlinClockViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                BerlinClockLampsView(berlinClockLamps: viewModel.berlinClockLamps)
                    .frame(width: 150, height: 200)
                
                DigitalClockView(digitalTime: viewModel.digitalTime)
            }.onAppear {
                viewModel.startTimer()
            }
            .onDisappear {
                viewModel.stopTimer()
            }
            .padding()
            .navigationTitle("Berlin Clock")
        }
    }
}

struct BerlinClockView_Previews: PreviewProvider {
    static var previews: some View {
        BerlinClockView()
    }
}
