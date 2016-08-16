//
//  LoginViewController.swift
//  AutoLayoutExample
//
//  Created by Felipe Lobo on 16/08/16.
//  Copyright © 2016 CopyIsRight. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

	var _showingKeyboard = false
	@IBOutlet var _loginField : UITextField?
	@IBOutlet var _passwordField : UITextField?
	@IBOutlet var _bottomConstraint : NSLayoutConstraint?
	
	override func awakeFromNib() {
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard(_:)))
		self.view.addGestureRecognizer(tapGestureRecognizer)

        // Do any additional setup after loading the view.
    }
	
	func dismissKeyboard(sender: UITapGestureRecognizer) {
		_loginField?.resignFirstResponder()
		_passwordField?.resignFirstResponder()
	}
	
	func keyboardWillShow(notification: NSNotification) {
		let userInfo = notification.userInfo
		
		_showingKeyboard = true
		
		let size = userInfo![UIKeyboardFrameBeginUserInfoKey]?.CGRectValue().size
		let duration = userInfo![UIKeyboardAnimationDurationUserInfoKey]?.doubleValue
		
		_bottomConstraint?.constant = size!.height
		
		UIView.animateWithDuration(duration!) {
			self.view.layoutSubviews()
		}
	}
	
	func keyboardWillHide(notification: NSNotification) {
		let userInfo = notification.userInfo
		
		_showingKeyboard = false
		
		let duration = userInfo![UIKeyboardAnimationDurationUserInfoKey]?.doubleValue
		
		_bottomConstraint?.constant = 15
		
		UIView.animateWithDuration(duration!) {
			self.view.layoutSubviews()
		}
	}
}
