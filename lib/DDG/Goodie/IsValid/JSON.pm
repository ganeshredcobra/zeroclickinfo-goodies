package DDG::Goodie::IsValid::JSON;

use DDG::Goodie;

use Try::Tiny;
use JSON qw(from_json);

zci answer_type => 'isvalid';
zci is_cached   => 1;

triggers start => 'is valid json', 'validate json';

handle remainder => sub {
	my $result = try {
		from_json($_);
		return 'valid';
	} catch {
		return 'invalid';
	};

	return "Your JSON is $result!";
};

1;
