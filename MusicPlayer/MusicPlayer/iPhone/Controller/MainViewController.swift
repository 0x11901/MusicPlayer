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
        mainTableView.rowHeight = 96
        if #available(iOS 9.3, *) {
            MPMediaLibrary.requestAuthorization { state in
                switch state {
                case .authorized:
                    DispatchQueue.main.async {
                        self.reloadData()
                    }
                    break
                default:
                    DispatchQueue.main.async {
                        self.noData()
                    }
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
            noData()
            return
        }
        for song in songs {
            let title = song.title
            let subtitle = song.artist
            let icon = song.artwork?.image(at: CGSize(width: 96, height: 96))
            let model = AudioModel(title: title, subtitle: subtitle, icon: icon)
            models.append(model)
        }
        mainTableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AudioTableViewCell = tableView.dequeueReusableCell(withIdentifier: audioCellReuseID) as! AudioTableViewCell
        cell.model = models[indexPath.row]
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
