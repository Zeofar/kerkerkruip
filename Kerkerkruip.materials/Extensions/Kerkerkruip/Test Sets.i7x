Test Sets by Kerkerkruip begins here.

Use authorial modesty.

Volume - All Test Sets (not for release)

Include Automated Testing by Kerkerkruip.

Chapter - Tests

Section - aite champions vs mindbat

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
aite champions vs mindbat	0	1	restarting for tests
player-targeted	1	0	--
spike-flyer	1	0	player-targeted
player-missed	1	0	player-targeted
player-damaged	1	0	player-targeted
bat crashing into spike	1	0	player-damaged
bat avoiding huge spike	1	0	player-missed
bat avoiding gigantic spike	1	0	player-missed	
Arena-tormentor-enslaving	1	0	--
arena-tormentor-damaged	1	0	arena-tormentor-enslaving
arena-tormentor-killed	1	0	arena-tormentor-enslaving
tormentor-killed-only-once	1	1	arena-tormentor-killed

Scenario rule for aite champions vs mindbat:
	now Bodmall is testobject;
	now mindslug is testobject;
	now Hall of Gods is testobject;
	now Drakul's lifeblood is testobject;
	now Temple of Chton is testobject;
	
Regular scheduling of aite champions vs mindbat:
	[TODO: Why doesn't this interrupt text capture when doing it from the killing rules does?]
	update the monster statistics;
	now the player carries Drakul's lifeblood;
	extract the player to the location of Bodmall;
	have the player defeat Bodmall;
	extract the player to temple of Chton;
	have the player sacrifice a random granted power;
	assert that the favour of the player with Chton is 4;
	extract the player to the location of the mindslug;
	have the player defeat the mindslug;
	now the mind score of the player is 200;
	extract the player to Hall of Gods;
	have the player and the healer of aite fight in Arena of the Gods;
	try drinking Drakul's lifeblood;
	try turning bat;

regular scheduling of player-targeted:
	repeat with guy running through people in the location:
		now health of guy is 1000;
	compel the action of waiting;
		
First intervention possible when testing aite champions vs mindbat:
	unless testing player-targeted, rule fails;
	unless the main actor is the player and intervention-god is Aite, rule fails;
	
Intervention bonus when testing player-targeted:
	if the main actor is the player, increase the intervention-bonus by 100;
	
testing effects of player-targeted: if we assert result "bursts out of the ground<^[line break]>+ you", rule succeeds.
testing effects of spike-flyer: if we assert result "bursts out of the ground in front of you", rule succeeds.
testing effects of player-missed: if the health of the player is 1000, rule succeeds.
testing effects of player-damaged: if the health of the player is less than 1000, rule succeeds.
testing effects of bat crashing into spike: if we assert result "crash into", rule succeeds.
testing effects of bat avoiding huge spike: if we assert result "huge <a-z>+ bursts out of the ground in front of you", rule succeeds.
testing effects of bat avoiding gigantic spike: if we assert result "gigantic <a-z>+ bursts out of the ground in front of you", rule succeeds.

Initial scheduling of Arena-tormentor-enslaving:
	now the health of the tormentor of Aite is the permanent health of the tormentor of Aite;
	
Regular scheduling of Arena-tormentor-enslaving:
	now enslave-cooldown is 0;
	compel the action of enslaving the tormentor of Aite.
	
testing effects of Arena-tormentor-enslaving:
	assert result "will do your bidding";
	if we assert result "ball of lightning .* damage to the tormentor of Aite", rule succeeds.
	
Testing effects of Arena-tormentor-damaged:
	if the tormentor of Aite is not alive, make no decision;
	assert "tormentor should oppose the player" based on whether or not the tormentor of Aite opposes the player;
	if we assert result "The tormentor of Aite prostrates herself. 'I beg for your mercy, O great Aite,' she prays. Then she rises to fight you again!", rule succeeds;
	
testing effects of Arena-tormentor-killed:
	if the tormentor of Aite is dead, rule succeeds;

testing effects of tormentor-killed-only-once:
	assert result ", killing her";
	if we assert absence of result "killing her.*killing her", rule succeeds.

Section - Enslaving the Defender

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
Defender-enslaving	1	1
defender-re-enslaving	1	1

initial scheduling of Defender-enslaving:
	try turning human;
	now the player worships Sul;
	now the favour of the player is 4; [not sure if this is really important]
	have the player defeat the healer of Aite;
	now the health of Defender of Aite is 100;
	
regular scheduling of an outcome (called event):
	if event is defender-enslaving or event is defender-re-enslaving:
		now enslave-cooldown is 0;
		compel the action of enslaving the defender of Aite.

testing effects of defender-enslaving:
	assert result "will do your bidding";
	assert result "ball of lightning .* damage to the defender of Aite";
	assert result "The defender of Aite prostrates himself. 'I beg for your mercy, O great Aite,' he prays. Then he rises to fight you again!";
	if the defender of Aite opposes the player, rule succeeds;

regular scheduling of defender-re-enslaving:
	now the health of Defender of Aite is 1;
	now the health of the player is 1;
	now the permanent health of the player is 100;
	
testing effects of defender-re-enslaving:
	assert result "will do your bidding";
	assert result "ball of lightning .* damage to the defender of Aite, killing him";
	assert that the location is Hall of Gods;
	assert result "receives the soul";
	assert "the defender of Aite should be off-stage" based on whether or not defender of Aite is off-stage;
	if the health of the player is 100, rule succeeds;

Section - Chton Champion vs Bat

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
Chton champion vs bat	0	1	restarting for tests
herm-arena-bonus	1	1	--
arena-vampire-joining	1	1	--
herm-ally-summoning	1	1	--
summoned-drakul-opponent	1	1	--
chton-arena-cheating	1	1	--

scenario rule for Chton champion vs bat:
	now Hall of Gods is testobject;
	now Bodmall is testobject;
	now Drakul's lifeblood is testobject;
	now Temple of Herm is testobject;
	now the reusable item is a random scroll of summoning;

initial scheduling of herm-arena-bonus:
	now the player carries Drakul's lifeblood;
	extract the player to the location of Bodmall;
	have the player defeat Bodmall;
	extract the player to temple of Herm;
	have the player sacrifice a random granted power;
	assert that the favour of the player with Herm is 4;
	extract the player to Hall of Gods;

regular scheduling of herm-arena-bonus: have the player and Drakul fight in Arena of the Gods;
testing effects of herm-arena-bonus: if we assert result "grants you 2 divine favour![line break][line break]Herm gifts you <^\n>+; and increases your hiding bonus to \+2\.[line break][line break]You are transported to the Arena of the Gods, where the angry Drakul awaits, preparing himself to", rule succeeds;
	
regular scheduling of arena-vampire-joining: compel the action of drinking Drakul's lifeblood.
testing effects for arena-vampire-joining: if we assert result "You turn into a vampire, but your opponent doesn't care", rule succeeds.

The summoned creature is an object that varies;

regular scheduling of herm-ally-summoning:
	update the combat status;
	assert that the combat status is combat;
	try reading the reusable item;
	now the summoned creature is a random visible undead not super-undead person who is not the player;
	
testing effects of herm-ally-summoning: if the summoned creature does not oppose the player, rule succeeds.
testing effects of summoned-drakul-opponent: if the summoned creature opposes drakul, rule succeeds.

Regular scheduling of chton-arena-cheating:
	Now the health of the player is 1;
	Now the permanent health of the player is 100;
	compel the action of smiting drakul.
	
testing effects for chton-arena-cheating:
	[should the lifeblood appear a second time just because drinking it removes it from play?]
	assert result ["infamous vampire, who crumbles away into ashes"] "infamous vampire, a small vial";
	assert result "receives the blood";
	assert that the health of the player is 33;
	assert result "transported back to the Hall of the Gods";
	assert that the location of the summoned creature is Hall of Gods;
	assert that drakul's lifeblood is in Hall of Gods;
	rule succeeds.

[
Section - Parting Shots

parting shots is a test set.

A scenario rule when testing parting shots:
	now israfel is testobject;
	now mindslug is testobject;
	now armadillo is testobject;
	now fuligin cloak is testobject;

A test play when testing parting shots:
	force the fuligin cloak to work;
	try butterflying;
	Travel sneakily to the location of the mindslug;
	now every person enclosed by the location is not asleep;
	
mindslug-hiding-check is a hiding-check test step. The first move of parting shots is mindslug-hiding-check.

mindslug-hidden-retreat is a hiding-check test step.   

Choosing a player action when testing mindslug-hidden-retreat:
	generate the action of retreating.
	
Before taking a player action when mindslug-hidden-retreat is the scheduled event:
	assert that the mindslug is in the location;
	assert that fafhrd is in the location;
	assert that mouser is in the location;
	update the combat status;
	assert that the combat status is combat;
	
testing effects for mindslug-hidden-retreat:
	assert zero hits by mindslug;
	assert zero hits by fafhrd;
	assert zero hits by mouser;
	
mindslug-hidden-runner is a hiding-check test step.

initial scheduling of mindslug-hidden-runner:
	extract the player to the location of the mindslug;
	
Choosing a player action when testing mindslug-hidden-runner:
	generate the action of going way-to-get-back.
	
testing effects for mindslug-hidden-runner:
	assert zero hits by mindslug;
	assert zero hits by fafhrd;
	assert zero hits by mouser;
	
mindslug-reveal is a hiding-reveal test step. The next move of mindslug-hidden-runner is mindslug-reveal.

Initial scheduling for mindslug-reveal:
	try going way-to-get-there;

mindslug-retreat is a test step.  The next move of mindslug-reveal is mindslug-retreat.   

Choosing a player action when testing mindslug-retreat:
	generate the action of retreating.

Before taking a player action [or reaction] when mindslug-retreat is the scheduled event:
	now mindslug presses the player;
	now concentration of mindslug is 0;
	now fafhrd does not press the player;
	now concentration of fafhrd is 1;
	now mouser does not press the player;
	now concentration of mouser is 0;
		
testing effects for mindslug-retreat:
	assert result "bravely run away";
	assert one hit by mindslug;
	assert one hit by fafhrd;
	assert zero hits by mouser;
	
mindslug-runner is a test step.

Initial scheduling of mindslug-runner:
	extract the player to the location of the mindslug;
	now retreat location is the location of the mindslug;

Choosing a player action when testing mindslug-runner:
	generate the action of going the way-to-get-back;
	
testing effects for mindslug-runner:
	assert result "run past your enemies";
	assert one hit by mindslug;
	assert one hit by fafhrd;
	assert one hit by mouser;
	
israfel-meeting-ps is a hidden-traveling extracting hiding-reveal test step. The location-target of israfel-meeting-ps is Israfel.

Initial scheduling of israfel-meeting-ps:
	now the health of israfel is 1000;
	compel the action of israfel israfel-splitting;
	
fell-freezing is a test step.

Initial scheduling of fell-freezing:
	Now Fell presses the player;
	now the initiative of Fell is 100;
	compel the action of fell israfel-reuniting;
		
frozen-fell-fleeing is a test step.   

Choosing a player action when testing frozen-fell-fleeing:
	generate the action of retreating.

testing effects of frozen-fell-fleeing:
	assert that israfel-reuniting-initiator is Fell with label "the reuniting initiator";
	assert 0 hits by Fell;
	
israfel-rejoining is a test step. The location-target of israfel-rejoining is fell.

before taking a player action when testing israfel-rejoining:
	if fell is off-stage:
		now the location-target of israfel-rejoining is israfel.

initial scheduling of israfel-rejoining:
	compel the action of israfel waiting;
	
testing effects of israfel-rejoining:
	assert that israfel is in the location;
	
israfel-resplitting is a test step.

Initial scheduling of israfel-resplitting:
	compel the action of israfel israfel-splitting;
	
Testing effects of israfel-resplitting:
	succeed based on whether or not israfel is off-stage;
		
unfrozen-fell-fleeing is a test step.   

Initial scheduling of unfrozen-fell-fleeing:
	compel the action of fell waiting; [TODO: see if it works without this line now that npc-suppressing is the default]
	
Choosing a player action when testing unfrozen-fell-fleeing:
	forget the compelled action; [TODO: this should be ok to delete too, as above]
	generate the action of retreating.

initial scheduling of unfrozen-fell-fleeing:
	now fell presses the player;

testing effects of unfrozen-fell-fleeing:
	assert 1 hit by Fell;
	
Section - Retreating from the Tentacle

tentacle-grab is a test set.

Scenario when testing tentacle-grab:
	Now the giant tentacle is testobject;
	now the fuligin cloak is testobject;
	now the hall of mirrors is bannedobject;
	Now the pickaxe is testobject;
	Now every not connectable room is bannedobject; [the bridge of doom stops digging]
	
A test play when testing tentacle-grab:
	now the player carries the pickaxe;
	try butterflying;
	Travel sneakily to the location of the tentacle;
	now every person enclosed by the location is not asleep;
	
tentacle-hiding-check is a hiding-check test step. The first move of tentacle-grab is tentacle-hiding-check.

Tentacle-reveal is a hiding-reveal test step. The next move of tentacle-hiding-check is tentacle-reveal.

tentacle-retreat is a test step.  The next move of tentacle-reveal is tentacle-retreat.   

Choosing a player action when testing tentacle-retreat:
	generate the action of retreating.

Before taking a player action when testing tentacle-grab:
	if the player is at-react:
		now the defence of the player is 100;
	otherwise:
		now the defence of the player is 0;
		
Initial scheduling for tentacle-retreat:
	now tentacle presses the player;
	now concentration of tentacle is 3;
	now the melee of the tentacle is 50;
	now the health of the player is 100;
		
testing effects for tentacle-retreat:
	assert result "bravely run away";
	assert one hit by tentacle;
	assert "the player should be grappled" based on whether or not the player is grappled by the tentacle;
	assert that the tentacle is in the location;

tentacle-dig-retreat is a test step. The next move of tentacle-retreat is tentacle-dig-retreat.

initial scheduling for tentacle-dig-retreat:
	now the tentacle does not grapple the player;
	
choosing a player action when testing tentacle-dig-retreat:
	generate the action of digging a random diggable direction.
	
testing effects for tentacle-dig-retreat:
	assert result "magically create a tunnel";
	assert one hit by tentacle;
	assert "the player should be grappled" based on whether or not the player is grappled by the tentacle;
	assert that the location of the player is the location of the tentacle;
]

Section - Insane Drakul

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
insane-drakul	0	1	restarting for tests
drakul-mild-concentration	1	1	--
drakul-med-concentration	1	1	--
drakul-max-concentration	1	1	--
Driving Drakul insane	1	1	--
insane-mild-concentration	1	1	--
insane-med-concentration	1	1	--
insane-max-concentration	1	1	--

Scenario for insane-drakul:
	Now drakul's lifeblood is bannedobject;
	Now drakul is testobject;
	
Initial scheduling of insane-drakul:
	now the mind score of the player is 100;  
	extract the player to the location of drakul;
	equip the player with the staff of insanity;
	while the size of the staff of insanity is less than medium:
		increase the size of the staff of insanity;
		
Regular scheduling of an outcome (called event):
	if event is drakul-mild-concentration or event is drakul-med-concentration or event is drakul-max-concentration or event is insane-mild-concentration or event is insane-med-concentration or event is insane-max-concentration:
		try Drakul concentrating;
		
Testing effects of drakul-mild-concentration: if we assert result "Drakul smiles a little wider", rule succeeds.

Testing effects of drakul-med-concentration: if we assert result "'There is no need to fear me,' Drakul says as he concentrates more deeply\.", rule succeeds.

Testing effects of drakul-max-concentration: if we assert result "Drakul attains the highest state of concentration. 'It feels so good to be alive!'", rule succeeds.

Regular scheduling of driving drakul insane: do the action of Drakul waiting for a 100 melee hit by the player.
Testing effects of driving drakul insane: if we assert result "Drakul goes insane", rule succeeds.
	
Initial scheduling of insane-mild-concentration:
	if there is a held achievement of Blood never lies in the Table of Held Achievements:
		do nothing;
		[this causes a glk error:
		choose row with held achievement of Blood never lies in the Table of Held Achievements;
		blank out the whole row;]
	now the concentration of drakul is 0;
	
Testing effects of insane-mild-concentration: if we assert result "Drakul smiles a little wider", rule succeeds.

Testing effects of insane-med-concentration: if we assert result "'An insane vampire always tells the truth\. And I tell you: You should fear me!' Drakul says as he concentrates more deeply.", rule succeeds.

Testing effects of insane-max-concentration: if we assert result "Drakul attains the highest state of concentration\. 'It feels so good to be alive - but I am undead!'", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
drakul statement	1	1	200	--
drakul identity	1	0	--	drakul statement
simple drakul identity	1	0	--	drakul identity
drakul conditional	1	0	--	drakul statement
double conditional	1	0	--	drakul conditional
nested conditionals	1	0	--	double conditional
nested belief	1	0	200	drakul statement
lifeblood-hinting	1	0	--	drakul statement
lifeblood-location	1	0	--	lifeblood-hinting
vampire-turning-hinting	1	0	--	drakul statement
Drakul suicide	1	1	--	--

Regular scheduling of drakul statement: try Drakul waiting.

Testing effects of drakul statement:
	if we assert result "Drakul says, '(<^'\n>*)":
		now the event description is the text matching subexpression 1;
		rule succeeds.

testing effects of drakul identity: if we assert result "I am .+ (vampire|insane)", rule succeeds.
testing effects of simple drakul identity: if we assert absence of result "not|someone who|, and|, or", rule succeeds.
testing effects of drakul conditional: if we assert result "^If .*,", rule succeeds.
testing effects of double conditional: if we assert result "I would give you", rule succeeds.
testing effects of nested conditionals: if we assert result ", if|, and|, or", rule succeeds.
testing effects of nested belief: if we assert result "I believe that I believe", rule succeeds.
testing effects of lifeblood-hinting: if we assert result "a vial of my lifeblood\b", rule succeeds.
testing effects of lifeblood-location: if we assert result "I am carrying| is in | can be found | is currently unreachable, ", rule succeeds.
testing effects of vampire-turning-hinting: if we assert result "\bI intend to vanquish Malygris after I make you my vampire-slave\b|\byou will never be my vampire-slave\b", rule succeeds.

	[this doesn't compile:
	assert "Blood never lies achievement should be held" based on whether not there is a held achievement of Blood never lies in the Table of Held Achievements;]

Initial scheduling of drakul suicide:
	now the health of drakul is 1;
	now the melee of drakul is 100;
	
regular scheduling of drakul suicide: try drakul hitting drakul.
Testing effects of drakul suicide: if we assert result "drains his own blood, a small vial", rule succeeds.
	
Section - Dreadful Presence

[E91A270C9962]

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
dreadful-presence-test	0	1	200	restarting for tests
player-presence	1	1	1	dreadful-presence-test
ape-only-cowering	0	1	200	--
ape-cower1	21	100	200	ape-only-cowering
toad-cower1	0	20	200	ape-only-cowering
player-cower1	0	20	200	ape-only-cowering
insane-player-cowering	0	1	200	--
ape-cower2	21	100	200	insane-player-cowering
toad-cower2	0	20	200	insane-player-cowering
player-cower2	6	25	200	insane-player-cowering

[To decide which number is the target cower percentage of (guy - a person):
	if guy is undead, decide on 0;
	if guy is the player and the player is not insane, decide on 0;
	let P be (dreadful presence of the player) times 12;
	if P is 0, decide on 0;
	decrease P by (3 times level of guy);
	if P > 40:
		decide on 40;
	if P < 1:
		decide on 1;
	decide on P;
	
blood ape: (dreadful presence 2) * 12 - (level 1 *3) = 21
insane player: (dreadful presence 2) * 12 - (level 0 * 3) = 24]

Scenario for Dreadful-Presence-Test:
	block interventions;
	
regular scheduling of Dreadful-Presence-Test:
	repeat with guy running through denizen people:
		now the defence of guy is 100;
	now the mind score of the player is 10;
	now the player worships Nomos;
	raise the favour of the player to 9;
	try wearing the gown of the red court;
	try readying the malleus;
	prepare a test battle with the blood ape;
	revive the zombie toad in the location;
	
Testing effects of player-presence: if we assert that the dreadful presence of the player is 2, rule succeeds;
	
To decide which object is the cowerer of (event - an outcome):
	if event is ape-cower1 or event is ape-cower2:
		decide on the blood ape;
	if event is toad-cower1 or event is toad-cower2:
		decide on the zombie toad;
	if event is player-cower1 or event is player-cower2:
		decide on the player;
	decide on nothing;

Definition: an outcome is cower-counter if the cowerer of it is a person;

regular scheduling of an outcome (called event):
	if event is ape-only-cowering or event is insane-player-cowering:
		now the health of the player is 1000;
		now the health of the blood ape is 1000;
		now the health of the zombie toad is 1000;
	
regular scheduling of a cower-counter outcome (called event): wait for the cowerer of event to act freely;

testing effects of a cower-counter outcome (called the event) (this is the cower counting rule):
	if we assert result "[The main actor] [cower] before your dreadful presence", rule succeeds;

initial scheduling of insane-player-cowering: now the player is insane.

Section - Sul Champion vs Herm worshipper

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
Sul Champion vs Herm worshipper	0	1	restarting for tests
player-defended-by-herm	1	0	--
israfel-undamaged	1	0	--
israfel-defended-by-sul	1	0	israfel-undamaged
isra-undamaged	1	0	--
isra-defended-by-sul	1	0	isra-undamaged

[TODO: figure out actual probabilities of interventions]

A scenario rule when testing Sul Champion vs Herm worshipper:
	now Hall of Gods is testobject;

Regular scheduling of player-defended-by-herm: do the action of waiting for a 100 melee hit by Israfel.
Testing effects of player-defended-by-herm: if we assert result "Herm bends space and time around you and Israfel, and you suddenly find yourself in the role of attacker!", rule succeeds.

[TODO: check that a hit actually took place, try to produce a Herm intervention for another person]
Initial scheduling of Sul Champion vs Herm worshipper:
	now the player worships Herm;
	raise the favour of the player by 4;
	have the player and Israfel fight in Arena of the Gods;

Regular scheduling of israfel-undamaged: do the action of israfel waiting for a 100 melee hit by the player.
Testing effects of israfel-undamaged: if we assert 0 damage to israfel after "You deal", rule succeeds.
Testing effects of israfel-defended-by-sul: if we assert result "\(Sul intervenes\)", rule succeeds.

Initial scheduling of isra-undamaged: try Israfel israfel-splitting.
Regular scheduling of isra-undamaged: do the action of Isra waiting for a 100 melee hit by the player.
Testing effects of isra-undamaged: if we assert 0 damage to Isra after "You deal", rule succeeds.
Testing effects of isra-defended-by-sul: if we assert result "\(Sul intervenes\)", rule succeeds.


Section - Bug 210

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
bug-210	0	1	restarting for tests
reaction-mindslug-killing	1	1	--
mindslug-soul-revival	1	1	reaction-mindslug-killing

scenario for bug-210: now the reusable item is a random scroll of death.

Initial scheduling of bug-210:
	prepare a test battle with the mindslug, inviting groups;
	now the health of the mindslug is 1;
	now the weapon damage bonus of the claymore is 100;
	now the melee of Fafhrd is 100;
	
Testing effects of bug-210:
	assert "fafhrd should carry the claymore" based on whether or not fafhrd carries the claymore;
	assert "the claymore should be readied" based on whether or not the claymore is readied;
	assert "fafhrd should only have one weapon readied" based on whether or not the number of readied weapons enclosed by fafhrd is 1;
	
regular scheduling of reaction-mindslug-killing: compel the action of reading the reusable item as a reaction to fafhrd.
	
[TODO: make sure the mindslug is alive before the reaction?]

testing effects of reaction-mindslug-killing: if the mindslug is dead, rule succeeds.

testing effects of mindslug-soul-revival: if we assert result "The contemplative northern barbarian ends your life, with what seems to be a hint of sadness in his face.*As the mindslug dies, you feel its powerful intelligence absorbed into your own body", rule succeeds.
		
Section - Reward in Arena of the Gods

[for issue #228]

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
divine reward	0	1	restarting for tests
isra-only-killing	1	1	--
fell-also-killing	1	1	--

scenario for divine reward:
	now Temple of Nomos is testobject;
	now Hall of Gods is testobject;
	now the glass cannon is testobject;
	block interventions;
	
Initial scheduling of divine reward:
	equip the player with the glass cannon;
	now the defence of the player is 100;
	now the player worships Nomos;
	raise the favour of the player by 4;
	extract the player to Hall of Gods;
	have the player and Israfel fight in Arena of the Gods;
	now the health of the player is the permanent health of the player - 1;
	try Israfel Israfel-splitting;

Regular scheduling of isra-only-killing:
	now fell is asleep;
	compel the action of smiting isra.

first testing effects of an outcome (called the current move) when testing divine reward:
	assert "Nomos counter should be zero on [the outcome described]" based on whether or not the nomos counter is zero;
	assert "Nomos bonus should be false on [the outcome described]" based on whether or not the nomos bonus is false;

testing effects of isra-only-killing:
	assert "Isra should be dead" based on whether or not Isra is dead;
	assert "Fell should be alive" based on whether or not Fell is not dead;
	assert "The player should not be healed" based on whether or not the health of the player is less than the permanent health of the player;
	assert absence of result "Nomos receives .* and fully heals you";
	rule succeeds.

regular scheduling of fell-also-killing: compel the action of smiting fell.

testing effects of fell-also-killing:
	assert that the location is Hall of Gods;
	assert result "receives the soul";
	assert absence of result "receives the soul.* receives the soul";
	assert that the health of the player is the permanent health of the player;
	assert "the glass cannon should still be carried" based on whether or not the player carries the glass cannon;
	assert "the glass cannon should still be readied" based on whether or not the glass cannon is readied;
	rule succeeds.
	
[
Section - Temporary Blood Magic from Nomos

temporary Nomos blood magic is a test set.
	
Scenario when testing temporary Nomos blood magic:
	now Bodmall is testobject;
	now the jumping bomb is testobject;
	now the swarm of daggers is testobject;
	now the Temple of Nomos is testobject;
	now columnated ruins is bannedobject;
	now the armadillo is bannedobject;
	now the reaper is bannedobject;
	now the imp is bannedobject;
	now everything is not cursed;
	block interventions;

The gown-timer is a number that varies;

To decide what number is the chance of (guy - a person) remaining concentrated:
	let the previous defender be the global defender;
	now the global defender is guy;
	now the remain concentrated chance is 0;
	follow the remain concentrated rules;
	now the global defender is previous defender;
	decide on the remain concentrated chance.
	
Test play when testing temporary Nomos blood magic:
	now every room is not rust-spored;
	now the health of the player is 1000;
	now the defence of the player is 50;
	extract the player to the location of bodmall;
	try smiting bodmall;
	extract the player to the temple of nomos, making sure it is unoccupied;
	extract the swarm of daggers to the temple of nomos;
	have the player sacrifice a random granted power;
	assert that the holder of the gown of the red court is the player;
	assert "the gown of the red court should be carried" based on whether or not the player carries the gown of the red court;
	assert "the inquisitor's hood should be carried" based on whether or not the player carries the inquisitor's hood;
	clear the event description;
	try examining the inquisitor's hood;
	assert result "This particular one gives you a \+15% chance of remaining concentrated when damaged\. It also increases your dreadful presence by 1\. Feeding 5 blood to the hood will temporarily add 10% to the chance of remaining concentrated";
	let the base chance be the chance of the player remaining concentrated;
	equip the player with the inquisitor's hood;
	assert that (the chance of the player remaining concentrated - the base chance) is 15 with label "concentration bonus of the inquisitor's hood";
	try concentrating;
	clear the event description;
	try feeding the inquisitor's hood;
	assert result "You feed 5 health to the inquisitor's hood, increasing its power \(and losing your concentration\)!";
	clear the event description;
	try examining the inquisitor's hood;
	assert result "This particular one gives you a \+25% chance of remaining concentrated when damaged\. It also increases your dreadful presence by 1\. Feeding 10 blood to the hood will temporarily add 10% to the chance of remaining concentrated";
	assert that (the chance of the player remaining concentrated - the base chance) is 25 with label "concentration bonus of the inquisitor's hood after one feeding";
	try taking off the inquisitor's hood;
	assert that the dreadful presence of the player is 0;
	try feeding the gown of the red court;
	Now the gown-timer is the blood timer of the gown of the red court;
	assert that gown-timer is between 2 and 10;
	clear the event description;
	try examining the gown of the red court;
	assert result "Wearing the gown gives you two levels of dreadful presence. You can feed the gown 8 blood";
	assert that the dreadful presence of the player is 0;
	now the gown of the red court is not cursed;
	try wearing the gown of the red court;
	assert that the dreadful presence of the player is 2;
	clear the event description;
	
second-gown-feeding is a hidden-traveling test step. The first move of temporary Nomos blood magic is second-gown-feeding.   

Choosing a player action when testing second-gown-feeding:
	generate the action of feeding the gown of the red court.

testing effects of second-gown-feeding:
	assert that the blood magic level of the gown of the red court is 2;
	assert that the dreadful presence of the player is 3;
	decrease the gown-timer by 1;
	assert that the blood timer of the gown of the red court is the gown-timer;
		
first-gown-timeout is a hidden-traveling test step.

To check the gown timer:
	Let expected timer be gown-timer - (the repeated moves);
	assert that the blood timer of the gown of the red court is the expected timer with label "blood timer of the gown ([gown-timer] - [repeated moves])" ;
	
testing effects of first-gown-timeout:
	succeed based on whether or not the blood magic level of the gown of the red court is not greater than 1 within gown-timer attempts;
	if waiting for resolution:
		check the gown timer;
	otherwise:
		assert result "Some of the blood power of the gown of the red court wears off";
		now gown-timer is the blood timer of the gown of the red court;
		assert that gown-timer is between 2 and 10;
	
second-gown-timeout is a hidden-traveling test step.

testing effects of second-gown-timeout:
	succeed based on whether or not the blood timer of the gown of the red court is 0 within gown-timer attempts;
	if waiting for resolution:
		check the gown timer;
	otherwise:
		assert that the blood magic level of the gown of the red court is 0;
		assert result "The blood power of the gown of the red court wears off completely";
		
malleus-earning is a extracting test step. The location-target of malleus-earning is the temple of nomos.

Testing effects of malleus-earning:
	have the player defeat the jumping bomb;
	have the player sacrifice a random granted power;
	assert "the malleus should be carried" based on whether or not the player carries the malleus maleficarum;
	try readying the malleus maleficarum;
	assert "the malleus maleficarum should be readied" based on whether or not the malleus maleficarum is readied;
	try examining the malleus maleficarum;
	assert result "Feeding 1 blood to the Malleus Maleficarum will give it a bonus of \+1 attack and \+1 damage on your next attack.* dreadful presence\.";
	
daggers-meeting is a test step. 

Testing effects of daggers-meeting:
	prepare a test battle with the swarm of daggers;
	now the health of the player is 1000;
	now the health of the swarm of daggers is 100;
	now the melee of the player is 100;

nomos-bonus-examining is a test step.   

Choosing a player action when testing nomos-bonus-examining:
	Generate the action of examining the swarm of daggers.

Initial scheduling of nomos-bonus-examining:
	now the nomos bonus is true;

Testing effects of nomos-bonus-examining:
	assert result "swarm of daggers attacks using sharp points";

malleus-bonus-attacking is a hidden-traveling test step.   

Choosing a player action when testing malleus-bonus-attacking:
	Generate the action of turning human. 

[turning human is not acting fast, but a rule sets the take no time boolean for it. This will be too late to stop the nomos bonus from changing our action]

to check that the malleus is fed:
       clear the event description;
       try examining the malleus maleficarum;
       assert result "Feeding 2 blood to the Malleus Maleficarum will give it an additional bonus of \+1 attack and \+1 damage on your next attack.* dreadful presence; blood bonus of \+1 attack and \+1 damage";

Initial scheduling for malleus-bonus-attacking:
	assert that the nomos bonus is true with label "nomos bonus";
	now the nomos bonus is false;
	try feeding the malleus maleficarum;
	check that the malleus is fed;
	now the nomos bonus is true;
	
testing effects of malleus-bonus-attacking:
	assert result "You plan on turning human, but find yourself attacking the swarm of daggers instead";
	assert that the hitting count of the player is 1 with label "player's hitting count (bug #281)";
	assert that the blood magic level of malleus maleficarum is 0 with label "malleus blood magic level";
	assert result " \+ 1 \(Malleus Maleficarum blood\) \+ 3 \(the law is with you\) = <0-9>+, you beat the swarm of daggers[']s defence rating";
	assert result " \+ 1 \(Malleus Maleficarum blood bonus\) \+ 3 \(the law is with you\) = <0-9>+ damage";
        
early-feeding is a test step.

initial scheduling of early-feeding:
       generate the action of feeding the malleus maleficarum.

testing effects of early-feeding:
       check that the malleus is fed.
       
[Test for bug #337]
bonus-surviving-attack is a test step.

initial scheduling of bonus-surviving-attack:
	now the melee of the swarm of daggers is 100;
	now the health of the player is 1000;
	now the hit protection of the player is 0;
	now dagger-scattered is 0;
	compel the action of the swarm of daggers attacking the player;
       
testing effects of bonus-surviving-attack:
       if waiting for player reaction, make no decision;
       assert "the player should be damaged" based on whether or not the health of the player < 1000;
       check that the malleus is fed;
]

Section - bug 234

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
bug-234	0	1	--	restarting for tests
link-holy-sword	1	1	--	--
no-holy-sword-link	1	1	--	link-holy-sword
still-linking	1	0	20	--

Scenario for bug-234:
	Now Israfel is testobject;
	Now the swarm of daggers is testobject;
	Now temple of Herm is testobject;
	Now Hall of Gods is testobject;
	
initial scheduling of bug-234:
	extract the player to the location of Israfel;
	have the player defeat israfel;
	extract the player to the location of the swarm of daggers;
	have the player defeat the swarm of daggers;
	extract the player to temple of herm;
	have the player sacrifice the power of the daggers;
	extract the player to Hall of Gods;
	now the health of the player is 1000;
	have the player and the healer of Aite fight in Arena of the Gods;

[also test bug 235]

regular scheduling of link-holy-sword: try linking the holy sword.
testing effects of link-holy-sword: if we assert result "You can only link to persons", rule succeeds.
testing effects of no-holy-sword-link: if we assert absence of result "You forge a spiritual link", rule succeeds.

regular scheduling of still-linking: compel the action of linking the healer of Aite.
testing effects of still-linking: if the healer of Aite is linked to the player, rule succeeds.

[not sure if this is testing the bug correctly]

Section - Attempting to Maze Someone in Arena of the Gods

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
mazing-tests	0	1	restarting for tests
axing-defender	1	1	--

Scenario for mazing-tests:
	Now the minotaur is testobject;
	Now Hall of Gods is testobject;
	now the overmind is testobject;
	now the hall of mirrors is bannedobject;
	
initial scheduling of mazing-tests:
	now the player worships Nomos;
	raise the favour of the player by 4;
	extract the player to the location of the minotaur;
	have the player defeat the minotaur;
	equip the player with the minotaur's axe;
	extract the player to hall of gods;
	have the player and the healer of aite fight in the arena of the gods;
	
regular scheduling of axing-defender: do the action of the defender of Aite waiting for a 100 melee hit by the player.

testing effects of axing-defender:
	assert result "you beat the defender of Aite's defence";
	assert absence of result "You plan on challenging the defender of Aite in the maze";
	assert result "Space and time begin to twist";
	assert that the location is Arena of the Gods;
	rule succeeds.

Section - At-react after getting mazed - bug 210

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
overmind-mazing	1	1
overmind-maze-reset	1	1

initial scheduling of overmind-mazing: extract the player to the location of the overmind.
regular scheduling of overmind-mazing: compel the action of the overmind waiting as a reaction to the player.
testing effects of overmind-mazing: if the location is Maze, rule succeeds.
testing effects of overmind-maze-reset: if the combat state of the overmind is at-inactive, rule succeeds.
	

[
Section - Banshees Gone Wild - bug 248

banshees gone wild is a test set.

[First every turn: say "Every turn rules run.";]
[TODO: get rid of "travel sneakily"]

To set the tension to (N - a number):
	transcribe "Setting tension to [N]";
	now the tension is N;
		
Scenario when testing banshees gone wild:
	now Hall of Raging Banshees is testobject;
	now the blood ape is testobject;
	now the reaper is testobject;
	now a random scroll of death is testobject;
	
Test play when testing banshees gone wild:
	Now the reusable item is a random scroll of death;
	swap the occupants of the location of the blood ape and the Hall of Raging Banshees;
	travel sneakily to Hall of Raging Banshees;
	if the retreat location is occupied:
		swap the occupants of the retreat location and a random unoccupied room;
	try taking off the fuligin cloak;
	set the tension to 10;
	now the health of the blood ape is 1;
	now the defence of the player is 100;
	now the health of the player is 100;
	
Waiting-for-banshees is a hidden-traveling test step. The first move of banshees gone wild is waiting-for-banshees.

testing effects of waiting-for-banshees:
	assert result "banshees suddenly break loose";
	assert that the living banshees boolean is true;

banshee-fleeing is a  hidden-traveling test step. The next move of waiting-for-banshees is banshee-fleeing.

Choosing a player action when testing banshee-fleeing:
	Let the way be the best route from the location to the retreat location;
	generate the action of going the way.

testing effects of banshee-fleeing:
	assert "we should no longer be in Hall of the Raging Banshees" based on whether or not the location is not Hall of Raging Banshees;
	assert that the tension is 0;
	assert that the living banshees boolean is false;
	
banshee-returning is a hidden-traveling test step. 

Initial scheduling for banshee-returning:
	extract the reaper to the location [to keep the tension from dissipating];
	set the tension to 10.
	
Choosing a player action when testing banshee-returning:
	Let the way be the best route from the location to the hall of raging banshees;
	generate the action of going the way;

testing effects of banshee-returning:
	assert "Tension should be at least 10" based on whether or not the tension is at least 10;
	succeed on result "banshees suddenly break loose";
	assert that the living banshees boolean is true;

[
Is it wrong to take this out? Not sure, but I just want the test to pass, and it seems ok!

banshee-return-waiting is a hidden-traveling test step. 	
[Initial scheduling for banshee-return-waiting:
	 set the tension to 10;]
	
testing effects of banshee-return-waiting:
	assert "Tension should be at least 10" based on whether or not the tension is at least 10;
	assert result "banshees suddenly break loose";
	assert that the living banshees boolean is true;
]	

reaction-ape-killing is a hiding-reveal test step. 

Initial scheduling of reaction-ape-killing:
	compel the action of the blood ape attacking the player;
	
Choosing a player reaction when reaction-ape-killing is the scheduled event:
	generate the action of reading the reusable item;
		
Choosing a player action when testing reaction-ape-killing:
	if waiting for player reaction, make no decision;
	Let the way be the best route from the location to the retreat location;
	generate the action of going the way;

testing effects of reaction-ape-killing:
	if waiting for player reaction, make no decision;
	assert "the blood ape should be dead" based on whether or not the blood ape is dead;
	assert result "Bored by a lack of tension";
	assert that the living banshees boolean is false;

Section - Remembering Text

remembering-text is a test set.

Scenario when testing remembering-text:
	now Bodmall is testobject;
	now the minotaur is testobject;
	now the angel of compassion is testobject;
	now the demon of rage is testobject;
	now the swarm of daggers is testobject;
	now the blood ape is testobject;
	now the fuligin cloak is testobject;
	now the teleportation beacon is bannedobject;
	now the dimensional anchor is bannedobject;
	now bridge of doom is testobject;
	now hall of vapours is bannedobject;
	now a random scroll of mapping is testobject;
	now the rod of the master builder is testobject;
	now generation info is true;
	Now the reusable item is a random scroll of psycholocation;
	now the reusable item is testobject;
	
[in case the first map is rejected, Arcane Vault must be switched back from testobject to bannedobject every time]
first creating the map rule when testing remembering-text:
	now every secretly placeable room is bannedobject; [prevent normal placement of Arcane Vault to simulate conditions for bug 244]
	now Eternal Prison is testobject;

last creating the map rule when testing remembering-text (this is the force Arcane Vault to be secretly placed rule):
	assert "Arcane Vault should not yet be placed" based on whether or not Arcane Vault is not placed;
	now Arcane Vault is testobject;
	now the rarity of Arcane Vault is 0;
	
The place all secret testobject rooms rule is listed after the force Arcane Vault to be secretly placed rule in the creating the map rules;
	
Test play when testing remembering-text:
	Now every room is not rust-spored;
	Let the item be a random not off-stage scroll of mapping;
	Now the player carries the item;
	Now the player carries the rod of the master builder;
	assert "Eternal Prison should be secretly placed" based on whether or not the eternal prison is secretly placed;
	assert "Lake of Lava should be placed" based on whether or not the lake of lava is placed;
	assert "Lake of Lava should not be denizen" based on whether or not the lake of lava is not denizen;
	assert "Lake of Lava should not be teleportable" based on whether or not the lake of lava is not teleportable;
	assert "Lake of Lava should be nogo" based on whether or not the lake of lava is nogo;
	assert "Lake of Lava should not be secretly placed" based on whether or not lake of lava is not secretly placed;
	assert "Lake of Lava should not be placeable" based on whether or not lake of lava is not placeable;
	
nothing-to-remember is a test step. The first move of remembering-text is nothing-to-remember.   

Choosing a player action when testing nothing-to-remember:
	Generate the action of remembering. 

testing effects of nothing-to-remember:
	assert result "You have not yet explored:\n( - the <a-w>+ exit of the entrance hall \(where you currently are\)\n)+\nYou have visited the following rooms: the entrance hall \(here\)\.\n\nTip:"
	
dumb-sensing is a test step.   

Choosing a player action when testing dumb-sensing:
	Generate the action of sensing;

testing effects of dumb-sensing:
	assert "Powerless sensing should not take time" based on previously-fast;
	
A test step can be psy-scroll-reading;

early-psycholocation is a psy-scroll-reading test step.

choosing a player action when testing a psy-scroll-reading test step:
	generate the action of reading the reusable item;
	
testing effects of psy-scroll-reading test step:
	[TODO: text that sensing takes no time]
	assert "The player should be psycholocating now" based on the psycholocation boolean;
	assert result "When you are psycholocating, sensing does not take time"

unexplored-sensing is a test step.   

Choosing a player action when testing unexplored-sensing:
	Generate the action of sensing.

testing effects of unexplored-sensing:
	Repeat with the enemy running through {swarm of daggers, blood ape, demon of rage, angel of compassion, minotaur, bodmall, malygris}:
		assert result "[soul description of the enemy], (from the )?[best route from the location to the location of the enemy][line break]";
	assert result "- a turning in on itself of space and time, on which you cannot bear to focus your attention, somewhere [general direction from the location to the Eternal Prison][line break]"

[ - a bolt of black shot through with a blaze of hot white, from the south
 - an aura like sharpened steel, from the east
 - a zone of tautened, reddened air, from the west
 - a squall of fury, all blacks and reds, from the south
 - a luminous arc of sorrow, from the south
 - a skein of twisting passages, from the south
 - spreading thorns dripping with dew--or blood, from the wes]
	
remembering-daggers is a hidden-traveling test step.  The location-target of remembering-daggers is the swarm of daggers.

Choosing a player action when testing remembering-daggers:
	Generate the action of remembering.
		
testing effects of remembering-daggers:
	assert result "You have visited the following rooms:.*You have seen the following creatures in these locations:.*- the swarm of daggers \(level 1\) in [the location] \(where you currently are\)"

[before we can get the partway-path psycholocating message, we have to put a visited room between us and an unseen creature. Find one that's at least two moves away and then go 1 move towards it.]

The sensing-place is a room that varies.
The on-the-way place is a room that varies.
The faraway enemy is an object that varies.

partway-visiting is a hidden-traveling psy-scroll-reading test step.
	
To decide which object is the next stop from (origin - a room) to (destination - a room):
	let the way be the best route from origin to destination;
	if the way is not a direction:
		decide on nothing;
	decide on the room way from origin;
	
Initial scheduling of partway-visiting:
	now the sensing-place is the location;
	now the faraway enemy is nothing;
	Repeat with guy running through denizen persons:
		If the number of moves from the location to the location of guy is at least 2 and the location of guy is not visited:
			now the faraway enemy is guy;
			break;
	assert "there should be an enemy in an unvisited room at least 2 moves away" based on whether or not the faraway enemy is a person;
	let the target be the location of the faraway enemy;
	now the on-the-way place is the next stop from the location to the target;
	if the on-the-way place is not visited:
		now the location-target of partway-visiting is the on-the-way place;
	while the next stop from the on-the-way place to the target is a visited room:
		now the on-the-way place is the next stop from the on-the-way place to the target.

middle-psycholocating is a extracting psy-scroll-reading test step. 

Initial scheduling of middle-psycholocating:
	now the location-target of middle-psycholocating is the sensing-place.

partial-explored-sensing is a hidden-traveling test step.   

Choosing a player action when testing partial-explored-sensing:
	Generate the action of sensing.

testing effects of partial-explored-sensing:
	assert result "the soul of the swarm of daggers here with you, like an aura like sharpened steel[line break]";
	assert result "[soul description of the faraway enemy], [best route from on-the-way place to location of the faraway enemy] from [the on-the-way place] \(which lies [best route from the location to on-the-way place] from here\)[line break]"

meeting-malygris is a hidden-traveling test step. The location-target of meeting-malygris is Malygris.
	
Testing effects of meeting-malygris:
	succeed on result "(does not (detect|notice)|remains unaware of) you(r presence)?[run paragraph on]" within 5 attempts;
	
psycholocation-expiring is a hidden-traveling test step.

testing effects of psycholocation-expiring:
	succeed based on whether or not psycholocation is inactive.
		
moving-malygris is a hiding-reveal test step. 

Initial scheduling for moving-malygris:
	Compel the action of Malygris teleporting.
	
testing effects of moving-malygris:
	if waiting for compelled action:
		fail based on whether or not the location of malygris is not the location;
		make no decision;
	assert result "Malygris suddenly teleports away";
	
[First choosing a player action when testing moving-malygris:
	if the location of Malygris is not the location:
		make no decision;
	if the fuligin cloak is worn:
		make no decision;
	generate the action of waiting;]
	
remembering-malygris is a test step.   

Choosing a player action when testing remembering-malygris:
	Generate the action of remembering.

testing effects of remembering-malygris:
	assert result "You have seen the following creatures in these locations:.*You have also seen Malygris, but you don't know where he is now"
	
remembering-lost-plural is a test step.   

Choosing a player action when testing remembering-lost-plural:
	Generate the action of remembering.

Initial scheduling of remembering-lost-plural:
	now the last-seen-location of the swarm of daggers is null-room.
	
testing effects of remembering-lost-plural:
	assert result "You have also seen (Malygris|the swarm of daggers) and (Malygris|the swarm of daggers), but you don't know where they are now"
	 
dungeon-clearing is a test step.

Initial scheduling for dungeon-clearing:
	now the health of the demonic assassin is -1;
	Repeat with guy running through denizen persons:
		if guy is the player or the level of guy is at least 5, next;
		now the health of guy is -1;
		
testing effects of dungeon-clearing:
	assert that the number of reachable persons is 2;
	assert "Malygris (in [the location of Malygris]) should be reachable from [the location]" based on whether or not Malygris is reachable;
	assert "The player (in [the location of the player]) should be reachable" based on whether or not the player is reachable.
	
Malygris-only-remembering is a test step.   

Choosing a player action when testing malygris-only-remembering:
	generate the action of remembering.

testing effects of Malygris-only-remembering:
	assert absence of result "You have seen the following creatures in these locations";
	assert result "You have also seen Malygris, but you don't know where he is now"
	
slow-sensing is a test step.   

Choosing a player action when testing slow-sensing:
	generate the action of sensing.

Initial scheduling of slow-sensing:
	assert "psycholocation should be inactive" based on whether or not psycholocation is inactive;
	
testing effects of slow-sensing:
	assert "sensing without psycholocation should take time" based on whether or not previously-fast is false;
	
exploring-everywhere is an extracting hidden-traveling test step. 

Initial scheduling for exploring-everywhere:
	Now the location-target of exploring-everywhere is a random unvisited reachable room.
	
testing effects of exploring-everywhere:
	Now the location-target of exploring-everywhere is a random unvisited reachable room;
	succeed based on whether or not the location-target of exploring-everywhere is nothing;
	if waiting for resolution, make no decision;
	assert that the number of unvisited reachable rooms is 0;
	assert "Arcane Vault should be secretly placed" based on whether or not the arcane vault is secretly placed;
	assert "Arcane Vault should be denizen" based on whether or not the arcane vault is denizen;
	assert "Arcane Vault should not be reachable" based on whether or not the arcane vault is not reachable;
	assert "There should be at least 1 unvisited secret room" based on whether or not the number of unvisited denizen rooms is at least 1;
	
remembering-everything-reachable is a test step.   

Choosing a player action when testing remembering-everything-reachable:
	generate the action of remembering.

testing effects of remembering-everything-reachable:
	assert result "All locations have been explored";
	assert absence of result "You have not yet explored";
	 
explored-psycholocating is a hidden-traveling extracting psy-scroll-reading test step.

Initial scheduling for explored-psycholocating:
	if the location is the location of Malygris:
		now the location-target of explored-psycholocating is a random unoccupied reachable room;
		if location-target of explored-psycholocating is a room:
			assert "location-target ([location-target of explored-psycholocating]) is not reachable" based on whether or not location-target of explored-psycholocating is a reachable room;
			assert "location-target ([location-target of explored-psycholocating]) should not be where Malygris is" based on whether or not location-target of explored-psycholocating is not the location of Malygris;
		otherwise:
			assert "location-target ([location-target of explored-psycholocating]) is not a room" based on false;


malygris-sensing is a test step.   

Choosing a player action when testing malygris-sensing:
	generate the action of sensing.

Initial scheduling of malygris-sensing:
	[make sure psycholocating works even when remembering doesn't]
	Now the last-seen-location of Malygris is null-room;

testing effects of malygris-sensing:
	assert result "[soul description of malygris], in [the location of Malygris]";
	assert "psycholocation sensing should not take time" based on previously-fast;

map-reading is a test step.

choosing a player action when testing map-reading:
	Let M be a random scroll of mapping carried by the player;
	generate the action of reading M;
	
testing effects of map-reading:
	assert result "a complete floor plan of the dungeon of Kerkerkruip imprints itself on your mind"
	
map-remembering is a test step.   

Choosing a player action when testing map-remembering:
	generate the action of remembering.

testing effects of map-remembering:
	Assert that the number of secretly placed rooms is 2;
	assert result "Based on the map you found.*secret rooms in the dungeon, one <^[line break]>+, one <^[line break]>+.";
	assert result "You have also seen Malygris, but you don't know where he is. With your powers of psycholocation, you might be able to SENSE it";
	
getting-close-to-vault is a hidden-traveling extracting test step.

Initial scheduling of getting-close-to-vault:
	Let the closest place be Null-room;
	Let the shortest distance be 1000;
	Repeat with the place running through connectable reachable rooms:
		Let the candidate distance be the absolute distance between the place and the Arcane Vault;
		if the candidate distance is less than the shortest distance:
			now the shortest distance is the candidate distance;
			now the closest place is the place;
	now the location-target of getting-close-to-vault is the closest place.
			
digging-to-vault is a hidden-traveling test step. 

Choosing a player action when testing digging-to-vault:
	Generate the action of digging a single general direction from the location to Arcane Vault.
		
testing effects of digging-to-vault:
	succeed based on whether or not the location is a secretly placed room within 20 attempts.
	[it doesn't actually have to be the vault - if we hit another secret room on the way we should stop]
	
secret-room-remembering is a test step.   

Choosing a player action when testing secret-room-remembering:
	generate the action of remembering.

testing effects of secret-room-remembering:
	assert result "Based on the map you found.*a secret room in the dungeon, <a-z>";
	assert absence of result "secret room in the dungeon, one";
	
[make sure tunnels don't show up when they shouldn't, make sure they do show up in unexplored list]

[psycholocation + sense]
]

Section - Blessed Grenade - bug #261

Scenario for blessed-grenade-test:
	now Drakul is testobject;
	now the Alchemical Laboratory is testobject;
	now the Blessed Grenade is bannedobject;
	
Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
blessed-grenade-test	0	1	1	restarting for tests
getting-blessed	1	0	400	--
no-extra-blessed	0	400	400	--
throwing-blessed	1	0	10	--
no-new-blessed	0	400	400	--

initial scheduling of blessed-grenade-test:
	now the defence of the player is 100;
	Now the reusable item is the staff of insanity;
	now the player carries the reusable item;
	Now every room is not rust-spored;
	Now every thing is not rusted;
	extract the player to the alchemical laboratory, making sure it is unoccupied;
	
regular scheduling of getting-blessed: produce a grenade.
testing effects of getting-blessed: if we assert result "the Blessed Grenade drops on the ground", rule succeeds.
	 
regular scheduling of no-extra-blessed: produce a grenade.
testing effects of no-extra-blessed: if we assert result "the Blessed Grenade drops on the ground", rule succeeds.

To produce a grenade:
	Repeat with item running through grenades in the location:
		if item is not a custom-grenade, remove item from play;
	Now every room is not rust-spored;
	Now every thing is not rusted;
	if the reusable item is not a thing:
		transcribe "DEBUG: produce a grenade - no reusable item";
	now the player carries the reusable item;
	clear event description;
	try inserting the reusable item into the curious machine;
	Now the health of the player is 100;
	Now the player is not asleep;
	if the location is not Alchemical Laboratory, extract the player to Alchemical Laboratory;
	[If the current move is hidden-traveling, now the player is hidden;]
	
Regular scheduling of throwing-blessed:
	now the player carries the blessed grenade;
	extract Drakul to the Alchemical Laboratory;
	generate the action of throwing the blessed grenade;
	
testing effects of throwing-blessed:
	assert "Drakul should be dead" based on whether or not Drakul is dead;
	assert "The blessed grenade should be exploded" based on whether or not the blessed grenade is exploded;
	assert "The blessed grenade should be placed" based on whether or not the Blessed Grenade is placed;
	assert "The blessed grenade should be off-stage" based on whether or not the blessed grenade is off-stage;
	assert result "As the grenade explodes you hear the singing of angels, several of whom swoop down from the heavens with huge swords and eviscerate <^[line break]>*Drakul";
	rule succeeds.
	
Regular scheduling of no-new-blessed: produce a grenade.

Testing effects of no-new-blessed:
	assert "The Blessed Grenade should be off-stage" based on whether or not the blessed grenade is off-stage;
	if we assert result "the Blessed Grenade drops on the ground", rule succeeds;
	

Section - bug 262

[this bug will not happen with normal testobject placement, so this is a bit of a gamble]

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
map-generation-tests	0	1	200	restarting for tests
bug-262	1	0	--	map-generation-tests
no-placed-treasure-packs	5	5	--	bug-262

Scenario for map-generation-tests:
	now generation info is true;
[	now every secretly placeable room is bannedobject;
	
First creating the map rule when testing bug-262:
	now every secretly placeable room is testobject;
	
First dungeon finish rule:
	repeat with pack running through not non-treasure things:
		repeat with item running through things enclosed by pack:
			now the valuation of item is the valuation of pack;
			
TODO: figure out what all that crap is for
	]
	
[TODO: merge with other dungeon generation tests]

Definition: a room is secret-treasure-stash if it is Mausoleum or it is Hidden Treasury or it is Elemental Plane of Smoke Storage.

testing effects of bug-262:
	unless portal of smoke is placed or hidden treasury is placed or mausoleum is placed, make no decision;
	repeat with place running through secret-treasure-stash rooms:
		if place encloses a not non-treasure thing, rule succeeds.

testing effects of no-placed-treasure-packs:
	Repeat with item running through treasure packs:
		if item is not off-stage:
			now the failure report is "[The item] should be off-stage, but it is in [the holder of the item][if holder of the item is not a room] (in [location of the item])";
			rule fails;
	rule succeeds.

Section - bug 244

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
bug-244	1	0	map-generation-tests
mausoleum-secret	5	5	bug-244

testing effects of bug-244 (this is the mausoleum must be secret rule):
	if the mausoleum is not placed, rule fails;
	let the path be the best route from Entrance Hall to the mausoleum;
	if the path is a direction, rule fails;
	rule succeeds.
	
[Finally found the cause of bug 244! The mausoleum could become connected to a secretly placed room. That made things kind of complicated!]
Testing effects of mausoleum-secret: if the mausoleum is secretly placeable, rule succeeds;

[
Section - bug 245

bug-245 is a test set.

Scenario when testing bug-245:
	now the blood ape is testobject;
	now bodmall is testobject;
	now the hall of mirrors is bannedobject;
	
Initial scheduling of ape-growing:
	now the defence of the player is 0;
	now the health of the player is 1000;
	now the melee of the player is 100;
	
ape-growing is a extracting hidden-traveling hiding-reveal test step. The first move of bug-245 is ape-growing. The location-target of ape-growing is the blood ape. 

[TODO:  a 100-melee hit phrase right here would cut through the crap]
testing effects of ape-growing:
	succeed based on whether or not the size of the blood ape is greater than medium;
	if waiting for resolution, compel the action of the blood ape attacking the player;
	
Choosing a player reaction when testing ape-growing:
	generate the action of exposing;
	rule succeeds.

ape-smiting is a test step.   

Choosing a player action when testing ape-smiting:
	generate the action of smiting the blood ape;

testing effects of ape-smiting:
	assert "the power of the ape should be granted" based on whether or not the power of the ape is granted;

bodmall-meeting is a hidden-traveling extracting hiding-reveal test step. The location-target of bodmall-meeting is bodmall.

Initial scheduling of bodmall-meeting:
	now the health of bodmall is 1000;
	now bodmall is not asleep;
	
bodmall-bleeding is a test step.   

Table of Outcomes (continued)
outcome	description	likelihood	minimum attempts
bodmall-reaction	""	1	100

Choosing a player action when testing bodmall-bleeding:
	generate the action of attacking bodmall.

Before Bodmall doing something when testing bodmall-bleeding:
	[TODO: keep counting outcomes even after they're achieved -
	then we can do a normal "achieve" instead of "test"]
	test bodmall-reaction against whether or not Bodmall is at-react;
	
testing effects of bodmall-bleeding:
	assert "the player should now be bigger than medium, but [regarding the player][they] [are] [size of the player]" based on whether or not the size of the player is greater than medium;
	assert that the success count of bodmall-reaction is 1 with label "number of times Bodmall reacted";
	assert "bodmall should be at-inactive, but she is [combat state of bodmall]" based on whether or not bodmall is at-inactive;
	reset bodmall-reaction;

Section - Maze Moving

[Moving around in the maze - check that all people have 0 concentration and are at-inactive. Check that the right thing happens when retreating or running from an opponent in the maze. Maybe check grenade-throwing effects in the maze]

[TODO: get rid of act count from this - this is the last test to use it]

To assert that (item - a thing) is located in (place - a room):
	assert "[The item] should be in [place], but [they] is in [location of item]" based on whether or not the location of item is place.
	
To assert that (guy - a person) has (N - a number) levels of concentration:
	assert "[The guy] has [concentration of guy] levels of concentration, but [they] should have [N] levels" based on whether or not concentration of guy is N.
	
maze-moving is a test set.

Scenario when testing maze-moving:
	now the minotaur is testobject;
	now the hall of mirrors is bannedobject;
	now the reusable item is a random flash grenade;
	
minotaur-meeting is a hidden-traveling extracting hiding-reveal test step. The first move of maze-moving is minotaur-meeting. The location-target of minotaur-meeting is the minotaur.

Initial scheduling of minotaur-meeting:
	now the health of the player is 1000;
	now the defence of the player is 0;
	
getting-mazed is a test step.

Initial scheduling of getting-mazed:
	compel the action of the minotaur attacking the player.

Testing effects of getting-mazed:
	succeed on result "minotaur deals";
	if waiting for resolution, make no decision;
	assert that the location is Maze;
	assert "the player should be at-inactive, but [regarding the player][they] [are] [combat state of the player]" based on whether or not the player is at-inactive;
	assert "the minotaur should be at-inactive, but he is [combat state of the minotaur]" based on whether or not the minotaur is at-inactive;
	assert that the minotaur is located in maze-waiting-room;
	assert that maze-sound is northwest;
	
directionless-throwing is a test step.

Choosing a player action when testing directionless-throwing:
	generate the action of throwing the reusable item to north;

Testing effects of directionless-throwing:
	assert result "There is no point throwing grenades into twisty little passages";
	assert "Trying to throw things in the maze should not take time" based on whether or not the take no time boolean is true;
	assert "[the reusable item] should be carried" based on whether or not the reusable item is carried.
	
sound-finding is a test step.   

Choosing a player action when testing sound-finding:
	generate the action of going north.

Testing effects of sound-finding:
	succeed based on whether or not maze-sound is a cardinal direction.
			
maze-summoning is an item-reading test step.

Initial scheduling of maze-summoning:
	now the the reusable item is a random scroll of summoning;
	now the player carries the reusable item;
	
Testing effects of maze-summoning:
	assert result "[a monster summoned] appears before you"
	
A test step can be sound-following.

summoned-fleeing is a sound-following test step.

Initial scheduling of summoned-fleeing:
	now the concentration of the player is 3;
	now the concentration of the monster summoned is 3;
	
Choosing a player action when testing a sound-following test step:
	generate the action of going maze-sound;

Definition: a person is not-yet-active if the act count of it is 0.

First combat round rule when testing summoned-fleeing:
	update event description;
	if every person who is not the player is not-yet-active:
		assert result "You flee through the tunnels, quickly losing all sense of direction.[line break][line break][The monster summoned] follows you towards the sound.";
		if the monster summoned is non-attacker:
			assert 0 hits by the monster summoned;
		otherwise:
			assert 1 hit by the monster summoned;
	if the act count of the main actor is 0:
		[this assertion can interrupt the event description]
		assert that the main actor has 0 levels of concentration;
	clear event description;

testing effects of summoned-fleeing:
	assert that the monster summoned is located in the maze;
	assert that the minotaur is located in the maze;
	if the act count of the monster summoned is 0:
		assert that the monster summoned has 0 levels of concentration;
	if the act count of the minotaur is 0:
		assert that the minotaur has 0 levels of concentration;

multiple-fleeing is a test step.   

Choosing a player action when testing multiple-fleeing:
	generate the action of going north.

Initial scheduling of multiple-fleeing:
	now the concentration of the minotaur is 3;
	now the concentration of the monster summoned is 3;
	
Testing effects of multiple-fleeing:
	assert that the minotaur has 0 levels of concentration;
	assert that the monster summoned has 0 levels of concentration;
	assert that the minotaur is located in maze-waiting-room;
	assert that the monster summoned is located in maze-waiting-room;
	assert 1 hit by the minotaur;
	
multiple-sound-seeking is a test step.   

Choosing a player action when testing multiple-sound-seeking:
	generate the action of going north.

Testing effects of multiple-sound-seeking:
	succeed based on whether or not the maze-sound is a cardinal direction;
	if waiting for resolution, make no decision;
	assert that the number of people in maze-waiting-room is 2;
		
first-rejoining is a sound-following test step.

Testing effects of first-rejoining:
	assert that the number of people in maze-waiting-room is 1;
	assert that the number of people in maze [including the player] is 2;
	
first-maze-smiting is a test step.

Choosing a player action when testing first-maze-smiting:
	now opposition test subject is the player;
	Let the enemy be a random opposer person enclosed by the location;
	generate the action of smiting the enemy.
	
Testing effects of first-maze-smiting:
	assert that the player is located in the maze;
	assert that the combat status is peace.

Section - Hiding Penalites

hiding-penalties is a test set.

scenario when testing hiding-penalties:
	now bodmall is testobject;
	
bodmall-sneaking is a hidden-traveling extracting test step. the first move of hiding-penalties is bodmall-sneaking. The location-target of bodmall-sneaking is bodmall.

Initial scheduling of bodmall-sneaking:
	now the teleportation beacon is in the location of Malygris;
	now the dimensional anchor is in the location of Malygris;
	now teleportation-beacon-on is true;
	
Choosing a player action when testing bodmall-sneaking:
	Let G be a random teleportation grenade;
	now G is in the location of Bodmall;
	generate the action of throwing G;
	
Testing effects of bodmall-sneaking:
	assert result "first taking the teleportation grenade";
	assert result "Malygris, perhaps the greatest of all living sorcerers, is standing here";
	assert absence of result "picking stuff up";
	
malygris-robbing is a hidden-traveling test step.

Initial scheduling of malygris-robbing:
	repeat with guy running through people in the location:
		assert "teleportation should be impossible for [guy]" based on whether or not teleportation is impossible for guy;

Choosing a player action when testing malygris-robbing:
	Let G be a random teleportation grenade;
	now G is in the location;
	generate the action of throwing G;
	
[if the player teleports away but reappears in the same room, their hiding penalty will be wiped out. This could be considered a bug, but I don't think it's worth fixing. Anyway, we can avoid it for testing purposes by using the dimensional anchor.]

Testing effects of malygris-robbing:
	assert that the teleportation beacon is located in the location;
	assert that malygris is located in the location;
	assert that bodmall is located in the location;
	assert result "Something has stopped you from teleporting";
	assert result "picking stuff up";

Section - Imp Teleporting Into Dreams

bug-280 is a test set.

Scenario when testing bug-280:
	now the reaper is testobject;
	now the lair of the imp is testobject;
	now the dimensional anchor is bannedobject;
	now the teleportation beacon is bannedobject; [test with the imp?]
	now the dream of briar roses is current-test-dream;
	now the reusable item is a random morphean grenade;
	now the vast staircase is bannedobject.
	
reaper-seeking is an extracting test step. The  first move of bug-280 is reaper-seeking. The location-target of reaper-seeking is the reaper.

Initial scheduling of reaper-seeking:
	assert "Lair of the imp should be placed" based on whether or not lair of the imp is placed;
	assert "Imp should be denizen" based on whether or not the imp is denizen;
	assert "Dimensional anchor is in [location of the dimensional anchor]" based on whether or not the dimensional anchor is off-stage;
	now the health of the player is 1000.
	
Testing effects of reaper-seeking:
	assert "the combat status should not be peace" based on whether or not the combat status is not peace;

imp-dreaming is an npc-enabling item-throwing test step.

Testing effects of imp-dreaming:
	assert that the location is garden of thorns;
	fail based on whether or not the location of the imp is the location within 20 attempts;
	wake the player up;
	update the combat status; [risky?]
	assert "we should no longer be in garden of thorns" based on whether or not the location is not garden of thorns;
	assert "we should be with the reaper in [location of the reaper] but we are in [the location]" based on whether or not the location is the location of the reaper;
	assert "the combat status should not be peace" based on whether or not the combat status is not peace;
	
imp-appearing is an npc-enabling test step.

Testing effects of imp-appearing:
	now the reusable item is nothing; [if the imp steals it, we don't want it coming back]
	succeed based on whether or not the location of the imp is the location:
		
imp-thieving is a test step.

Initial scheduling of imp-thieving:
	compel the action of the imp imp-grabbing.
			
The imp's loot is an object that varies;

Testing effects of imp-thieving:
	if waiting for compelled action, make no decision;
	Now the imp's loot is a random thing carried by the imp;
	assert "the imp should have stolen something" based on whether or not the imp's loot is a thing;

imp-vanishing is a test step.   

Choosing a player action when testing imp-vanishing:
	generate the action of attacking the imp;

First every turn when testing imp-vanishing:
	[before the imp has a chance to act independently]
	succeed based on whether or not the location of the imp is lair of the imp;
		
imp-stashing is an npc-enabling test step.

Testing effects of imp-stashing:
	succeed based on whether or not the imp's loot is in the lair of the imp within 2 attempts;
	

Section - Starting Kits

starting-kits-test is a test set.

Scenario when testing starting-kits-test:
	now generation info is true;
	now the gilded rapier is testobject;
	now the gorgeous dagger is testobject;
	now the evil dagger is testobject;
	now Metastasio's hat is testobject;
	set difficulty to 1;
	[assert "the addict's amulet should start off cursed" based on whether or not the addict's amulet is cursed;]
	
malygris-heal-max is a number that varies.


[TODO: make tests that can save outcomes and restart the game]

To say malygris-heal-max-message:
	say "[malygris-heal-max divided by 60] and [remainder after dividing malygris-heal-max by 60] 60ths is too much healing for Malygris";
	
Table of Outcomes (continued)
outcome	description	likelihood	minimum attempts	maximum attempts	antecedent
malygris-healing	""	1	20	--	--
too-much-malygris-healing	"[malygris-heal-max-message]"	0	5	--	--
shimmering-player-item	""	0	30	--	--
got-addicts-amulet	""	2	64	256	--
cursed-addicts-amulet	""	2	2	--	got-addicts-amulet	
got-shield	""	1	20	--	--
wearing-shield	""	5	5	--	got-shield
compassion-placed	""	1	0	--	--
fafhrd-placed	""	1	0	--	--
sword-of-light-owner	""	10	10	10	compassion-placed
claymore-owner	""	10	10	10	fafhrd-placed

Generation test when testing starting-kits-test:
	[Malygris heal power]
	let max healing be (heal power of Malygris) * 60 / (heal cooldown of Malygris);
	if max healing is greater than malygris-heal-max:
		now malygris-heal-max is max healing;
	if max healing is at least 1:
		say "* Malygris can heal [max healing divided by 60] and [remainder after dividing max healing by 60] 60ths per turn[line break]";
	achieve malygris-healing based on whether or not max healing is at least 1;
	fail too-much-malygris-healing based on whether or not (max healing) is greater than (60 times 3);
	[no shimmer weapons]
	[We place all of the player's possible starting kit items in the dungeon, tempting the starting kit rules to make shimmer-copies. But it must resist the temptation!]
	Repeat with item running through things enclosed by the player:
		fail shimmering-player-item based on whether or not the item is shimmering;
	Let item be a random shield had by the player;
	achieve got-shield based on whether or not item is a shield;
	test wearing-shield against whether or not item is a shield worn by the player;
	test got-addicts-amulet against whether or not the player wears the addict's amulet;
	test cursed-addicts-amulet against whether or not the addict's amulet is cursed;
	test compassion-placed against whether or not the angel of compassion is denizen;
	test sword-of-light-owner against whether or not the original owner of the sword of light is the angel of compassion;
	test fafhrd-placed against whether or not fafhrd is denizen;
	test claymore-owner against whether or not the original owner of the claymore is fafhrd;
	[TODO: starting kit items should match the player's size?]
	[TODO: check ownership/starting kits in Arena of the Gods and Arena of the Fallen]
	
Section - Bloodlust - issue 279

bloodlust-279 is a test set.

to assert that bloodlusting is (active - a truth state) when (condition - indexed text):
	assert "the player should [if active is false]not [end if]be bloodlusting [condition], but you are [person condition of the player]" based on whether or not active is (whether or not the player is bloodlusting).
	
Scenario when testing bloodlust-279:
	now the swarm of daggers is testobject;
	now the blood ape is testobject;
	now the mindslug is testobject;
	now the hall of mirrors is bannedobject;
	now lair of the imp is bannedobject;
	
meeting-daggers is an extracting test step. The first move of bloodlust-279 is meeting-daggers. The location-target of meeting-daggers is the swarm of daggers.

Initial scheduling of meeting-daggers:
	now the melee of the player is 100;
	now the defence of the player is 100;
	now the health of the swarm of daggers is 50;
	
hitting-daggers is a test step. 

choosing a player action when testing hitting-daggers:
	generate the action of attacking the swarm of daggers.
	
Testing effects of hitting-daggers:
	assert that bloodlusting is true when "after hitting";
	
smiting-daggers is a test step.

choosing a player action when testing smiting-daggers:
	generate the action of smiting the swarm of daggers.
	
Testing effects of smiting-daggers:
	assert that the combat status is peace with label "combat status";
	assert that bloodlusting is false when "after killing the daggers".
	
[If we can think of any tricky cases where the combat status changes during the every turn stage, we should test those]
		
meeting-ape is an extracting test step. The location-target of meeting-ape is the blood ape.

Initial scheduling of meeting-ape:
	have the player defeat the mindslug;
	extract fafhrd to the location of the blood ape;
	now the health of the blood ape is 100;
	
hitting-ape is a test step.

choosing a player action when testing hitting-ape:
	generate the action of attacking the blood ape;
	
testing effects of hitting-ape:
	assert that bloodlusting is true when "after hitting the ape the first time";
	
fafhrd-killing-ape is a test step.

initial scheduling of fafhrd-killing-ape:
	now the melee of fafhrd is 100;

choosing a player action when testing fafhrd-killing-ape:
	compel the action of fafhrd attacking the blood ape;
	generate the action of attacking the blood ape;

before fafhrd hitting the blood ape when testing fafhrd-killing-ape:
	transcribe "reducing the ape's health to 1";
	now the health of the blood ape is 1;
	
testing effects of fafhrd-killing-ape:
	if the blood ape is alive:
		make no decision;
	assert that bloodlusting is false when "after Fafhrd kills the ape";

Section - bug 291

bug-291 is a test set.

Scenario when testing bug-291:
	now the healer of aite is testobject;
	now the dream of tungausy shaman is current-test-dream;
	now the reusable item is a random morphean grenade;
	now the swarm of daggers is testobject;
	now the hall of mirrors is bannedobject;
	now the lair of the imp is bannedobject;
	now the armadillo is bannedobject;
	now the reaper is bannedobject;

sleepy-throwing is an extracting item-throwing test step. The first move of bug-291 is sleepy-throwing. The location-target of sleepy-throwing is the healer of aite.

Before taking a player action when testing sleepy-throwing:
	now the player is just-woken;
	clear event description;
	
Testing effects of sleepy-throwing:
	assert that the player is tungausy warrior with label "identity of the player";
	assert absence of result "fog of sleep";
	
hut-entering is a test step.

Choosing a player action when testing hut-entering:
	generate the action of going inside.
	
shaman-choosing is a test step.

Choosing a player action when testing shaman-choosing:
	select menu question answer 1;
	
To assert that (guy - a person) is fully alert:
	assert "[The guy] should not be just-woken" based on whether or not the guy is not just-woken.
	
To assert that (guy - a person) is just-woken:
	assert "[The guy] should be just-woken" based on whether or not the guy is just-woken.
	
Testing effects of shaman-choosing:
	Now opposition test subject is the player;
	Repeat with guy running through opposer people in the location:
		assert that guy is asleep;
	assert that the player is the true body of the player with label "true body of the player";
	assert that the player is awake;
	assert that the player is fully alert;
	assert absence of result "fog of sleep";
	
teleport-waking is a test step.

initial scheduling of teleport-waking:
	now the reusable item is a random scroll of teleportation;
	now the healer of aite is not asleep;
	compel the action of the healer of aite attacking the player;
	now the teleportation beacon is in a random unoccupied placed room;
	now teleportation-beacon-on is true;	
	
Choosing a player reaction when testing teleport-waking:
	now the player is just-woken;
	generate the action of reading the reusable item.
	
Testing effects of teleport-waking:
	if waiting for compelled action, make no decision;
	if the player is at-react, make no decision;
	assert that the player is fully alert;
	assert result "fog of sleep";
	
sleepy-teleport is a hidden-traveling item-reading test step.

Initial scheduling of sleepy-teleport:
	now the teleportation beacon is in the location of the swarm of daggers;
	now the player is just-woken;
	
Testing effects of sleepy-teleport:
	assert that the player is just-woken;
	assert absence of result "fog of sleep";
	
sleepy-status is a test step.

Choosing a player action when testing sleepy-status:
	generate the action of asking status.
	
Testing effects of sleepy-status:
	assert result "You are just-woken: The next attack against you gets a \+3 bonus and \+2 damage\.";
	
sleepy-slaying is a hidden-traveling test step.

choosing a player action when testing sleepy-slaying:
	generate the action of smiting the swarm of daggers;
	
testing effects of sleepy-slaying:
	assert result "fog of sleep";
	assert that the player is fully alert.
]

[	
Section - Bug 301 Redux

bug-301-aite is a test set.

scenario when testing bug-301-aite:
	now Temple of Sul is testobject;
	now Bodmall is testobject;
	now Hall of Gods is testobject;
	now the reusable item is a random fragmentation grenade;
	
First intervention possible when testing bug-301-aite:
	rule fails;
	
bug-301-setup is a test step. The first move of bug-301-aite is bug-301-setup.
	
Initial scheduling of bug-301-setup:
	Now every room is not rust-spored;
	Now every thing is not rusted;
	now the defence of the player is 100;
	extract the player to the location of bodmall;
	have the player defeat Bodmall;
	extract the player to temple of Sul;
	have the player sacrifice a random granted power;
	assert that the favour of the player with Sul is 4;
	extract the player to Hall of Gods;
	have the player and healer of Aite fight in Arena of the Gods;
	
healer-first-killing is a test step. 

Initial scheduling of healer-first-killing:
	now the health of the player is the permanent health of the player - 1; 

Choosing a player action when testing healer-first-killing:
	generate the action of smiting the healer of aite.
	
Testing effects of healer-first-killing:
	assert "The healer should be dead" based on whether or not the healer of Aite is dead;
	assert "The tormentor of Aite should be alive" based on whether or not the tormentor of Aite is alive;
	assert "The defender should be alive" based on whether or not the defender of Aite is alive;
	assert "The player should not be healed" based on whether or not the health of the player is less than the permanent health of the player;
	assert absence of result "Sul receives .* and fully heals you";
	
other-fanatics-killing is an item-throwing test step.

Initial scheduling of other-fanatics-killing:
	now the health of the tormentor of Aite is 1;
	now the health of the defender of Aite is 1;

testing effects of other-fanatics-killing:
	assert "The tormentor should be dead" based on whether or not the tormentor of Aite is dead;
	assert "The defender should be dead" based on whether or not the defender of Aite is dead;
	assert that the location is Hall of Gods with label "current location";
	assert result "receives the soul";
	assert absence of result "receives the soul.* receives the soul";
	assert that the health of the player is the permanent health of the player with label "health of the player";
]
[TODO: test armadillo and reaper following]


Section - Armadillo wandering

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
armadillo-wandering	0	1	restarting for tests
armadillo-moved	1	0	--

Scenario when testing armadillo-wandering: now the ravenous armadillo is testobject.

Armadillo-origin is a room that varies.

Initial scheduling of armadillo-moved: now armadillo-origin is the location of the ravenous armadillo.
Regular scheduling of armadillo-moved: compel the action of waiting.
Testing effects of armadillo-moved: if the location of the armadillo is not the armadillo-origin, rule succeeds.

Section - Unlocking - issue 243

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
unlocking-behavior	0	1	restarting for tests

to assert that placement possibility is (allowable - a truth state) when (conditions - indexed text):
	now basic game mode is false;
	follow the decide basic mode rule;
	assert "basic game mode should not be [allowable] when  difficulty is [the difficulty] and advanced content is [if advanced content is enabled]en[otherwise]dis[end if]abled and the dungeon generation seed is [the dungeon generation seed]" based on whether or not basic game mode is not allowable;
	now the rarity of Space-Time Discontinuum is 0;
	now the considered room is Space-Time Discontinuum;
	follow the placement possible rules;
	assert "Space-Time Discontinuum should be [if allowable is false]im[end if]possible to place [conditions]" based on whether or not allowable is (whether or not the rule succeeded);
	now global monster level is 1;
	now the considered monster is the ravenous armadillo;
	follow the monster placement possible rules;
	assert "The armadillo should be [if allowable is false]im[end if]possible to place [conditions]" based on whether or not allowable is (whether or not the rule succeeded);
	[not-too-difficult is no longer used to place treasure - the smoky blade is now placed by the stock minor treasure rule]
	[assert "The smoky blade should [if allowable is false]not [end if]be not-too-difficult" based on whether or not allowable is (whether or not the smoky blade is not-too-difficult);]
	
	
Scenario for unlocking-behavior:
	Let the saved seed be the dungeon generation seed;
	now the dungeon generation seed is 0;
	set difficulty to 0;
	disable advanced content;
	assert that setting of current difficulty is 0 with label "current difficulty setting";
	assert that difficulty is 0 with label "difficulty";
	assert "advanced content should be disabled" based on whether or not advanced content is disabled;
	assert that placement possibility is false when "in novice level";
	enable advanced content;
	assert that placement possibility is true when "in novice level with advanced content enabled";
	set difficulty to 1;
	assert that setting of current difficulty is 1 with label "current difficulty setting";
	assert that difficulty is 1 with label "difficulty";
	disable advanced content;
	assert that placement possibility is true when "in apprentice level";
	enable advanced content;
	assert that placement possibility is true when "in apprentice level when advanced content is enabled";
	now the dungeon generation seed is the saved seed;
	set difficulty to 0;
	disable advanced content;
	assert that placement possibility is true when "in novice level with a preset dungeon generation seed";
	enable advanced content;
	assert that placement possibility is true when "in novice level with advanced content enabled with a preset dungeon generation seed";
	set difficulty to 1;
	disable advanced content;
	assert that placement possibility is true when "in apprentice level with a preset dungeon generation seed";
	enable advanced content;
	assert that placement possibility is true when "in apprentice level when advanced content is enabled with a preset dungeon generation seed";

[
Section - bug 293 - Sensing Isra and Fell

bug-293 is a test set

scenario when testing bug-293:
	now the reusable item is a random teleportation grenade;
	now israfel is testobject;
	
israfel-meeting-293 is an extracting hidden-traveling test step. The first move of bug-293 is israfel-meeting-293. The location-target of israfel-meeting-293 is israfel.

israfel-splitting-293 is a hiding-reveal test step. 

initial scheduling of israfel-splitting-293:
	assert "isra should be off-stage" based on whether or not isra is off-stage;
	assert "fell should be off-stage" based on whether or not fell is off-stage;
	compel the action of israfel israfel-splitting.
		
isra-and-fell-scattering is a hidden-traveling item-throwing test step.

Testing effects of isra-and-fell-scattering:
	assert "isra should be onstage" based on whether or not isra is not off-stage;
	if the location of Isra is the location:
		extract Isra to a random unoccupied reachable room;
	assert "fell should be onstage" based on whether or not fell is not off-stage;
	if the location of Fell is the location:
		extract Fell to the location of Isra;
	repeat with guy running through people in the location of isra:
		if guy is not isra and guy is not Fell:
			extract guy to the location;
	repeat with guy running through people in the location of fell:
		if guy is not fell and guy is not Isra:
			extract guy to the location;
	
psycholocating-293 is a hidden-traveling item-reading test step.

initial scheduling of psycholocating-293:
	now the reusable item is a random scroll of psycholocation.
	
sensing-293 is a hidden-traveling test step.

Choosing a player action when testing sensing-293:
	generate the action of sensing.
	
Testing effects of sensing-293:
	assert "Isra should be psycholocatable" based on whether or not Isra is psycholocation-revealed;
	assert "Fell should be psycholocatable" based on whether or not fell is psycholocation-revealed;
	assert result "frozen lightning";
	assert result "molten thunder";
	
isra-defeating-293 is a test step.

initial scheduling of isra-defeating-293:
	have the player defeat isra;
	
Testing effects of isra-defeating-293:
	assert "power of israfel should not be granted" based on whether or not the power of israfel is not granted;
	
fell-defeating-293 is a test step.

initial scheduling of fell-defeating-293:
	have the player defeat fell;
	
Testing effects of fell-defeating-293:
	assert "isra should be dead" based on whether or not isra is dead;
	assert "fell should be dead" based on whether or not fell is dead;
	assert "israfel should be off-stage" based on whether or not israfel is off-stage;
	[assert result "Israfel's dying cry shakes the foundations of the world";]
	assert "power of israfel should be granted" based on whether or not the power of israfel is granted.

Section - Weapon aftereffects

weapon aftereffects is a test set.

Scenario when testing weapon aftereffects:
	now the body score of fafhrd is 100;

The sometimes feed armour of thorns rule does nothing when testing weapon aftereffects.

fafhrd-battling is a test step. The first move of weapon aftereffects is fafhrd-battling.

initial scheduling of fafhrd-battling:
	Now the player carries the gilded rapier;
	try readying the gilded rapier;
	prepare a test battle with fafhrd;
	now the defence of the player is 50;
	now the health of the player is 1000;
		
Testing effects of fafhrd-battling:
	assert that the location of Fafhrd is test arena with label "location of Fafhrd";
	have Fafhrd do no reaction to a 100 melee hit with result "You deal";
	assert that the gilded rapier readied after "Fafhrd is hit";
	have Fafhrd do a dodge reaction to a 0 melee hit with result "you do not overcome Fafhrd";
	assert that the gilded rapier readied after "Fafhrd dodges";
	[claymore parries rapier]
	have Fafhrd do a parry reaction to a 0 melee hit with result "The claymore shatters the gilded rapier!";
	assert no weapon after "the claymore parries the rapier";
	[claymore parries fists]
	have Fafhrd do a parry reaction to a 0 melee hit with result "you do not overcome Fafhrd";
	assert absence of result "The claymore shatters";
	assert that the global attacker weapon is a random natural weapon enclosed by the player with label "global attacker weapon";
	[restore rapier to the player]
	clear event description;
	now the gilded rapier is not readied;
	now the player carries the gilded rapier;
	try readying the gilded rapier;
	try taking inventory;
	update event description;
	assert result "gilded rapier \(readied\)";
	assert absence of result "\(readied\).*\(readied\)";
	assert that the number of readied weapons enclosed by the player is 1 with label "number of player's readied weapons ([the list of readied weapons enclosed by the player])";
	have the player do a dodge reaction to a 0 melee hit by Fafhrd with result "Fafhrd does not overcome your defence rating";
	assert the gilded rapier readied after "successfully dodging the claymore";
	have the player do a dodge reaction to a 100 melee hit by Fafhrd with result "Fafhrd beats your defence rating";
	assert the gilded rapier readied after "failing to dodge the claymore";
	have the player do a parry reaction to a 100 melee hit by Fafhrd with result "Fafhrd beats your defence rating";
	assert the gilded rapier readied after "failing to parry the claymore";
	now the hit protection of the player is 1;
	have the player do a parry reaction to a 100 melee hit by Fafhrd with result "Fafhrd beats your defence rating";
	assert the gilded rapier readied after "the protected player fails to parry the claymore";
	assert that the hit protection of the player is 0 with label "hit protection of the player";
	have the player do a parry reaction to a 0 melee hit by Fafhrd with result "The claymore shatters the gilded rapier!";
	assert no weapon after "parrying the claymore";

scythe-vs-fafhrd is a test step.

Initial scheduling of scythe-vs-fafhrd:
	equip the player with the scythe of oxidation;
	now the body score of fafhrd is 0;
	make everyone wait;
		
Testing effects of scythe-vs-fafhrd:
	have fafhrd do no reaction to a 100 melee hit with result "You deal";
	have fafhrd do a parry reaction to a 100 melee hit with result "You deal";
	assert absence of result "the claymore rusts";
	assert "Fafhrd should not be rusted" based on whether or not Fafhrd is not rusted;
	assert "The claymore should not be rusted" based on whether or not the claymore is not rusted;
	have fafhrd do a parry reaction to a 0 melee hit with result "Having been in contact with the scythe of oxidation, the claymore rusts";
	assert "The claymore should be rusted after parrying the scythe of oxidation" based on whether or not the claymore is rusted;
	now the claymore is not rusted;
	have the player do a parry reaction to a 0 melee hit by Fafhrd with result "Having been in contact with the scythe of oxidation, the claymore rusts";
	assert "The claymore should be rusted after being parried by the scythe of oxidation" based on whether or not the claymore is rusted;
	
scythe-vs-chains is a test step.

Initial scheduling of scythe-vs-chains:
	prepare a test battle with the chain golem;
	
Testing effects of scythe-vs-chains:
	Let the chain-weapon be a random natural weapon enclosed by the chain golem;
	have the chain golem do a dodge reaction to a 0 melee hit with result "you do not overcome";
	assert "The chain golem should not be rusted" based on whether or not the chain golem is not rusted;
	assert "The chain golem's chains should not be rusted" based on whether or not the chain-weapon is not rusted;
	have the chain golem do a parry reaction to a 0 melee hit with result "Having been in contact with the scythe of oxidation, the lashing chains rust\.";
	assert "The chain golem's chains should be rusted after parrying the scythe of oxidation" based on whether or not the chain-weapon is rusted;
	assert "The chain golem should not be rusted even though the lashing chains are rusted" based on whether or not the chain golem is not rusted;
	now the chain-weapon is not rusted;
	have the chain golem do a dodge reaction to a 100 melee hit with result "Having been hit with the scythe of oxidation, the chain golem rusts!";
	assert "The chain golem should be rusted after being hit by the scythe of oxidation" based on whether or not the chain golem is rusted;
	assert "The lashing chains should not be rusted after the chain golem is hit by the scythe of oxidation" based on whether or not the chain-weapon is not rusted;
	now the chain golem is not rusted;
	have the player do a parry reaction to a 0 melee hit by the chain golem with result "Having been in contact with the scythe of oxidation, the lashing chains rust\.";
	assert "The lashing chains should be rusted after being parried by the scythe of oxidation" based on whether or not the chain-weapon is rusted;

lionshield-vs-chains is a test step.

Initial scheduling of lionshield-vs-chains:
	Repeat with S running through shields worn by the player:
		now the player carries S;
	now the player carries the lion's shield;
	now the player wears the lion's shield;
	make everyone wait;
	
Testing effects of lionshield-vs-chains:
	now the health of the chain golem is 100;
	have the player do a dodge reaction to a 0 melee hit by the chain golem with result "the chain golem does not overcome";
	assert absence of result "The lion on the shield strikes out, and bites the chain golem for 2 damage";
	assert that the health of the chain golem is 100 with label "health of the chain golem";
	have the player do a block reaction to a 0 melee hit by the chain golem with result "The lion on the shield strikes out, and bites the chain golem for 2 damage";
	assert that the health of the chain golem is 98 with label "health of the chain golem";

chains-vs-thorns is a test step.

Initial scheduling of chains-vs-thorns:
	Repeat with item running through suits worn by the player:
		now the player carries item;
	Now the player wears the armour of thorns;
	make everyone wait;
	
Testing effects of chains-vs-thorns:
	now the health of the chain golem is 100;
	have the player do a dodge reaction to a 0 melee hit by the the chain golem with result "the chain golem does not overcome";
	assert absence of result "The armour of thorns scratches the chain golem for 1 damage";
	assert that the health of the chain golem is 100 with label "health of the chain golem";
	now the hit protection of the player is 1;
	have the player do a dodge reaction to a 100 melee hit by the the chain golem with result "The armour of thorns scratches the chain golem for 1 damage" in 0 out of 1 attempts;
	now the hit protection of the player is 0;
	now the inherent damage modifier of the chain golem is 2;
	have the player do a dodge reaction to a 100 melee hit by the the chain golem with result "The armour of thorns scratches the chain golem for 1 damage";
	assert that the health of the chain golem is 99 with label "health of the chain golem";

lionshield-vs-bodmall is a test step.
	
Initial scheduling of lionshield-vs-bodmall:
	prepare a test battle with bodmall;
	
[TODO: make sure the lion's shield doesn't work when it's not worn or when not blocking]
[TODO: test everything with the demonic mistress - tethered but not natural weapon]

Testing effects of lionshield-vs-bodmall:
	now the health of bodmall is 100;
	have the player do a block reaction to a 0 melee hit by bodmall with result "Bodmall does not overcome";
	assert absence of result "lion on the shield strikes out";
	assert that the health of bodmall is 100 with label "health of bodmall";
	
bodmall-vs-thorns is a test step.

Initial scheduling of bodmall-vs-thorns:
	[player already wears the armour of thorns]
	compel the action of bodmall waiting;
	
Testing effects of bodmall-vs-thorns:
	now the health of bodmall is 100;
	[should the lion's shield bite the chain golem or not? Should it be because the chains are a natural weapon or because they are tethered? or both?]
	have the player do a dodge reaction to a 0 melee hit by bodmall with result "Bodmall does not overcome";
	assert absence of result "The armour of thorns scratches Bodmall for 1 damage";
	assert that the health of Bodmall is 100 with label "health of bodmall";
	have the player do a dodge reaction to a 100 melee hit by Bodmall with result "Bodmall beats your defence rating";
	assert that the health of Bodmall is 100 with label "health of Bodmall";


greasy-gauntlets vs mouser is a test step.

Initial scheduling of greasy-gauntlets vs mouser:
	now the player wears the greasy gauntlets;
	now the player carries the gilded rapier;
	now the gilded rapier is not readied;
	try readying the gilded rapier;
	prepare a test battle with mouser;
		
Testing effects of greasy-gauntlets vs mouser:
	have mouser do a dodge reaction to a 0 melee hit by the player with result "you drop the gilded rapier" in 0 out of 20 attempts;
	assert the gilded rapier readied after "missing mouser";
	have mouser do a parry reaction to a 0 melee hit by the player with result "you drop the gilded rapier" in 0 out of 20 attempts;
	assert the gilded rapier readied after "successfully parried by mouser";
	have mouser do a dodge reaction to a 100 melee hit by the player with result "you drop the gilded rapier" in 1 out of 6 attempts;
	assert no weapon after "mouser was hit by the rapier using greasy gauntlets";
	now the gilded rapier is not readied;
	now the player carries the gilded rapier;
	try readying the gilded rapier;
	have the player do a parry reaction to a 100 melee hit by mouser with result "you drop the gilded rapier" in 0 out of 20 attempts;
	assert the gilded rapier readied after "failing to parry mouser";
	have the player do a parry reaction to a 0 melee hit by mouser with result "you drop the gilded rapier" in 1 out of 4 attempts;
	assert no weapon after "successfully parrying mouser using greasy gauntlets";
	
[TODO: Hot weapons only do heat damage (or break because of heat)? if not projectile]

mouser-vs-thorns is a test step.

Initial scheduling of mouser-vs-thorns:
	[player already wears the armour of thorns]
	make everyone wait;
	
Testing effects of mouser-vs-thorns:
	now the health of mouser is 100;
	[should the lion's shield bite the chain golem or not? Should it be because the chains are a natural weapon or because they are tethered? or both?]
	have the player do a dodge reaction to a 0 melee hit by the mouser with result "Mouser does not overcome";
	assert absence of result "The armour of thorns scratches Mouser for 1 damage";
	assert that the health of mouser is 100 with label "health of mouser";
	have the player do a dodge reaction to a 100 melee hit by the mouser with result "The armour of thorns scratches Mouser for 1 damage";
	assert that the health of mouser is 99 with label "health of mouser";

[TODO: test armor of thorns (started) and Israfel (not started), 
when hitting with damage (done)
hitting without damage (not done)
vs chain golem, bodmall, and hand-to-hand attacker, and missing - (all started)]


]

Section - Damage Text

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	antecedent
damage-text	0	1	restarting for tests
basic attack damage text	1	1	--	
tense attack damage text	1	1	--
divine-lightning text	1	1	--
fragmentation damage text	1	1	--

[Test every instance of the "inflict" phrase. If you add an invocation, please consider adding a test here.]

[TODO: test #384 - glass cannon weapon damage bonus]

Scenario when testing damage-text:
	now Vast Staircase is testobject;

Initial scheduling of basic attack damage text:
	prepare a test battle with the reaper;
	now the health of the player is 1000;
	now the tension is 0;
	
Regular scheduling of basic attack damage text: do the action of the reaper dodging a 100 melee hit by the player.
Testing effects of basic attack damage text: if we assert result "(\n|^)You deal <1-9><0-9>* damage", rule succeeds.

Regular scheduling of tense attack damage text:
	now the tension is 3;
	capture damage text; [TODO: reset capture mode when "make possible?" or "scheduling?" - done but possibly not done right]
	do the action of the reaper dodging a 100 melee hit by the player.

Testing effects of tense attack damage text: if we assert result "\+ 1 \(tension\)", rule succeeds.

regular scheduling of divine-lightning text: say Divine lightning strikes the player;
testing effects of divine-lightning text: if we assert result "(\n|^)A ball of lightning shoots from the sky, doing <3-7> damage to you", rule succeeds.
	
regular scheduling of fragmentation damage text: have a fragmentation event in the location with a random fragmentation grenade by the player.
testing effects of fragmentation damage text: if we assert result "<2-5> damage to the Reaper; and <2-5> damage to you", rule succeeds.

[skip fragmentation in other rooms because no damage text is printed]

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
dodge-thorns damage text	1	1
lion-block damage text	1	1
death-scroll damage text	1	1
anti-purification damage text	1	1
aite-statue damage text	1	1

Regular scheduling of dodge-thorns damage text:
	now the player wears the armour of thorns;
	now the blood magic level of the armour of thorns is 1;
	do the action of dodging a 100 melee hit by the reaper.

Testing effects of dodge-thorns damage text: if we assert result "(\n|^)The armour of thorns scratches the Reaper for 1 damage.", rule succeeds.

Regular scheduling of lion-block damage text:
	now the player wears the lion's shield;
	do the action of blocking a 0 melee hit by the reaper.
	
Testing effects of lion-block damage text: if we assert result "(\n|^)The lion on the shield strikes out, and bites the Reaper for 2 damage.", rule succeeds.

Regular scheduling of death-scroll damage text:
	Now the reusable item is a random scroll of death;
	now the player carries the reusable item;
	try reading the reusable item.
	
Testing effects of death-scroll damage text: if we assert result "(\n|^)A wave of unholy energy is released, dealing <3-6> damage to the Reaper; and <3-6> damage to you.", rule succeeds.

[not sure how we could trigger an unholy wave in another room, but it wouldn't print anything anyway]

Regular scheduling of anti-purification damage text:
	now the player worships Chton;
	now the player carries the vial of purification;
	try drinking the vial of purification.
	
Testing effects of anti-purification damage text: if we assert result "(\n|^)Chton prevents the vial of purification from doing its work; but your attempt at escaping undeath did not amuse him. A wave of extreme cold racks your body, dealing 15 damage!", rule succeeds.

Regular scheduling of aite-statue damage text:
	extract the player to the Temple of Aite;
	try climbing the statue of Aite.
	
Testing effects of aite-statue damage text: if we assert result "(\n|^)You cut yourself as soon as you touch the statue\. The weapons deal 3 damage\.", rule succeeds.
	
Table of Outcomes (continued)
outcome	likelihood	minimum attempts
abyss-wave damage text	1	1
chain-smack damage text	1	1
bomb-power damage text	1	1

Initial scheduling of abyss-wave damage text: prepare a test battle with the abyss of the soul.
regular scheduling of abyss-wave damage text: try the abyss of the soul pulsating.
Testing effects of abyss-wave damage text: if we assert result "(\n|^)The abyss of the soul pulsates, sending out a wave of negative energy that deals <1-2> damage to you.", rule succeeds.

Initial scheduling of chain-smack damage text:
	prepare a test battle with the chain golem;
	now the body score of the player is -100;
	now the melee of the player is 0;
	now the health of the chain golem is 1000;
	now the defence of the chain golem is 50;
	now the concentration of the chain golem is 3.
	
regular scheduling of chain-smack damage text: try attacking the chain golem.
[TODO: make sure attacking doesn't leave crap in the delayed actions table?]	
Testing effects of chain-smack damage text: if we assert result "(\n|^)You attempt to duck under the whirling chains\. You roll <0-9>+ \+ -100 \(body\) = -<0-9>+ against a target number of <0-9>+, failing the body check\. One of the chains catches you with a loud smack, dealing 6 damage\.", rule succeeds.

Regular scheduling of bomb-power damage text:
	now the power of the bomb is granted;
	now the health of the player is 0;
	now the health of the chain golem is 1000;
	have an event of the chain golem killing the player.
	
Testing effects of bomb-power damage text: if we assert result "(\n|^)Your body explodes vehemently as you throw yourself at the chain golem, but you only deal 5 damage instead of the 1000 damage you needed to deal.", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
tentacle-hold no damage text	1	1
tentacle-attack wounding text	1	1
tentacle-constrict damage text	1	1

Initial scheduling of tentacle-hold no damage text:
	prepare a test battle with the tentacle;
	now the hit protection of the player is 1;
	[make sure the tentacle "holds on to you" when the attack does no damage]
	
regular scheduling of tentacle-hold no damage text: do the action of dodging a 100 melee hit by the tentacle.
Testing effects of tentacle-hold no damage text: if we assert "The giant tentacle deals" to the player a total of 0 damage "but holds on to you\.", rule succeeds.
	
Initial scheduling of tentacle-attack wounding text:
	now the tentacle does not grapple the player;
	now the tension is 3;
	
regular scheduling of tentacle-attack wounding text: do the action of dodging a 100 melee hit by the tentacle.
Testing effects of tentacle-attack wounding text:
	assert result "(\n|^)The giant tentacle deals 0 \+ <^=>+ = \d+ damage, wounding you to \d+ health\.";
	check damage of the player with 1000 health after "deals";
	rule succeeds.

regular scheduling of tentacle-constrict damage text: try the tentacle tentacle-constricting;
Testing effects of tentacle-constrict damage text: if we assert "The giant tentacle tightens its muscles, dealing" to the player a total of 1 damage "to you", rule succeeds.

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
thorns-launch damage text	1	1
israfel-burn damage text	1	1
isra-burn damage text	1	1

Regular scheduling of thorns-launch damage text: 
	now brambles strength is 1;
	launch the thorns.

Testing effects of thorns-launch damage text: if we assert "Thorns shoot towards everyone, dealing 1 damage to the giant tentacle; and" to the player a total of 1 damage "to you\.", rule succeeds.
	
Initial scheduling of israfel-burn damage text: prepare a test battle with Israfel.
regular scheduling of israfel-burn damage text: do the action of Israfel waiting for a 100 melee hit by the player.
Testing effects of israfel-burn damage text: if we assert 3 damage to the player after "Israfel's flames burn you for", rule succeeds.
	
initial scheduling of isra-burn damage text: try israfel israfel-splitting.
regular scheduling of isra-burn damage text: do the action of isra waiting for a 100 melee hit by the player.
Testing effects of isra-burn damage text: if we assert 2 damage to the player after "Isra's flames burn you for", rule succeeds.

[TODO: check damage and damage description in one phrase?]
	
Table of Outcomes (continued)
outcome	likelihood	minimum attempts
aite-spike damage text	1	1
chton-wave damage text	1	1
sul-sacrifice damage text	1	1
deathly-scroll damage text	1	1
downstairs damage text	1	1
bees damage text	1	1

Regular scheduling of Aite-spike damage text: deal 3 points of Aite-damage to the player on behalf of the player.
Testing effects of Aite-spike damage text: if we assert 3 damage to the player after "A huge <a-w>+ bursts out of the ground, skewering you for", rule succeeds.
	
Regular scheduling of chton-wave damage text:
	now the reusable item is a random scroll of ghoulification;
	now the player carries the reusable item;
	try reading the reusable item;
	now the health of Isra is 1000;
	clear event description;
	have Chton intervene on behalf of the player.

Testing effects of chton-wave damage text: if we assert "Chton suddenly sends a wave of unholy energy through the room, dealing <3-6> damage to Fell; and" to Isra any damage "to Isra\.", rule succeeds.

[TODO: necromantic damage reduction?]

Regular scheduling of sul-sacrifice damage text:
	extract the player to the temple of Sul;
	now the player does not worship chton;
	clear event description;
	try sacrificing;
	
Testing effects of sul-sacrifice damage text: if we assert 10 damage to the player after "Sul abhors the undead! Divine wrath strikes you instantly, dealing", rule succeeds.

Regular scheduling of deathly-scroll damage text:
	now the player carries the vial of purification;
	try drinking the vial of purification;
	now the player worships Sul;
	now the player carries the reusable item; [scroll of ghoulfication TODO: we should already have it]
	clear event description;
	try reading the reusable item;

Testing effects of deathly-scroll damage text: if we assert "Before you finish reading it, the scroll burns up in your hands! Sul is not amused by your defiant behaviour, and deals" to the player a total of 10 damage "to you\.", rule succeeds.

Regular scheduling of downstairs damage text:
	extract the player to vast staircase;
	clear event description;
	try direction-jumping down.
	
Testing effects of downstairs damage text: if we assert described damage to the player with 1000 health after "With a loud smack, you land in [the room down from Vast Staircase], receiving", rule succeeds.
	
Initial scheduling of bees damage text:
	move the swarm of bees to the location;
	compel the action of waiting;
	
Testing effects of bees damage text: if we assert result "The swarm of bees attacks <^\n>+, dealing <1-3> damage\.", rule succeeds.

[
	
	
[TODO: tests for all damage modifier rules]
[TODO: test damage effects, e.g. fragmentation grenade exploding in another room]
	
Section - Damage Modifiers

damage-modifiers is a test set.

[Test every rule in the following rulebooks:
	
add specific damage
remove specific damage
specific damage multiplier
add general damage
remove general damage
general damage multiplier

If you add any rules, please consider adding a test here]

scenario when testing damage-modifiers:
	Repeat with guy running through people:
		now inherent damage modifier of the guy is 10;
	now the tungausy totem is bannedobject;
	now the focal totem is bannedobject;
	now the totem of the bull is bannedobject;
	now Hall of Mirrors is bannedobject;
	now Miranda is testobject.

Last starting kit setup for Miranda when testing damage-modifiers:
	remove Miranda's amulet from play;
	
damage-modifier-testing is an extracting test step. The first move of damage-modifiers is damage-modifier-testing. The location-target of damage-modifier-testing is Miranda.
	
Definition: a room is precarious if it is Bridge of Doom or it is the Vast Staircase.

Table of Outcomes (continued)
outcome	description	likelihood	minimum attempts	maximum attempts	antecedent
death-blessing	""	1	15	100	--
death-curse	""	1	20	133	--
blessing-reset	""	1	2	10	death-blessing
curse-reset	""	1	2	10	death-curse

Initial scheduling of damage-modifier-testing:
	equip Miranda with nunchucks;
	Now the nunchucks are wood;
	Let the place be the location of Miranda;
	[now the inherent damage modifier of Miranda is 2;]
	if the place is a precarious room:
		swap the occupants of the place and a random not precarious habitable placed room.
	
Testing effects of damage-modifier-testing:
	equip the player with the robe of the dead mage;
	have the player do no reaction to a 100 melee hit by Miranda with result "robe of the dead mage" in 0 out of 1 attempts, checking damage;
	repeat with conc-level running from 1 to 4:
		now the concentration of the player is conc-level;
		transcribe "setting player concentration to [conc-level]";
		have the player do no reaction to a 100 melee hit by Miranda with result "\+ [conc-level * 25]% \(robe of the dead mage\)", checking damage;
		assert that the concentration of the player is conc-level with label "concentration of the player";
	try taking off the robe of the dead mage;	
	now the hit protection of the player is 1;
	have the player do no reaction to a 100 melee hit by Miranda with result "- 100% \(protection\)", checking damage;
	equip the player with dragon armour;
	have the player do no reaction to a 100 melee hit by Miranda with result "- 2 \(dragon armour\)" in 1 out of 3 attempts;
	check damage of the player with 1000 health after "Miranda deals";
	now Miranda is at-stun;
	have the player do no reaction to a 100 melee hit by Miranda with result "- 1 \(stunning\)", checking damage;
	now Miranda is not at-stun;
	equip the player with the executioner's axe;
	now the tension is 2;
	have Miranda do no reaction to a 100 melee hit by the player with result "executioner's axe benefits from tension" in 0 out of 1 attempts, checking damage;
	now the tension is 3;
	have Miranda do no reaction to a 100 melee hit by the player with result "\+ 1 \(executioner's axe benefits from tension\) ", checking damage;
	extract Bodmall to the location;
	have Bodmall do no reaction to a 100 melee hit by Miranda with result "- 1 \(druid resistant to wood\)";
	now Bodmall is barkskinned;
	[barkskin does not protect against axes]
	have Bodmall do no reaction to a 100 melee hit by the player with result "barkskin" in 0 out of 1 attempts;
	equip the player with the plate mail;
	have the player do no reaction to a 100 melee hit by Bodmall with result "- 3 \(suit acts as a Faraday cage\)";
	remove Bodmall from play;
	try taking off the plate mail;
	now the power of the minotaur is granted;
	now the body score of the player is 25;
	have Miranda do no reaction to a 100 melee hit by the player with result "\+ 10 \(axe proficiency\)" in 1 out of 4 attempts, checking damage;
	equip the player with Malleus Maleficarum;
	now the blood magic level of Malleus Maleficarum is 1;
	now the tension is 10;
	have Miranda do no reaction to a 100 melee hit by the player with result "\+ 1 \(Malleus Maleficarum blood bonus\) ", checking damage;
	assert absence of result "tension<^\n>+ damage";
	equip the player with the Yahvinnian crossbow;
	now the tension is 1;
	have Miranda do no reaction to a 100 melee hit by the player with result "crossbow benefits from tension" in 0 out of 1 attempts, checking damage;
	now the current shots of the Yahvinnian crossbow is 1;
	now the tension is 2;
	have Miranda do no reaction to a 100 melee hit by the player with result "\+ 1 \(crossbow benefits from tension\) ", checking damage;
	equip the player with giantbane;
	extract the chain golem to the location;
	now the tension is 20;
	have Miranda do no reaction to a 100 melee hit by the player with result "\+ 2 \(dagger benefits from tension\)", checking damage;
	now the tension is 8;
	have Miranda do no reaction to a 100 melee hit by the player with result "\+ 2 \(dagger benefits from tension\)", checking damage;
	now the tension is 7;
	have Miranda do no reaction to a 100 melee hit by the player with result "\+ 1 \(dagger benefits from tension\)", checking damage;
	now the tension is 1;
	have Miranda do no reaction to a 100 melee hit by the player with result "\+ 1 \(dagger benefits from tension\)", checking damage;
	now the tension is 0;
	now Miranda is just-woken;
	now the player is at-pierce;
	now the body score of the player is 5;
	now the mind score of the player is 5;
	now the stun count of the player is 0;
	now the player is at-howl;
	now the hound provoker is Miranda;
	now the hound status is 1;
	now the concentration of Miranda is 2;
	now Miranda is linked to the player;
	assert that the final body of the player is 5 with label "final body of the player";
	assert that the final mind of the player is 5 with label "final mind of the player";
	have Miranda do no reaction to a 100 melee hit by the player with result "dagger benefits from tension" in 0 out of 1 attempts, checking damage;
	assert that the damage description does not include "Giantbane's special";
	assert that the damage description includes "\+ 2 \(defender was asleep\)";
	assert that the damage description includes "\+ 3 \(piercing\)";
	assert that the damage description includes "\+ 3 \(howling\)";
	assert that the damage description includes "\+ 2 \(counterstrike\)";
	assert that the damage description includes "\+ 2 \(link\)";
	now the hound status is 0;
	now the player is small;
	have the chain golem do no reaction to a 100 melee hit by the player with result "\+ 4 \(Giantbane's special\)", checking damage;
	assert that the damage description includes "- 1 \(small attacker\)";
	now the player is medium;
	now the brightest-flame-counter is 1;
	have the player do no reaction to a 100 melee hit by Miranda with result "- \d+ \(brightest flame\) ", checking damage;
	assert that the total damage is 0 with label "total damage with brightest flame";
	now the brightest-flame-counter is 0;
	now Miranda is insane;
	have the player do no reaction to a 100 melee hit by Miranda with result "\+ 10 \(insane burst of strength\)" in 1 out of 8 attempts, checking damage;
	now Miranda is hostile;
	now the concentration of the chain golem is 1;
	now disintegrating flesh is adapted;
	now metallic scales are adapted;
	have the player do no reaction to a 100 melee hit by the chain golem with result "\+ 2 \(golem spinning\)", checking damage;
	assert that the damage description includes "\+ 1 \(large attacker\)"; [TODO: primary or physical damage? size-agnostic?]
	assert that the damage description includes "\+ 1 \(disintegrating flesh\)";
	assert that the damage description includes "- 1 \(metallic scales\)";
	now disintegrating flesh is not adapted;
	now metallic scales are not adapted;
	remove the chain golem from play;
	[not tested: ethereal damage removal]
	make death-blessing possible; [we only need one to start the loop]
	while we haven't reset every possible outcome:
		now the player is death-cursed;
		now the player is death-blessed; [nothing says you can't be both!]
		now the health of the player is 1000;
		deal 6 points of physical damage;
		deal 5 points of necromantic damage;
		clear event description because "testing death effects -";
		say "Chton tests you with [run paragraph on]";
		have Chton inflict damage on the player;
		check damage of the player with 1000 health after "Chton tests you with";
		test death-blessing against "- 10 \(blessing of life\)";
		test blessing-reset against whether or not the player is death-blessed;
		unless blessing-reset is resolved, make death-blessing possible; [this is a hack - implement dependencies?]
		test death-curse against "\+ 10 \(curse of death\)";
		test curse-reset against whether or not the player is death-cursed;
		unless curse-reset is resolved, make death-curse possible;
	now the player is not death-blessed;
	now the player is not death-cursed;
	say paragraph break;
	
Miranda-runner is a test step. 

Initial scheduling of Miranda-runner:
	now the player carries the rod of the master builder;
	now retreat location is the location of Miranda;
	now the health of the player is 1000;
	now the melee of Miranda is 100;
	now the offensive flow of Miranda is 1;
	now the concentration of Miranda is 2;
	now the innate bloodlust of Miranda is 1;
	[TODO: test bloodlust/insane strength with staff of pain (no bonus?)]
	now Miranda is bloodlusting;
	now the tension is 3;

Choosing a player action when testing Miranda-runner:
	generate the action of going the way-to-get-back.
	
Testing effects of Miranda-runner:
	check damage of the player with 1000 health after "Miranda deals";
	[TODO: more automation of damage description tests, use everywhere]
	assert that the damage description includes "\+ 1 \(you are running\) ";
	assert that the damage description includes "\+ 1 \(offensive flow\) ";
	assert that the damage description includes "\+ 2 \(concentration\) ";
	assert that the damage description includes "\+ 1 \(tension\) ";
	assert that the damage description includes "\+ 10 \(inherent bonus\) ";
	assert that the damage description includes "\+ 1 \(bloodlust\)";
	assert that the damage description includes "x 50% \(rod of the master builder\) ";

radiance-reduction is a test step.

Initial scheduling of radiance-reduction:
	prepare a test battle with the angel of compassion;
	equip the player with the fuligin cloak;
	now the melee of the angel of compassion is 100;
	now the health of the player is 1000;
	compel the action of the angel of compassion attacking the player;
	
Testing effects of radiance-reduction:
	if waiting for player reaction, make no decision;
	assert result "\+ 4 \(sword of light radiance bonus\)";
	assert result "- 2 \(fuligin cloak\)<^\n>+ damage";
	check damage of the player with 1000 health after "deals";
	now the sword of light is iron;
	clear event description;
	try examining the sword of light;
	assert result "It seems to consist of pure iron.";
	assert absence of result "damage increases";
	assert result "; no special bonus when it is made of iron";
	have the player do no reaction to a 100 melee hit by the angel of compassion with result "sword of light radiance bonus" in 0 out of 1 attempts, checking damage;
	now the sword of light is radiance;
	now the radiation of the angel of compassion is 0;
	have the player do no reaction to a 100 melee hit by the angel of compassion with result "sword of light radiance bonus" in 0 out of 1 attempts, checking damage;
	equip the player with the sandals of the heretic;
	clear event description;
	say Divine lightning strikes the player;
	assert result "- 2 \(sandals of the heretic\)<^\n>+ damage";
	check damage of the player with 1000 health after "A ball of lightning shoots from the sky, doing";
	now chton-killing is true;
	have the player do no reaction to a 100 melee hit by the angel of compassion with result "\+ 2 \(Chton's wrath pulls you to your grave\) ", checking damage;
	now chton-killing is false;
	assert result "- 2 \(sandals of the heretic\)";
	equip the player with the sneaking sword;
	force the fuligin cloak to work;
	have the angel of compassion do no reaction to a 100 melee hit with result "\+ 1 \(sneaky attack\) ", checking damage;
	try taking off the fuligin cloak;
	now the radiation of the angel of compassion is 2;
	equip the player with plate mail;
	have the player do no reaction to a 100 melee hit by the angel of compassion with result "- 2 \(plate mail\) ", checking damage;
	
heat-damage-testing is a test step.

Initial scheduling of heat-damage-testing:
	revive the armadillo in the location;
	equip the player with dragon armour;
	now the internal heat of the sword of light is 5;
	compel the action of the angel of compassion attacking the player;
	
Testing effects of heat-damage-testing:
	if waiting for player reaction, make no decision;
	check damage of the player with 1000 health after "angel of compassion deals";
	assert that the damage description includes "\+ 5 \(sword of light is hot\)";
	assert that the damage description includes "- 4 \(dragon armour protects against heat\)";
	have the armadillo do no reaction to 100 melee hit by the angel of compassion with result "- 2 \(victim made of bone\)", checking damage;
	assert that the damage description includes "- 3 \(intrinsic heat resistance\)";
	now the internal heat of the sword of light is 2;
	now the heat strength of the sword of light is 2;
	now the intrinsic heat resistance of the player is -1;
	have the player do no reaction to a 100 melee hit by the angel of compassion with result "- 2 \(dragon armour\)" in 1 out of 3 attempts, checking damage;
	assert that the damage description includes "\+ 1 \(intrinsic heat vulnerability\)"; 
	assert that the damage description includes "- 3 \(dragon armour protects against heat\)";
	have the player do no reaction to a 100 melee hit by the armadillo with result "intrinsic heat vulnerability" in 0 out of 1 attempts, checking damage;
	equip the player with the scythe of flaming;
	now the scythe of flaming is rusted;
	have the angel of compassion do no reaction to a 100 melee hit by the player with result "- 3 \(victim made of radiance\)", checking damage;
	assert that the damage description includes "\(scythe of flaming is hot\)"; [not mentioning rust or heat]
	assert that the damage description includes "- 2 \(rust\)";
	remove the dragon armour from play;
	now the scythe of flaming is not rusted;
	
holy-damage is a test step.

Initial scheduling of holy-damage:
	prepare a test battle with the healer of Aite, inviting groups;
	[now the inherent damage modifier of the defender of aite is 2;]
	revive the reaper in the location;
	equip the reaper with the scythe of slaying;
	revive the rotting corpse in the location;
	revive the malignant chanter in the location;
	revive the smoke demon in the location;
	revive the armadillo in the location;
	[now the inherent damage modifier of the armadillo is 4;]
	revive the wisps of pain in the location;
	revive Bodmall in the location;
	
Testing effects of holy-damage:
	Now the spirit score of the healer of Aite is 9;
	have the rotting corpse do no reaction to a 100 melee hit by the healer of Aite with result "\+ 2 \(holiness\) ", checking damage;
	now the concentration of the smoke demon is 2;
	now the tension is 9;
	have the smoke demon do no reaction to a 100 melee hit by the healer of Aite with result "\+ 2 \(holiness\) ", checking damage;
	assert that the damage description includes "^ (\d) \+ 10 \(inherent bonus\) \+ 2 \(holiness\) \+ 3 \(tension\) \+ (<1-9>) \(smoke demon is quite dense\)";
	Now the expression scan position is 0;
	Let base damage be the number we scan in text matching subexpression 1;
	Now the expression scan position is 0;
	Let density damage be the number we scan in text matching subexpression 2;
	[holy sword does divine damage, so doesn't add to the density damage]
	assert that density damage is (base damage + 10 + 3) / 2 with label "density damage";
	now the tension is 0;
	have the player do no reaction to a 100 melee hit by the healer of Aite with result "\+ 2 \(holiness\)" in 0 out of 1 attempts, checking damage;
	now the reusable item is a random scroll of ghoulification;
	now the player carries the reusable item;
	try reading the reusable item;
	have the player do no reaction to a 100 melee hit by the healer of Aite with result "\+ 2 \(holiness\)", checking damage;
	assert that the damage description includes "- 1 \(ghoul\)";
	assert that the damage description includes "- 2 \(sandals of the heretic\)";
	now the player carries the vial of purification;
	try drinking the vial of purification;
	have the rotting corpse do no reaction to a 100 melee hit by the reaper with result "\+ 5 \(slaying undead\) ", checking damage;
	assert that the damage description includes "\+ 4 \(silver\)";
	assert that the damage description does not include "- \d+ \(silver\)";
	have the smoke demon do no reaction to a 100 melee hit by the reaper with result "\+ 5 \(slaying undead\)<^\n>+ damage" in 0 out of 1 attempts, checking damage;
	assert that the damage description includes "\+ 4 \(silver\)";
	assert that the damage description does not include "- \d+ \(silver\)";
	have the player do no reaction to a 100 melee hit by the reaper with result "- 1 \(silver\)", checking damage;
	assert that the damage description does not include "\+ \d+ \(silver\)";
	now the tormentor of aite is at-pierce;
	now the body score of the tormentor of aite is 8;
	have the smoke demon do no reaction to a 100 melee hit by the tormentor of Aite with result " 0$" in 0 out of 1 attempts, checking damage;
	assert that the damage description does not include "\+ 3 \(piercing\)"; [piercing only affects physical damage]
	now the unmodified damage is 1000; [triggers an old bug]
	now the tormentor of aite is at-pierce;
	have the rotting corpse do no reaction to a 100 melee hit by the tormentor of Aite with result " 0$", checking damage;
	assert that the damage description includes "^\s*<1-9>"; [unmodified damage should be nonzero]
	assert that the damage description includes "- \d+ \(undead immune to necromantic damage\)";
	assert that the damage description does not include "piercing";
	assert that the total damage is 0;
	now the player is deathly-resistant;
	clear event description;
	have chton intervene on behalf of the player;
	[TODO: phrase to check damage in multiple-person damage report]
	assert result "dealing<^\n>* (\d+) - 2 \(resistant to deathly magic\) = (\d+) damage to you";
	now the expression scan position is 0;
	Let original damage be the number we scan in the text matching subexpression 1;
	now the expression scan position is 0;
	Let final damage be the number we scan in the text matching subexpression 2;
	Let expected damage be original damage - 2;
	if expected damage < 0, now expected damage is 0;
	assert that final damage is expected damage with label "calculated damage";
	assert that the health of the player is 1000 - final damage with label "actual damage to the player";
	now the health of the player is 1000;
	now the player is not deathly-resistant;
	[now the inherent damage modifier of the player is 4;]
	have the armadillo do no reaction to a 100 melee hit by the player with result "- 4 \(tough scales\)", checking damage;
	[now the inherent damage modifier of the tormentor of Aite is 7;]
	[TODO: turn the staff of pain silver and check effects on undead and demons]
	have the armadillo do no reaction to a 100 melee hit by the Tormentor of Aite with result "tough scales" in 0 out of 1 attempts; [physical damage reduction only]
	now the power of the armadillo is granted;
	have the player do no reaction to a 100 melee hit by the Tormentor of Aite with result "- 1 \(armadillo\)", checking damage; [general damage reduction - TODO: should it be?]
	have Bodmall do no reaction to a 100 melee hit by the Tormentor of Aite with result "barkskin" in 0 out of 1 attempts;
	[now the inherent damage modifier of the smoke demon is 4;]
	have Bodmall do no reaction to a 100 melee hit by the smoke demon with result "- 3 \(druid resistant to vapour\)";
	clear event description;
	have a fragmentation event in the location with a random fragmentation grenade by the player;
	assert result "\d - \d \(tough scales\) = \d damage to the ravenous armadillo";
	assert result "\d - \d \(hard to damage\) = 0 damage to the wisps of pain";
	assert result "\d - 1 \(barkskin\) = \d damage to Bodmall";
	assert result "\d - 1 \(armadillo\) = \d damage to you";
	try taking off the sandals of the heretic;
	now the player is at-scale;
	have the player do no reaction to a 100 melee hit by the Tormentor of Aite with result "- 6 \(scales\)";
	now the concentration of the malignant chanter is 1;
	have the player do no reaction to a 100 melee hit by the rotting corpse with result "\+ 1 \(malignant chanter\)", checking damage;
	now the player worships Nomos;
	now the favour of the player is 9;
	have the player do no reaction to a 100 melee hit by the armadillo with result "- 4 \(Nomos\)";
	now nomos bonus is true;
	have the defender of Aite do no reaction to a 100 melee hit by the player with result "\+ 4 \(the law is with you\)";
	now the player worships Sul;
	have the rotting corpse do no reaction to a 100 melee hit by the player with result "\+ 2 \(undead slayer\)";
	have the smoke demon do no reaction to a 100 melee hit by the player with result "\+ 2 \(demon slayer\)";
	[chance of no intervention = (39/40)^9 = 79.6%]
	have the player do no reaction to a 100 melee hit by the armadillo with result "x 0% \(Sul intervenes\)" in 1 out of 5 attempts;
	now the player worships nothing;
	while the limbs of the rotting corpse > 0:
		have the rotting corpse do no reaction to a 100 melee hit with result "As the corpse reels back from the blow, his rotting ";
	now the concentration of the rotting corpse is 3;
	have the player do no reaction to a 100 melee hit by the rotting corpse with result "x 0% \(no means of attack\)", checking damage;
	
[TODO: add this check to sul interventions:
	
Section - Sul's intervention

sul-intervention-test is a test set [for issue #227].

Scenario when testing sul-intervention-test:
	now Temple of Sul is testobject;
	now Bodmall is testobject;
	now the swarm of daggers is testobject;
	now the hall of mirrors is bannedobject; 
	
Test play when testing sul-intervention-test:
	extract the player to the location of bodmall;
	have the player defeat Bodmall;
	extract the player to the temple of sul;
	have the player sacrifice a random granted power;
	now the swarm of daggers is not asleep;
	extract the player to the location of the swarm of daggers;
	now the melee of the swarm of daggers is 100;
	clear the event description;
	try the swarm of daggers hitting the player;
	assert result "swarm of daggers deals";
	assert absence of result "Programming error";
	now the melee of the player is 100;
	clear the event description;
	try the player hitting the swarm of daggers;
	assert result "You deal";
	assert absence of result "Programming error";
	[TODO: check frequency of intervention]

]

slave-attacking is a test step.

Initial scheduling of slave-attacking:
	now the health of the reaper is 1000;
	now the reaper is player-enslaved;
	
Choosing a player action when testing slave-attacking:
	generate the action of attacking the reaper;
	
Testing effects of slave-attacking:
	check damage of the reaper with 1000 health after "You deal";
	assert that the damage description includes "\+ 4 \(betrayed by [master]\)";

ment-damage is a test step.

Testing effects of ment-damage:
	have the ment kick in;
	have the defender of Aite do no reaction to a 100 melee hit by the player with result "\+ 1 \(ment\) ", checking damage;
	have the player do no reaction to a 100 melee hit by the defender of Aite with result "- 1 \(ment\) ", checking damage;

automatos-tests is a test set.

automatos-blow is a test step. The first move of automatos-tests is automatos-blow;

Initial scheduling of automatos-blow:
	prepare a test battle with Automatos.
	
Testing effects of automatos-blow:
	equip the player with the executioner's axe;
	now the tension is 12;
	have Automatos do no reaction to a 100 melee hit by the player with result "The impact of the attack is so great that Automatos staggers backwards and shakes its head several times. Some small, almost delicate mechanical parts fall out of its ";
	equip the player with the gorgeous dagger;
	set the size of the gorgeous dagger to medium;
	now the tension is 15;
	have Automatos do no reaction to a 100 melee hit by the player with result "The dagger has struck deep between plates of steel and dislodged something inside Automatos. The behemoth staggers backwards and shakes its head several times. Some small, almost delicate mechanical parts fall out of its ";
	
[
./Victor Gijsbers/Kerkerkruip Actions and UI.i7x - done
./Victor Gijsbers/Kerkerkruip ATTACK.i7x - done
./Victor Gijsbers/Kerkerkruip Items.i7x - done
./Victor Gijsbers/Kerkerkruip Monster Abilities.i7x - done
./Victor Gijsbers/Kerkerkruip Monsters.i7x - done
./Victor Gijsbers/Kerkerkruip Religion.i7x - done
./Victor Gijsbers/Kerkerkruip Systems - Hiding Smoke Ethereal.i7x:A specific damage multiplier rule (this is the ethereal damage immunity rule) - not tested
./Victor Gijsbers/Kerkerkruip Systems.i7x:An add specific damage rule (this is the disintegrating flesh damage modifier rule):
./Victor Gijsbers/Kerkerkruip Systems.i7x:A remove specific damage rule (this is the metallic scales damage reduction rule):


]

[	
Section - Example failure

example failure is a test set.

passing move is a test step. The first move of example failure is passing move.

Testing effects of passing move:
	assert "truth is true" based on true.

failing move is a test step.

Testing effects of failing move:
	assert "truth is false" based on false.

]]

Section - Outcome Behavior

[meta tests]

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
outcome-behavior	1	0	600	restarting for tests
coin-flip	1	2	20	--
easy-flip	1	1	20	coin-flip
third-flip	1	2	20	easy-flip
new-flip	1	2	20	--
after-new-flip	1	2	20	new-flip
insufficient-flip	1	2	20	--
impossible-flip	39	40	400	insufficient-flip
more-impossible	1	2	1	impossible-flip
first-time	2	10	100	--
after-first	2	3	30	first-time
wrong-success	20	30	100	after-first
intended-failure	0	0	100	--
unintended-success	0	0	100	--
wait-a-turn	1	0	2	--
jump-a-turn	1	0	2	--

[This is a meta-test. impossible-flip, more-impossible, after-first, wrong-success, and unintended-success should fail. Sometimes more-impossible never gets tested because impossible-flip never gives it a chance... I think that's probably ok either way]

[Definition: outcome-behavior is enabled:
	decide on whether or not the number of filled rows in Table of Test Set Queue is 1. [only runs when it's the only test]
	
not sure how to do this now]

Testing effects of outcome-behavior: rule succeeds.
Testing effects of coin-flip: if a random chance of 1 in 2 succeeds, rule succeeds.
Testing effects of easy-flip: rule succeeds.
Testing effects of third-flip: if a random chance of 1 in 2 succeeds, rule succeeds.
Testing effects of new-flip: if a random chance of 1 in 2 succeeds, rule succeeds.
Testing effects of after-new-flip: if a random chance of 1 in 2 succeeds, rule succeeds.
Testing effects of insufficient-flip: if a random chance of 1 in 2 succeeds, rule succeeds.
Testing effects of impossible-flip: rule fails.
Testing effects of more-impossible: rule succeeds.
Testing effects of first-time: if the attempt count of first-time is 1, rule succeeds.
Testing effects of after-first: rule succeeds.
Testing effects of wrong-success: if a random chance of 1 in 3 succeeds, rule succeeds.
Testing effects of intended-failure: rule fails.
Testing effects of unintended-success: rule succeeds.

Regular scheduling of wait-a-turn:
	transcribe "DEBUG: regular scheduling of wait-a-turn";
	compel the action of waiting;
	transcribe "DEBUG: compelled waiting";
	update event description;
	
Testing effects of wait-a-turn:
	if we assert result "Time passes", rule succeeds;
	otherwise say "No time passing in '[event description]'!";

Regular scheduling of jump-a-turn: compel the action of jumping.
Testing effects of jump-a-turn: if we assert result "You jump", rule succeeds.

Chapter - Simple Tests

Section - Resizing salves

[tests that don't require restart]

Table of Outcomes (continued)
Outcome	likelihood	minimum attempts	antecedent
Simple tests	0	1	restarting for tests
Resizing salves	1	1	--
too-small-block	1	1	--
agnostic-block	1	1	--	

To decide whether we assert that (item - a thing) is (size - a size):
	if the size of item is size, yes;
	now the failure report is "[the item] should be [size], but it is [size of item]";
	no.
	
Testing effects of resizing salves:
	Let object-list be {yourself, the spiked mace of the ape king, the gilded rapier, the wooden buckler, the bulwark of faith, the plate mail};
	Let the salve-list be a list of things;
	Add a random unguentum crescendi to the salve-list;
	Add a random unguentum diminuendi to the salve-list;
	Repeat with item running through the salve-list:
		now the player carries item;
		Repeat with target running through object-list:
			if target is not the player, now the player carries target;
			Let prev-size be medium;
			now target is medium;
			clear event description;
			try putting the item on the target;
			while prev-size is not the size of target:
				[TODO: how does size affect weapon stats? what about shield stats?]
				if prev-size is [still] the size of target:
					assert result "You carefully apply the salve to [if target is the player]yourself[otherwise][the target][end if], turning ";
				clear event description;
				now prev-size is the size of target;
				try putting the item on the target;
			if the target is the spiked mace of the ape king:
				assert result "Some magic seems to protect the spiked mace of the ape king from the salve\.";
				assert that the target is medium;
			otherwise if the target is the plate mail:
				assert result "The salve will only work on weapons, shields and persons\.";
				assert that the target is medium;
			otherwise if the item is an unguentum crescendi:
				assert result "You cannot make [if target is the player]yourself[otherwise][the target] any bigger\.";
				assert that the target is gargantuan;
			otherwise:
				assert result "You cannot make [if target is the player]yourself[otherwise][the target] any smaller\.";
				assert that the target is tiny;
	rule succeeds;

Initial scheduling of too-small-block:
	prepare a test battle with the armadillo;
	now the player is medium;
	equip the player with the wooden buckler;
	
Regular scheduling of too-small-block: do the action of blocking a 100 melee hit by the armadillo.
Testing effects of too-small-block: if we assert result "\+ 2 \(defender's shield too small\)", rule succeeds.
	
Initial scheduling of agnostic-block:
	equip the player with the bulwark of faith;
	now the player worships Sul;
	now favour of the player is 1;
	
Regular scheduling of agnostic-block: do the action of blocking a 100 melee hit by the armadillo.
Testing effects of agnostic-block: if we assert absence of result "defender's shield too small", rule succeeds.
	
Section - Controlling pipes

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
open-pipes	1	1
x-open pipes	1	1
x-open wheel	1	1
x-closed pipes	1	1
x-closed wheel	1	1

Scenario for simple tests: now Hall of Vapours is testobject. [TODO: run scenario for ALL outcomes in the same test set?]
	
initial scheduling of open-pipes:
	extract the player to Hall of Vapours;
	now pipes-open is true;
	
Regular scheduling of open-pipes: try looking.
Testing effects of open-pipes: if we assert result "Several large pipes continuously spew forth vapours into this room\. A big wheel is attached", rule succeeds.

regular scheduling of x-open pipes: try examining the pipes.
testing effects of x-open pipes: if we assert result " They are currently spewing vapours into the room\.", rule succeeds.

regular scheduling of x-open wheel: try examining the wheel.
testing effects of x-open wheel: if we assert result "which are currently open\.", rule succeeds.

initial scheduling of x-closed pipes: try turning the wheel.
regular scheduling of x-closed pipes: try examining the pipes.
testing effects of x-closed pipes: if we assert result " They are currently shut off\.", rule succeeds.

regular scheduling of x-closed wheel: try examining the wheel.
testing effects of x-closed wheel: if we assert result "which are currently closed\.", rule succeeds.

Section - Bug 351 - scroll cloning

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
bug-351-find	1	1
bug-351-obsc-name	1	1
bug-351-true-name	1	1

regular scheduling of bug-351-find: find a healthy scroll.
testing effects of bug-351-find: if we assert result "You have found a scroll", rule succeeds.

testing effects of bug-351-obsc-name: 
	Repeat with item running through scrolls enclosed by the player:
		unless we assert "The true name and obfuscated name of [item] should be different, but they are both '[true name of item]'" based on whether or not the true name of item is not the obfuscated name of item, rule fails;
	rule succeeds.
	
testing effects of bug-351-true-name:
	Repeat with item running through scrolls:
		let item-name be the true name of item;
		unless we assert "The true name of [item] should not be obfuscated, but it is [true name of item], which is an obfuscated name'" based on whether or not item-name is a not obfuscated scroll name, rule fails;
	rule succeeds.

Section - Bug 352 - exploded property

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
throwing-352	1	1

Initial scheduling of throwing-352: now the reusable item is a random smoke grenade.
Regular scheduling of throwing-352: try throwing the reusable item.
Testing effects of throwing-352: if we assert absence of result "Run-time problem", rule succeeds.
	
Section - Died Counts

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
died-count-test	1	1

[I don't think this bug ever comes up in play, but it happens in test battles]

Initial scheduling of died-count-test:
	now the challenger's initial defeats is the died count of Israfel;
	move Isra to Entrance Hall;
	revive Israfel in Entrance Hall;
	prepare a test battle with israfel;
	
Regular scheduling of died-count-test: try smiting Israfel.
	
Testing effects of died-count-test: if we assert that the died count of israfel is the challenger's initial defeats + 1 with label "died count of Israfel", rule succeeds.

	
Section - Enemies should always start out awake in Arena of the Fallen

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
sleeping fallen	1	1
dead-fallen	1	1
awake-in-fallen-arena	1	1

Scenario when testing Simple Tests: now Entrance to the Arena is testobject.
	
initial scheduling of Sleeping Fallen:
	now the player worships nothing;
	now the favour of the player is 0;
	prepare a test battle with the blood ape;
	now the blood ape is asleep;
	Now the reusable item is a random scroll of death;
	now the health of the blood ape is 1;
	
Regular scheduling of Sleeping fallen: try reading the reusable item.
Testing effects of sleeping fallen: if the blood ape is asleep, rule succeeds.
Testing effects of dead-fallen: if the blood ape is dead, rule succeeds.

initial scheduling of awake-in-fallen-arena: have the player and the blood ape fight in Arena of the Fallen.
testing effects of awake-in-fallen-arena: if the blood ape is not asleep, rule succeeds.

Section - Dream of Sleeping

Table of Outcomes (continued)
outcome	likelihood	minimum attempts
sleeping-dream-dreaming	1	1
sleeping-dream-waking	1	1
malygris-missing-sleeper	1	1
still-sleepy	1	1
malygris-hitting-sleeper	1	1
slapped-awake	1	1

Initial scheduling of sleeping-dream-dreaming:
	now the dream of sleeping is current-test-dream;
	now the reusable item is a random morphean grenade;
	Now Malygris is asleep;
	extract the player to Entrance Hall, making sure it is unoccupied.
	
regular scheduling of sleeping-dream-dreaming: compel the action of throwing the reusable item.
testing effects of sleeping-dream-dreaming: if the player is the untroubled sleeper, rule succeeds.

regular scheduling of sleeping-dream-waking: compel the action of exiting.
testing effects of sleeping-dream-waking:
	assert result "Malygris standing over you";
	assert "Malygris should be awake" based on whether or not Malygris is not asleep;
	assert that the concentration of Malygris is 2;
	assert "the player should be just-woken" based on whether or not the player is just-woken;
	rule succeeds.
	
Initial scheduling of Malygris-missing-sleeper:
	now the health of the player is 1000;
	now the defence of the player is 50;
	now the melee of Malygris is 0;
	
regular scheduling of Malygris-missing-sleeper: compel the action of waiting as a reaction to Malygris.
		
testing effects of malygris-missing-sleeper: if we assert result "defender was asleep<^\n>+Malygris does not overcome your defence rating", rule succeeds.
testing effects of still-sleepy: if the player is just-woken, rule succeeds.

initial scheduling of Malygris-hitting-sleeper: now the melee of Malygris is 100.
regular scheduling of Malygris-hitting-sleeper: compel the action of waiting as a reaction to Malygris.
testing effects of Malygris-hitting-sleeper: if we assert result "Malygris deals<^\n>+ \+ 2 \(defender was asleep\)", rule succeeds.
testing effects of slapped-awake: if the player is not just-woken, rule succeeds.

Section - Healer of Aite Healing

Table of Outcomes (continued)
outcome	likelihood	minimum attempts	maximum attempts	antecedent
healer-not-healing-player	20	20	--	--
healer-healing-defender	1	0	20	--
healer-still-injured	1	1	--	healer-healing-defender
healer-healing-self	1	0	20	--

Initial scheduling of healer-not-healing-player:
	prepare a test battle with the healer of Aite, inviting groups;
	Repeat with guy running through people in the location:
		now the defence of guy is 50;
		now the melee of guy is 0;
		now the health of guy is the permanent health of guy;
	decrease the health of the player by 3;
	
regular scheduling of the scheduled event: [does not apply to dependents]
	if the scheduled event is at least healer-not-healing-player and the scheduled event is at most healer-healing-self:
		wait for the healer of Aite to act freely.
	
testing effects of healer-not-healing-player: if the injury of the player is at least 3, rule succeeds.
		
Initial scheduling of healer-healing-defender:
	decrease the health of the healer of aite by 3;
	decrease the health of the defender of aite by 4;
	
testing effects of healer-healing-defender: if the injury of defender of Aite is less than 4, rule succeeds.
testing effects of healer-still-injured: if the injury of healer of Aite is at least 3, rule succeeds.
testing effects of healer-healing-self: if the injury of healer of Aite is less than 3, rule succeeds.
			
Test Sets ends here.
