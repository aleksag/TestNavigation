//
//  CommunityDetailView.m
//  TestNavigation
//
//  Created by Aleksander Grande on 11/23/10.
//  Copyright 2010 Trasig. All rights reserved.
//

#import "CommunityDetailView.h"

@implementation CommunityDetailView

@synthesize nameLabel;
@synthesize urlButton;
@synthesize model;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/
- (id) initWithModel:(CommunityModel*) mod{
	[self init];
	self.model = mod;
	return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	nameLabel.text = self.model.name;
	self.title = self.model.name;
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

-(IBAction) urlClicked{
	NSURL* url = [NSURL URLWithString:self.model.url];//[[NSURL alloc] URL: urlButton.titleLabel.text];
	if(![[UIApplication sharedApplication] openURL:url])
		NSLog(@"%@%@",@"Failed to open url:",[url description]);
}

- (void)dealloc {
	[nameLabel release];
	[urlButton release];
	[model release];
    [super dealloc];
}


@end
