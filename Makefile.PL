#!/usr/bin/env perl
use strict;
use warnings;
use ExtUtils::MakeMaker;

my( $mm ) = $ExtUtils::MakeMaker::VERSION =~ /^([^_]+)/;

WriteMakefile(
    NAME          => 'App::Nopaste::Service::Dpaste',
    VERSION_FROM  => 'lib/App/Nopaste/Service/Dpaste.pm',
    ABSTRACT_FROM => 'lib/App/Nopaste/Service/Dpaste.pm',
    AUTHOR        => 'Sergey Romanov <sromanov@cpan.org>',
    PREREQ_PM     => {
        'App::Nopaste' => '0.91',
    },
    ( $mm >= 6.31
        ? ( LICENSE => 'artistic_2' )
        : ()
    ),
    ( $mm < 6.46
        ? ()
        : ( META_MERGE => {
                resources => {
                    license    => 'http://dev.perl.org/licenses/',
                    repository => 'http://github.com/sergeyromanov/app-nopaste-service-dpaste',
                    bugtracker => 'https://github.com/sergeyromanov/app-nopaste-service-dpaste/issues'
                },
                no_index => {directory => [qw/t/]},
            },
            META_ADD => {
                build_requires     => {},
                configure_requires => {},
                test_requires      => {
                    'Test::More'   => '0.47',
                },
            },
        )
    ),
    test => { TESTS => 't/*.t' }
);
