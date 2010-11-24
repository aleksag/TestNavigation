//
//  CommunitiesViewController.m
//  TestNavigation
//
//  Created by Aleksander Grande on 11/23/10.
//  Copyright 2010 Trasig. All rights reserved.
//

#import "CommunitiesViewController.h"
#import "CommunityDetailView.h"

@implementation CommunitiesViewController

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Communities" ofType:@"plist"];
	NSMutableDictionary* communitiesDict = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
	NSLog(communitiesDict.description);
    [super viewDidLoad];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (void) showDetailedView:(NSString*)communityName
{
	CommunityDetailView *communityView = [[CommunityDetailView alloc] init];
	[self.navigationController pushViewController:communityView animated:YES];

	[communityView.nameLabel setText:communityName];
	[communityView.urlButton setText:@"http://knowit.no"];
	communityView.title = @"tittel";
	[communityView release];
}

- (IBAction)javaBin
{
	[self showDetailedView: @"javaBin"];
}

- (IBAction)scalaBin
{
	[self showDetailedView: @"scalaBin"];
}



@end
