//
//  Person.h
//  iOS-block-auto-variable
//
//  Created by chenshuang on 2018/9/1.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
/** age*/
@property(nonatomic,assign)int age;
/** name*/
@property(nonatomic,strong)NSString *name;
@end
