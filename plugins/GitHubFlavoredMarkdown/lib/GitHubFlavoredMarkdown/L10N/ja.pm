package GitHubFlavoredMarkdown::L10N::ja;

use strict;
use warnings;
use base 'GitHubFlavoredMarkdown::L10N::en_us';

use vars qw( %Lexicon );

%Lexicon = (
    # config.yaml
    '_PLUGIN_DESCRIPTION'   => '"GitHub Flavored Markdown"書式をサポートします。CSSは<a href="https://gist.github.com/andyferra/2554919" target="_blank">Gist: Github Markdown CSS - for Markdown Editor Preview</a>あたりからダウンロードして使用すると幸せになれます。',
    # tmpl/system_config.tmpl
    'Use Anonymous mode'    => '匿名モード',
    'GFM API Username'      => 'APIユーザー名',
    'GFM API Password'      => 'APIパスワード',
);

1;