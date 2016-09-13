//
//  CGamePlayingCard.m
//  CardGame
//
//  Created by Gabriel Enrique Echeverria Mira on 9/12/16.
//  Copyright © 2016 Gabriel Enrique Echeverria Mira. All rights reserved.
//

#import "CGamePlayingCard.h"

@implementation CGamePlayingCard

//Sobreescribimos la propiedad contents de CGameCard
-(NSString *) contents {
    
    NSArray *rankStrings = [CGamePlayingCard rankStrings];
    //los self.ranky self.suit vienen de sus getters, que son llenados en el playingcarddeck.
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
    
}

//A continuacion 3 metodos de clase, que son principalmente de utilidad para definir valores
+ (NSArray *)validSuits {
    return @[@"♠︎",@"♣︎",@"♥︎",@"♦︎"];
}

+ (NSArray *)rankStrings {
    return @[@"?",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRanks {
    return [[self rankStrings] count] - 1;
}

//Debemos sintetizar suit porque sobreescribimos su getter y setter
@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit {
    if ([[CGamePlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *) setSuit {
    return _suit ? _suit :@"?";
}

- (void)setRank:(NSUInteger)rank {
    if (rank <= [CGamePlayingCard maxRanks]) {
        _rank = rank;
    }
}

@end
