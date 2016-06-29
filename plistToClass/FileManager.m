//
//  FileManager.m
//  plistToClass
//
//  Created by Ihor Hrynevych on 6/16/16.
//  Copyright © 2016 Ihor Hrynevych. All rights reserved.
//

#import "FileManager.h"
#import "PlistObject.h"

@interface FileManager ()

@property (nonatomic, strong) PlistObject *plist;
@property (nonatomic, strong) NSMutableString *interface;

@end

@implementation FileManager

-(id) initWithObject:(PlistObject*) plist {
    self = [super init];
    if (self) {
        self.plist = plist;
        self.interface = [NSMutableString new];
    }
    return self;
}

-(void) startWithInterface {
    
}

@end
