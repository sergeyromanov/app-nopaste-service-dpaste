package App::Nopaste::Service::dpaste;

use strict;
use warnings;

our $VERSION = '0.02';

use base 'App::Nopaste::Service';

sub uri { 'http://dpaste.com/' }

my $languages = {
    apacheconf => 'Apache',
    bash       => 'Bash',
    css        => 'Css',
    diff       => 'Diff',
    django     => 'DjangoTemplate',
    erb        => 'Rhtml',
    haskell    => 'Haskell',
    js         => 'JScript',
    pycon      => 'PythonConsole',
    python     => 'Python',
    ruby       => 'Ruby',
    sql        => 'Sql',
    xml        => 'Xml',
    text       => q(),
};

sub fill_form {
    my( $self, $mech, %args ) = @_;

    my $lang = $args{lang} || 'text';

    $mech->submit_form(
        form_name => 'pasteform',
        fields    => {
            content  => $args{text},
            hold     => 'on',
            language => $languages->{$lang},
            ( $args{nick}
                ? (poster => $args{nick})
                : ()
            ),
            ( $args{desc}
                ? (title => $args{desc})
                : ()
            ),
        },
    );
}

sub return {
    my( $self, $mech ) = @_;

    my $link = $mech->uri;

    return (1, $link);
}

1 && q[Electric Wizard - Return Trip];

__END__
=pod

=encoding UTF-8

=head1 NAME

App::Nopaste::Service::dpaste - L<App::Nopaste> interface to L<http://dpaste.com>

=head1 SYNOPSIS

    nopaste -s dpaste -l haskell foo_file.hs

=head1 SEE ALSO

L<App::Nopaste::Command> - command-line utility for L<App::Nopaste>

=head1 AUTHOR

Sergey Romanov, C<sromanov@cpan.org>.

=head1 COPYRIGHT AND LICENSE

Copyright (C) 2013 by Sergey Romanov.

This library is free software; you can redistribute it and/or modify
it under the terms of the Artistic License version 2.0.

=cut
