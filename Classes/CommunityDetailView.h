//
//  CommunityDetailView.h
//  TestNavigation
//
//  Created by Aleksander Grande on 11/23/10.
//  Copyright 2010 Trasig. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommunityModel.h"

@interface CommunityDetailView : UIViewController {
	IBOutlet UILabel* nameLabel;
	IBOutlet UIButton* urlButton;
}

@property (retain) UILabel* nameLabel;
@property (retain) UIButton* urlButton;
@property (retain) CommunityModel* model;
-(IBAction) urlClicked;
- (id) initWithModel:(CommunityModel*) mod;

@end
