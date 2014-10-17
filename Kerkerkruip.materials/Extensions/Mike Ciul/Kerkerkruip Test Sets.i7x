Kerkerkruip Test Sets by Mike Ciul begins here.

Use authorial modesty.

Volume - All Test Sets (not for release)

Include Kerkerkruip Automated Testing by Mike Ciul.
	
Section - Dreadful Presence

[E91A270C9962]

Dreadful-Presence-Test is a test set.

Scenario when testing Dreadful-Presence-Test:
	now the blood ape is testobject;
	
A person has a number called the cower count;

Test play when testing Dreadful-Presence-Test:
	repeat with guy running through denizen people:
		now the defence of guy is 100;
	now the mind score of the player is 10;
	now the player worships Nomos;
	raise the favour of the player to 9;
	try wearing the gown of the red court;
	try readying the malleus;
	now the blood ape is not asleep;
	now the zombie toad is not asleep;
	extract the player to the location of the blood ape;
	extract the zombie toad to the location of the player;
	assert that the dreadful presence of the player is 2;
	[Can't depend on the blood ape's mind being constant - there could be room effects, for example
	assert that the final mind of the blood ape is 5;]
	assert truth of whether or not the target cower percentage of the blood ape is at least 1 with message "the blood ape should have a nonzero target cower percentage";
  	assert that the target cower percentage of the player is 0;
	assert that the target cower percentage of the zombie toad is 0;
	
To decide which number is the target cower percentage of (guy - a person):
	if guy is undead, decide on 0;
	if guy is the player and the player is not insane, decide on 0;
	let n be dreadful presence of the player;
	let m be 10 times n;
	increase m by 5;
	decrease m by final mind of guy;
	decrease m by level of guy;
	if m > 40:
		now m is 40;
	if m < 0:
		now m is 0;
	decide on m;

To check if (guy - a person) cowered this turn:
	let pattern be indexed text;
	now pattern is "[The guy] [cower] before your dreadful presence";
	if the event description matches the regular expression pattern:
		increment cower count of the guy;
	
To decide whether (guy - a person) is within (delta - a number) percent of cowering target:
	if the act count of guy is 0, decide no;
	let cower percentage be cower count of guy times 100 divided by the act count of guy;
	let percent difference be cower percentage minus the target cower percentage of guy;
	if the percent difference is less than 0, now the percent difference is 0 minus the percent difference;
	decide on whether or not the percent difference not greater than delta;
		
To say cower report:
	Repeat with guy running through people in the location:
		say "After [act count of guy] rounds, [the guy] cowered [cower count of guy] times versus a target of [target cower percentage of guy] percent ([target cower percentage of guy times act count of guy divided by 100]).";
	
A test step can be cower-counting.

A cower-counting test step is usually repeatable.

When play begins:
	repeat with E running through cower-counting test steps:
		now the maxed out report of E is "[cower report]";
		now the maximum repeats of E is 300;
	
initial scheduling for a cower-counting test step:
	repeat with guy running through people:
		now the cower count of guy is 0;

testing effects of a cower-counting test step:
	Let success count be 0;
	Repeat with guy running through people in the location:
		check if guy cowered this turn;
		if guy is within 5 percent of cowering target, increment success count;	
	if the repeated moves is at least 20 and success count is the number of people in the location:
		record success of the scheduled event;

Ape-cowering is a cower-counting test step. The first move of Dreadful-Presence-Test is Ape-cowering.
		
Player-cowering is a cower-counting test step. The next move of Ape-cowering is Player-cowering.

initial scheduling for Player-cowering:
	now the player is insane;
	assert truth of whether or not the target cower percentage of the player is at least 1 with message "the insane player's target cower percentage should be at least 1"; 

Chapter - Wasted Space

Table of Wasted Space
space (number)
with 26038 blank rows

Kerkerkruip Test Sets ends here.
