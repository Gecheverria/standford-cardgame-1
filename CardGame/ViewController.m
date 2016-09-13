//
//  ViewController.m
//  CardGame
//
//  Created by Gabriel Enrique Echeverria Mira on 9/9/16.
//  Copyright © 2016 Gabriel Enrique Echeverria Mira. All rights reserved.
//

#import "ViewController.h"
#import "CGamePlayingCardDeck.h"
#import "CGameCard.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;

//Necesitamos un deck para poder jugar, por lo que lo creamos como un property
@property (strong, nonatomic) CGameDeck *deck;

@end

@implementation ViewController

//No podemos tenes un deck nulo, por lo que hay que iniciarlo mediante lazy instantiation. Iniciamos un PlayingCardDeck porque es ahi donde se genera las cartas a usar del deck.
- (CGameDeck *)deck {
    if (!_deck) _deck = [self createDeck];
    return _deck;
}

- (CGameDeck *)createDeck {
    return [[CGamePlayingCardDeck alloc] init];
}

- (void)setFlipCount:(int)flipCount {
    _flipCount = flipCount;
    self.flipsLabel.text= [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    if ([sender.currentTitle length]) {
        
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
        
    } else {
        //Una ves creado nuestro deck, creamos una nueva carta, que la extraemos del metodo drawRandomCard
        CGameCard *randomCard = [self.deck drawRandomCard];
        
        if (randomCard) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
            [sender setTitle:randomCard.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
    
}

@end
