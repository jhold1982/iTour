//
//  iTourApp.swift
//  iTour
//
//  Created by Justin Hold on 12/31/24.
//

import SwiftData
import SwiftUI

@main
struct iTourApp: App {
	
	var body: some Scene {
		
		WindowGroup {
			TabView {
				
				ContentView()
					.tabItem {
						Label("Destinations", systemImage: "map")
					}

				SightsView()
					.tabItem {
						Label("Sights", systemImage: "mappin.and.ellipse")
					}
			}
		}
		.modelContainer(for: Destination.self)
	}
}
