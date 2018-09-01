//
//  main.m
//  iOS-block-__block的本质
//
//  Created by chenshuang on 2018/9/1.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

// 定义一个block
typedef void (^CSBlock) (void);

// block内部实现
struct __Block_byref_age_0 {
    void *__isa;
    struct __Block_byref_age_0 *__forwarding;
    int __flags;
    int __size;
    int age;
};

struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
    void (*copy)(void);
    void (*dispose)(void);
};

struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    struct __Block_byref_age_0 *age;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        __block int age = 10;
//        CSBlock block = ^{
//            age = 20;
//            NSLog(@"age is %d", age);
//        };
//        struct __main_block_impl_0 *blockImpl = (__bridge struct __main_block_impl_0 *)block;
//        NSLog(@"%p", &age);
        
        // 演示被__block修饰的变量类型
        // 1.有__weak修饰
//        CSBlock block;
//        {
//            Person *person = [[Person alloc] init];
//            __block Person *weakPerson = person;
//            block = ^ {
//                NSLog(@"%p",weakPerson);
//            };
//        }
//        block();
        
        // 2.没有__weak修饰
//        CSBlock block;
//        {
//            Person *person = [[Person alloc] init];
//            __block Person *weakPerson = person;
//            block = ^ {
//                NSLog(@"%p",weakPerson);
//            };
//        }
//        block();
        
        // 3.MRC环境下
        Person *person = [[Person alloc] init];
        
        CSBlock block = [^{
            NSLog(@"%p", person);
        } copy];
        
        [person release];
        
        block();
        
        [block release];
    }
    return 0;
}
