-define(BUOY_URL, {buoy_url, http, ?HOST, ?HOSTNAME, ?PORT, ?PATH}).
-define(HEADERS, [{<<"Connection">>, <<"Keep-Alive">>}]).
-define(HOST, <<"127.0.0.1:8080">>).
-define(HOSTNAME, <<"127.0.0.1">>).
-define(PIPELINING, 1024).
-define(PATH, <<"/db/client/12345/seg.json?adsafe_url=",
    "https%3a%2f%2fwww.foodnetwork.com%2frecipes%2faaron-mccargo-jr",
    "%2fbaked-lemon-meringue-pie-recipe">>).
-define(PORT, 8080).
-define(TIMEOUT, 1000).
-define(URL, <<"http://127.0.0.1:8080/db/client/12345/",
    "seg.json?adsafe_url=https%3a%2f%2fwww.foodnetwork.com",
    "%2frecipes%2faaron-mccargo-jr%2fbaked-lemon-meringue-pie-recipe">>).

