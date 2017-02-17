From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH v3] Add sysfs interface for touchpad state
Date: Sat, 18 Feb 2017 00:20:02 +0530
Message-ID: <1487357402.13283.1.camel@debian.org>
References: <20170217144815.11791-1-rrs@debian.org>
         <CAHp75Vd8oqnJLRP4HLsTD_SUThwvRNegektN+-bbeT5L8h-NTQ@mail.gmail.com>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35436 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934763AbdBQSuV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2017 13:50:21 -0500
Received: by mail-pg0-f65.google.com with SMTP id y6so4461297pgy.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2017 10:50:06 -0800 (PST)
In-Reply-To: <CAHp75Vd8oqnJLRP4HLsTD_SUThwvRNegektN+-bbeT5L8h-NTQ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Ike Panhc <ike.pan@canonical.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On Fri, 2017-02-17 at 18:12 +0200, Andy Shevchenko wrote:
> > +static ssize_t touchpad_store(struct device *dev,
> > +                                struct device_attribute *attr,
> > +                                const char *buf, size_t count)
> > +{
> > +       struct ideapad_private *priv = dev_get_drvdata(dev);
> > +       int ret, state;
> > +
> > +       ret = kstrtoint(buf, 0, &state);
> > +       if (ret)
> > +               return ret;
> 
> If it's intended to be boolean, better to use kstrtobool()

Thanks. Revised patch built, tested locally, and sent (git send-email).


- -- 
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAlinRdoACgkQpjpYo/Lh
dWljCRAAqAqvbXABNFnoObBrQ4e4nULupH/R2FuAOU+tgKJUv6Fks85TuPvoNLwb
OYMP7HoXXKf1ME4lIILEhrl6UCvlOzN4lUbxdFaUhg/NvvduHc9n5v+hFDask/BC
dA+Vt4r8KI8FH6O5O/JqxkFm0UZSVA41K15fTsX/5JunH7f+SOKPQIjMAk3/3MBm
puVtxDUTHjx0yOTpzIv0xzIrVtwAeFtfINDG/M+e5wKuurCyZ+ARvRb0melRHGXH
N4PlAAZ2BvgLqHjZqU+EqkER1wiAPkpZw0VSavT9Efw+FMy/yKoogdRLImRNR8Sh
MwAuj+U4xL572n53x09w9UBbAGAbP4O4O/1DUl2zL6MXFtHboCs+AkPP9UYaUXYG
rhi3GSPHCDk0iQuXrwMmjyDw3Ta1RFJs4aBAuRdJOiifH0nOTsA5SmX4i4Mep+9k
QuMSEIHTNQpflAuGe0/4ku+QEQDm0L7IXxzqK7Ra+P9XdqOxa5iYyrbmPxqgL0xA
+DjT/92ZvHI5IFBBk/c5ZSCaRmSchaHiHWPG3z7qcP770jKqKAeMVeyxMAo8q/h7
J0E7w5p+kFn/71+3E4TvM1pC13mHwspAqheoIfYObPS1nU3XVIUpJ9A/rLLcvXY5
920LxV0Yz+Gs1GcgVlItOSSUhPeh11atzV3Y4UAnMuvh7RWWzDc=
=6Bli
-----END PGP SIGNATURE-----
