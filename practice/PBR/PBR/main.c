//
//  main.c
//  PBR
//
//  Created by Osbert Orr on 7/10/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>
#include <math.h>

void metersToFeetAndInches(double meters, unsigned int *ftPtr, double *inPtr) {
        // This function assumes meters i non-negative.
    
    // Convert the numebr of meters into a floating-point number of feet
    double rawFeet = meters * 3.281; // e.g. 2.4536
    
    // How many complete feet as an unsigned int?
    double dFeet;
    modf(rawFeet, &dFeet);
    unsigned int feet = (unsigned int) dFeet;
    
    // Store the number of feet at the supplied address
    if(ftPtr) {
        printf("Storing %u to the address %p\n", feet, ftPtr);
        *ftPtr = feet;
    }
    
    // Calculate inches
    double fractionalFoot = rawFeet - feet;
    double inches = fractionalFoot * 12.0;
    
    // Store the number of inches at the supplied address
    if(inPtr) {
        printf("Storing %.2f to the address %p\n", inches, inPtr);
        *inPtr = inches;
    }
}

int main(int argc, const char * argv[]) {
    double meters = 3.0;
    unsigned int feet;
    double inches;
    
    metersToFeetAndInches(meters, &feet, &inches);
    printf("%.1f meters is equal to %d feet and %.1f inches.", meters, feet, inches);
    
    return 0;
}
