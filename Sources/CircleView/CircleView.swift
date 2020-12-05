import UIKit

class CircleView: UIView {
	var lineWidth: CGFloat = 0
	var strokeColor: UIColor = .black
	var fillColor: UIColor = .black
	var shouldFill = false
	var circle: Circle = .zero {
		didSet {
			self.frame = CGRect(x: circle.x, y: circle.y, width: circle.diameter, height: circle.diameter)
		}
		
	}

	/// A view containing a circle
	///
	///	The circle will be contained inside a square view with a width and height equal to the circle's diameter.
	/// The frame of the view should not be manipulated directly. Instead the changes should be performed on the view's
	/// circle-property.
	/// - Parameter circle: The definition of the view's circle.
	/// - Parameter lineWidth: The line width of the outer path of the circle.
	/// - Parameter strokeColor: The color used for the outer path of the circle. The default value is `UIColor.label`.
	/// - Parameter fillColor: The color used to fill the circle. The default value is `UIColor.label`.
	/// - Parameter filled: Defines whether the circle should be filled or not. The default value is `true`.
	
	init(circle: Circle, lineWidth: CGFloat = 1, strokeColor: UIColor = .label, fillColor: UIColor = .label, filled: Bool = true) {
		let frame = CGRect(x: circle.x, y: circle.y, width: circle.diameter, height: circle.diameter)
		self.init(frame: frame)
		setup()

		self.lineWidth = lineWidth
		self.strokeColor = strokeColor
		self.fillColor = fillColor
		self.shouldFill = filled
		self.circle = circle
	}

	private override init(frame: CGRect) {
		super.init(frame: frame)
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	override func draw(_ rect: CGRect) {
		let inset = lineWidth/2
		let rect = rect.insetBy(dx: inset, dy: inset)
		let path = UIBezierPath(ovalIn: rect)
		strokeColor.setStroke()
		fillColor.setFill()
		path.lineWidth = lineWidth
		path.stroke()
		if shouldFill { path.fill() }
	}

	private func setup() {
		backgroundColor = .clear
	}
}
