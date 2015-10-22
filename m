From: Darren Hart <dvhart@infradead.org>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Thu, 22 Oct 2015 15:02:11 +0200
Message-ID: <20151022130211.GA110029@vmdeb7>
References: <20151021110059.GF15219@pali>
 <20151021111243.GB87951@vmdeb7>
 <CABFtUbTZ6M4FQ3bAjKp1iKhkoybs9-RiL6B6sCgTVvEsdXJSrw@mail.gmail.com>
 <CABFtUbTF5k1Jm_pG6XiG1_9H8EwZQfvbXFuGWUjNZHd5YDgvXg@mail.gmail.com>
 <20151022074937.GA2581@malice.jf.intel.com>
 <CABFtUbTKUTfkeqE5nWKdNyrpbs3d2edNhMb8aSmSG_fBsMvcBg@mail.gmail.com>
 <20151022085117.GQ15219@pali>
 <5628BDF8.9030506@gmail.com>
 <20151022105018.GX15219@pali>
 <5628C069.8040902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:34074 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757301AbbJVNCW (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 09:02:22 -0400
Content-Disposition: inline
In-Reply-To: <5628C069.8040902@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Gabriele Mazzotta <gabriele.mzt@gmail.com>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>

On Thu, Oct 22, 2015 at 12:54:33PM +0200, Gabriele Mazzotta wrote:
> On 22/10/2015 12:50, Pali Roh=E1r wrote:
> >On Thursday 22 October 2015 12:44:08 Gabriele Mazzotta wrote:
> >>On 22/10/2015 10:51, Pali Roh=E1r wrote:
> >>>On Thursday 22 October 2015 10:26:47 Gabriele Mazzotta wrote:
> >>>>I'll see if I can find a batter way to deal with this problem,
> >>>>dell-laptop can detect the presence of an hardware switch.
> >>>
> >>>dell-rbtn.ko has acpi method CRBT which returns if notebook has hw=
 switch or
> >>>toggle key.
> >>>
> >>>And rfkill implementation in dell-laptop.ko does not work correctl=
y on
> >>>XPS machines. And because userspace implementation of smbios works=
 fine,
> >>>I think that problem is in kernel driver rather in BIOS/firmware..=
=2E
> >>
> >>I was thinking about something such as the following, which should =
favor
> >>the hardware slider when available. This should work if my assumpti=
on is
> >>correct, that is the laptops with a working RBTN method are the one=
s
> >>having problems.
> >>
> >
> >Hm... wait! There are machines with HW slider and type is RBTN_TOGGL=
E?
> >
> >I thought that all machines with HW slider has type RBTN_SLIDER and
> >others have RBTN_TOGGLE.
>=20
> Yes, this is the problem I've been talking about ever since the work
> on this driver started. AFAIK we don't know how to detect these lapto=
ps
> (my XPS13 is one of them).

Where is the radio hw slider on this machine?

This patch would effectively ignore Fn-F2 (radio toggle) key on this ma=
chine
then - correct? I don't think that is desirable either.

Seems to me the desired behavior would be to restore the radio state on=
 resume.
Consider the following table:

SW: Switch state
SS: State at suspend
SR: State after resume
 0: WiFi Enabled
 1: WiFi Disabled

State SW SS SR
--------------
a      0  0  0
b      0  1  1   (switch is enabled, but toggle key disabled wifi)
c      1  0  N/A (invalid state)
d      1  1  1

State "a" is where we are failing currently I believe?

Do we know if DELRBTN and DELLABCE are always a TOGGLE or a SLIDER resp=
ectively?
I'm wondering if these should be separate drivers.

--=20
Darren Hart
Intel Open Source Technology Center
