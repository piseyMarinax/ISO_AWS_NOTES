//
//  ViewController.swift
//  ArticleApp
//
//  Created by Chhaileng Peng on 8/26/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit
import SVProgressHUD

class ViewController: UIViewController, ArticlePresenterDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articlePresenter: ArticlePresenter?
    
    var articles = [Article]()
    
    var page = 1
    var limit = 15
    
    //Loading at table view footer when scrolling
    var loadMore = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    //Loadin pull to refresh
    var refreshControll = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articlePresenter = ArticlePresenter()
        articlePresenter?.delegate = self
    
        tableView.tableFooterView = loadMore
        tableView.refreshControl = refreshControll
        refreshControll.addTarget(self, action: #selector(refreshArticle), for: .valueChanged)

    }
    
    @objc func refreshArticle()
    {
        page = 1
        articles = []
        SVProgressHUD.show()
        articlePresenter?.getArticles(page: page, limit: limit)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        SVProgressHUD.show()
        articlePresenter?.getArticles(page: page, limit: limit)
    }

    func responseArticles(articles: [Article]) {
        countResponseArticle = articles.count
        self.articles += articles
        SVProgressHUD.dismiss()
        refreshControll.endRefreshing()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func responseMessage(messaeg: String, article: Article) {
        let alert = UIAlertController(title: messaeg, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
            SVProgressHUD.show()
            self.articlePresenter?.getArticles(page: self.page, limit: self.limit)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell") as! ArticleTableViewCell
        cell.configureCell(article: articles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { (action, indexPath) in
            // edit article code goes here
//            let alert = UIAlertController(title: "Update Article", message: nil, preferredStyle: .alert)
//            alert.addTextField(configurationHandler: { (textField) in
//                textField.placeholder = "New Title"
//                textField.text = self.articles[indexPath.row].title
//            })
//
//            alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { (action) in
//                self.articles[indexPath.row].title = alert.textFields?.first?.text
//                self.articlePresenter?.updateArticle(article: self.articles[indexPath.row])
//            }))
//            self.present(alert, animated: true, completion: nil)
            
            let dest = self.storyboard?.instantiateViewController(withIdentifier: "AddArticleBoard") as! AddArticleViewController
            
            dest.articleId = self.articles[indexPath.row].id!
            dest.articleImage = self.articles[indexPath.row].image!
            dest.articleTitle = self.articles[indexPath.row].title!
            dest.articleDesc = self.articles[indexPath.row].description!
            
            self.navigationController?.pushViewController(dest, animated: true)
            
        }
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            // delete article code goes here
            self.articlePresenter?.deleteArticle(id: self.articles[indexPath.row].id!)
            self.articles.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete, edit]
    }
    
    var newFetch = false
    var countResponseArticle = 0
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.newFetch = false
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        self.newFetch = true
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate && newFetch && scrollView.contentOffset.y >= 0 && countResponseArticle > 0{
            page = page + 1
            self.articlePresenter?.getArticles(page: self.page, limit: self.limit)
             self.newFetch = false
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
}

