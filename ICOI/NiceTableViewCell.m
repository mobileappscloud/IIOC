//
//  NiceTableViewCell.m
//  FindItClose
//
//  Created by iMac on 7/18/14.
//  Copyright (c) 2014 CongenialApps. All rights reserved.
//

#import "NiceTableViewCell.h"

@implementation NiceTableViewCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self applyEditingModeBackgroundViewPositionCorrections];
}


/**
 When using a backgroundView or selectedBackgroundView on a custom UITableViewCell
 subclass, iOS7 currently has a bug where tapping the Delete access control reveals
 the Delete button, only to have the background cover it up again! Radar 14940393 has
 been filed for this. Until solved, use this method in your Table Cell's layoutSubviews
 to correct the behavior.
 
 This solution courtesy of cyphers72 on the Apple Developer Forum, who posted the
 working solution here: https://devforums.apple.com/message/873484#873484
 */
- (void)applyEditingModeBackgroundViewPositionCorrections {
    if (!self.editing) { return; } // BAIL. This fix is not needed.
    
    // Assertion: we are in editing mode.
    
    // Do we have a regular background view?
    if (self.backgroundView) {
        // YES: So adjust the frame for that:
        CGRect backgroundViewFrame = self.backgroundView.frame;
        backgroundViewFrame.origin.x = 0;
        self.backgroundView.frame = backgroundViewFrame;
    }
    
    // Do we have a selected background view?
    if (self.selectedBackgroundView) {
        // YES: So adjust the frame for that:
        CGRect selectedBackgroundViewFrame = self.selectedBackgroundView.frame;
        selectedBackgroundViewFrame.origin.x = 0;
        self.selectedBackgroundView.frame = selectedBackgroundViewFrame;
    }
}

@end
