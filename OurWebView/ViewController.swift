//
//  ViewController.swift
//  OurWebView
//
//  Created by Abhijit singh on 17/04/23.
//

import UIKit
import WebKit
//WebKit is a framework that displays properly-formatted webpages based on their markup. Apple Safari depends on WebKit, and so do many mobile browsers (since WebKit is highly portable and customizable).



class ViewController: UIViewController {
    
    
    let webView : WKWebView = {
        
        let prefs = WKWebpagePreferences()
        prefs.allowsContentJavaScript = true
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = prefs
        let webView = WKWebView(frame : .zero, configuration:configuration)
        
        return webView
    }()
    
    //    by default the webiew doesnt enable javascript we need to specify configuration for our web view
    override func viewDidLoad() {
        super.viewDidLoad()
                        //        "subviews" means the views which are holding by the curent view. For example, you have a view (will call it as MyView) which include a button. Button is a view too (UIButton is a kind of view). So, MyView is superview for the button. Button is a subview for MyView.
        view.addSubview(webView)
        
        
        guard let url = URL(string : "https://iosacademy.io")else{
            return
        }
        
        webView.load(URLRequest(url :url))
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5){
            self.webView.evaluateJavaScript("document.body.innerHTML"){ result,error in
                guard let html = result as? String, error == nil else{
                    return
                }
                print(html)
            }
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    
}

