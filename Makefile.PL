# $Id: Makefile.PL,v 1.4 2004/07/04 17:04:17 comdog Exp $
use ExtUtils::MakeMaker;

require 5.006;

eval "use Test::Manifest 1.14";

WriteMakefile(
	'NAME'	       => 'github_creator',
	'ABSTRACT'     => 'Create a Github repository for your Perl module',
	'VERSION_FROM' => 'github_creator',
	'LICENSE'      => 'perl',
	'AUTHOR'       => 'brian d foy <bdfoy@cpan.org>',
	
	'PREREQ_PM'    => { 
		'Test::More'           => '0',
		'YAML'                 => '0',
		'Config::IniFiles'     => '0',
		'File::Find::Closures' => '0',
		'WWW::Mechanize'       => '0',
		},

	'EXE_FILES'    => [ 'github_creator' ],

	'MAN1PODS'     => {
		'github_creator' => '$(INST_MAN1DIR)/github_creator.1',
		},

	clean  => { FILES    => q|github_creator-*| },
	);
