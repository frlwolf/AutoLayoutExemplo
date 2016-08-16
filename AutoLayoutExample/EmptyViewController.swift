//
//  EmptyViewController.swift
//  AutoLayoutExample
//
//  Created by Felipe Lobo on 16/08/16.
//  Copyright © 2016 CopyIsRight. All rights reserved.
//

import UIKit

class EmptyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.text = "Magnífico Topo"
		label.backgroundColor = UIColor.blueColor()
		label.textColor = UIColor.lightTextColor()
		label.font = UIFont.systemFontOfSize(30)
		
		self.view.addSubview(label)
		
		self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[label]|",
			options: .AlignAllLeading, metrics: nil, views: ["label": label]))

		let guide = self.topLayoutGuide
		let topConstraint = label.topAnchor.constraintEqualToAnchor(guide.bottomAnchor)
		topConstraint.constant = self.view.layoutMargins.top
		topConstraint.active = true
		
//		self.view.addConstraint(
//			NSLayoutConstraint(
//				item: label,
//				attribute: .Leading,
//				relatedBy: .Equal,
//				toItem: self.view, 
//				attribute: .Leading,
//				multiplier: 1,
//				constant: 0
//			)
//		)
//		
//		self.view.addConstraint(
//			NSLayoutConstraint(
//				item: label,
//				attribute: .Trailing,
//				relatedBy: .Equal,
//				toItem: self.view,
//				attribute: .Trailing,
//				multiplier: 1,
//				constant: 0
//			)
//		)
//		
//		self.view.addConstraint(
//			NSLayoutConstraint(
//				item: label,
//				attribute: .Top,
//				relatedBy: .Equal,
//				toItem: self.topLayoutGuide,
//				attribute: .Bottom,
//				multiplier: 1,
//				constant: self.view.layoutMargins.top
//			)
//		)
    }
	
	override func shouldAutorotate() -> Bool {
		return true
	}
	
	override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
		return .All
	}
}
