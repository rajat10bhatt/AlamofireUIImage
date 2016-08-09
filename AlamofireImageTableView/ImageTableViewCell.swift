//
//  ImageTableViewCell.swift
//  AlamofireImageTableView
//
//  Created by Rajat on 08/08/16.
//  Copyright © 2016 Rajat. All rights reserved.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    // MARK: Outlet
    @IBOutlet weak var urlImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var languageOutlet: UILabel!
    @IBOutlet weak var certificateLabel: UILabel!   
    @IBOutlet weak var dimensionOutlet: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func bookButton(sender: AnyObject) {
        print("buttonClicked")
    }

}
