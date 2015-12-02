//
//  AppDelegate.swift
//  Pager
//
//  Created by Lucas Oceano on 12/03/2015.
//  Copyright (c) 2015 Cheesecake. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
		self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
		let viewController = ViewController()
		let navController = UINavigationController(rootViewController: viewController)
		navController.navigationBar.topItem?.title = "Pager"
		navController.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "Tab #7", style: .Plain, target: viewController, action: Selector("changeTab"))
		navController.navigationBar.hideBottomHairline()
		
		self.window!.rootViewController = navController
		self.window?.makeKeyAndVisible()
		
		UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]  // Title's text color
		UINavigationBar.appearance().shadowImage = UIImage()
		UINavigationBar.appearance().barTintColor = UIColor(rgb: 0x00AA00)
		UINavigationBar.appearance().tintColor = UIColor.whiteColor()
		
		UIApplication.sharedApplication().statusBarStyle = .LightContent
		
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}


extension UINavigationBar {
	
	func hideBottomHairline() {
		let navigationBarImageView = hairlineImageViewInNavigationBar(self)
		navigationBarImageView!.hidden = true
	}
	
	func showBottomHairline() {
		let navigationBarImageView = hairlineImageViewInNavigationBar(self)
		navigationBarImageView!.hidden = false
	}
	
	private func hairlineImageViewInNavigationBar(view: UIView) -> UIImageView? {
		if view.isKindOfClass(UIImageView) && view.bounds.size.height <= 1.0 {
			return (view as! UIImageView)
		}
		
		let subviews = (view.subviews as [UIView])
		for subview: UIView in subviews {
			if let imageView: UIImageView = hairlineImageViewInNavigationBar(subview) {
				return imageView
			}
		}
		
		return nil
	}
	
}
