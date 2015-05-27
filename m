From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: dell_rbtn - kernel panic at boot...
Date: Wed, 27 May 2015 09:28:23 +0200
Message-ID: <20150527072823.GC30798@pali>
References: <5875.1432260403@turing-police.cc.vt.edu>
 <20150525044432.GA38428@fury.dvhart.com>
 <20150525050121.GA28810@srcf.ucam.org>
 <201505250803.42410@pali>
 <20150527041658.GB14480@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150527041658.GB14480@fury.dvhart.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, lkml <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday 26 May 2015 21:16:58 Darren Hart wrote:
> On Mon, May 25, 2015 at 08:03:42AM +0200, Pali Roh=C3=A1r wrote:
> > On Monday 25 May 2015 07:01:21 Matthew Garrett wrote:
> > > On Sun, May 24, 2015 at 09:44:32PM -0700, Darren Hart wrote:
> > > > Greg, Matthew, I'm tempted to recommend this 434 line driver be
> > > > rolled into dell-laptop.c. Any strong opinions?
> > >=20
> > > Mrm. It's slightly conceptually nasty in that one's an ACPI drive=
r
> > > and one's calling a Dell custom interface, but I think merging th=
em
> > > is probably the last bad answer.
> >=20
> > I think merging does not fix our problem. dell laptop rfkill driver=
=20
> > needs to be initialized after dell-rbtn acpi driver register itself=
=2E
>=20
> If they were the same driver, you could control this ordering.
>=20

Yes, I see, you are right. I can call acpi driver register function and
after that initializing dell laptop rfkill code.

> >=20
> > And dell-laptop and dell-rbtn are two different devices (one dell s=
mbios=20
> > and one acpi) and it for me it sounds like bad idea too...
>=20
> We all agree it's a bad idea - the point Mathew and I made was it may=
 be the
> "least bad" idea (all the others may be worse).
>=20
> I'm looking into this, but I don't have an easy answer for you. This =
one is
> going to take some research on your part to get to the right answer.
>=20

I still think that changing module_init() could work... Do you know who
can help us with those _ini*() macros (and ideally answer how to do tha=
t)?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
