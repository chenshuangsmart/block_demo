//
//  main.m
//  iOS-block-copy
//
//  Created by chenshuang on 2018/9/1.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义一个block
typedef void(^CSBlock)(void);

// 定义一个返回blcok的函数
CSBlock myBlock() {
    int age = 10;
    return ^{
        NSLog(@"age = %d",age);
    };
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        // 1.block作为函数返回值
//        CSBlock block = myBlock();
//        block();
//        NSLog(@"%@",[block class]);
        
        // 2.block有被强指针引用
        // ARC - 环境下 block - __NSMallocBlock__
        // MRC - 环境下 block - __NSStackBlock__
        int age = 10;
        CSBlock block = ^{
            NSLog(@"---------%d", age);
        };
        NSLog(@"%@", [block class]);
        
        // 3.block作为Cocoa API中方法名含有usingBlock的方法参数时
        NSArray *array = [NSArray array];
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
        }];
        
        // 4.block作为GCD API的方法参数时
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
        });
    }
    return 0;
}
