//
//  ViewController.swift
//  DelegationApp
//
//  Created by Alexey Efimov on 28.04.2023.
//

import UIKit

final class GreetingViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		let navigationVC = segue.destination as? UINavigationController
		let profileVC = navigationVC?.topViewController as? ProfileViewController
		profileVC?.delegate = self
		
		let color = UIColor.red
		let ciColor = CIColor(color: color)
        ciColor.red
	}
	
	
}

extension GreetingViewController: ProfileViewControllerDelegate {
    func getColor(for color: UIColor) {
        view.backgroundColor = .red
    }
    
	func setGreeting(for user: User) {
		welcomeLabel.text = "Welcome, \(user.fullName)"
	}
}
