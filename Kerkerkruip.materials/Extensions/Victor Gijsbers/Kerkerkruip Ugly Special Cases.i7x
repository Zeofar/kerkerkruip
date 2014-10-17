Kerkerkruip Ugly Special Cases by Victor Gijsbers begins here.

Use authorial modesty.


[For specific item combinations, for instance, that should, perhaps, one dayy, be implemented in a more robust fashion.]


Chapter - Fixing Numbered Disambiguation Choices (for use with Numbered Disambiguation Choices by Aaron Reed)

[Hopefully, we can kick this out when Inform is updated!

Test with: The player carries a scroll of alteration. The player carries a scroll of the blade.

purloin analyser / drop analyser / put scroll in analyser / 2.

See issue #59]

Include (-

[ Descriptors  o x flag cto type n hold signal;
	hold = 0;
	signal = 0;
	ResetDescriptors();
	if (wn > num_words) return 0;

	for (flag=true : flag :) {
		o = NextWordStopped(); flag = false;

	   for (x=1 : x<=LanguageDescriptors-->0 : x=x+4)
			if (o == LanguageDescriptors-->x) {
				flag = true;
				type = LanguageDescriptors-->(x+2);
				if (type ~= DEFART_PK) indef_mode = true;
				indef_possambig = true;
				indef_cases = indef_cases & (LanguageDescriptors-->(x+1));

				if (type == POSSESS_PK) {
					cto = LanguageDescriptors-->(x+3);
					switch (cto) {
					  0: indef_type = indef_type | MY_BIT;
					  1: indef_type = indef_type | THAT_BIT;
					  default:
						indef_owner = PronounValue(cto);
						if (indef_owner == NULL) indef_owner = InformParser;
					}
				}

				if (type == light)  indef_type = indef_type | LIT_BIT;
				if (type == -light) indef_type = indef_type | UNLIT_BIT;
			}

		if (o == OTHER1__WD or OTHER2__WD or OTHER3__WD) {
			indef_mode = 1; flag = 1;
			indef_type = indef_type | OTHER_BIT;
			signal = 1;
		}
		if (o == ALL1__WD or ALL2__WD or ALL3__WD or ALL4__WD or ALL5__WD) {
			indef_mode = 1; flag = 1; indef_wanted = INDEF_ALL_WANTED;
			if (take_all_rule == 1) take_all_rule = 2;
			indef_type = indef_type | PLURAL_BIT;
			signal = 1;
		}
		if (allow_plurals) {
			if (NextWordStopped() ~= -1) { wn--; n = TryNumber(wn-1); } else { n=0; wn--; }
			if (n == 1) { indef_mode = 1; flag = 1; }
			if (n > 1) {
				indef_guess_p = 1;
				indef_mode = 1; flag = 1; indef_wanted = n;
				indef_nspec_at = wn-1;
				indef_type = indef_type | PLURAL_BIT;
			}
		}
		if (flag == 1 && NextWordStopped() ~= OF1__WD or OF2__WD or OF3__WD or OF4__WD) {
			hold=1;
			wn--;  ! Skip 'of' after these
		}
	}
	wn--;
	if (hold == 1) {
		hold=0;
		if (signal == 0) {
			wn--;
		}
		else {
			signal = 0;
		}
	}
	return 0;
];

[ SafeSkipDescriptors;
	@push indef_mode; @push indef_type; @push indef_wanted;
	@push indef_guess_p; @push indef_possambig; @push indef_owner;
	@push indef_cases; @push indef_nspec_at;
	
	Descriptors();
	
	@pull indef_nspec_at; @pull indef_cases;
	@pull indef_owner; @pull indef_possambig; @pull indef_guess_p;
	@pull indef_wanted; @pull indef_type; @pull indef_mode;
];

-) instead of "Parsing Descriptors" in "Parser.i6t".


Kerkerkruip Ugly Special Cases ends here.