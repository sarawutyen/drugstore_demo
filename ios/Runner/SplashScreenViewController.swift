//
//  SplashScreenViewController.swift
//  Runner
//
//  Created by Ahmad Yen on 6/7/2567 BE.
//

import UIKit

class SplashScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        // Custom initialization code
        view.setGradientBackground(colorTop: UIColor.white, colorBottom: UIColor(red: 0.0, green: 0.702, blue: 0.941, alpha: 1.0))
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
           self.launchFlutterApp()
        }
    }
    
    private func launchFlutterApp() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.showFlutterView()
    }

}

extension UIView {
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.4)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.frame = bounds
        gradientLayer.masksToBounds = true
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
