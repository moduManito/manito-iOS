//
//  InputMailInfoVC.swift
//  manito
//
//  Created by 우진 on 2023/07/18.
//

import UIKit

class InputMailInfoVC: UIViewController {

    // IBOutlet
    @IBOutlet weak var meetingNameTextField: PaddingTextField!
    @IBOutlet weak var emailDataTextField: PaddingTextField!
    @IBOutlet weak var nameDataTextField: PaddingTextField!
    @IBOutlet weak var publicDatePicker: UIDatePicker!
    @IBOutlet weak var giftAmountTextField: PaddingTextField!
    
    // IBAction
    @IBAction func nextButton(_ sender: UIButton) {
        // 입력에 대한 유효성 검사
        if isTextFieldEmpty(textField: meetingNameTextField) {
            showAlert(title: "알림", message: "모임명이 입력되지 않았습니다.", viewController: self)
        } else if isTextFieldEmpty(textField: emailDataTextField){
            showAlert(title: "알림", message: "참가자의 메일이 입력되지 않았습니다.", viewController: self)
        } else if isTextFieldEmpty(textField: nameDataTextField){
            showAlert(title: "알림", message: "참가자의 이름이 입력되지 않았습니다.", viewController: self)
        } else if isTextFieldEmpty(textField: giftAmountTextField){
            showAlert(title: "알림", message: "선물 금액이 입력되지 않았습니다.", viewController: self)
        } else if !isValidEmailFormat(emails: emailDataTextField.text!) {
            showAlert(title: "알림", message: "형식이 유효하지 않은 이메일 주소가 있습니다.", viewController: self)
        } else if !areListLengthsEqual(list1: nameDataTextField.text!, list2: emailDataTextField.text!) {
            showAlert(title: "알림", message: "참가자의 이메일과 이름의 개수가 맞지 않습니다.", viewController: self)
        } else if !hasMoreThanThreeEmails(emails: emailDataTextField.text!) {
            showAlert(title: "알림", message: "참가자가 3명 이상이어야 합니다.", viewController: self)
        } else {
            performSegue(withIdentifier: "ShowCheckInfo", sender: sender)
        }
        
        view.endEditing(true) // 다음 버튼 누르면 키보드 내림
    }
    
    @IBAction func tapBackgroundView(_ sender: Any) {
        // 배경 터치시 키보드 내리게 함
        view.endEditing(true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setKeyboardObserver() // 키보드 올라오고 내려갈때 전체 뷰를 키보드 높이 만큼 올렸다 내림
    }
    
    private func updateUI() {
        // DatePicker 중앙으로 정렬
        publicDatePicker.contentHorizontalAlignment = .center
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ShowCheckInfo" {
                // Get a reference to the destination view controller
                if let destinationVC = segue.destination as? CheckInfoVC {
                    // Pass the information to the destination view controller
                    destinationVC.meetingName = meetingNameTextField.text
                    destinationVC.emailData = emailDataTextField.text
                    destinationVC.nameData = nameDataTextField.text
                    destinationVC.publicDate = publicDatePicker.date
                    destinationVC.giftAmount = giftAmountTextField.text
                }
            }
        }
    
}
