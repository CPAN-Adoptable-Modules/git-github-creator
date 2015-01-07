require 5.008;
use strict;
use warnings;

my $github    = 'https://github.com/briandfoy/';
my $main_file = 'lib/Git/Github/Creator.pm';

my %WriteMakefile = (
	NAME          => 'Git::Github::Creator',
	ABSTRACT_FROM => $main_file,
	VERSION_FROM  => $main_file,
	LICENSE       => 'perl',
	AUTHOR        => 'brian d foy <bdfoy@cpan.org>',

	PREREQ_PM    => {
		'Config::IniFiles'     => '0',
		'File::Find::Closures' => '0',
		'Log::Log4perl'        => '0',
		'Term::Prompt'         => '0',
		'Test::More'           => '0',
		'Test::Output'         => '0',
		'YAML'                 => '0',
		'Net::GitHub'          => '0.48',
		},

	EXE_FILES    => [ 'github_creator' ],

	MAN1PODS     => {
		'github_creator' => '$(INST_MAN1DIR)/github_creator.$(MAN1EXT)',
		},

	META_MERGE => {
		'meta-spec' => { version => 2 },
		resources => {
			repository => {
				type => 'git',
				url  => 'git://github.com/briandfoy/github_creator.git',
				web  => 'https://github.com/briandfoy/github_creator',
				}
			}
		},

	clean  => { FILES => q|github_creator-*| },
	);

sub arguments { \%WriteMakefile }

do_it() unless caller;
sub do_it {
	require File::Spec;
	my $MM ='ExtUtils::MakeMaker';
	my $MM_version =
		eval{ "$MM " . $WriteMakefile{'CONFIGURE_REQUIRES'}{'ExtUtils::MakeMaker'} }
			//
		"$MM 6.64";
	eval "use $MM_version";
	eval "use Test::Manifest 1.21" 
		if -e File::Spec->catfile( qw(t test_manifest) );
	WriteMakefile( %WriteMakefile );
	}


no warnings;
__PACKAGE__;
