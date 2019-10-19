//
//  ArticleTableViewCell.swift
//  NineNews
//
//  Created by Danish Aziz on 18/10/19.
//  Copyright © 2019 Danish Aziz. All rights reserved.
//

import UIKit
import MindV

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var lblHeadline: UILabel!
    @IBOutlet weak var lblLineBy: UILabel!
    @IBOutlet weak var lblAbstract: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    /// Set Cell
    ///
    /// set variables text headline, lineBy, Abstract and set thumbnil image 
    func setCell(artical: Asset) {
        self.lblHeadline.text = artical.headline
        self.lblLineBy.text = artical.byLine
        self.lblAbstract.text = artical.theAbstract
        if let image = artical.relatedImages?.first(where: { $0.type == FluffyType.thumbnail.rawValue })?.url, let url = URL(string: image) {
            MindVL.shared().loadImage(from: url, imageView: self.coverImageView, placeHolder: "placeholder")
        }
    }
}
