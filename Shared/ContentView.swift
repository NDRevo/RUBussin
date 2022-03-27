//
//  ContentView.swift
//  Shared
//
//  Created by Noé Duran on 2/17/22.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    var body: some View {
        TabView {
            BussesMapView()
                .tabItem {
                    Image(systemName: "bus.fill")
                    Text("Busses")
                }
            BusListView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Bus List")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
