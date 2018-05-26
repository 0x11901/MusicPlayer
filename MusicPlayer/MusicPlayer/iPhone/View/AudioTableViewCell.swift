//
//  AudioTableViewCell.swift
//  MusicPlayer
//
//  Created by 王靖凯 on 2018/5/26.
//  Copyright © 2018年 王靖凯. All rights reserved.
//

import UIKit

class AudioTableViewCell: UITableViewCell {
    @IBOutlet var icon: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var subtitle: UILabel!

    public var model: AudioModel? {
        didSet {
            refreshUI()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension AudioTableViewCell {
    func refreshUI() {
        title.text = model?.title ?? ""
        subtitle.text = model?.subtitle ?? ""
        if let icon = model?.icon {
            self.icon.image = UIImage(named: icon)
        }
    }
}
