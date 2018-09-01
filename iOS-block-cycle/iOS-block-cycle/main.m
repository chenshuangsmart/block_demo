//
//  main.m
//  iOS-block-cycle
//
//  Created by chenshuang on 2018/9/1.
//  Copyright © 2018年 wenwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // __weak：不会产生强引用，指向的对象销毁时，会自动让指针置为nil
        // __unsafe_unretained：不会产生强引用，不安全，指向的对象销毁时，指针存储的地址值不变
        
//        Person *person = [[Person alloc] init];
//        person.age = 100;
////        __weak typeof(person) weakPerson = person;
//        __unsafe_unretained typeof(person) weakPerson = person;
//        person.block = ^{
//            NSLog(@"age = %d",weakPerson.age);
//        };
        
        // 法三 __block
//        __block Person *person = [[Person alloc] init];
//        person.age = 10;
//        person.block = ^{
//            NSLog(@"age is %d", person.age);
//            person = nil;
//        };
//        person.block();
        
        // MRC环境下
        // MRC不支持__weak的
        __block Person *person = [[Person alloc] init];
        person.age = 10;
        person.block = ^{
            NSLog(@"age is %d", person.age);
        };
        [person release];
    }
    NSLog(@"end");
    return 0;
}
