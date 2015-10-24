//
//  main.c
//  Coolness
//
//  Created by Osbert Orr on 7/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>
#include <readline/readline.h>

int main(int argc, const char * argv[]) {
    printf("Who is cool? ");
    const char *name = readline(NULL);
    printf("%s is cool!\n\n", name);
    return 0;
}
