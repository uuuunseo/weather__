import SwiftUI

struct CloudsView: View {
    let clouds: Int

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("구름")

                Spacer()
                
                Text("\(clouds)%")
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .foregroundColor(.white)

            Spacer()
        }
        .background(Color.blue)
    }
}
