//
//  ViewController.m
//  beacon
//
//  Created by William Falcon on 10/30/16.
//  Copyright © 2016 HAC Studios. All rights reserved.
//

#import "ViewController.h"
#import "BeaconAdvertisementUtil.h"
@import CoreBluetooth;
@import IOBluetooth;

@interface ViewController () <CBPeripheralManagerDelegate>
@property (nonatomic,strong) CBPeripheralManager *manager;
@property (nonatomic,strong) BeaconAdvertisementUtil *beaconData;
@property (weak) IBOutlet NSTextField *uuidLabel;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _manager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                       queue:nil];
    
    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}

- (IBAction)transmit:(NSButton *)sender {
    bool isOn = sender.state == 1;
    self.uuidLabel.alphaValue = sender.state;

    if (isOn) {
        [_manager startAdvertising:self.beaconData.beaconAdvertisement];
    }else {
        [_manager stopAdvertising];
    }
}


- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    
    NSString *uuid = @"E2C56DB5-DFFB-48D2-B060-D0F5A71096E0";
    
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        
        NSUUID *proximityUUID = [[NSUUID alloc] initWithUUIDString:uuid];
        
        self.beaconData = [[BeaconAdvertisementUtil alloc] initWithProximityUUID:proximityUUID
                                                                                               major:1
                                                                                               minor:1
                                                                                       measuredPower:-59];
        self.uuidLabel.stringValue = [NSString stringWithFormat:@"UUID: %@", uuid];
        self.uuidLabel.alphaValue = 0.0;
        
        
    }
}


@end
