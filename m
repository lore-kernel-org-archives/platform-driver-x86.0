From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Thu, 22 Oct 2015 12:50:18 +0200
Message-ID: <20151022105018.GX15219@pali>
References: <20151021085724.GA87951@vmdeb7>
 <20151021091954.GD15219@pali>
 <20151021110059.GF15219@pali>
 <20151021111243.GB87951@vmdeb7>
 <CABFtUbTZ6M4FQ3bAjKp1iKhkoybs9-RiL6B6sCgTVvEsdXJSrw@mail.gmail.com>
 <CABFtUbTF5k1Jm_pG6XiG1_9H8EwZQfvbXFuGWUjNZHd5YDgvXg@mail.gmail.com>
 <20151022074937.GA2581@malice.jf.intel.com>
 <CABFtUbTKUTfkeqE5nWKdNyrpbs3d2edNhMb8aSmSG_fBsMvcBg@mail.gmail.com>
 <20151022085117.GQ15219@pali>
 <5628BDF8.9030506@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:38144 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751885AbbJVKuW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 06:50:22 -0400
Received: by wicll6 with SMTP id ll6so113059693wic.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2015 03:50:20 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <5628BDF8.9030506@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On Thursday 22 October 2015 12:44:08 Gabriele Mazzotta wrote:
> On 22/10/2015 10:51, Pali Roh=C3=A1r wrote:
> >On Thursday 22 October 2015 10:26:47 Gabriele Mazzotta wrote:
> >>I'll see if I can find a batter way to deal with this problem,
> >>dell-laptop can detect the presence of an hardware switch.
> >
> >dell-rbtn.ko has acpi method CRBT which returns if notebook has hw s=
witch or
> >toggle key.
> >
> >And rfkill implementation in dell-laptop.ko does not work correctly =
on
> >XPS machines. And because userspace implementation of smbios works f=
ine,
> >I think that problem is in kernel driver rather in BIOS/firmware...
>=20
> I was thinking about something such as the following, which should fa=
vor
> the hardware slider when available. This should work if my assumption=
 is
> correct, that is the laptops with a working RBTN method are the ones
> having problems.
>=20

Hm... wait! There are machines with HW slider and type is RBTN_TOGGLE?

I thought that all machines with HW slider has type RBTN_SLIDER and
others have RBTN_TOGGLE.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
