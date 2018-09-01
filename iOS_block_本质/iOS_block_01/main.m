//
//  main.m
//  iOS_block_01
//
//  Created by chenshuang on 2018/8/29.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

struct __main_block_desc_0 {
    size_t reserved;
    size_t Block_size;
};

struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};

// block底层结构体
struct __main_block_impl_0 {
    struct __block_impl impl;
    struct __main_block_desc_0* Desc;
    int age;
};

// 1.block结构体
void test1() {
    int age = 10;
    
    // 定义block
    void(^block)(int, int) = ^(int a, int b){
        NSLog(@"this is a block! -- %d", age);
        NSLog(@"a = %d, b = %d",a,b);
    };
    
    struct __main_block_impl_0 *blockStruct = (__bridge struct __main_block_impl_0 *)block;
    block(100,200);
}

// 2.捕获变量类型
void (^block)(void);
void blockTest() {
    int age = 10;
    static int height = 10;
    
    block = ^ {
        NSLog(@"age is %d, height is %d", age, height);
    };
    
    age = 20;
    height = 20;
}

// 3.block的继承
void blockClassSuper() {
    // __NSGlobalBlock__ : __NSGlobalBlock : NSBlock : NSObject
    void (^block)(void) = ^ {
        NSLog(@"Hello");
    };
    NSLog(@"%@", [block class]);
    NSLog(@"%@", [[block class] superclass]);
    NSLog(@"%@", [[[block class] superclass] superclass]);
    NSLog(@"%@", [[[[block class] superclass] superclass] superclass]);
}

// 4.block的类型
int weight = 100;
void blockClassType() {
    
    // 堆：动态分配内存,需要程序员申请申请，也需要程序员自己管理内存
    static int age = 10;
    // 局部static变量
    int height = 10;
    
    // Global：没有访问auto变量
    void(^block1)(void) = ^ {
        NSLog(@"block1");
    };
    // Globa2：访问static变量
    void(^block2)(void) = ^ {
        NSLog(@"block2 - age = %d",age);
    };
    // Globa3：访问全局变量
    void(^block3)(void) = ^ {
        NSLog(@"block3 - weight = %d",weight);
    };
    
    // Stack：访问了auto变量
    void (^block4)(void) = ^{
        NSLog(@"block4 - height = %d", height);
    };
    
    // NSMallocBlock - 对StackBlock做copy操作
    block = [^{
        NSLog(@"block---------%d", height);
    } copy];
    [block release];
    
    NSLog(@"%@ %@ %@ %@ %@",
          [block1 class],
          [block2 class],
          [block3 class],
          [block4 class],
          [block class]
    );
}

// 5.数据存储位置
int age = 100;
void dataLocationTest() {
    int a = 10;
    
    NSLog(@"数据段：age %p", &age);
    NSLog(@"栈：a %p", &a);
    NSLog(@"堆：obj %p", [[NSObject alloc] init]);
    NSLog(@"数据段：class %p", [Person class]);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        // 1. block结构体
//        test1();
        
        // 2. 捕获变量类型
//        blockTest();
//        block();
        
        // 3.block的继承
//        blockClassSuper();
        
        // 4.block的类型
//        blockClassType();
        
        // 5.数据存储位置
        dataLocationTest();
    }
    return 0;
}
