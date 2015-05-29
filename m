From: Darren Hart <dvhart@infradead.org>
Subject: Re: dell_rbtn - kernel panic at boot...
Date: Thu, 28 May 2015 20:15:24 -0700
Message-ID: <20150529031524.GA31158@fury.dvhart.com>
References: <5875.1432260403@turing-police.cc.vt.edu>
 <20150525044432.GA38428@fury.dvhart.com>
 <20150525050121.GA28810@srcf.ucam.org>
 <201505250803.42410@pali>
 <20150527041658.GB14480@fury.dvhart.com>
 <20150527072823.GC30798@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:58581 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754566AbbE2DPk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 28 May 2015 23:15:40 -0400
Content-Disposition: inline
In-Reply-To: <20150527072823.GC30798@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, lkml <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Wed, May 27, 2015 at 09:28:23AM +0200, Pali Roh=E1r wrote:
> On Tuesday 26 May 2015 21:16:58 Darren Hart wrote:
> > On Mon, May 25, 2015 at 08:03:42AM +0200, Pali Roh=E1r wrote:
> > > On Monday 25 May 2015 07:01:21 Matthew Garrett wrote:
> > > > On Sun, May 24, 2015 at 09:44:32PM -0700, Darren Hart wrote:
> > > > > Greg, Matthew, I'm tempted to recommend this 434 line driver =
be
> > > > > rolled into dell-laptop.c. Any strong opinions?
> > > >=20
> > > > Mrm. It's slightly conceptually nasty in that one's an ACPI dri=
ver
> > > > and one's calling a Dell custom interface, but I think merging =
them
> > > > is probably the last bad answer.
> > >=20
> > > I think merging does not fix our problem. dell laptop rfkill driv=
er=20
> > > needs to be initialized after dell-rbtn acpi driver register itse=
lf.
> >=20
> > If they were the same driver, you could control this ordering.
> >=20
>=20
> Yes, I see, you are right. I can call acpi driver register function a=
nd
> after that initializing dell laptop rfkill code.
>=20
> > >=20
> > > And dell-laptop and dell-rbtn are two different devices (one dell=
 smbios=20
> > > and one acpi) and it for me it sounds like bad idea too...
> >=20
> > We all agree it's a bad idea - the point Mathew and I made was it m=
ay be the
> > "least bad" idea (all the others may be worse).
> >=20
> > I'm looking into this, but I don't have an easy answer for you. Thi=
s one is
> > going to take some research on your part to get to the right answer=
=2E
> >=20
>=20
> I still think that changing module_init() could work... Do you know w=
ho
> can help us with those _ini*() macros (and ideally answer how to do t=
hat)?

You sent the patches implementing that, I'd suggest providing complete =
details
on what you tested to add confidence to this working.

Greg, on Cc, is likely the best one to say if this is a reasonable appr=
oach, or
an abuse of the *_init APIs. I suspect he'll say it's the a hack to wor=
karound a
fundamentally flawed design.

I'd suggest spending some time thinking about how this could be written=
 such
that the individual drivers do not talk back and forth to eachother, bu=
t instead
talk to a subsystem (rfkill?) in a way that can tolerate the ordering i=
ssue.

If you simply cannot reasonably avoid the ordering issue, then I suspec=
t the
least bad approach is to merge the drivers.

Greg - from a general driver development best practices perspective, wo=
uld you
disagree with anything I've said here?

Quick summary to save Greg the search: dell-laptop calls a function in
dell-rbtn. If both are built-in, if dell-rbtn hasn't completed init yet=
, the
dell-laptop init will crash.

--=20
Darren Hart
Intel Open Source Technology Center
