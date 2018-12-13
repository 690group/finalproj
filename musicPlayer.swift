//
//  MusicPlayer.swift
//  finalproj
//
//  Created by Russelle Pineda on 12/12/18.
//  Copyright © 2018 Jasmine Chen. All rights reserved.
//

import UIKit
import AVFoundation


class MusicPlayer: UIViewController {
    
    //song name label
    @IBOutlet weak var songName: UILabel!
    //image view label
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBAction func playButton(_ sender: UIButton) {
        
        if audioPlayer.isPlaying == false {
            audioPlayer.play()
        }
        
    }
    
    @IBAction func stopButton(_ sender: UIButton) {
        
        if audioPlayer.isPlaying {
            audioPlayer.pause()
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        let maxIndex = songs.count - 1
        if songToTrack == maxIndex {
            playThis(thisSong: songs[0])
            
            //without this, app crashes with an error "index out of range"
            //resets index counter to 0
            songToTrack = 0
            
            //song label
            songName.text = songs[songToTrack]
            
            print("if:", songToTrack)
        }
            //end of array
        else {
            playThis(thisSong: songs[songToTrack + 1])
            
            //song label
            songName.text = songs[songToTrack]
            
            print("else:", songToTrack)
        }
    }
    
    @IBAction func prevButton(_ sender: UIButton) {
        
        let maxIndex = songs.count - 1
        if songToTrack == 0 {
            
            playThis(thisSong: songs[maxIndex])
            
            //without this, app crashes with an error "index out of range"
            //reset index counter to maxIndex
            songToTrack = maxIndex
            
            //song label
            songName.text = songs[songToTrack]
            
            print("if:", songToTrack)
        }
        else {
            
            playThis(thisSong: songs[songToTrack - 1])
            
            //index counter must be decremented to -2 because playThis func increments to 1 everytime used!
            songToTrack = songToTrack - 2
            
            //song label
            songName.text = songs[songToTrack]
            print("else:", songToTrack)
            
        }
        
    }
    
    @IBAction func volumeSlider(_ sender: UISlider) {
        
        //1 is max and 0 is min/mute
        audioPlayer.volume = sender.value
    }
    
    //function for prev and next buttons
    func playThis(thisSong: String) {
        
        do{
            let audioPath = Bundle.main.path(forResource: thisSong, ofType:".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            
            //increment to update index of song
            songToTrack = songToTrack + 1
            audioPlayer.play()
        }
        catch{
            print("Cannot play song!")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        songName.text = songs[songToTrack]
    }
    
    
    
}

