//
//  SelfSizingTableViewController.swift
//  AutoLayoutExample
//
//  Created by Felipe Lobo on 16/08/16.
//  Copyright © 2016 CopyIsRight. All rights reserved.
//

import UIKit

class SelfSizingTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.rowHeight = UITableViewAutomaticDimension
		self.tableView.estimatedRowHeight = 60
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2000
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DefaultId", forIndexPath: indexPath)
		
		let string = NSMutableString(string: "Foo")
		let max = arc4random() % 30
		
		for _ in 0...max {
			string.appendString(" foo")
		}
		
		cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = string as String
		cell.textLabel?.textColor = UIColor(red		: (CGFloat)(arc4random() % 255) / 255,
		                                    green	: (CGFloat)(arc4random() % 255) / 255,
		                                    blue	: (CGFloat)(arc4random() % 255) / 255,
		                                    alpha	: 1.0)

        return cell
    }

}
