//
//  ViewController.swift
//  RingAnimationDemo
//
//  Created by Ayaka Mihara on 2021/03/12.
//

import UIKit

class ViewController: UIViewController {

    let shape = CAShapeLayer()
    
    //円の形成の生成を設定
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center //ラベルの位置の設定
        label.text = "Practice" //ラベルテキストの設定
        label.font = .systemFont(ofSize: 36, weight: .regular) //フォントサイズと太さの設定
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.sizeToFit()
        view.addSubview(label)
        label.center = view.center
        let circlePath = UIBezierPath(arcCenter: view.center,
                                      radius: 150,
                                      startAngle: -(.pi / 2),
                                      endAngle: .pi * 2,
                                      clockwise: true)
        
        let trackShape = CAShapeLayer()
        trackShape.path = circlePath.cgPath
        trackShape.fillColor = UIColor.clear.cgColor
        trackShape.lineWidth = 20
        trackShape.strokeColor = UIColor.lightGray.cgColor
        view.layer.addSublayer(trackShape)
       
        shape.path = circlePath.cgPath
        shape.lineWidth = 20
        shape.strokeColor = UIColor.blue.cgColor
        shape.fillColor = UIColor.clear.cgColor
        shape.strokeEnd = 0
        view.layer.addSublayer(shape)
        
        //ボタンの形成
        let button = UIButton(frame: CGRect(x: 40, y: view.frame.size.height-100, width: view.frame.size.width-80, height: 60))
        view.addSubview(button)
        //角丸にする
        button.layer.cornerRadius = 0.05 * button.bounds.size.width
        button.clipsToBounds = true
        
        button.setTitle("Start", for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }

    //ボタンを押した時に円のアニメーションが動くように設定
    @objc func didTapButton() {
        // Animate
       let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.isRemovedOnCompletion = false
        animation.fillMode = .forwards
        shape.add(animation, forKey: "animation")
    }
}

