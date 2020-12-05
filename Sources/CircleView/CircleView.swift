//
// Copyright (c) 2020 Truls Benjamin Larsen
// MIT License, see README.md
//

import UIKit

public class CircleView: UIView {
	public var lineWidth: CGFloat = 0
	public var lineColor: UIColor = .label
	public var fillColor: UIColor = .black
	public var shouldFill = false
	public var circle: Circle = .zero {
		didSet {
			self.frame = CGRect(x: circle.x, y: circle.y, width: circle.diameter, height: circle.diameter)
		}
	}

	/// A view containing a circle
	///
	///	The circle will be contained inside a square view with a width and height equal to the circle's diameter.
	/// The frame of the view should not be manipulated directly. Instead the changes should be performed on the view's
	/// circle-property.
	///
	/// Note: When working with constraints you can set _either_ width or height. Please note that setting
	/// different constraints for height and width will not be respected the CircleView is not designed to be an oval.
	/// For legibility you can use the CircleView's `diameterAnchor` (spoiler: It's actually just the `widthAnchor`).
	///
	/// - Parameter circle: The definition of the view's circle.
	/// - Parameter lineWidth: The line width of the outer path of the circle.
	/// - Parameter lineColor: The color used for the outer path of the circle. The default value is `UIColor.label`.
	/// - Parameter fillColor: The color used to fill the circle. The default value is `UIColor.label`.
	/// - Parameter filled: Defines whether the circle should be filled or not. The default value is `true`.
	
	public init(circle: Circle, lineWidth: CGFloat = 1, lineColor: UIColor = .label, fillColor: UIColor = .label, filled: Bool = true) {
		let frame = CGRect(x: circle.x, y: circle.y, width: circle.diameter, height: circle.diameter)
		super.init(frame: frame)
		setup()

		self.lineWidth = lineWidth
		self.lineColor = lineColor
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

	public override func draw(_ rect: CGRect) {
		let inset = lineWidth/2
		let rect = rect.insetBy(dx: inset, dy: inset)
		let path = UIBezierPath(ovalIn: rect)
		lineColor.setStroke()
		fillColor.setFill()
		path.lineWidth = lineWidth
		path.stroke()
		if shouldFill { path.fill() }
	}

	private func setup() {
		backgroundColor = .clear
		let squareConstraint: NSLayoutConstraint = widthAnchor.constraint(equalTo: heightAnchor)
		squareConstraint.priority = .required
		squareConstraint.isActive = true
	}
}


extension CircleView {
	/// A layout anchor representing the diameter of the view’s circle.
	///
	/// This is actually just the `widthAnchor` but added for readability in the constraint-code. Use this
	/// anchor to create constraints with the view’s diameter. You can combine this anchor only with other
	/// NSLayoutDimension anchors. For more information, see NSLayoutAnchor.
	public var diameterAnchor: NSLayoutDimension {
		widthAnchor
	}
}

