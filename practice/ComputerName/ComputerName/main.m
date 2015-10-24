//
//  main.m
//  ComputerName
//
//  Created by Osbert Orr on 7/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSHost *host = [NSHost currentHost];
        NSString *computerName = [host localizedName];
        NSLog(@"computerName pointer address %p", computerName);
        NSLog(@"computerName is %@", computerName);
    }
    /*
    char *teststring = (char *)malloc(sizeof(char)*5);
    teststring = "hellorasdfdsaf";
    printf("string = %s\n", teststring);
    free(teststring);
    teststring = NULL;
     */
    char teststring[] = "hello";
    char teststring2[] = "bye";
    char *testptr = teststring;
    printf("memaddress of testptr = %p\n", &testptr);
    printf("memaddress of what testptr points to = %p\n", testptr);
    
    testptr = teststring2;
    
    
    
    return 0;
}
