---
title: "GitHub Pages Custom Domains Via HTTPS"
date: 2018-05-03 08:15
---
Two days ago, GitHub [announced](https://blog.github.com/2018-05-01-github-pages-custom-domains-https/) the support of HTTPS for custom domains.
In addition to this blog, I maintain a few websites for [friends](https://physiomovimento.ch/) and [family](https://psychotherapie-bieri.ch/), all configured through `A` records – time for migration!

Officially, the migration is a simple matter of toggling the "Enforce HTTPS" button, but the button was disabled for all of my sites.
The explanation wasn't particularly encouraging: _Unavailable for your site because your domain is not properly configured to support HTTPS_.

Well, time for RTFM (not my favorite hobby).

These are the steps that finally worked for me:

## HTTPS Migration Steps

### Step 0: Mixed Content Prevention

First things first: Prepare your site's content.
Ensure that all your assets (links to CSS, JS, etc.) are loaded via HTTPS.
Otherwise browsers might block your "Mixed Content".

### Step 1: DNS A-Record Migration

On your provider's website, change all `A` records to point to the following four new IPs:
\
&nbsp;

~~`192.30.252.153`~~

~~`192.30.252.154`~~

`185.199.108.153`

`185.199.109.153`

`185.199.110.153`

`185.199.111.153`
\
&nbsp;

This change might take a few hours to become effective (depending on the TTL).
Use `dig` to check whether the new DNS configuration is ready:
```bash
dig netzwerg.ch +noall +answer
```
It should look like this:
```bash
; <<>> DiG 9.10.6 <<>> netzwerg.ch +noall +answer
;; global options: +cmd
netzwerg.ch.		10800	IN	A	185.199.110.153
netzwerg.ch.		10800	IN	A	185.199.111.153
netzwerg.ch.		10800	IN	A	185.199.108.153
netzwerg.ch.		10800	IN	A	185.199.109.153
```

### Step 2: Trigger Certificate Generation

In order for GitHub to detect that your site is now ready for migration, you apparently need to trigger a detection script.
Any change to your repository's `CNAME` file will do, so e.g. make a minor change and revert it, or make a harmless whitespace edit.
As a result, GitHub will now generate the certificates necessary for HTTPS.

### Step 3: Wait For Certificate Availability

Now the "Enforce HTTPS" button will still be disabled, but the explanation will be much more encouraging: _Not yet available for your site because the certificate has not finished being issued_.
More patience required, we're getting there...

### Step 4: Enforce HTTPS

It might take a few hours, but as soon as this message is gone, you can access your site via HTTPS.
Check that everything still works (particularly your new HTTPS asset links).
Once you're happy, toggle the "Enforce HTTPS" switch – Voil&agrave;!