# $Id: Makefile.PL,v 1.4 2004/07/04 17:04:17 comdog Exp $
use ExtUtils::MakeMaker;

require 5.006;

eval "use Test::Manifest 1.21";

WriteMakefile(
	'NAME'	       => 'Git::Github::Creator',
	'ABSTRACT'     => 'Create a Github repository for your Perl module',
	'VERSION_FROM' => 'lib/Creator.pm',
	'LICENSE'      => 'perl',
	'AUTHOR'       => 'brian d foy <bdfoy@cpan.org>',
	
	'PREREQ_PM'    => { 
		'Config::IniFiles'     => '0',
		'File::Find::Closures' => '0',
		'Log::Log4perl'        => '0',
		'Test::More'           => '0',
		'Test::Output'         => '0',
		'WWW::Mechanize'       => '0',
		'YAML'                 => '0',
		},
	
	'PM'           => {
		'lib/Creator.pm' => '$(INST_LIBDIR)/Creator.pm',
		},
		
	'EXE_FILES'    => [ 'github_creator' ],

	'MAN1PODS'     => {
		'github_creator' => '$(INST_MAN1DIR)/github_creator.$(MAN1EXT)',
		},

  (eval { ExtUtils::MakeMaker->VERSION(6.46) }
    ? (META_MERGE => {
        resources => {
          Repository => 'http://github.com/briandfoy/github_creator'
          }
        })
    : ()
    ),

	clean  => { FILES    => q|github_creator-*| },
	);
