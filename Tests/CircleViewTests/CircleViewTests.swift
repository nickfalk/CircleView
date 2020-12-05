import XCTest
@testable import CircleView

final class CircleViewTests: XCTestCase {
    func testViewInit() {
		let zeroView = CircleView(circle: .zero)
		XCTAssertEqual(zeroView.lineWidth, 1)
		XCTAssertTrue(zeroView.shouldFill)
		XCTAssertEqual(zeroView.frame, .zero)
		
		let circleView = CircleView(circle: Circle(x: 100, y: 50, diameter: 44), lineWidth: 5, filled: false)
		XCTAssertEqual(circleView.lineWidth, 5)
		XCTAssertFalse(circleView.shouldFill)
		XCTAssertEqual(circleView.frame.origin.x, 100)
		XCTAssertEqual(circleView.frame.origin.y, 50)
		XCTAssertEqual(circleView.frame.size.width, 44)
		XCTAssertEqual(circleView.frame.size.height, 44)
    }
	
	func testCircleInit() {
		let zeroCircle = Circle.zero
		XCTAssertEqual(zeroCircle.diameter, 0)
		XCTAssertEqual(zeroCircle.x, 0)
		XCTAssertEqual(zeroCircle.y, 0)
		XCTAssertEqual(zeroCircle.origin.x, 0)
		XCTAssertEqual(zeroCircle.origin.y, 0)
		
		let noOriginCircle = Circle(diameter: 44)
		XCTAssertEqual(noOriginCircle.diameter, 44)
		XCTAssertEqual(noOriginCircle.x, 0)
		XCTAssertEqual(noOriginCircle.y, 0)
		XCTAssertEqual(noOriginCircle.origin.x, 0)
		XCTAssertEqual(noOriginCircle.origin.y, 0)
		
		let circle = Circle(x: 100, y: 50, diameter: 44)
		XCTAssertEqual(circle.diameter, 44)
		XCTAssertEqual(circle.x, 100)
		XCTAssertEqual(circle.y, 50)
		XCTAssertEqual(circle.origin.x, 100)
		XCTAssertEqual(circle.origin.y, 50)
	}
	
	func testAlterations() {
		let zeroView = CircleView(circle: .zero)
		XCTAssertEqual(zeroView.lineWidth, 1)
		XCTAssertTrue(zeroView.shouldFill)
		XCTAssertEqual(zeroView.frame, .zero)
		
		zeroView.circle.diameter = 44
		XCTAssertEqual(zeroView.frame.size.width, 44)
		XCTAssertEqual(zeroView.frame.size.height, 44)
		
		zeroView.circle.origin = CGPoint(x: 100, y: 50)
		XCTAssertEqual(zeroView.frame.origin.x, 100)
		XCTAssertEqual(zeroView.frame.origin.y, 50)
	}

    static var allTests = [
        ("testViewInit", testViewInit),
		("testCircleInit", testCircleInit),
		("testAlterations", testAlterations)
    ]
}
