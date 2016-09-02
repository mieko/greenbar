# General Notes

Of the Top 2000 sites on the Web:

  * 1329 return a certificate on port host:443.  Not all of which are valid
    (e.g., the site doesn't advertise HTTPS, but has something listening there
    anyway).

  * 122 sites serve EV Certificates.  That's 6.1% of the top 2000, or 9.1% of
    sites that presented a certificate.

  * A few sites use EV certificates to do stupid things.  bedbathandbeyond.com has
    an EV cert signed only for 'www'.bedbathandbeyond.com, and if accessed, uses
    it to redirect the client to plain-HTTP.  Presumably this is so he or she
    can be SSL-stripped before they reach the authentication or checkout
    process, where the EV cert is utilized.

  * CloudFlare is continuing to take over the web, being the certificate
    served for 123 of the 1329 (9%)  HTTPS-enabled sites.  Creepy, but in
    terms of security, is very probably improving things.  104 certs are
    Google's.

  * EV certs seem to run the same SSLLabs score gamut in similar proportions
    to the rest of the web.

For future ref:
http://siliconangle.com/blog/2014/02/26/bitcoin-weekly-2014-february-26-mtgox-is-dead-but-its-not-all-about-mtgox/
