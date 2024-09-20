import SwiftUI

struct HourlyTempView: View {
    let tempList: [Int]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(tempList, id: \.self) { temp in
                    hourlyTempItem(temp: temp)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
        .background(Color.gray)
    }

    @ViewBuilder
    func hourlyTempItem(
        temp: Int
    ) -> some View {
        VStack(spacing: 4) {
            Text("\(temp)°")
        }
        .padding(.horizontal, 4)
    }
}
