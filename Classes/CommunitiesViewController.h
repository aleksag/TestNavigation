//
//  CommunitiesViewController.h
//  TestNavigation
//
//  Created by Aleksander Grande on 11/23/10.
//  Copyright 2010 Trasig. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CommunitiesViewController : UIViewController 
{

}
- (IBAction)javaBin;
- (IBAction)scalaBin;
@property (assign) id <UITableViewDataSource> dataSource;
@end
