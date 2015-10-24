//
//  main.c
//  TimeTest
//
//  Created by Osbert Orr on 7/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>
#include <time.h>

int main(int argc, const char * argv[]) {
    long currentTime = time(NULL);
    
    long futureTime = currentTime + 4000000;
    struct tm future;
    
    localtime_r(&futureTime, &future);
    
    printf("Future date is %d-%d-%d\n", future.tm_year + 1990, future.tm_mon, future.tm_mday);
    return 0;
}
