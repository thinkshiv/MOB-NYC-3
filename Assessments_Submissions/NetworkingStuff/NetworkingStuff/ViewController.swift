//
//  ViewController.swift
//  NetworkingStuff
//
//  Created by Shiven Ramji on 6/16/15.
//  Copyright (c) 2015 Shiven Ramji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataTextView: UITextView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBAction func onDataTapped(sender: AnyObject) {
        self.getSomeData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onImageTapped(sender: AnyObject) {
        self.getTheImage()
    }
    
    func getTheImage(){
        let imageUrlStr = "http://static.ddmcdn.com/en-us/apl/breedselector/images/breed-selector/dogs/breeds/shiba-inu_01_lg.jpg"
        let url = NSURL(string: imageUrlStr)
        
        let session = NSURLSession.sharedSession()
        
        func onCompletion(location:NSURL!, response:NSURLResponse!, error:NSError!){
            println("Done getting image data!")
            
            let imageData = NSData(contentsOfURL: location)
            let img = UIImage(data: imageData!)
            
            dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()){
                self.imageView.image = img
            }
            
        }
        
        let imageTask = session.downloadTaskWithURL(url!, completionHandler: onCompletion)
        
        imageTask.resume()
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getSomeData(){
        println("Getting some data!")
        let dataUrlStr = "http://mashable.com/stories.json"
        let url = NSURL(string: dataUrlStr)
        
        let session = NSURLSession.sharedSession()
        
        func onCompletion(data: NSData!, response: NSURLResponse!, error: NSError!){
            println("DONE!")
            
            let str = NSString(data: data, encoding: NSUTF8StringEncoding)!
            //println(str)
            
            var e : NSError? = nil
            var json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &e) as? NSDictionary
            
            let hotArticles = json?.valueForKey("hot") as? NSArray
            
            let firstArticle = hotArticles?.objectAtIndex(0) as? NSDictionary
            let title = firstArticle?.valueForKey("title") as? NSString
            
            let result = "The title was \(title!). It's about "
            
            dispatch_after(DISPATCH_TIME_NOW, dispatch_get_main_queue()){
                self.dataTextView.text = result
            }
        }
        
        let dataTask = session.dataTaskWithURL(url!, completionHandler: onCompletion)
        dataTask.resume()
    }

}

