//
//  LoginVC.swift
//  manito
//
//  Created by 우진 on 2023/07/16.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var mainImg1: UIImageView!
    @IBOutlet weak var mainImg2: UIImageView!
    @IBOutlet weak var mainImg3: UIImageView!
    @IBOutlet weak var mainImg4: UIImageView!
    @IBOutlet weak var mainImg5: UIImageView!
    @IBOutlet weak var mainImgLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 애니메이션 효과 적용
        animateFloatingImages()
    }

    @IBAction func LoginButton(_ sender: UIButton) {
        performSegue(withIdentifier: "ShowMain", sender: sender)
    }
    func animateFloatingImages() {
           let images = [mainImg1, mainImg2, mainImg3, mainImg4, mainImg5]
           
           for image in images {
               // 이미지 뷰들의 초기 위치를 현재 위치로 설정
               image?.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
               
               // 이미지 뷰들을 둥둥 떠다니는 애니메이션 적용
               let animation = CAKeyframeAnimation(keyPath: "position")
               animation.path = createFloatingPath().cgPath
               animation.duration = Double.random(in: 3.0...5.0) // 떠다니는 속도를 무작위로 설정
               animation.repeatCount = Float.infinity // 무한 반복
               animation.autoreverses = true // 애니메이션을 왕복하도록 설정
               
               image?.layer.add(animation, forKey: nil)
           }
       }
       
       func createFloatingPath() -> UIBezierPath {
           // 둥둥 떠다닐 경로를 생성합니다.
           let path = UIBezierPath()
           
           let startX = view.bounds.midX
           let startY = view.bounds.height
           let endY = view.bounds.midY
           
           path.move(to: CGPoint(x: startX, y: startY))
           path.addLine(to: CGPoint(x: startX, y: endY))
           
           return path
       }
    
}
