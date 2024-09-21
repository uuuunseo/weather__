import SwiftUI

struct HumidityView: View {
    let humidity: Int

    var body: some View {
        VStack(alignment: .leading) {
            Text("습도")

            Spacer()

            Text("\(humidity)%")
        }
        .padding(.leading, 16)
        .foregroundColor(.white)
        .padding(.vertical, 16)
        .background(Color.blue)
    }
}
