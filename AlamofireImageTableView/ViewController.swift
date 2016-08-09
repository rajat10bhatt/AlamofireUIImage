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
import SwiftyJSON
import AlamofireObjectMapper
import ObjectMapper
import Kingfisher

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: Properties
    let url = "http://52.221.233.254/api/v1/citymovies/movies/"
    let headers = ["city": "pune"]
    var movies = [String]()
    
    // MARK: Outlet
    @IBOutlet weak var tableViewOutlet: UITableView!
    
    // MARK: ViewController methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getMovies()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Function to get movies
    func getMovies (){
        Alamofire.request(.GET, url, headers: headers).validate().responseJSON { response in
            switch response.result {
            case .Success(let json):
                let key_json = JSON(json)
                var count = 0
                for _ in key_json
                {
                    let movie = key_json[count]
                    let movieString = String(movie)
                    self.movies.append(movieString)
                    count = count+1
                    //print(movie)
                }
                self.tableViewOutlet.reloadData()
            case .Failure(let error):
                print("Request failed with error: \(error)")
                return
            }
            
        }
        
    }
    
    // MARK: Delegate methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(self.movies.count)
        // return self.movies.count
        return self.movies.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableViewOutlet.scrollEnabled = true
        let cell = self.tableViewOutlet.dequeueReusableCellWithIdentifier("cell" , forIndexPath: indexPath) as! ImageTableViewCell
        
        if let deserializedMovie = Mapper<Movie>().map(movies[indexPath.row]){
            // apend list to movies
            // tableview  reload data
            //print(deserializedMovie.title)
            //cell.urlImage.image = image
            
            if let stringURL = deserializedMovie.poster{
                let URL = NSURL(string: stringURL)!
                print(URL)
                let resource = Resource(downloadURL: URL)
                cell.urlImage.kf_setImageWithResource(resource)
                
            }else{
                cell.urlImage.kf_setImageWithURL(NSURL(string: "https://www.interntheory.com/uploads/company/companylogos/ed5d0b0e58c5d7b0c9f6dc48d26af7a354af4185/292491909de22d63689b48f7c6dd62b7e430c8c5com.png")!)
            }
            cell.movieName.text = deserializedMovie.title
            cell.languageOutlet.text = deserializedMovie.languages
            cell.certificateLabel.text = deserializedMovie.certificate
            cell.dimensionOutlet.text = deserializedMovie.dimensions
        }
        
        return cell
    }
    // Function to get URL

}

