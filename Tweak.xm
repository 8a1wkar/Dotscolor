// 
// Developer by 8a1wkar
// Twitter 8a1wkar_dev
// 2020 june 17

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <UIKit/UIControl.h>
#import <Cephei/HBPreferences.h>
#import <spawn.h>
#import "SparkColourPickerUtils.h"

%config(generator=internal)
%group Dotscolor

// Home screen
%hook _UILegibilitySettings

-(id) secondaryColor{
    NSString* colourString = NULL;
    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/gq.8a1wkar.dotscolor.plist"];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey: @"HomeScreen"];
    }

    UIColor* selectedColour = [SparkColourPickerUtils colourWithString: colourString withFallback: @"#ffffff"];

    return selectedColour;
}

%end


// Lock screen
%hook CSPageControl

-(id) _pageIndicatorColor{
    NSString* colourString = NULL;
    NSDictionary* preferencesDictionary = [NSDictionary dictionaryWithContentsOfFile: @"/var/mobile/Library/Preferences/gq.8a1wkar.dotscolor.plist"];
    if(preferencesDictionary)
    {
        colourString = [preferencesDictionary objectForKey: @"LockScreen"];
    }

    UIColor* selectedColour = [SparkColourPickerUtils colourWithString: colourString withFallback: @"#ffffff"];

    return selectedColour;
}

%end


%end
%ctor
{
  HBPreferences *Key = [[HBPreferences alloc] initWithIdentifier:@"com.apple.springboard"];
 bool Enable = [([Key objectForKey:@"isEnabled"] ?: @(NO)) boolValue];

if (Enable) {
 %init(Dotscolor);

}
}