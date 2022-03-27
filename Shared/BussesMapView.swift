//
//  BussesMapView.swift
//  RUBussin
//
//  Created by Noé Duran on 3/27/22.
//

import SwiftUI
import MapKit

struct BussesMapView: View {

    var busList: [RUBBus] = [RUBBus(id: 1, busName: "Bob", busLocation: CLLocationCoordinate2D(latitude: 40.50467, longitude: -74.452621))]
    
    @State var coordinateRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.504663, longitude: -74.452611),
        latitudinalMeters: 4000,
        longitudinalMeters: 4000)

    var body: some View {
        NavigationView{
            Map(coordinateRegion: $coordinateRegion, annotationItems: busList) { bus in
                MapAnnotation(coordinate: bus.busLocation) {
                    Circle()
                        .foregroundColor(.red)
                        .frame(width: 20, height: 20, alignment: .center)
                }
            }
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
