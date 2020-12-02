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

	convenience init(circle: Circle, lineWidth: CGFloat = 1, strokeColor: UIColor = .black, fillColor: UIColor = .black, filled: Bool = true) {
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
