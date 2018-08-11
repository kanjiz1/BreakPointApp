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
    
    var groupsArray = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
            DataService.instance.getAllGroups { (returnedGroupsArray) in
                self.groupsArray = returnedGroupsArray
                self.tableView.reloadData()
            }
        }
    }
}

extension GroupsVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: GROUP_CELL, for: indexPath) as? GroupCell else {
            return UITableViewCell()}
        
        cell.configureCell(title: groupsArray[indexPath.row].groupTitle, description:groupsArray[indexPath.row].groupDescription, memberCount: groupsArray[indexPath.row].memberCount)
        
        return cell
    }
    
}

