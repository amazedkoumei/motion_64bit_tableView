# -*- coding: utf-8 -*-
class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    rootViewController = UINavigationController.new.tap do |nav|
      MainTableViewController.new.tap do |v|
        nav.initWithRootViewController(v)
      end
    end
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = rootViewController
    @window.makeKeyAndVisible
    true
  end
end
