//
//  SecondViewController.swift
//  Break Point
//
//  Created by Oforkanji Odekpe on 7/5/18.
//  Copyright © 2018 Oforkanji Odekpe. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: GROUP_CELL, for: indexPath) as? GroupCell else {
            return UITableViewCell()}
        
        cell.configureCell(title: "Big head", description:"This is my first group", memberCount: 4)
        
        return cell
    }
    
}

