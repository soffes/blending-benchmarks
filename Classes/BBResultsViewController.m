//
//  BBResultsViewController.m
//  Blending Benchmarks
//
//  Created by Sam Soffes on 4/2/12.
//  Copyright (c) 2012 Sam Soffes. All rights reserved.
//

#import "BBResultsViewController.h"
#import "SSBenchmarker.h"

@interface BBResultsViewController () <SSBenchmarkerDelegate>
- (void)_benchmark;
@end


@implementation BBResultsViewController {
	NSArray *_results;
	UIProgressView *_progressView;
}


#pragma mark - UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_results = [[NSMutableArray alloc] init];
	
	// Progress view
	_progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleBar];
	self.navigationItem.titleView = _progressView;
	
	[self _benchmark];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	// iPad supports all orientations
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
		return YES;
	}
	
	// iPhone supports all orientations except portrait upside down
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - Private

- (void)_benchmark {
	CGImageRef image = CGImageRetain([UIImage imageNamed:@"rings.png"].CGImage);
	size_t width = CGImageGetWidth(image);
	size_t height = CGImageGetHeight(image);
	size_t bitsPerComponent = CGImageGetBitsPerComponent(image);
	size_t bytesPerRow = CGImageGetBytesPerRow(image);
	CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
	CGBitmapInfo bitmapInfo = kCGImageAlphaPremultipliedFirst; //CGImageGetBitmapInfo(image);
	CGRect rect = CGRectMake(0.0f, 0.0f, width, height);
	
	SSBenchmarker *benchmarker = [[SSBenchmarker alloc] init];
	benchmarker.delegate = self;
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeNormal);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Normal"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeMultiply);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Multiply"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeScreen);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Screen"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeOverlay);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Overlay"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeDarken);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Darken"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeLighten);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Lighten"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeColorDodge);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Color Dodge"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeColorBurn);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Color Burn"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeSoftLight);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Soft Light"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeHardLight);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Hard Light"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeDifference);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Difference"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeExclusion);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Exclusion"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeHue);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Hue"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeSaturation);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Saturation"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeColor);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Color"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeLuminosity);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Luminosity"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeClear);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Clear"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModeCopy);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Copy"];
	
//	kCGBlendModeSourceIn,
//	kCGBlendModeSourceOut,
//	kCGBlendModeSourceAtop,
//	kCGBlendModeDestinationOver,
//	kCGBlendModeDestinationIn,
//	kCGBlendModeDestinationOut,
//	kCGBlendModeDestinationAtop,
//	kCGBlendModeXOR,
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModePlusDarker);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Plus Darker"];
	
	[benchmarker addTask:^{
		CGContextRef context = CGBitmapContextCreate(NULL, width, height, bitsPerComponent, bytesPerRow, colorSpace, bitmapInfo);
		CGContextDrawImage(context, rect, image);
		CGContextSetBlendMode(context, kCGBlendModePlusLighter);
		CGContextDrawImage(context, rect, image);
		CGContextRelease(context);
	} withIdentifier:@"Plus Lighter"];
	
	CGColorSpaceRelease(colorSpace);
	CGImageRelease(image);
	
	[benchmarker run];
}


#pragma mark - UITableViewDataSource

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
    
	SSBenchmark *benchmark = [_results objectAtIndex:indexPath.row];
	cell.textLabel.text = benchmark.identifier;
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%.03f ms", benchmark.mean];
    
    return cell;
}


#pragma mark - SSBenchmarkerDelegate

- (void)benchmarker:(SSBenchmarker *)benchmarker didUpdateProgress:(CGFloat)progress {
	dispatch_async(dispatch_get_main_queue(), ^{
		_progressView.progress = progress;
	});
}


- (void)benchmarker:(SSBenchmarker *)benchmarker didStartTaskWithIdentifier:(NSString *)identifier {
	NSLog(@"Started: `%@`", identifier);
}


- (void)benchmarker:(SSBenchmarker *)benchmarker didFinishTaskWithBenchmark:(SSBenchmark *)benchmark {
	NSMutableArray *working = _results.mutableCopy;
	[working addObject:benchmark];
	
	_results = [working sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
		double mean1 = [obj1 mean];
		double mean2 = [obj2 mean];
		
		if (mean1 < mean2) {
			return NSOrderedDescending;
		} else if (mean1 > mean2) {
			return NSOrderedAscending;
		}
		
		return NSOrderedSame;
	}];
	
	dispatch_async(dispatch_get_main_queue(), ^{
		[self.tableView reloadData];
	});
	
	NSLog(@"Completed: `%@` — Mean: %0.3f", benchmark.identifier, benchmark.mean);
}


- (void)benchmarkerDidFinish:(SSBenchmarker *)benchmarker {
	dispatch_async(dispatch_get_main_queue(), ^{
		self.navigationItem.titleView = nil;
		_progressView = nil;
		self.title = @"Results";
		[self.tableView flashScrollIndicators];
	});
}

@end
