# error-message utilities

# include guard
[ "${_libs/${BASH_SOURCE[0]}}" = "${_libs=}" ] ||
  return 0 && _libs+=" ${BASH_SOURCE[0]}"

warn() { printf "$* at line %s, file %s\n" $(caller) 1>&2 ; }
die() { printf "$* at line %s, file %s\n" $(caller) 1>&2 ; exit -1; }

return 0

=head1 NAME

gripe.sh - shell utilities for error messages

=head1 SYNOPSIS

    source gripe.sh
    warn [message]
    die [message]

=head1 DESCRIPTION

B<warn> issues a warning message to standard error and continues.
B<die> issues a warning message to standard error and terminates the calling program with a non-zero exit status.

In both, the message includes a file name and a line number.

Note that these are shell functions, so C<gripe.sh> must be sourced, not called.

=head1 OPTIONS

=over

=item C<message>

optional message

=back

=head1 DIAGNOSTICS

Hey.  These I<are> diagnostics.

=head1 AUTHOR

  Jeffrey S. Haemer <jsh@usenix.org>
