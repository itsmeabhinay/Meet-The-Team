//
//  ViewController.swift
//  Meet The Team
//
//  Created by Abhinay Simha Vangipuram on 2/13/17.
//  Copyright © 2017 Home. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageURL = String()
    var bioString = String()
    var firstName = String()
    var lastName = String()
    var role = String()
    var id = String()

    override func loadView() {
        super.loadView()
        self.createLayoutForViewController()
        view.backgroundColor = UIColor.white
        self.title = self.role
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createLayoutForViewController() {
        
        let headerView = UIView(frame: CGRect(x:0, y:100, width: view.frame.size.width, height: 150.0))
        let headerImageView = UIImageView(frame: CGRect(x:headerView.frame.size.width/4, y:headerView.frame.size.height/4, width: headerView.frame.size.width/2, height: headerView.frame.size.height/2))
        headerImageView.backgroundColor = UIColor.gray
        
        let activityIndicator = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.backgroundColor = UIColor.gray
        view.addSubview(activityIndicator)
        
        activityIndicator.startAnimating()
        self.getImageFromUrl(url: URL.init(string: imageURL)!) { (data, response, error)  in
            guard let data = data, error == nil else {
                
                DispatchQueue.main.async {
                    let noDataLabel = UILabel(frame: CGRect(x:0, y:0, width: self.view.frame.size.width, height: 40.0))
                    noDataLabel.center = self.view.center
                    noDataLabel.textColor = UIColor.black
                    noDataLabel.font = UIFont(name: "Optima-Bold", size: 16.0)
                    noDataLabel.text = String(format: "No Data Available.")
                    noDataLabel.textAlignment = .center
                    self.view.addSubview(noDataLabel)
                    activityIndicator.stopAnimating()
                }
                return
            }
            DispatchQueue.main.async() { () -> Void in
                headerImageView.contentMode = .scaleAspectFill
                headerImageView.image = UIImage(data: data)
                headerView.addSubview(headerImageView)
                self.view.addSubview(headerView)
                
                let nameLabel = UILabel(frame: CGRect(x:0, y:headerView.frame.size.height + 120, width: self.view.frame.size.width, height: 40.0))
                nameLabel.textColor = UIColor.black
                nameLabel.font = UIFont(name: "Optima-Bold", size: 20.0)
                nameLabel.text = String(format: "Name: %@, %@", self.lastName, self.firstName)
                nameLabel.textAlignment = .center
                self.view.addSubview(nameLabel)
                
                let nameToHeaderVerticalConstraint = NSLayoutConstraint.init(item: nameLabel, attribute: .topMargin, relatedBy: .equal, toItem: headerView, attribute: .bottomMargin, multiplier: 1.0, constant: 0)
                
                let idLabel = UILabel(frame: CGRect(x:0, y:headerView.frame.size.height + 155, width: self.view.frame.size.width, height: 20.0))
                idLabel.textColor = UIColor.black
                idLabel.font = UIFont(name: "Optima-Bold", size: 16.0)
                idLabel.text = String(format: "Id: %@", self.id)
                idLabel.textAlignment = .center
                self.view.addSubview(idLabel)
                
                let idToNameVerticalConstraint = NSLayoutConstraint.init(item: idLabel, attribute: .topMargin, relatedBy: .equal, toItem: nameLabel, attribute: .bottomMargin, multiplier: 1.0, constant: 0)
                
                let aboutMeLabel = UILabel(frame: CGRect(x:10, y:headerView.frame.size.height + 180, width: self.view.frame.size.width, height: 20.0))
                aboutMeLabel.textColor = UIColor.black
                aboutMeLabel.font = UIFont(name: "Optima-Bold", size: 16.0)
                aboutMeLabel.text = "Bio: "
                aboutMeLabel.textAlignment = .left
                self.view.addSubview(aboutMeLabel)
                
                let aboutMeToIdVerticalConstraint = NSLayoutConstraint.init(item: aboutMeLabel, attribute: .topMargin, relatedBy: .equal, toItem: idLabel, attribute: .bottomMargin, multiplier: 1.0, constant: 0)
                
                let aboutMeTextView = UITextView(frame: CGRect(x:5, y:headerView.frame.size.height + 200, width: self.view.frame.size.width - 10, height: 225.0))
                aboutMeTextView.textColor = UIColor.black
                aboutMeTextView.font = UIFont(name: "Optima", size: 14.0)
                aboutMeTextView.text = self.bioString
                aboutMeTextView.textAlignment = .justified
                aboutMeTextView.isEditable = false
                aboutMeTextView.isSelectable = false
                self.view.addSubview(aboutMeTextView)
                
                let textViewToAboutVerticalConstraint = NSLayoutConstraint.init(item: aboutMeTextView, attribute: .topMargin, relatedBy: .equal, toItem: aboutMeLabel, attribute: .bottomMargin, multiplier: 1.0, constant: 0)
                
                let textViewToBottomConstraint = NSLayoutConstraint.init(item: aboutMeTextView, attribute: .bottomMargin, relatedBy: .equal, toItem: aboutMeLabel, attribute: .bottom, multiplier: 1.0, constant: 10)
                
                NSLayoutConstraint.activate([nameToHeaderVerticalConstraint, idToNameVerticalConstraint, aboutMeToIdVerticalConstraint, textViewToAboutVerticalConstraint, textViewToBottomConstraint])
                
                activityIndicator.stopAnimating()
            }
        }
    }
    
    func getImageFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
}

