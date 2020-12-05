//
// Copyright (c) 2020 Truls Benjamin Larsen
// MIT License, see README.md
//

import CoreGraphics

/// A structure that contains the location and diameter of a circle.
public struct Circle {
	var x: CGFloat
	var y: CGFloat
	var diameter: CGFloat

	var origin: CGPoint {
		set {
			x = newValue.x
			y = newValue.y
		}

		get {
			CGPoint(x: x, y: y)
		}
	}
	
	public init(x: CGFloat = 0, y: CGFloat = 0, diameter: CGFloat) {
		self.x = x
		self.y = y
		self.diameter = diameter
	}
}

public extension Circle {
	static let zero = Circle(diameter: 0)
}
