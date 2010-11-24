//
//  CommunitiesTableViewController.m
//  TestNavigation
//
//  Created by Aleksander Grande on 11/23/10.
//  Copyright 2010 Trasig. All rights reserved.
//

#import "CommunitiesTableViewController.h"
#import "CommunityDetailView.h"

@implementation CommunitiesTableViewController

@synthesize communities, sections;

- (NSMutableDictionary *) communities
{
	if(!communities){
		NSURL *communitiesUrl = [NSURL URLWithString:@"http://grande.cc/javascripttest/communities.plist"];
		//NSURL *communitiesUrl = [NSURL URLWithString:@"http://cs193p.stanford.edu/vocabwords.txt"];
		communities = [[NSMutableDictionary dictionaryWithContentsOfURL:communitiesUrl] retain];
	}
	return communities;
}


- (NSArray *)sections
{
	if(!sections){
		sections = [[[self.communities allKeys] sortedArrayUsingSelector:@selector(compare:)] retain];
	}
	return sections;
}
#pragma mark -
#pragma mark Initialization

/*
- (id)initWithStyle:(UITableViewStyle)style {
    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    if ((self = [super initWithStyle:style])) {
    }
    return self;
}
*/


#pragma mark -
#pragma mark View lifecycle

/*
- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
*/

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return self.sections.count;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	NSArray *communitiesInSection = [self.communities objectForKey:[self.sections objectAtIndex:section]];
    return communitiesInSection.count;
}

- (NSString *)communityAtIndexPath:(NSIndexPath *)indexPath{
	NSArray *communitiesInSection = [self.communities objectForKey:[self.sections objectAtIndex:indexPath.section]];
	return [[communitiesInSection objectAtIndex:indexPath.row] objectForKey:@"name"];
}

- (NSString *)urlAtIndexPath:(NSIndexPath *)indexPath{
	NSArray *communitiesInSection = [self.communities objectForKey:[self.sections objectAtIndex:indexPath.section]];
	return [[communitiesInSection objectAtIndex:indexPath.row] objectForKey:@"url"];
}
- (NSString *)imageAtIndexPath:(NSIndexPath *)indexPath{
	NSArray *communitiesInSection = [self.communities objectForKey:[self.sections objectAtIndex:indexPath.section]];
	return [[communitiesInSection objectAtIndex:indexPath.row] objectForKey:@"imageurl"];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CommunityViewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		//cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyle reuseIdentifier:CellIdentifier] autorelease];
		UIImage * img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[self imageAtIndexPath:indexPath]]]];
		cell.imageView.image = img; 
		[img release];
    }
    
    // Configure the cell...
    cell.textLabel.text = [self communityAtIndexPath:indexPath];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger) section
{
	return [self.sections objectAtIndex:section];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
	CommunityModel* model = [[CommunityModel alloc] init];
	model.name = [self communityAtIndexPath:indexPath];
	model.url = [self urlAtIndexPath:indexPath];
	model.imagePath = [self imageAtIndexPath:indexPath];
	
	CommunityDetailView *communityView = [[CommunityDetailView alloc] initWithModel:model];
	[self.navigationController pushViewController:communityView animated:YES];
	
	[model release];
	[communityView release];
	
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	[communities release];
	[sections release];
    [super dealloc];
}


@end

