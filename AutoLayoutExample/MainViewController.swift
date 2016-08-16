//
//  ViewController.swift
//  AutoLayoutExample
//
//  Created by Felipe Lobo on 16/08/16.
//  Copyright © 2016 CopyIsRight. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
	
	let viewControllersIds = ["BlankId", "CenterId", "LoginId", "TableViewId"]
	let viewControllersTitles = ["#1 Vazio", "#2 Centralizado", "#3 Login", "#4 Table view"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Exemplo"
		
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewControllersIds.count;
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("DefaultId", forIndexPath: indexPath)
		
		cell.textLabel?.text = viewControllersTitles[indexPath.row]
		
		return cell
	}

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)
		
		self.performSegueWithIdentifier(viewControllersIds[indexPath.row], sender: tableView.cellForRowAtIndexPath(indexPath))
	}
	
	override func shouldAutorotate() -> Bool {
		return true
	}
	
	override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
		return .All
	}
}

