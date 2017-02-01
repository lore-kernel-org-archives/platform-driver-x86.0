From: Ritesh Raj Sarraf <rrs@debian.org>
Subject: Re: [PATCH] Add sysfs interface for touchpad state
Date: Wed, 01 Feb 2017 21:47:26 +0530
Message-ID: <1485965846.14297.1.camel@debian.org>
References: <20170130105749.17338-1-rrs@debian.org>
         <CAHp75VcekiLxkGbHFXbPvTX7SwBHobQFmnx5Y-uFWXZSEN9ujA@mail.gmail.com>
         <1485863265.11199.3.camel@debian.org>
         <CAHp75Vfbr0dfxjv1QhF+z6D1Ptd5z9s0K825VnE786W2-y+kPQ@mail.gmail.com>
         <1485959219.8977.1.camel@debian.org>
         <CAHp75VcHE8ZHpuS=WEQOD7kMLSDSiFhZSAx_55ARidi0FUhapw@mail.gmail.com>
Reply-To: rrs@debian.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:36711 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752566AbdBAQRb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 1 Feb 2017 11:17:31 -0500
Received: by mail-pf0-f196.google.com with SMTP id 19so32072570pfo.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 01 Feb 2017 08:17:30 -0800 (PST)
In-Reply-To: <CAHp75VcHE8ZHpuS=WEQOD7kMLSDSiFhZSAx_55ARidi0FUhapw@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

On Wed, 2017-02-01 at 17:07 +0200, Andy Shevchenko wrote:
> > root@learner:/sys/class/input# od -x /dev/input/event6
> > ?0000000 ee33 5891 0000 0000 2bd9 0005 0000 0000
> > ^@0000020 0004 0004 0042 0000 ee33 5891 0000 0000
> > 0000040 2bd9 0005 0000 0000 0001 00c1 0001 0000
> > 0000060 ee33 5891 0000 0000 2bd9 0005 0000 0000
> > 0000100 0000 0000 0000 0000 ee33 5891 0000 0000
> > 0000120 2c09 0005 0000 0000 0001 00c1 0000 0000
> > 0000140 ee33 5891 0000 0000 2c09 0005 0000 0000
> > 0000160 0000 0000 0000 0000 ee37 5891 0000 0000
> > 0000200 3d7e 000f 0000 0000 0004 0004 0043 0000
> > 0000220 ee37 5891 0000 0000 3d7e 000f 0000 0000
> > 0000240 0001 00c0 0001 0000 ee37 5891 0000 0000
> > 0000260 3d7e 000f 0000 0000 0000 0000 0000 0000
> > 0000300 ee37 5891 0000 0000 3dae 000f 0000 0000
> > 0000320 0001 00c0 0000 0000 ee37 5891 0000 0000
> > 0000340 3dae 000f 0000 0000 0000 0000 0000 0000
> 
> So, the whole idea of this exercise is to show that driver sends an
> event whenever you bend / unbend the cover.
> User space already will know what is the state of the cover.
> 

Yes. But we've not found the interface in sysfs where we could read that from.
Nor did udev report anything meaningful for it.

> > By the way, does the patch make sense for
> > inclusion ? To have an interface for touchpad mode ?
> 
> The question now is why do you need that on top of existing event?

If you have time, please see:
https://bugs.launchpad.net/bugs/1366421

It has pretty much all the details on what and why we need something in sysfs.

For HP and ThinkPad, there already are interfaces available.

/sys/devices/platform/hp-wmi/tablet
/sys/devices/platform/thinkpad_acpi/hotkey_tablet_mode

It'd be nice to see the same for Yoga IdeaPad; a proper interface for tablet-
mode.

- -- 
Ritesh Raj Sarraf | http://people.debian.org/~rrs
Debian - The Universal Operating System
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEQCVDstmIVAB/Yn02pjpYo/LhdWkFAliSChYACgkQpjpYo/Lh
dWm/LhAAitvcaPzR2fUR6gtlxMLOQDTEPA8rjQdVmIBFLYPV9OTyJPkjz9V0aZlR
S4BcGa43foXLNsj5tGFNoy8gucwQ2bpEEpPJazlsmRVk9SB7Ui0GVzU673EUqCHD
wR3NI4MzlEmo6RV8DxTyx6rGOjGH2XGjwi6cbfZFLiehw7RjYZV5ggO5uxK+O43n
EbudMaiHOZeg+rYtU+c162TdAjPwwWTiTx5LJvZpam7QS3M31U76PdVt75bacbfH
m7TarxK15ksP9Mmj3DJnXKavOS5u92mPRkSIZmE/hmWsJ/X6tmTzgX0tHddF4N+7
yaftBwglqV6Da8Xylc9GKkC2Q/b0mXSQqTwr86fK2TyKY6HHj5QJ6CNG9gwP33tG
Kg2zIpMzKul7FHpJeQIrHL312Z/4bek1Islki2ydt8CwdheMPTnxUqcFNKpaTItM
FudQTJuaffXinmavGtwco/iFBqJbnqX3RkgWpXxyIvG4NTLrcMcMDKY6DRo+f2FB
0ojU2APhPZ+63+fvCwO1Bv06/vbzfphkOvgQv6w2laekmuCJaF2RfQDj8N+DiteH
LRmqYpF4UEr4WnJeHuumV3oRQsjHU6exdzg/5oBNyJ1vD8CzRFYvTgyNmdunmFnp
ybuVmjVIjFKxGnF1x46ZFF+o7CM0+3XeC6vFYbT3WNDQq1iQKTY=
=/CI9
-----END PGP SIGNATURE-----
