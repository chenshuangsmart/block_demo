//
//  Person.m
//  iOS-block-__block的本质
//
//  Created by chenshuang on 2018/9/1.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "Person.h"

@implementation Person
- (void)dealloc {
    [super dealloc];
    NSLog(@"%s",__func__);
}
@end
