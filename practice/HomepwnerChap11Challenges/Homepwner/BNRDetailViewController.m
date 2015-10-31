//
//  BNRDetailViewController.m
//  Homepwner
//
//  Created by Osbert Orr on 10/26/15.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface BNRDetailViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIView  *overlayCrossHairView;

@end

@implementation BNRDetailViewController
- (UIView *)overlayCrossHairView {
    if (!_overlayCrossHairView) {
        [[NSBundle mainBundle] loadNibNamed:@"OverlayCrosshairView" owner:self options:nil];
    }
    
    return _overlayCrossHairView;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.valueField.keyboardType = UIKeyboardTypeNumberPad;
    self.valueField.returnKeyType = UIReturnKeyDone;
    BNRItem *item = self.item;
    
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    
    // You need an NSDateFormatter that will turn a date into a simple date string
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    // Use filtered NSDate object to set dateLabel contents
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    NSString *itemKey = self.item.itemKey;
    
    // Get the image for its image key from the image store
    UIImage *imageToDisplay = [[BNRImageStore sharedStore] imageForKey:itemKey];
    
    // Use that image to put on the screen in the imageView
    self.imageView.image = imageToDisplay;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Clear first responder
    [self.view endEditing:YES];
    
    // "Save" changes to item
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}

- (void)setItem:(BNRItem *)item {
    _item = item;
    self.navigationItem.title = _item.itemName;
}

- (IBAction)takePicture:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    // If the device has a camera, take a picture, otherwise,
    // just pick from the photo library
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSArray *availableTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera];
        
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = availableTypes;
        CGRect imagePickerBounds = imagePicker.view.bounds;
        CGRect overlayCrosshairFrame = self.overlayCrossHairView.frame;
        overlayCrosshairFrame.origin.x = (imagePickerBounds.size.width / 2) - (overlayCrosshairFrame.size.width / 2);
        overlayCrosshairFrame.origin.y = (imagePickerBounds.size.height / 2) - (overlayCrosshairFrame.size.height / 2);
        
        self.overlayCrossHairView.frame = overlayCrosshairFrame;
        imagePicker.cameraOverlayView = self.overlayCrossHairView;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.allowsEditing = YES;
    imagePicker.delegate = self;
    
    // Place image picker on the screen
    [self presentViewController:imagePicker animated:YES completion:NULL];
}

- (void)video: (NSString *) videoPath didFinishSavingWithError: (NSError *) error contextInfo: (void *) contextInfo {
    [[NSFileManager defaultManager] removeItemAtPath:videoPath error:nil];
    NSLog(@"Video Saving Error: %@", error);
    NSLog(@"error = %@", [error localizedDescription]);
    NSLog(@"finished writing mediainfo to camera album");
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image;
    NSURL *mediaURL = info[UIImagePickerControllerMediaURL];
    
    if(mediaURL) {
        NSLog(@"mediaURL1");
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum([mediaURL path])) {
            UISaveVideoAtPathToSavedPhotosAlbum([mediaURL path], self, @selector(video:didFinishSavingWithError:contextInfo:), nil);
        }
    }
    
    if (info[UIImagePickerControllerEditedImage]) {
        image = info[UIImagePickerControllerEditedImage];
    } else {
        image = info[UIImagePickerControllerOriginalImage];
    }
    
    // Store the image in BNRImageStore for this key
    [[BNRImageStore sharedStore] setImage:image forKey:self.item.itemKey];
    
    // Put that image onto the screen in our image view
    self.imageView.image = image;
    
    // Take image picker off the screen -
    // you must call this dismiss method
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)clearPicture:(id)sender {
    [[BNRImageStore sharedStore] deleteImageForKey:self.item.itemKey];
    self.imageView.image = nil;
}

@end
