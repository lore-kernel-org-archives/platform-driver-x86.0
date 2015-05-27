From: Darren Hart <dvhart@infradead.org>
Subject: Re: dell_rbtn - kernel panic at boot...
Date: Tue, 26 May 2015 21:16:58 -0700
Message-ID: <20150527041658.GB14480@fury.dvhart.com>
References: <5875.1432260403@turing-police.cc.vt.edu>
 <20150525044432.GA38428@fury.dvhart.com>
 <20150525050121.GA28810@srcf.ucam.org>
 <201505250803.42410@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201505250803.42410@pali>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, lkml <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: platform-driver-x86.vger.kernel.org

On Mon, May 25, 2015 at 08:03:42AM +0200, Pali Roh=E1r wrote:
> On Monday 25 May 2015 07:01:21 Matthew Garrett wrote:
> > On Sun, May 24, 2015 at 09:44:32PM -0700, Darren Hart wrote:
> > > Greg, Matthew, I'm tempted to recommend this 434 line driver be
> > > rolled into dell-laptop.c. Any strong opinions?
> >=20
> > Mrm. It's slightly conceptually nasty in that one's an ACPI driver
> > and one's calling a Dell custom interface, but I think merging them
> > is probably the last bad answer.
>=20
> I think merging does not fix our problem. dell laptop rfkill driver=20
> needs to be initialized after dell-rbtn acpi driver register itself.

If they were the same driver, you could control this ordering.

>=20
> And dell-laptop and dell-rbtn are two different devices (one dell smb=
ios=20
> and one acpi) and it for me it sounds like bad idea too...

We all agree it's a bad idea - the point Mathew and I made was it may b=
e the
"least bad" idea (all the others may be worse).

I'm looking into this, but I don't have an easy answer for you. This on=
e is
going to take some research on your part to get to the right answer.

--=20
Darren Hart
Intel Open Source Technology Center
