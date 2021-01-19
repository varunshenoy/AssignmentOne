//
//  MapView.swift
//  Assignment One
//
//  Created by Varun Shenoy on 1/18/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 37.424107,
            longitude: -122.166077
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.1,
            longitudeDelta: 0.1
        )
    )

    var body: some View {
        VStack {
            Text("Local Testing Center").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Map(coordinateRegion: $region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: nil,
                annotationItems: [PinItem(coordinate: .init(latitude: 37.424107, longitude: -122.166077))]) { item in
                MapMarker(coordinate: item.coordinate)
            }.cornerRadius(15).padding()
        }.padding()
    }
}

struct PinItem: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
