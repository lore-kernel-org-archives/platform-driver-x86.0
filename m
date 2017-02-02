From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH] Add sysfs interface for touchpad state
Date: Thu, 02 Feb 2017 13:46:39 +0530
Message-ID: <1486023399.14342.1.camel@debian.org>
References: <20170130105749.17338-1-rrs@debian.org>
         <CAHp75VcekiLxkGbHFXbPvTX7SwBHobQFmnx5Y-uFWXZSEN9ujA@mail.gmail.com>
         <1485863265.11199.3.camel@debian.org>
         <CAHp75Vfbr0dfxjv1QhF+z6D1Ptd5z9s0K825VnE786W2-y+kPQ@mail.gmail.com>
         <1485959219.8977.1.camel@debian.org>
         <CAHp75VcHE8ZHpuS=WEQOD7kMLSDSiFhZSAx_55ARidi0FUhapw@mail.gmail.com>
         <1485965846.14297.1.camel@debian.org>
         <CAHp75VckDTD+yx4tTwpzgvgsygiWFEs1t5Uc85UsbaJD8inx_w@mail.gmail.com>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:33831 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750937AbdBBIQo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Feb 2017 03:16:44 -0500
Received: by mail-pg0-f66.google.com with SMTP id 3so1185187pgj.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Feb 2017 00:16:44 -0800 (PST)
In-Reply-To: <CAHp75VckDTD+yx4tTwpzgvgsygiWFEs1t5Uc85UsbaJD8inx_w@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hello Andy,

On Wed, 2017-02-01 at 22:53 +0200, Andy Shevchenko wrote:
> > If you have time, please see:
> > https://bugs.launchpad.net/bugs/1366421
> > 
> > It has pretty much all the details on what and why we need something in
> > sysfs.
> 
> It's a lo-o-ong discussion from which I, might be wrongly, assumed
> that there couple of problems: a) you don't know initial state, b)
> something preventing use of event.
> 

Yes.

> Keyboard and touchpad are disabled by hw, so, only what OS needs is a
> notification.
> 

Yes.

> Can you point me exactly to the message that explains _why_ it's
> impossible to use standard eventX mechanism for that?
> 

Comment #43 has the summary of what we've tried.
https://bugs.launchpad.net/onboard/+bug/1366421/comments/43

Some of the drivers do SW_TABLET_MODE, but ideapad does not.
Some of the drivers do sysfs, but ideapad does not.

For ideapad, under Xorg, it generates hotkey events.
And the hotkey event are going to work under Xorg only. What about Wayland/Mir ?
We also aren't sure, if the keycodes that it sends, are uniform across all Yoga
variants.

- -- 
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAliS6ucACgkQpjpYo/Lh
dWlydw/9Ejt8FSHXB3yCwBJdJc0OKfTx3zoJnJ3USbarE3XbNGW+M++FEnz9l6CR
CI97nJDmXRQIXdfKv8xgnoUIFvZhFP20DhvytUx6ukadcLSH/Dwzf60BTThJok08
q76j7hBpV9bRiWANaBw2dPKLt/4++UVPT5Pd8yb70gC0J8PLJ4iyFeEFgOaoniIp
wv01whOHDkSiSW6Due/jC9Cwwv0m4AKeiUYZtJ3oJgFn1yBirlCWjkWvTktjxgwD
QyL3QWePqTl11JATIp34zS+cXOKZFdS26F741aE0eLWP0i9N9KlXceNXe9OXWwYg
EkxGQLbgqgQJ7J4XgRpl6x2ajgwA61Q0KtRep7+TLNT+9SC+OYUqsttLk6EwKSsc
5CAyOcQC1d2i9vPDMHBbqB+Gluu/GcNON7fv3oTbPXYIWkw9kT4yDDlz4Phi3noK
fncCkYw/yp3/lAkTYW5ChEj2/HADcgY3uqG1tpI1XC0YNVxd9LQY++GlboJOVTp5
EoHBcWTmBGKJVXOW1ZmzER5pPDpf6CE/pb0KCBNq3ZLvyyPV/VRJeOPgre1+7Kz5
Ub9mygN3rU/GhalFCj5BQIQpeiTCZa1ax1Ze1iNvJLxfsE5oasWW8yDNdzcl70Wr
grPDk83bTKf+LdNa/jpTijZTMzhpMBWLdZf8N6c1pofDdABMoXU=
=wiLZ
-----END PGP SIGNATURE-----
