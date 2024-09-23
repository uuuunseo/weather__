import SwiftUI

struct HourlyTempView: View {
    let tempList: [Double]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(tempList, id: \.self) { temp in
                    hourlyTempItem(temp: temp)
                }
            }
            .padding(.vertical, 8)
        }
        .padding(.horizontal, 16)
        .background(Color.gray)
    }

    @ViewBuilder
    func hourlyTempItem(
        temp: Double
    ) -> some View {
        VStack(spacing: 4) {
            Text("\(String(format: "%.f", temp))°")
        }
        .padding(.horizontal, 4)
    }
}
