//
//  UIViewController.swift
//  manito
//
//  Created by 우진 on 2023/07/19.
//

import Foundation
import UIKit

extension UIViewController {
    
    // 키보드 올라오고 내려갈때 전체 뷰를 키보드 높이 만큼 올렸다 내림
    func setKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(UIViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object:nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if self.view.window?.frame.origin.y == 0 {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height
                UIView.animate(withDuration: 1) {
                    self.view.window?.frame.origin.y -= keyboardHeight
                }
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.window?.frame.origin.y != 0 {
            if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                    let keyboardRectangle = keyboardFrame.cgRectValue
                    let keyboardHeight = keyboardRectangle.height
                UIView.animate(withDuration: 1) {
                    self.view.window?.frame.origin.y += keyboardHeight
                }
            }
        }
    }
}

extension UIViewController {
    
    // Email validation function
    func isValidEmailFormat(emails: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"

        let emailArray = emails.components(separatedBy: ",")
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)

        for email in emailArray {
            let trimmedEmail = email.trimmingCharacters(in: .whitespaces)
            if !emailPredicate.evaluate(with: trimmedEmail) {
                return false
            }
        }

        return true
    }
    
    // Name and Email length validation function
    func areListLengthsEqual(list1: String, list2: String) -> Bool {
        let list1Array = list1.components(separatedBy: ",")
        let list2Array = list2.components(separatedBy: ",")

        return list1Array.count == list2Array.count
    }
    
    // Check text field is empty
    func isTextFieldEmpty(textField: UITextField) -> Bool {
        if let text = textField.text, !text.isEmpty {
            // Text field is not empty
            return false
        } else {
            // Text field is empty
            return true
        }
    }
    
    // 참여자가 3명 이상인지 확인
    func hasMoreThanThreeEmails(emails: String) -> Bool {
        let emailArray = emails.components(separatedBy: ",")
        return emailArray.count > 3
    }
    
    // Alert을 띄우는 함수
    func showAlert(title: String, message: String, viewController: UIViewController) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
    
}
