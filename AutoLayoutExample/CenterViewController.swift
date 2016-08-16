//
//  CenterViewController.swift
//  AutoLayoutExample
//
//  Created by Felipe Lobo on 16/08/16.
//  Copyright © 2016 CopyIsRight. All rights reserved.
//

import UIKit

class CenterViewController: UIViewController {

	var _squares : NSMutableArray?
	
    override func viewDidLoad() {
        super.viewDidLoad()

		_squares = NSMutableArray(capacity: 5)
		
		var lastSquare : UIView?
		
		for _ in 0...3 {
			let square = createSquare()
			
			if lastSquare != nil {
				self.view.addConstraint(
					NSLayoutConstraint(
						item		: square,
						attribute	: .Top,
						relatedBy	: .Equal,
						toItem		: lastSquare!,
						attribute	: .Bottom,
						multiplier	: 1.0,
						constant	: 20
					)
				)
			}
			
			lastSquare = square
			
			_squares!.addObject(square)
		}
		
		let stepper = UIStepper();
		stepper.value = 4.0
		stepper.tintColor = UIColor.whiteColor()
		stepper.addTarget(self, action: #selector(CenterViewController.stepperValueChanged(_:)), forControlEvents: .ValueChanged)
		
		self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: stepper)
    }
	
	func createSquare() -> UIView {
		let square = UIView()
		square.translatesAutoresizingMaskIntoConstraints = false
		square.backgroundColor = UIColor(red	: (CGFloat)(arc4random() % 255) / 255,
		                                 green	: (CGFloat)(arc4random() % 255) / 255,
		                                 blue	: (CGFloat)(arc4random() % 255) / 255,
		                                 alpha	: 1.0)
		
		self.view.addSubview(square)
		
		self.view.addConstraint(
			NSLayoutConstraint(
				item		: square,
				attribute	: .CenterX,
				relatedBy	: .Equal,
				toItem		: self.view,
				attribute	: .CenterX,
				multiplier	: 1.0,
				constant	: 0
			)
		)
		
		self.view.addConstraint(
			NSLayoutConstraint(
				item		: square,
				attribute	: .Height,
				relatedBy	: .Equal,
				toItem		: nil,
				attribute	: .NotAnAttribute,
				multiplier	: 1.0,
				constant	: 44.0
			)
		)
		
		self.view.addConstraint(
			NSLayoutConstraint(
				item		: square,
				attribute	: .Height,
				relatedBy	: .Equal,
				toItem		: square,
				attribute	: .Width,
				multiplier	: 1.0,
				constant	: 0
			)
		)
		
		let centerConstraint = NSLayoutConstraint(
			item		: square,
			attribute	: .CenterY,
			relatedBy	: .Equal,
			toItem		: self.view,
			attribute	: .CenterY,
			multiplier	: 1.0,
			constant	: 0
		)
		
		centerConstraint.priority = UILayoutPriorityDefaultHigh
		
		self.view.addConstraint(centerConstraint)
		
		return square
	}
	
	func stepperValueChanged(stepper: UIStepper) {
		if Int(stepper.value) > _squares!.count {
			addSquare()
		} else {
			removeLastSquare()
		}
	}
	
	func removeLastSquare() {
		let lastSquare = _squares!.lastObject as? UIView
		
		_squares!.removeLastObject()
		
		let square = _squares!.lastObject
		
		if square != nil {
			for constraint in NSArray(array: square!.constraints) {
				if constraint.secondItem as? UIView == lastSquare {
					square?.removeConstraint(constraint as! NSLayoutConstraint)
				}
			}
		}
		
		lastSquare?.removeFromSuperview()
		
		UIView.animateWithDuration(0.2) {
			self.view.layoutSubviews()
		}
	}
	
	func addSquare() {
		let square = createSquare()
		let lastSquare = _squares!.lastObject
		
		if lastSquare != nil {
			self.view.addConstraint(
				NSLayoutConstraint(
					item		: square,
					attribute	: .Top,
					relatedBy	: .Equal,
					toItem		: lastSquare!,
					attribute	: .Bottom,
					multiplier	: 1.0,
					constant	: 20
				)
			)
		}
		
		_squares!.addObject(square)
		
		UIView.animateWithDuration(0.2) {
			self.view.layoutSubviews()
		}
	}
}
