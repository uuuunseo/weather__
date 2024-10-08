import SwiftUI

struct HumidityView: View {
    let humidity: Int

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("습도")

                Spacer()
                
                Text("\(humidity)%")
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .foregroundColor(.white)

            Spacer()
        }
        .background(Color.blue)
    }
}
