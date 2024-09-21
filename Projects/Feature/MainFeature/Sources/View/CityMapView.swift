import SwiftUI
import MapKit

struct CityMapView: View {
    @Binding var location: Location

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("위치")

            MapView(location: $location)
                .frame(height: 300)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(Color.green)
    }
}
