//
//  ViewController.swift
//  Timer
//
//  Created by 203a28 on 2022/06/17.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var mywebView2: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet var myactivityIndicator2: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    func loadWebPage2(_ url: String) {
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        mywebView2.navigationDelegate = self
        loadWebPage("Google.com")
        loadWebPage2("Yutube.com")
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
        myactivityIndicator2.startAnimating()
        myactivityIndicator2.isHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
        myactivityIndicator2.stopAnimating()
        myactivityIndicator2.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
        myactivityIndicator2.stopAnimating()
        myactivityIndicator2.isHidden = true
    }
    

    @IBAction func bunGotoUrl(_ sender: UIButton) {
    }
    
    @IBAction func btnGotoNaver(_ sender: UIButton) {
        loadWebPage("http://naver.com")
    }
    
    @IBAction func btnGotoInst(_ sender: UIButton) {
        loadWebPage2("http://Instargram.com")
    }
    
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
        mywebView2.stopLoading()
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload()
        mywebView2.reload()
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
        mywebView2.goBack()
    }
    @IBAction func btnGoForword(_ sender: UIBarButtonItem) {
        myWebView.goForward()
        mywebView2.goForward()
    }
}

