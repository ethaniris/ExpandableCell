//
//  ExpandableTableViewHeaderView.swift
//  ExpandableCell
//
//  Created by Ethan on 2020/1/31.
//  Copyright © 2020 playplay. All rights reserved.
//

import UIKit




protocol ExpandableTalbeViewHeaderViewDelegate {
     
    func toggleSection(header: ExpandableTableViewHeaderView, section: Int)

}

class ExpandableTableViewHeaderView: UITableViewHeaderFooterView {

    
    var delegate:ExpandableTalbeViewHeaderViewDelegate?
    
    var section: Int!
    
    func customInit(title: String, section: Int, delegate: ExpandableTalbeViewHeaderViewDelegate){
    self.textLabel?.text = title
    self.section = section
    self.delegate = delegate
    }
 
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(clickSecionHeader)))

    }
    
    @objc func clickSecionHeader(gesture: UITapGestureRecognizer){
        let cell = gesture.view as! ExpandableTableViewHeaderView
        delegate?.toggleSection(header: self, section: cell.section)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
