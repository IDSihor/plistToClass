//
//  BaseClass.h
//  plistToClass
//
//  Created by Ihor Hrynevych on 6/16/16.
//  Copyright © 2016 Ihor Hrynevych. All rights reserved.
//

#import <Foundation/Foundation.h>

#define isObjectOfClass(obj, cl) ([(obj) isKindOfClass:[cl class]])
// xCodeColor plugin from alcatraz
#define XCODE_COLORS_ESCAPE @"\033["
#define XCODE_COLORS_RESET_FG  XCODE_COLORS_ESCAPE @"fg;" // Clear any foreground color
#define XCODE_COLORS_RESET_BG  XCODE_COLORS_ESCAPE @"bg;" // Clear any background color
#define XCODE_COLORS_RESET     XCODE_COLORS_ESCAPE @";"   // Clear any foreground or background color

#define LogBlue(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg0,0,255;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogRed(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg255,0,0;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)
#define LogGreen(frmt, ...) NSLog((XCODE_COLORS_ESCAPE @"fg44,181,53;" frmt XCODE_COLORS_RESET), ##__VA_ARGS__)


@interface BaseClass : NSObject

@property (nonatomic, strong) NSString *propertyName;

-(NSString*) propertyValuesInterface;
-(id) initWithValue:(id) value propertyName:(NSString*) propertyName withParentObject:(BaseClass*) parent plist:(NSString*) plist;

@property (nonatomic, strong) NSDictionary *types;
@property (nonatomic, strong) id value;
@property (nonatomic, strong) NSString *interface;
@property (nonatomic, strong) NSString *className;
@property (nonatomic, strong) NSString *path;
@property (nonnull, strong) NSString *plistName;

@property (nonatomic, strong) NSString *implementation;
@property (nonatomic, strong) NSString *plistOriginalName;

@end
