package GitHubFlavoredMarkdown::Plugin;

use strict;
use warnings;
use Encode;
use MT;

sub gfm_filter {
    my ( $text, $ctx ) = @_;
    return $text unless $text;
    my $is_template_context = defined $ctx && ref( $ctx ) eq 'MT::Template::Context';
    return $text unless $is_template_context;
    
    my $plugin = MT->component( 'GitHubFlavoredMarkdown' );
    my $api = $plugin->get_config_value( 'gfm_api_base' ) || 'https://api.github.com/markdown/raw';
    my $bytes = encode_utf8($text);
    my @headers = (
        'User-Agent'    => 'mt-plugin-GitHubFlavoredMarkdown/' . $plugin->{ version },
        'Content-Type'  => 'text/x-markdown',
    );
    my $is_anonymous = $plugin->get_config_value( 'gfm_api_anonymous' ) ? 1 : 0;
    
    require LWP::UserAgent;
    my $ua = LWP::UserAgent->new;
    $ua->ssl_opts( verify_hostname => 0 );
    my $req = HTTP::Request->new( 'POST', $api );
    $req->header( @headers );
    unless ( $is_anonymous ) {
        my $username = $plugin->get_config_value( 'gfm_api_username' ) || '';
        my $password = $plugin->get_config_value( 'gfm_api_password' ) || '';
        $req->authorization_basic( $username, $password );
    }
    $req->content( $bytes );
    my $res = $ua->request( $req );
    unless ( $res->is_success ) {
        my $blog_id = $ctx->stash( 'blog' ) ? $ctx->stash( 'blog' )->id : 0;
        my $error_msg = "GFM error response: " . $res->code . ' ' . $res->content;
        _error_log( $error_msg, $blog_id );
        die $error_msg;
    }
    
    return $res->content;
}

sub _error_log {
    my ( $message, $blog_id ) = @_;
    require MT::Log;
    use MT::Log;
    my $log = MT::Log->new;
    $log->message( $message );
    $log->level( MT::Log::ERROR );
    if ( $blog_id ) {
        $log->blog_id( $blog_id );
    }
    $log->category( 'gfm' );
    $log->save
        or die $log->errstr;
    return 1;
}

1;