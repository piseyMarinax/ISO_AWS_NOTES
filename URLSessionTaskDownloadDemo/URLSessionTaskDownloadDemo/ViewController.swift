//
//  ViewController.swift
//  URLSessionTaskDownloadDemo
//
//  Created by mp001 on 8/25/18.
//  Copyright © 2018 mp001. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDelegate, URLSessionDownloadDelegate {
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
          self.proBar.progress = 0
        self.proBar.isHidden = true
        self.imageView.image = nil
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var proBar: UIProgressView!
    @IBOutlet weak var imageView: UIImageView!
    

    @IBAction func btnDownload(_ sender: Any) {
        let url = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4Ow4L_Jw5nw8AItHJnYh9wD2bZOBxhbo-nHfDJ8L42QUJuAfu")
         self.proBar.isHidden = true
         self.proBar.progress = 0
         self.imageView.image = nil
        
        let config = URLSessionConfiguration.default
        
//        let urlSessoin = URLSession(configuration: config, delegate: self, delegateQ)
        
        let urlSessoin = URLSession(configuration: config, delegate: self, delegateQueue: nil)
        
        // use share instance as default configuartion
//        let session = URLSession.shared
        
        let downloadTask = urlSessoin.downloadTask(with: url!)
        downloadTask.resume()
    
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
        let data = try? Data(contentsOf: location)
        DispatchQueue.main.async {
            self.imageView.image = UIImage(data: data!)
            self.proBar.isHidden = true
        }
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        let progress = Float(totalBytesExpectedToWrite) / Float(totalBytesWritten)
        
        DispatchQueue.main.async {
            self.proBar.progress = progress
        }
    }
    
    
    

    
}

