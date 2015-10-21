From: Darren Hart <dvhart@infradead.org>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Wed, 21 Oct 2015 13:12:43 +0200
Message-ID: <20151021111243.GB87951@vmdeb7>
References: <bug-106031-5380@https.bugzilla.kernel.org/>
 <bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
 <20151021085724.GA87951@vmdeb7>
 <20151021091954.GD15219@pali>
 <20151021110059.GF15219@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:50523 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752480AbbJULMt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 21 Oct 2015 07:12:49 -0400
Content-Disposition: inline
In-Reply-To: <20151021110059.GF15219@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Wed, Oct 21, 2015 at 01:00:59PM +0200, Pali Roh=E1r wrote:
> On Wednesday 21 October 2015 11:19:54 Pali Roh=E1r wrote:
> > On Wednesday 21 October 2015 10:57:24 Darren Hart wrote:
> > > On Sun, Oct 18, 2015 at 09:34:56AM +0000, bugzilla-daemon@bugzill=
a.kernel.org wrote:
> > > > https://bugzilla.kernel.org/show_bug.cgi?id=3D106031
> > > >=20
> > > > --- Comment #2 from Britt Yazel <bwyazel@gmail.com> ---
> > > > Confirmed. Blacklisting the dell_rbtn module solves this issue
> > >=20
> > > Pali,
> > >=20
> > > Can you take a look at this bug report regarding a 4.2 regression=
 for rfkill
> > > after the introduction of the dell-rbtn driver please.
> > >=20
> >=20
> > Hi! This looks strange. Driver dell_rbnt is just receiver of BIOS/A=
CPI
> > events. It receive hotkey or slide switch event and translate it in=
to
> > either linux input keypress or rfkill block event. But dell_rbnt dr=
iver
> > itself cannot set or change wireless rfkill or airplane mode.
> >=20
> > So my opinion is that BIOS/ACPI could send such event, dell_rbnt th=
en
> > propagate it into userspace and some application process it and do
> > something...
> >=20
>=20
> CCing Gabriele, owner of XPS machine too. Have you seen similar probl=
ems
> with dell_rbtn as described in above bug report?

Here's some context I've gathered. I haven't drawn any conclusions from=
 this,
but perhaps you will find it useful:

=46rom what I can tell, the XPS 13 has a TOGGLE type rfkill button (Fn-=
PrtScrn):

http://www.trustedreviews.com/dell-xps-13-2015-photos-11

I see in the journal that systemd is working with two rfkill devices (8=
 and 9),
and that dell-wmi is emitting unknown key events (e00e). This key is of=
 course
not in the dell_wmi_legacy_keymap, but it would land right after 0xe00d=
, labeled
as a BIOS error.

--=20
Darren Hart
Intel Open Source Technology Center
