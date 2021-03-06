//
//  ModuleProgressHUD.h
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

#import <Foundation/Foundation.h>
#import <SVProgressHUD/SVProgressHUD.h>
#import <MBProgressHUD/MBProgressHUD.h>


@interface ModuleProgressHUD : NSObject

+ (instancetype)module;

- (NSDictionary *)configuration;
	
+ (void)autoConfigure;
	
@end

// MARK: - SVProgressHUD

@interface SVProgressHUD (Additions)

/**
 SHOW ERROR STATUS WITH A STRING USING C PRINTG-STYLE FORMATTING

 @param format format string
 */
+ (void)showErrorWithFormatStatus:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

/**
 SHOW SUCCESS STATUS WITH A STRING USING C PRINTG-STYLE FORMATTING

 @param format format string
 */
+ (void)showSuccessWithFormatStatus:(NSString *)format, ... NS_FORMAT_FUNCTION(1, 2);

/**
 SHOW HUD WHEN IT'S VISIBLE

 @param format format string
 */
+ (void)tryToShowErrorWithFormatStatus:(NSString *)format, ... NS_FORMAT_FUNCTION(1,2);

/**
 SHOW A MESSAGE WITH AUTO DISMISSION

 @param message message string
 @param seconds seconds to display
 */
+ (void)showMessage:(NSString *)message withDelay:(NSInteger)seconds;

/**
 SHOW AN AUTO DISMISSED PROGRESS HUD WITH DISPLAY DURATION

 @param seconds secounds to display
 */
+ (void)showProgressHideAfter:(NSInteger)seconds;

/**
 SHOW A NETWORKING FAILED ERROR PROGRESS HUD
 */
+ (void)showErrorNetworkFailure;

@end


// MARK: - MBProgressHUD

@interface MBProgressHUD (Additions)

/**
 SHOW A HINT ON BOTTOM OF SCREEN

 @param format format string
 */
+ (void)showHintAtBottomWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1, 2);

/**
 SHOW A HINT ON CENTER OF SCREEN

 @param format format string
 */
+ (void)showHintAtCenterWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1, 2);

/**
 SHOW SUCCESS STRING WITH MBProgressHUD

 @param format format string
 */
+ (void)showSuccessWithFormat:(NSString *)format, ... NS_FORMAT_FUNCTION(1, 2);

/**
 SHOW SUCCESS WITH MBProgressHUD, TITLE AND SUBTITLE

 @param title title string
 @param subtitle subtitle string
 */
+ (void)showSuccessWithTitle:(NSString *)title subtitle:(NSString *)subtitle;

/**
 SHOW A NETWORKING FAILED ERROR MB PROGRESS HUD
 */
+ (void)showErrorNetworkFailure;

@end
