//  WelcomeViewController.swift
//  Flash Chat iOS13


import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       titleAnimation()
    }
    
    //MARK: - Title Animation
    func titleAnimation() {
        titleLabel.text = ""
        var charIndex = 0.0
        let theText = K.appName
        for words in theText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { timer in
                self.titleLabel.text?.append(words)
            }
            charIndex += 1
            }
        }
}
