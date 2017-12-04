//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Murat Kuran on 05/11/2017.
//  Copyright © 2017 Murat Kuran. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI(partRockObj: PartyRock){
        videoTitle.text = partRockObj.videoTitle
        
        let url = URL(string: partRockObj.imageURL)!
        
        DispatchQueue.global().async {
            do{
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch {
                // handle the error
            }
        }
        
    }

}
