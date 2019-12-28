# Greenbar

This is a scrape of TLS handshakes from the top 2000 sites, per Alexa.  The certificates returned
are in `certs/`, the TLS scores according to SSL Labs are in `scores/`.  EV certs are (also) in
`ev-certs`.

I run this periodically just to see what's going on with HTTPS on the open internet.  This time,
I didn't have a chance to gather anything particularly in-depth, but the data is up-to-date as of
Dec 27, 2019.

## Quick Facts

Of the Top 2000 sites on the Web:
  * 1825 return a certificate on port host:443.  Not all of which are valid
    (e.g., the site doesn't advertise HTTPS, but has something listening there
    anyway).
  * 90 sites serve EV Certificates.
  * LetsEncrypt accounts for 384 certificates.
  * CloudFlare accounts for 294 certificates.
  * Google accounts for 335 certificates.
  * EV certs seem to run the same SSLLabs score gamut in similar proportions to the rest of the web.

## Trivia
  * Apple.com is the largest site with a terrible SSL Labs score: F.  It's not a some weird edge
    case, it's *actually* terrible.  Poodle vulnerability, no secure negotiation, TLS1.0 and
    TLS1.1 enabled.  If it's all for compatibility, they're covering a range *much* larger than
    most sites.  `icloud.com` has an A+.

## Usage
The `top-2k.csv` is just a `head -n 2000` of this CSV file:

  http://s3.amazonaws.com/alexa-static/top-1m.csv.zip

You can re-fetch the certificates by running `./get-certs.sh`.  It requires `gtimeout` and
`openssl` commands to be available.

You can then get the EV certs copied into `./ev-certs` by running `./find-ev.sh`.

You can score all sites by running `./score-evs.sh`.  It requires `ssllabs-scan` (available via
homebrew.)  My initial purpose was to only compare the *actual* HTTPS implementation of sites
presenting EV certs to DV certs, so it currently only uses `ssllabs-scan` on the `ev-certs`
directory.

I'll update this intermittently.  The commit history will have older versions.
