//
//  main.m
//  iOS-block-auto-variable
//
//  Created by chenshuang on 2018/9/1.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

typedef void (^MJBlock)(void);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        MJBlock block;
        {
            Person *person1 = [[Person alloc] init];
            person1.age = 10;
            person1.name = @"person1";
            
            Person *person2 = [[Person alloc] init];
            person2.age = 100;
            person2.name = @"person2";
            
            Person *person3 = [[Person alloc] init];
            person3.age = 1000;
            person3.name = @"person3";

            __weak Person *weakPerson = person2;
            __strong Person *strongPerson = person3;
            
            // 测试1.block被强指针引用,在堆上
            block = ^{  // 因为该block已经被强引用,所以此时在堆上
                NSLog(@"---------%d", person1.age);
                NSLog(@"---------%d", weakPerson.age);
                NSLog(@"---------%d", strongPerson.age);
            };
            
            // 测试2,block没有被强指针引用,在栈上
            ^{  // 因为该block已经被强引用,所以此时在堆上
                NSLog(@"---------%d", person1.age);
                NSLog(@"---------%d", weakPerson.age);
                NSLog(@"---------%d", strongPerson.age);
            };
            
            NSLog(@"end");
        }
        NSLog(@"------");
    }
    return 0;
}
