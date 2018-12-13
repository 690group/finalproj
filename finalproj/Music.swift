import UIKit
import AVFoundation

var songs:[String] = []
var audioPlayer = AVAudioPlayer()

//for prev and next button to navigate through songs
var songToTrack = 0

class Music: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var musicPlaylistTab: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = songs[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //play song on the playlist tab
        
        do{
            let audioPath = Bundle.main.path(forResource: songs[indexPath.row], ofType:".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            
            audioPlayer.play()
            
            //accessing index for which song is playing
            songToTrack = indexPath.row
        }
        catch{
            print("Cannot play song!")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getSongName()
    }
    
    override func didReceiveMemoryWarning(){
        
        super.didReceiveMemoryWarning()
        //Dispose of any resources that can be recreated
    }
    
    
    //get song func
    func getSongName() {
        
        let folderURL = URL(fileURLWithPath: Bundle.main.resourcePath!)
        
        do{
            //files stored in constant songPath
            let songPath = try FileManager.default.contentsOfDirectory(at: folderURL, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for song in songPath {
                var currentSong = song.absoluteString
                
                if currentSong.contains(".mp3") {
                    //find only title from URL of song
                    let findString = currentSong.components(separatedBy: "/")
                    
                    //title is last string
                    currentSong = (findString[findString.count-1])
                    //replaces %20 with space
                    currentSong = currentSong.replacingOccurrences(of: "%20", with: " ")
                    //replaces gets rid of mp3
                    currentSong = currentSong.replacingOccurrences(of: ".mp3", with: "")
                    
                    songs.append(currentSong)
                }
            }
            
            //update table view data
            musicPlaylistTab.reloadData()
        }
        catch{
            
        }
    }
    
}




