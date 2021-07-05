//
//  AppDelegate.m
//  rs.ios.stage-task7
//
//  Created by Sergey Gomolko on 7/2/21.
//

#import "AppDelegate.h"
#import "XIBViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
  XIBViewController *rootVC = [[XIBViewController alloc] initWithNibName:@"XIBViewController" bundle:nil];
  //RSViewControllerXIB *rootVC = [[RSViewControllerXIB alloc] initWithNibName:@"RSViewControllerXIB" bundle:nil];
 // UIViewController *rootVC = [[UIViewController alloc] init];
 // RSViewControllerCode *rootVC = [[RSViewControllerCode alloc] init];
 // rootVC.view.backgroundColor = [UIColor whiteColor];
//  NSLog(@"isViewLoaded? =  %d", rootVC.isViewLoaded);
//  NSLog(@"-------------------");
//  rootVC.view;
//  NSLog(@"isViewLoaded? =  %d", rootVC.isViewLoaded);
//  NSLog(@"-------------------");
  
  
  [window setRootViewController:rootVC];
  
  self.window =window;
  [self.window makeKeyAndVisible];
  
 //    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20,20, 100, 100)];
 // view.backgroundColor = [UIColor blueColor];
//  [rootVC.view addSubview:view];
  
  [[UIView appearanceWhenContainedIn:[UIAlertController class], nil] setTintColor:[UIColor redColor]];
  return YES;
}


#pragma mark - UISceneSession lifecycle


//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//  // Called when a new scene session is being created.
//  // Use this method to select a configuration to create the new scene with.
//  return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//  // Called when the user discards a scene session.
//  // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//  // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
