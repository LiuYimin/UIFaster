//
//  MainVC.swift
//  NewUITest
//
//  Created by 0000 on 2024/2/8.
//

import UIKit
import SwiftMessages

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var keys: [String] = ["klfjsld", "akl;fjldk;asjflkdjslkfjdsljfldskjf", "klfjdaksljflkjkljldkjflkdsjflkjdslfjsdlkjfldsjflkdsjlfkjdslkjflkdsjflkdsjflksjdlfkjdslkfjldskjflsdkjflkdsjflkdsjflkdsjflksdjflksdjflds", "akl;fkdjflk;asdjlfksdjakfjlsdjflskdjlfdsj", "akl;fkdjflk;asd\njlfksdjakfjlsdjfls\\nkdjlfdsj", "akl;fkdjflk;asdjlfk\nsdjakfjlsdjflskdjlfdsj",]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib.init(nibName: "MainCell", bundle: nil), forCellReuseIdentifier: "MainCell")
        
        tableView.register(UINib.init(nibName: "NotificationV5Cell", bundle: nil), forCellReuseIdentifier: "NotificationV5Cell")

        tableView.estimatedRowHeight = 76
        tableView.rowHeight = UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return keys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
//       cell.contentView.setNeedsLayout()
//       cell.contentView.layoutIfNeeded()
//        cell.titleLab.text = keys[indexPath.row]

       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: String(describing: PopVC.self), bundle: .main).instantiateInitialViewController() as! PopVC
        let segue = SwiftMessagesSegue(identifier: String(describing: vc.self), source: self, destination: vc)
        segue.configure(layout: .bottomMessage)
        segue.dimMode = .gray(interactive: true)
        segue.perform()
        
        
        
    }
}
