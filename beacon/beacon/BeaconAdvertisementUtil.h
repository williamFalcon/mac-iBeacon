//
//  Beacon.h
//  beacon
//
//  Created by William Falcon on 10/30/16.
//  Copyright © 2016 HAC Studios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BeaconAdvertisementUtil : NSObject

@property (strong,nonatomic) NSUUID *proximityUUID;
@property (assign,nonatomic) uint16_t major;
@property (assign,nonatomic) uint16_t minor;
@property (assign,nonatomic) int8_t measuredPower;

- (id)initWithProximityUUID:(NSUUID *)proximityUUID
                      major:(uint16_t)major
                      minor:(uint16_t)minor
              measuredPower:(int8_t)power;


- (NSDictionary *)beaconAdvertisement;

@end
