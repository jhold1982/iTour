//
//  SightsView.swift
//  iTour
//
//  Created by Justin Hold on 12/31/24.
//

import SwiftData
import SwiftUI

struct SightsView: View {
	
	// MARK: - Properties
	@Query(sort: \Sight.name) var sights: [Sight]

	
	
	// MARK: - View Body
	var body: some View {
		
		NavigationStack {
			List(sights) { sight in
				NavigationLink(value: sight.destination) {
					Text(sight.name)
				}
			}
			.navigationTitle("Sights")
			.navigationDestination(for: Destination.self, destination: EditDestinationView.init)
		}
	}
}

#Preview {
	SightsView()
}
