//
//  CommunityModel.h
//  TestNavigation
//
//  Created by Aleksander Grande on 11/23/10.
//  Copyright 2010 Trasig. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CommunityModel : NSObject {
	NSString *name;
	NSString *url;
	NSString *imagePath;
}

@property (copy,nonatomic) NSString *name;
@property (copy,nonatomic) NSString *url;
@property (copy,nonatomic) NSString *imagePath;


@end
