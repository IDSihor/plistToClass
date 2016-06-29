//
//  String.m
//  plistToClass
//
//  Created by Ihor Hrynevych on 6/16/16.
//  Copyright © 2016 Ihor Hrynevych. All rights reserved.
//

#import "String.h"

@implementation String

-(id) initWithValue:(NSString*) value propertyName:(NSString*) propertyName withParentObject:(id) parent {
    self = [super initWithValue:value propertyName:propertyName withParentObject:parent ];
    if (self) {
        self.className = @"NSString";
    }
    return self;
}

-(NSString*) implementation {
    NSString *imp = [NSString stringWithFormat:@"-(NSString*) %@ {\n  return @\"%@\";\n}\n", self.propertyName, ((NSString*)self.value)];
    return imp;
}

-(NSString*) propertyValuesInterface {
    return [NSString stringWithFormat:@"    @property (nonatomic, strong) NSString *%@;", self.propertyName];
}

@end
