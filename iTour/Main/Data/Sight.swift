//
//  Sight.swift
//  iTour
//
//  Created by Justin Hold on 12/31/24.
//

import Foundation
import SwiftData

@Model
class Sight {
	
	var name: String
	var destination: Destination?

	init(name: String) {
		self.name = name
	}
}
