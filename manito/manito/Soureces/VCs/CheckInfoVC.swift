//
//  CheckInfoVC.swift
//  manito
//
//  Created by 우진 on 2023/07/21.
//

import UIKit

class CheckInfoVC: UIViewController {
    
    var meetingName: String?
    var emailData: String!
    var nameData: String!
    var publicDate: Date?
    var giftAmount: String?
    var nameList:[String] {
        // string을 ',' 기준으로 나눠 리스트로 만들고, 각 요소의 앞뒤 공백을 지움
        return nameData?.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces) } ?? []
    }
    var emailList:[String] {
        return emailData?.components(separatedBy: ",").map { $0.trimmingCharacters(in: .whitespaces) } ?? []
    }
    

    // IBOutlet
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoStackView: UIStackView!
    @IBOutlet weak var publicDatePicker: UIDatePicker!
    @IBOutlet weak var giftAmountTextField: PaddingTextField!
    
    // IBAction
    @IBAction func editButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        
        // infoView 테두리 세팅
        infoView?.layer.cornerRadius = 5
        infoView?.layer.borderWidth = 1
        infoView?.layer.borderColor = UIColor(rgb: 0xE5DEDF).cgColor
        
        // infoStackView 내용물 세팅
        for i in nameList.indices {
            // 이름, 이메일 포함된 stack view를 만들어서 infoStackView에 추가
            let personInfo:UIStackView = makePersonInfoStack(index: i, name: nameList[i], email: emailList[i])
            infoStackView.addArrangedSubview(personInfo)
        }
        
        // DatePicker 중앙으로 정렬
        publicDatePicker.contentHorizontalAlignment = .center
        
        // 공개 날짜 세팅
        publicDatePicker.date = publicDate!
        
        // 선물 금액 세팅
        // 3자리 마다 ','를 붙임
        let numberString = giftAmount!
        // Create a NumberFormatter instance
        let numberFormatter = NumberFormatter()

        // Set the number style to decimal
        numberFormatter.numberStyle = .decimal

        // Convert the string to a number (NSNumber)
        if let number = numberFormatter.number(from: numberString) {
            // Convert the number back to a formatted string with commas
            if let formattedString = numberFormatter.string(from: number) {
                print(formattedString) // Output: "1,000,000"
                giftAmountTextField.text = formattedString + " 원"
            }
        }
    }
    

}


extension CheckInfoVC {
    
    private func makePersonInfoStack(index: Int, name: String, email: String) -> UIStackView {
        // Create two UILabel instances
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.textAlignment = .center

        let emailLabel = UILabel()
        emailLabel.text = email
        emailLabel.textAlignment = .center
        emailLabel.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal) // stack view에서 차지하는 공간 우선순위 설정
        
        // Create a width constraint for the label
        let widthConstraint = NSLayoutConstraint(
            item: nameLabel,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: 100.0
        )
        
        // Add the width constraint to the label
        nameLabel.addConstraint(widthConstraint)
        

        // Create the UIStackView
        let stackView = UIStackView()
        
        // Set the axis of the UIStackView to horizontal
        stackView.axis = .horizontal
        stackView.distribution = .fill
        
        if index%2 == 1 {
            // 홀수 번째의 스택은 배경색을 바꾸고 코너를 둥글게 함
            stackView.backgroundColor = UIColor(rgb: 0xF1E8DD)
            stackView.layer.cornerRadius = 5
        }
        
        // Add the UILabels to the UIStackView
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(emailLabel)
        
        // Create a height constraint for the stack view
        let stackViewHeightConstraint = NSLayoutConstraint(
            item: stackView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: 40.0
        )
            
        // Add the height constraint to the stack view
        stackView.addConstraint(stackViewHeightConstraint)

        return stackView
    }
    
}
