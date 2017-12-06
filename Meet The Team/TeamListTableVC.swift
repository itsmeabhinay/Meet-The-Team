//
//  TeamListTableVC.swift
//  Meet The Team
//
//  Created by Abhinay Simha Vangipuram on 2/13/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class TeamListTableVC: UITableViewController {
    
    var listOfMembers = [[String : String]]()
    var teamData: TeamData!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell().classForCoder, forCellReuseIdentifier: "memberNameCell")
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.tableHeaderView = self.createTableHeaderView()
        
        let teamDataSource = TeamDataSource()
        
        teamDataSource.createTeamData(success: { (response) -> Void in
            if response.count > 0 {
                self.listOfMembers = response
                for dict in response {
                    self.teamData = TeamData(dataDictionary: dict)
                }
            }
        }) { (error) -> Void in
            print("Failed to create datasource")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if listOfMembers.count > 0 {
            return listOfMembers.count
        }
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TeamNamesTableCell.init(style: .default, reuseIdentifier: "memberNameCell")
        
        var nameText = ""
        var headerText = ""
        
        if listOfMembers.count > 0 {
            nameText = String(format: "%@, %@", listOfMembers[indexPath.row]["lastName"]!, listOfMembers[indexPath.row]["firstName"]!)
            headerText = listOfMembers[indexPath.row]["title"]!
        }
        else {
            nameText = "No Data Available"
            headerText = "Role"
        }
        
        cell.headerLabel.text = headerText
        cell.nameLabel.text = nameText
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let viewController = ViewController()
        viewController.id = listOfMembers[indexPath.row]["id"]!
        viewController.role = listOfMembers[indexPath.row]["title"]!
        viewController.firstName = listOfMembers[indexPath.row]["firstName"]!
        viewController.lastName = listOfMembers[indexPath.row]["lastName"]!
        viewController.bioString = listOfMembers[indexPath.row]["bio"]!
        viewController.imageURL = listOfMembers[indexPath.row]["avatar"]!
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func createTableHeaderView() -> UIView {
        let tableHeaderView = UIView()
        tableHeaderView.frame = CGRect(x:0, y:0, width: tableView.frame.size.width, height: 50.0)
        tableHeaderView.backgroundColor = UIColor.blue
        
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: tableHeaderView.frame.size.width , height: 50.0)
        label.textColor = UIColor.white
        label.font = UIFont(name: "Optima-Bold", size: 22.0)
        label.textAlignment = .center
        label.text = "Meet the Team"
        
        tableHeaderView.addSubview(label)
        
        return tableHeaderView
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
