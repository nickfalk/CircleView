import CoreGraphics

struct Circle {
	var x: CGFloat
	var y: CGFloat
	var diameter: CGFloat {
		didSet {
			width = diameter
			height = diameter
		}
	}
	private(set) var width: CGFloat = 0
	private(set) var height: CGFloat = 0

	var origin: CGPoint {
		set {
			x = newValue.x
			y = newValue.y
		}

		get {
			CGPoint(x: x, y: y)
		}
	}
}

extension Circle {
	static let zero: Circle = Circle(x: 0, y: 0, diameter: 0)
}
