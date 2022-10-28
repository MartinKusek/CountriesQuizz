//
//  StartViewController.swift
//  Countries
//
//  Created by Martin Kusek on 28.10.2022..
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet var startView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //assignbackground()
    }
    
    @IBAction func flagsButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "startToFlags", sender: self)
    }
    @IBAction func capitalCitysPressed(_ sender: Any) {
        performSegue(withIdentifier: "startToCapital", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

            super.prepare(for: segue, sender: sender)
            segue.destination.modalPresentationStyle = .fullScreen
        }
    
    func assignbackground(){
            let background = UIImage(named: "765")

            var imageView : UIImageView!
            imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFit
            imageView.clipsToBounds = true
            imageView.image = background
            imageView.center = view.center
            view.addSubview(imageView)
            self.view.sendSubviewToBack(imageView)
        }

}
