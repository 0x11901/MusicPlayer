//
// Created by 王靖凯 on 2018/5/26.
// Copyright (c) 2018 王靖凯. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var mainTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainTableView.dataSource = self
        mainTableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MainViewController: UITableViewDataSource {
}

extension MainViewController: UITableViewDelegate {
}
