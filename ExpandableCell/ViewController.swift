//
//  ViewController.swift
//  ExpandableCell
//
//  Created by Ethan on 2020/1/31.
//  Copyright © 2020 playplay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandableTalbeViewHeaderViewDelegate {
    
    @IBOutlet weak var tableView:UITableView!
    
    var sections:[Section] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let movieGroup1 = Section(type: "old", movies: ["good fellow","God father"], isExpanded: false)
        let movieGroup2 = Section(type: "japanese", movies: ["龍貓","天空之城"], isExpanded: false)
        
        let movieGroup3 = Section(type: "new", movies: ["Good will hunting","Sleepless in Seattle"], isExpanded: false)
        sections.append(movieGroup1)
        sections.append(movieGroup2)
        sections.append(movieGroup3)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    //這裡就是expanded的主要原因
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if sections[indexPath.section].isExpanded {
            return 40
        }
        return 0
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].movies.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = ExpandableTableViewHeaderView()
        view.customInit(title: sections[section].type, section: section, delegate: self)
        return view
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        cell.textLabel?.text = sections[indexPath.section].movies[indexPath.row]
        
        return cell
    }
    
    
    func toggleSection(header: ExpandableTableViewHeaderView, section: Int) {
        
        sections[section].isExpanded = !sections[section].isExpanded
        
        tableView.beginUpdates()
        
        for i in 0 ..< sections[section].movies.count {
            
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        
        }
     
        tableView.endUpdates()
    }

}

