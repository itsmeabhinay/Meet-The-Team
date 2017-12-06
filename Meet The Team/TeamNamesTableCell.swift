//
//  TeamNamesTableCell.swift
//  Meet The Team
//
//  Created by Abhinay Simha Vangipuram on 2/14/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class TeamNamesTableCell: UITableViewCell {
    
    var headerLabel : UILabel!
    var nameLabel : UILabel!
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:)")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let headerView = UIView()
        headerView.frame = CGRect(x:0, y:0, width: 420.0, height: 20.0)
        headerView.backgroundColor = UIColor.groupTableViewBackground
        
        headerLabel = UILabel()
        headerLabel.frame = CGRect(x: 15, y: 0, width: contentView.frame.size.width , height: 20.0)
        headerLabel.textColor = UIColor.black
        headerLabel.font = UIFont(name: "Optima-Bold", size: 15.0)
        
        headerView.addSubview(headerLabel)
        contentView.addSubview(headerView)
        
        nameLabel = UILabel()
        nameLabel.frame = CGRect(x: 15, y: 25, width: contentView.frame.size.width , height: 40.0)
        nameLabel.textColor = UIColor.black
        nameLabel.font = UIFont(name: "Optima", size: 15.0)
        contentView.addSubview(nameLabel)
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
