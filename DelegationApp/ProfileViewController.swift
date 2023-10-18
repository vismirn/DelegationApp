//
//  ProfileViewController.swift
//  DelegationApp
//
//  Created by Alexey Efimov on 28.04.2023.
//


// +1. Определить кто будет директором, кто будет передавать ответственность. +
// +2. Нужно создать протокол для директора.
// +3. Наполнить протокол правилами для взаимодействия с другим экраном. (Создать методы, и вычесляемые свойства внутри протокола)
// +4. Создаем у директора ссылку на протокол. (Не инициализированое свойство)
// +5. Нужно определить эвент у директора по которому мы будем заставлять работника что то сделать.
// 6. Подписать под протокол нашего сотрудника. И реализовать методы этого протокола.
// 7. Инициализировать свойство delegate.

import UIKit

protocol ProfileViewControllerDelegate: AnyObject {
	func setGreeting(for user: User)
    func getColor(for color: UIColor)
}

final class ProfileViewController: UIViewController { //  Директор
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    
	weak var delegate: ProfileViewControllerDelegate!
	
    private var user = User(name: "", surname: "")
    private var color = UIColor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		nameTextField.delegate = self
		surnameTextField.delegate = self
    }
    
    @IBAction func saveAction() {
		delegate.setGreeting(for: user)
        delegate.getColor(for: color)
        dismiss(animated: true)
    }
    
    @IBAction func cancelAction() {
        dismiss(animated: true)
    }
}

extension ProfileViewController: UITextFieldDelegate {
	func textFieldDidEndEditing(_ textField: UITextField) {
		if textField == nameTextField {
			user.name = textField.text ?? ""
		} else {
			user.surname = textField.text ?? ""
		}
		
		print(user)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
	}
}
