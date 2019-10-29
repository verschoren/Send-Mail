//
//  main.m
//  Send SMS
//
//  Created by Thomas Verschoren on 09/03/16.
//  Copyright © 2016 Thomas Verschoren. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <AppleScriptObjC/AppleScriptObjC.h>

int main(int argc, const char * argv[]) {
    [[NSBundle mainBundle] loadAppleScriptObjectiveCScripts];
    return NSApplicationMain(argc, argv);
}
