//
//  Person.m
//  iOS-block-auto-variable
//
//  Created by chenshuang on 2018/9/1.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc {
    NSLog(@"Person - name = %@ dealloc",self.name);
}
@end
