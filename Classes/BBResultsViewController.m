//
//  BBResultsViewController.m
//  Blending Benchmarks
//
//  Created by Sam Soffes on 4/2/12.
//  Copyright (c) 2012 Sam Soffes. All rights reserved.
//

#import "BBResultsViewController.h"

@implementation BBResultsViewController {
	NSArray *_results;
}

#pragma mark UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
		
	// Indicator
	UIActivityIndicatorViewStyle indicatorStyle = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? UIActivityIndicatorViewStyleGray : UIActivityIndicatorViewStyleWhite;
	UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:indicatorStyle];
	[indicator startAnimating];
	self.navigationItem.titleView = indicator;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		return YES;
	}
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_results count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *const cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
//	NSDictionary *result = [_results objectAtIndex:indexPath.row];
//	cell.textLabel.text = [result objectForKey:JBLibraryKey];
//	cell.detailTextLabel.text = [NSString stringWithFormat:@"%.03f ms", [[result objectForKey:JBAverageTimeKey] floatValue]];
    
    return cell;
}

@end
