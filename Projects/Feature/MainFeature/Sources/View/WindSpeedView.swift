import SwiftUI

struct WindSpeedView: View {
    let windSpeed: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("바람 속도")

                Spacer()
                
                Text("\(windSpeed)m/s")
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .foregroundColor(.white)

            Spacer()
        }
        .background(Color.blue)
    }
}
