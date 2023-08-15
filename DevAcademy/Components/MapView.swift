//
//  MapView.swift
//  DevAcademy
//
//  Created by Jan Vaverka on 08.08.2023.
//

import MapKit
import SwiftUI

struct MapView: View {
    let coordinate: CLLocationCoordinate2D

    var body: some View {
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))), annotationItems: [IdentifiableCoordinate(coordinate)]) { location in
            MapMarker(coordinate: location.coordinate, tint: .red)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D())
    }
}
