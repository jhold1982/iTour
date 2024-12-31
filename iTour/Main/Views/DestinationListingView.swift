//
//  DestinationListingView.swift
//  iTour
//
//  Created by Justin Hold on 12/31/24.
//

import SwiftData
import SwiftUI

struct DestinationListingView: View {
	
	// MARK: - Properties
	@Environment(\.modelContext) var modelContext
	@Query(
		sort: [
			SortDescriptor(\Destination.priority, order: .reverse),
			SortDescriptor(\Destination.name)
		]
	) var destinations: [Destination]

	// MARK: - View Body
	var body: some View {
		List {
			ForEach(destinations) { destination in
				NavigationLink(value: destination) {
					VStack(alignment: .leading) {
						Text(destination.name)
							.font(.headline)

						Text(destination.date.formatted(date: .long, time: .shortened))
					}
				}
			}
			.onDelete(perform: deleteDestinations)
		}
	}

	init(sort: [SortDescriptor<Destination>], searchString: String, minimumDate: Date) {
		_destinations = Query(filter: #Predicate {
			if searchString.isEmpty {
				return $0.date > minimumDate
			} else {
				return $0.date > minimumDate && ($0.name.localizedStandardContains(searchString) || $0.sights.contains { $0.name.localizedStandardContains(searchString) })
			}
		}, sort: sort)
	}

	func deleteDestinations(_ indexSet: IndexSet) {
		for index in indexSet {
			let destination = destinations[index]
			modelContext.delete(destination)
		}
	}
}

#Preview {
	DestinationListingView(sort: [SortDescriptor(\Destination.name)], searchString: "", minimumDate: .distantPast)
}
