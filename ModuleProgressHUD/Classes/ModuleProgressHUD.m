//
//  ModuleProgressHUD.m
//  LUO YU
//
//  CREATED BY LUO Yu ON 2013-07-23.
//	Email: indie.luo@gmail.com
//
//	The MIT License (MIT)
//
//	Copyright (c) 2013~2018 骆昱(Luo Yu). All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy of
//	this software and associated documentation files (the "Software"), to deal in
//	the Software without restriction, including without limitation the rights to
//	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//	the Software, and to permit persons to whom the Software is furnished to do so,
//	subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//	FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//	COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//	IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "ModuleProgressHUD.h"


NSString *const LIB_PROGRESSHUD_BUNDLE_ID = @"org.cocoapods.ModuleProgressHUD";
NSString *const NAME_CONF_PROGRESS_HUD = @"conf-progress-hud"; // SHOUND NOT BE CHANGED

@implementation ModuleProgressHUD
	
+ (void)autoConfigure {
	
	NSString *confpath;
	
	confpath = [[NSBundle mainBundle] pathForResource:NAME_CONF_PROGRESS_HUD ofType:@"plist"];
	
	if (confpath == nil ||
		[confpath isEqualToString:@""] == YES ||
		[[NSFileManager defaultManager] fileExistsAtPath:confpath] == NO) {
		
		NSLog(@"ModuleProgressHUD WARNING\n\tAPP CONFIGURATION FILE WAS NOT FOUND.\n\t%@", confpath);
		
		// FALLBACK TO LIB DEFAULT
		confpath = [[NSBundle bundleWithIdentifier:LIB_PROGRESSHUD_BUNDLE_ID] pathForResource:NAME_CONF_PROGRESS_HUD ofType:@"plist"];
	}
	
	// TRY TO READ APP CONFIGURATION
	NSDictionary *conf = [NSDictionary dictionaryWithContentsOfFile:confpath];
	
	if (conf == nil) {
		NSLog(@"ModuleProgressHUD ERROR\n\tCONFIGURATION FILE WAS NEVER FOUND.");
	}
	
	// NSLog(@"%@", conf);
	
	// CONFIGURE HUD STYLE
	[SVProgressHUD setDefaultStyle:[conf[@"sv-default-style"][@"conf-value"] integerValue]];
	[SVProgressHUD setDefaultMaskType:[conf[@"sv-default-mask-type"][@"conf-value"] integerValue]];
	[SVProgressHUD setMinimumDismissTimeInterval:[conf[@"sv-default-min-dismiss-interval"][@"conf-value"] doubleValue]];
}

+ (id)confValueFor:(NSString *)valueKey {
	
	if (valueKey == nil
		|| [valueKey isKindOfClass:[NSString class]] == NO
		|| [valueKey isEqualToString:@""]) {
		// NOT PASSED VALIDATION
		return nil;
	}
	
	NSString *confpath;
	
	confpath = [[NSBundle mainBundle] pathForResource:NAME_CONF_PROGRESS_HUD ofType:@"plist"];
	
	if (confpath == nil
		|| [confpath isEqualToString:@""] == YES
		|| [[NSFileManager defaultManager] fileExistsAtPath:confpath] == NO) {
		
		NSLog(@"ModuleProgressHUD WARNING\n\tAPP CONFIGURATION FILE WAS NOT FOUND.\n\t%@", confpath);
		
		// FALLBACK TO LIB DEFAULT
		confpath = [[NSBundle bundleWithIdentifier:LIB_PROGRESSHUD_BUNDLE_ID]
					pathForResource:NAME_CONF_PROGRESS_HUD ofType:@"plist"];
	}
	
	// TRY TO READ APP CONFIGURATION
	NSDictionary *conf = [NSDictionary dictionaryWithContentsOfFile:confpath];
	
	if (conf == nil) {
		NSLog(@"ModuleProgressHUD ERROR\n\tCONFIGURATION FILE WAS NEVER FOUND.");
	}
	
	return conf[valueKey][@"conf-value"];
}

@end

@implementation SVProgressHUD (Additions)
	
// SHOW ERROR STATUS WITH A STRING USING C PRINTF-STYLE FORMATTING
+ (void)showErrorWithFormatStatus:(NSString *)format, ... {
	
	va_list args;
	id ret;
	
	va_start(args, format);
	if (format == nil) {
		ret = nil;
	} else {
		ret = [[NSString alloc] initWithFormat:format arguments:args];
	}
	
	va_end(args);
	
	if (ret != nil) {
		[SVProgressHUD showErrorWithStatus:ret];
	} else {
		[SVProgressHUD showErrorWithStatus:@""];
	}
}
	
// SHOW SUCCESS STATUS WITH A STRING USING C PRINTG-STYLE FORMATTING
+ (void)showSuccessWithFormatStatus:(NSString *)format, ... {
	
	va_list args;
	id ret;
	
	va_start(args, format);
	if (format == nil) {
		ret = nil;
	} else {
		ret = [[NSString alloc] initWithFormat:format arguments:args];
	}
	
	va_end(args);
	
	if (ret != nil) {
		[SVProgressHUD showSuccessWithStatus:ret];
	} else {
		[SVProgressHUD showSuccessWithStatus:@""];
	}
	
}
	
// SHOW HUD WHEN IT'S VISIBLE
+ (void)tryToShowErrorWithFormatStatus:(NSString *)format, ... {
	
	va_list args;
	id ret;
	
	va_start(args, format);
	if (format == nil) {
		ret = nil;
	} else {
		ret = [[NSString alloc] initWithFormat:format arguments:args];
	}
	
	va_end(args);
	
	if (ret != nil && [SVProgressHUD isVisible]) {
		[SVProgressHUD showErrorWithStatus:ret];
	} else if ([SVProgressHUD isVisible]) {
		[SVProgressHUD showErrorWithStatus:@""];
	} else {
		// DO NOTHING
	}
	
}
	
+ (void)showMessage:(NSString *)message withDelay:(NSInteger)seconds {
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[SVProgressHUD showImage:nil status:message];
	});
}

+ (void)showProgressHideAfter:(NSInteger)seconds {
	[SVProgressHUD show];
	
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(seconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[SVProgressHUD dismiss];
	});
}

+ (void)showErrorNetworkFailure {
	[SVProgressHUD showErrorWithStatus:[ModuleProgressHUD confValueFor:@"sv-networking-failure-message"]];
}
	
@end
