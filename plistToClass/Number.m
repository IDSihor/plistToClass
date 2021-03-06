//
//  Number.m
//  plistToClass
//
//  Created by Ihor Hrynevych on 6/16/16.
//  Copyright © 2016 Ihor Hrynevych. All rights reserved.
//

#import "Number.h"

@implementation Number

-(id) initWithValue:(NSNumber*) value propertyName:(NSString*) propertyName withParentObject:(id) parent plist:(NSString *)plist{
    self = [super initWithValue:value propertyName:propertyName withParentObject:parent plist:plist ];
    if (self) {
        self.className = @"NSNumber";
    }
    return self;
}

-(NSString*) implementation {
    NSString *imp = [NSString stringWithFormat:@"-(NSNumber*) %@ {\n  return @(%@);\n}\n", self.propertyName, ((NSNumber*)self.value).stringValue];
    return imp;
}

-(NSString*) propertyValuesInterface {
    return [NSString stringWithFormat:@"    @property (nonatomic, strong) NSNumber *%@;", self.propertyName];
}

@end
