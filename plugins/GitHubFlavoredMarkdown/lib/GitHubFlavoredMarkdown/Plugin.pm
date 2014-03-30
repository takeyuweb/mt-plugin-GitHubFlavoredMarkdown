package GitHubFlavoredMarkdown::Plugin;

use strict;
use warnings;
use Encode;
use MT;

sub gfm_filter {
    my ( $text, $ctx ) = @_;
    my $plugin = MT->component( 'GitHubFlavoredMarkdown' );
    my $api = MT->config->GFM_API || 'https://api.github.com/markdown/raw';
    my $bytes = encode_utf8($text);
    my @headers = (
        'User-Agent'    => 'mt-plugin-GitHubFlavoredMarkdown/' . $plugin->{ version },
        'Content-Type'  => 'text/x-markdown',
    );
    require LWP::UserAgent;
    my $ua = LWP::UserAgent->new;
    $ua->ssl_opts( verify_hostname => 0 );
    my $req = HTTP::Request->new( 'POST', $api );
    $req->header( @headers );
    $req->content( $bytes );
    my $res = $ua->request( $req );
    unless ( $res->is_success ) {
        die "GFM error response: " . $res->code . ' ' . $res->content;
    }
    return $res->content;
}

1;