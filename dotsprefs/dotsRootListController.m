#include "dotsRootListController.h"

#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed: 0.25 green: 0.66 blue: 0.96 alpha: 1.00];

@implementation dotsRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Dots" target:self];
	}

	return _specifiers;
}

- (void)viewDidLoad {
  [super viewDidLoad];

UIImageView *iconImage = [[UIImageView alloc]
      initWithImage:
          [UIImage imageWithContentsOfFile:@"/Library/PreferenceBundles/"
                                           @"dotsprefs.bundle/icon.png"]];

self.navigationController.navigationItem.titleView = iconImage;

iconImage.contentMode = UIViewContentModeScaleAspectFit;

}

- (instancetype)init {
    self = [super init];
    
    if (self) {
HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];

       

appearanceSettings.tableViewCellSeparatorColor = [UIColor clearColor];

appearanceSettings.tintColor = UIColorFromRGB(0xB24592);

self.hb_appearanceSettings = appearanceSettings;

appearanceSettings.navigationBarBackgroundColor = [UIColor colorWithRed: 0.96 green: 0.33 blue: 0.80 alpha: 1.00];

    }
    
    return self;
}

- (void)respring {
pid_t pid;
    const char* args[] = {"killall", "backboardd", NULL};
    posix_spawn(&pid, "/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
}

- (void)twitter {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/8a1wkar_dev"] options:@{} completionHandler:nil];
}

- (void)github {
[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/8a1wkar/dotscolor"] options:@{} completionHandler:nil];
}

@end
