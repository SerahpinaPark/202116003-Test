# Final Test

기말고사 과제로는 한 화면에 동시에 두 사이트를 띄워서 볼 수 있는 애플리케이션을 만들었습니다.

첫 화면으로는 구글, 유튜브가 나타납니다.

여기서 상단의 ‘Naver’ 버튼과, ‘Instargram’ 버튼을 누르면 각각의 사이트로 이동됩니다.

다만 하단의 정지, 뒤로 가기, 앞으로 가기 등의 버튼을 눌렀을 때 두 화면 모두 동기화되어 불편함을 초래할 것 같아 이 부분은 어떻게 분리하여 적용 가능할지, 학기가 끝나고도 생각하여 수정해 보도록 하겠습니다.

```
//
//  ViewController.swift
//  Web
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
```
