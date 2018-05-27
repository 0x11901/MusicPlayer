//
// Created by 王靖凯 on 2018/5/26.
// Copyright (c) 2018 王靖凯. All rights reserved.
//

import UIKit

class AudioModel {
    var title: String?
    var subtitle: String?
    var icon: UIImage?

    convenience init(title: String? = nil, subtitle: String? = nil, icon: UIImage?) {
        self.init()
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
    }
}
