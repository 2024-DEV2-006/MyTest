//
//  BerlinClockLampsView.swift
//  BerlinClock
//
//  Created by 2024-DEV2-006 on 18/01/24.
//

import SwiftUI

struct BerlinClockLampsView: View {
    
     var berlinClockLamps: BerlinClockLamps

    var body: some View {
            VStack(spacing: 8) {
                SecondsLampView(lamp: berlinClockLamps.seconds)
                
                HStack {
                    ForEach(berlinClockLamps.fiveHours, id: \.self) { lamp in
                        LampView(lamp: lamp)
                    }
                }
                HStack {
                    ForEach(berlinClockLamps.oneHours, id: \.self) { lamp in
                        LampView(lamp: lamp)
                    }
                }
                HStack {
                    ForEach(berlinClockLamps.fiveMinutes, id: \.self) { lamp in
                        FiveMinuteLampView(lamp: lamp)
                    }
                }
                HStack {
                    ForEach(berlinClockLamps.oneMinutes, id: \.self) { lamp in
                        LampView(lamp: lamp)
                    }
                }
            }.padding()
             .cornerRadius(10)
             .background(.blue.opacity(0.1))
             .foregroundColor(.white)
       }
}

struct BerlinClockLampsView_Previews: PreviewProvider {
    static var previews: some View {
        BerlinClockLampsView(berlinClockLamps: BerlinClockLamps(seconds: .off, oneMinutes: [.off, .off, .off, .off], fiveMinutes: [.off, .off, .off, .off, .off, .off, .off, .off, .off, .off, .off], oneHours: [.off, .off, .off, .off], fiveHours: [.off, .off, .off, .off]))
    }
}
