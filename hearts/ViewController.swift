//
//  ViewController.swift
//  hearts
//
//  Created by MAC-OBS-26 on 30/06/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var floaterLikeView: Floater!
    
    @IBOutlet weak var floaterDislikeView: Floater!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    func startEndLikeAnimation() {
        floaterLikeView.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.floaterLikeView.stopAnimation()
        })
    }
    
    func startEndDisLikeAnimation() {
        floaterDislikeView.startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.floaterDislikeView.stopAnimation()
        })
    }

    @IBAction func likeButton(_ sender: Any) {
        floaterLikeView.image1 = UIImage(named: "like")
        floaterLikeView.image2 = UIImage(named: "like")
        floaterLikeView.image3 = UIImage(named: "like")
        floaterLikeView.image4 = UIImage(named: "like")
        startEndLikeAnimation()
    }
    @IBAction func disLikeButton(_ sender: Any) {
        floaterDislikeView.image1 = UIImage(named: "dislike")
        floaterDislikeView.image2 = UIImage(named: "dislike")
        floaterDislikeView.image3 = UIImage(named: "dislike")
        floaterDislikeView.image4 = UIImage(named: "dislike")
        startEndDisLikeAnimation()
    }
    
}

