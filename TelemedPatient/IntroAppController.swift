//
//  IntroAppController.swift
//  TelemedPatient
//
//  Created by dr.mac on 24/09/19.
//  Copyright © 2019 dr.mac. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
import MediaPlayer

class IntroAppController: UIViewController {

    @IBOutlet weak var viewPlayer: UIView?
    
    @IBOutlet weak var playButton: UIButton?
    
    @IBOutlet weak var placeImage: UIImageView?

    @IBOutlet weak var nextButton: UIButton?

    @IBOutlet weak var lbeTitle: UILabel?


    var isAddPlyer = Bool()
    
    let playerController = AVPlayerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // playerController.player?.play()
       // let del:AppDelegate = UIApplication.shared.delegate as! AppDelegate
       // del.currentController = self
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if !isAddPlyer{
            playVideo()
            isAddPlyer = true
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {

        
    }
    
    @IBAction func Play(_ sender: Any) {
       
        if playerController.player?.timeControlStatus == .playing{
            playButton?.isHidden = false
            placeImage?.isHidden = true
            playerController.player?.pause()
        }
        else{
            if playerController.player?.status == AVPlayer.Status.readyToPlay {
                playButton?.isHidden = true
                placeImage?.isHidden = true
                playerController.player?.play()
            }
        }
    }
        
    
    
    @IBAction func Close(_ sender: Any) {
        playerController.player?.pause()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "HomeController") as! HomeController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
   
    //MARK:-  Video Methods
    
    func playVideo() {
        var videoUrl = Bundle.main.url(forResource: "Smartphone_User_2823_Videvo", withExtension: "mov")
        
        if UIScreen.main.bounds.size.height >= 812 {
            videoUrl = Bundle.main.url(forResource: "Smartphone_User_2823_Videvo", withExtension: "mov")
          //  self.playerController.view.frame = CGRect(x:-20, y:-20, width: UIScreen.main.bounds.size.width + 40, height: UIScreen.main.bounds.size.height + 40)
        self.playerController.view.frame = CGRect(x:0, y:0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 110)

        }
        else {
            self.playerController.view.frame = CGRect(x:0, y:0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height - 110)
        }
        let player = AVPlayer(url: videoUrl!)
        self.playerController.player = player
        self.playerController.showsPlaybackControls = true
        player.actionAtItemEnd = .none
        // player.play()
        self.addChild(self.playerController)
        self.viewPlayer?.addSubview(self.playerController.view)
        //
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd(_ :)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: nil)
        
        UIView.animate(withDuration: 1.5, animations: {
           
        }) { (completed: Bool) in
            
        }
    }

    
    @objc func playerItemDidReachEnd(_ notification: Notification){
        let playerItem = notification.object as! AVPlayerItem
        
        playButton?.isHidden = false
        placeImage?.isHidden = false

        playerItem.seek(to: CMTime.zero)
        playerController.player?.pause()
        
        let redTapImage = UIImage(named: "checkCircals")
        self.nextButton!.setImage(redTapImage, for: .normal)
        

//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewController(withIdentifier: "HomeController") as! HomeController
//        self.navigationController?.pushViewController(vc, animated: true)
        
        
    }
}
