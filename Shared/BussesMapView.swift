//
//  BussesMapView.swift
//  RUBussin
//
//  Created by Noé Duran on 3/27/22.
//

import SwiftUI
import MapKit

struct BussesMapView: View {

    @State var coordinateRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.504663, longitude: -74.452611),
        latitudinalMeters: 4000,
        longitudinalMeters: 4000)

    var body: some View {
        NavigationView{
            Map(coordinateRegion: $coordinateRegion)
                .navigationTitle("RU Bussin")
                .ignoresSafeArea()
        }
    }
}

struct BussesMapView_Previews: PreviewProvider {
    static var previews: some View {
        BussesMapView()
    }
}
