#!perl
use 5.12.1;
use Text::CSV_XS qw(csv);

my $file = shift @ARGV;
my $aoh = csv(in => $file, headers => 'auto');
my @out = ( [ qw(LastName FirstName Group SubGroup CarNumber) ] );
for my $scout (@$aoh) {
    state $i = '01';
    push @out, [
            $scout->{'Last Name'},
            $scout->{'First Name'},
            'Pack 42',
            $scout->{'Den Type'} . ' ' . $scout->{'Den Number'},
            '',
    ],
}

csv( in => \@out, out => *STDOUT);
