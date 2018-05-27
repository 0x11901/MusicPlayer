//
// Created by 王靖凯 on 2018/5/26.
// Copyright (c) 2018 王靖凯. All rights reserved.
//

import MediaPlayer
import UIKit

let audioCellReuseID = "audioCellReuseID"

class MainViewController: UIViewController {
    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var noDataView: UIView!
    var models: [AudioModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        noDataView.isHidden = true
        mainTableView.dataSource = self
        mainTableView.delegate = self
        if #available(iOS 9.3, *) {
            MPMediaLibrary.requestAuthorization { state in
                switch state {
                case .authorized:
                    self.reloadData()
                    break
                default:
                    self.noData()
                    break
                }
            }
        } else {
            // Fallback on earlier versions
            reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainViewController {
    func noData() {
        mainTableView.isHidden = true
        noDataView.isHidden = false
    }

    func reloadData() {
        let items = MPMediaQuery.songs().items
        guard let songs = items else {
            self.noData()
            return
        }
        for song in songs {
            song.artwork?.image(at: CGSize(96,96))
        }
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return models.count
    }

    func tableView(_: UITableView, cellForRowAt _: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension MainViewController: UITableViewDelegate {
}
