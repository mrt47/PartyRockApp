//
//  ViewController.swift
//  PartyRockApp
//
//  Created by Murat Kuran on 05/11/2017.
//  Copyright © 2017 Murat Kuran. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var partyRockArr = [PartyRock]()
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock(imageURL: "http://cdn.sixthman.net/2016/gronk/images/artists/2923.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/3BpdKCzHbq8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Lights Out")
        
        let p2 = PartyRock(imageURL: "http://www.croshalgroup.com/wp-content/uploads/2015/05/Redfoo-Website.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CdLhdrNgGu4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Let's Get Ridiculous")

        let p3 = PartyRock(imageURL: "https://i.ytimg.com/vi/2wUxw6GH3IM/hqdefault.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/vg_nvEGryA4\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Juicy Wiggle Lesson")

        let p4 = PartyRock(imageURL: "http://www.billboard.com/files/styles/article_main_image/public/media/lmfao-party-rock-anthem-2011-billboard-650.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/KQ6zr6kCPj8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Party Rock Commercial")

        let p5 = PartyRock(imageURL: "http://direct-ns.rhap.com/imageserver/v2/albums/Alb.219913217/images/600x600.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/xGiBiHocSZM\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "New Thang")
        
        partyRockArr.append(p1)
        partyRockArr.append(p2)
        partyRockArr.append(p3)
        partyRockArr.append(p4)
        partyRockArr.append(p5)
        
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableview.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            let partyRockObj = partyRockArr[indexPath.row]
            cell.updateUI(partRockObj: partyRockObj)
            
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 5
            cell.layer.borderWidth = 0.5
            cell.layer.shadowOffset = CGSize(width: -1, height: 1)
            let borderColor = UIColor.blue
            cell.layer.borderColor = borderColor.cgColor
            
            return cell
        }
        else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRockArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 80.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let partyRock = partyRockArr[indexPath.row]
        performSegue(withIdentifier: "PlayVC", sender: partyRock)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC {
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
        }
    }


}

