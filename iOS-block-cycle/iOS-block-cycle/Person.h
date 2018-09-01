//
//  Person.h
//  iOS-block-cycle
//
//  Created by chenshuang on 2018/9/1.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CSBlock)(void);

@interface Person : NSObject
/** age*/
@property(nonatomic,assign)int age;
/** blokc*/
@property(nonatomic,copy) CSBlock block;
@end
