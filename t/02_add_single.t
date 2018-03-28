use strict;
use Test::More 0.98;
use FindBin;

use lib ("$FindBin::Bin/../lib");
use App::enman::Command::add;

is( &App::enman::Command::add::is_url("http://google.com"),
    1, "is url works" );
is( &App::enman::Command::add::is_url(
        "http://builder.sabayon/8220428241425820618/science"),
    1,
    "is url works"
);
is( &App::enman::Command::add::is_url("google.com"), 0, "is url works" );
is( &App::enman::Command::add::normalize("http://google.com"),
    "google-com", "normalize works" );
is( &App::enman::Command::add::normalize("https://google.com"),
    "google-com", "normalize works" );

is( &App::enman::Command::add::normalize("https://google.com/is/a/test"),
    "google-com-is-a-test", "normalize works" );

is( &App::enman::Command::add::last_path("http://foo.com/b"),
    "b", "normalize works" );
is( &App::enman::Command::add::last_path(
        "https://bar.com/last/last/path/of/url"),
    "url",
    "normalize works"
);

done_testing;
