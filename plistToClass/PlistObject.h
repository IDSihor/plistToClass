//
//  PlistObject.h
//  plistToClass
//
//  Created by Ihor Hrynevych on 6/16/16.
//  Copyright © 2016 Ihor Hrynevych. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseClass.h"

@interface PlistObject : BaseClass

@property (nonatomic , strong) NSMutableArray *properties;//fullInterface
@property (nonatomic , strong) NSString *fullInterface;
@property (nonatomic , strong) NSString *fullImplementation;


@end
