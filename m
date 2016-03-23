From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH] fujitsu-laptop: Support radio LED
Date: Wed, 23 Mar 2016 08:51:45 +0100
Message-ID: <20160323075145.GA4216@eudyptula.hq.kempniu.pl>
References: <1458127687-25366-1-git-send-email-kernel@kempniu.pl>
 <20160318120418.GA29889@marvin.atrad.com.au>
 <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:33903 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753431AbcCWHvV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 23 Mar 2016 03:51:21 -0400
Received: by mail-lf0-f51.google.com with SMTP id c62so1867497lfc.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Mar 2016 00:51:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160322133051.GA3379@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> > If you could let me know how you went about
> > acquiring the values on your machine I could try the exact same ste=
ps on the
> > S7020 to see what we get.
>=20
> The BTNI value is printed to the kernel log buffer by
> acpi_fujitsu_hotkey_add(), so all it takes to retrieve it is:
>=20
>     dmesg | grep BTNI
>=20

I forgot to write that the other value I suggested could perhaps be use=
d
to determine whether a radio toggle button is present on a given model
(0x00020320 on a Lifebook E744) is the return value of:

    call_fext_func(FUNC_RFKILL, 0x0, 0x0, 0x0);

It is stored in the rfkill_supported field of struct fujitsu_hotkey_t.
You can also look it up in a DSDT dump.  On a Lifebook E744:

    Method (S000, 3, Serialized)
    {
        Name (_T_0, Zero)  // _T_x: Emitted by ASL Compiler
        Local0 =3D Zero
        While (One)
        {
            _T_0 =3D Arg0
            If ((_T_0 =3D=3D Zero))
            {
 >>             Local0 |=3D 0x00020000
                Local0 |=3D 0x0200
                Local0 |=3D 0x0100
                Local0 |=3D 0x20
            }
            ...
            Break
        }

        Return (Local0)
    }

On an E8420:

    Method (S000, 3, NotSerialized)
    {
        Local0 =3D 0x80000000
        If ((Arg0 =3D=3D 0x00))
        {
            Local0 =3D Zero
            Local0 |=3D 0x20
            Local0 |=3D 0x0100
            Local0 |=3D 0x0200
        }
        ...
        Return (Local0)
    }

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
