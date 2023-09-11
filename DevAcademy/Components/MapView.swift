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
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))), annotationItems: [IdentifiableCoordinate(coordinate)]) { location in
            MapAnnotation(coordinate: location.coordinate) {
                PlaceMarker()
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(coordinate: CLLocationCoordinate2D(latitude: 40.748433, longitude: -73.985656))
    }
}
