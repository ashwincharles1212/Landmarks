//
//  SwiftUIView.swift
//  Landmarks
//
//  Created by Ashwin Charles on 11/3/24.
//

import SwiftUI
import MapKit


struct MapView: View {
    var body: some View {
        Map(initialPosition: .region(region))
    }


    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.6624, longitude: -121.8747),
                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }
}


#Preview {
    MapView()
}

