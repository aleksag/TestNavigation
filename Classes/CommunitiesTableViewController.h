//
//  CommunitiesTableViewController.h
//  TestNavigation
//
//  Created by Aleksander Grande on 11/23/10.
//  Copyright 2010 Trasig. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CommunitiesTableViewController : UITableViewController {
	NSMutableDictionary * communities;
	NSArray	*sections;
}
@property (retain) NSMutableDictionary *communities;
@property (retain) NSArray *sections;
@end
