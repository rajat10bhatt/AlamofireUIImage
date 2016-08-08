//
//  ViewController.swift
//  AlamofireImageTableView
//
//  Created by Rajat on 08/08/16.
//  Copyright © 2016 Rajat. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: Outlet
    @IBOutlet weak var tableViewOutlet: UITableView!
    let names = ["Kung fu panda", "How to train your dragon"]
    let urls = ["https://images-eds-ssl.xboxlive.com/image?url=8Oaj9Ryq1G1_p3lLnXlsaZgGzAie6Mnu24_PawYuDYIoH77pJ.X5Z.MqQPibUVTcp6kQ8FZeiqX6c2iizxyfnk1vFzGBRJECaJijsKdkgS9nSh9unGXNLdL_LBMMEC2wFG5anD9H1vMJq4gau02avC9I9lDZp7E82J8wELE_EXSablKt7Xey_dabDw7vCePlyjvIybL3Eb0mgUxw0kfySGUZe6LgUWHCu5fuVJeLXKE-&format=jpg", "http://www.designbolts.com/wp-content/uploads/2014/05/how-to-train-your-dragon-2-hd-wallpaper-1920x10801.jpg"]
    let language = ["English 3D", "English 3D"]
    
    // MARK: ViewController methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Delegate methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Total count:\(names.count)")
        return names.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableViewOutlet.dequeueReusableCellWithIdentifier("cell" , forIndexPath: indexPath) as! ImageTableViewCell
     
        Alamofire.request(.GET, urls[indexPath.row])
            .responseImage { response in
                debugPrint(response)
                
                //print(response.request)
                //print(response.response)
                //debugPrint(response.result)
                
                if let image = response.result.value {
                    //print("image downloaded: \(image)")
                   cell.urlImage.image = image
                   cell.movieName.text = self.names[indexPath.row]
                   cell.languageOutlet.text = self.language[indexPath.row]
                }
        }
        return cell
    }

    }

