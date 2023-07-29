//
//  MyMnitoDetailVC.swift
//  manito
//
//  Created by 우진 on 2023/07/29.
//

import UIKit

class MyMnitoDetailVC: UIViewController {
    
    let maroList:[String] = ["김길동", "이길동", "정길동", "장길동", "홍길동", "최길동", "하길동"]
    let manitoList:[String] = ["이길동", "홍길동", "정길동", "최길동", "김길동", "장길동", "하길동"]
    
    var visualEffectView: UIVisualEffectView?
    
    // IBOutlet
    @IBOutlet weak var infoView: UIView!
    @IBOutlet weak var infoStackView: UIStackView!
    @IBOutlet weak var secretLockImageView: UIImageView!
    @IBOutlet weak var okButton: UIButton!
    
    // IBAction
    @IBAction func okButton(_ sender: Any) {
        showAlert(title: "알림", message: "모든 참여자에게 확인 사실이 전달 됐습니다!", viewController: self)
        secretLockImageView.isHidden = true // 자물쇠 그림 숨김
        visualEffectView?.isHidden = true // 블러 효과 숨김
        okButton.isHidden = true // 확인하기 버튼 숨김
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
        for i in maroList.indices {
            // 마로 이름, 마니또 이름 포함된 stack view를 만들어서 infoStackView에 추가
            let personInfo:UIStackView = makePersonInfoStack(index: i, maroName: maroList[i], manitoName: manitoList[i])
            infoStackView.addArrangedSubview(personInfo)
        }
        
        // infoStackView에 블러 효과 적용
        applyBlurEffectToStackView(stackView: infoStackView)
        
    }

}

extension MyMnitoDetailVC {
    
    func applyBlurEffectToStackView(stackView: UIStackView) {
        let blurEffect = UIBlurEffect(style: .light) // You can choose the style according to your preference
        let newVisualEffectView = UIVisualEffectView(effect: blurEffect)
        
        // Set the visualEffectView's frame to cover the entire stackView
        newVisualEffectView.frame = stackView.bounds
        
        // If you want to preserve user interactions within the stackView, set the following property to false
        newVisualEffectView.isUserInteractionEnabled = false
        
        // Add the visualEffectView as a subview to the stackView
        stackView.addSubview(newVisualEffectView)
        
        // Make the visualEffectView fill the entire stackView using Auto Layout
        newVisualEffectView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newVisualEffectView.topAnchor.constraint(equalTo: stackView.topAnchor),
            newVisualEffectView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            newVisualEffectView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            newVisualEffectView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
        
        // Save the reference to the visualEffectView
        self.visualEffectView = newVisualEffectView
    }
    
    private func makePersonInfoStack(index: Int, maroName: String, manitoName: String) -> UIStackView {
        // Create two UILabel instances
        let nameLabel = UILabel()
        nameLabel.text = maroName
        nameLabel.textAlignment = .center

        let emailLabel = UILabel()
        emailLabel.text = manitoName
        emailLabel.textAlignment = .center
        
        
        // Create the UIStackView
        let stackView = UIStackView()
        
        // Set the axis of the UIStackView to horizontal
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
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
