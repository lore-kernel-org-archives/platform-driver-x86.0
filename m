From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH 0/3] dell-wmi: Don't send unneeded keypresses
Date: Wed, 3 Dec 2014 10:03:37 -0800
Message-ID: <20141203180329.GB20370@vmdeb7>
References: <1417648583-9336-1-git-send-email-gabriele.mzt@gmail.com>
 <201412052131.34455@pali>
 <20141205204122.GA11772@amd>
 <201412052207.35676@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49573 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751777AbaLFEee (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 5 Dec 2014 23:34:34 -0500
Content-Disposition: inline
In-Reply-To: <201412052207.35676@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, mjg59@srcf.ucam.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Dec 05, 2014 at 10:07:35PM +0100, Pali Roh=E1r wrote:
> On Friday 05 December 2014 21:41:22 Pavel Machek wrote:
> > On Fri 2014-12-05 21:31:34, Pali Roh=E1r wrote:
> > > On Wednesday 03 December 2014 14:34:32 Darren Hart wrote:
> > > > On Thu, Dec 04, 2014 at 12:16:20AM +0100, Gabriele
> > > > Mazzotta
> > >=20
> > > wrote:
> > > > > Currently dell-wmi reports keypresses for WMI events
> > > > > that are notifications of changes performed by the
> > > > > BIOS. This patch series make sure that no keypresses
> > > > > are sent for those events so that nothing is done from
> > > > > userspace.
> > > > >=20
> > > > > Gabriele Mazzotta (3):
> > > > >   dell-wmi: Use appropriate keycode for radio state
> > > > >   changes dell-wmi: Don't report keypresses for radio
> > > > >   state changes
> > > >=20
> > > > Merged into one patch, queued.
> > > >=20
> > > > >   dell-wmi: Don't report keypresses on keybord
> > > > >   illumination change
> > > >=20
> > > > Queued.
> > > >=20
> > > > Thanks Gabriele.
> > >=20
> > > Darren, what do you think about sending patch into stable
> > > kernel?
> >=20
> > I'd suggest against that. -stable is for "serious" bugs, and
> > we don't want to change this kind of behaviour in -stable
> > kernel.
> >=20
> > 								Pavel
>=20
> Ok, I agree that it is subjective how serious it is...
> Just to remind that patch fixing problem described in
>=20
> http://www.spinics.net/lists/platform-driver-x86/msg05922.html
> http://www.spinics.net/lists/platform-driver-x86/msg05924.html

I don't have any objection to sending this back to stable. Stable is fo=
r fixing
REAL bugs, as opposed to theorhetical races, etc. This is a "real" bug.

As to not chaning behavior, if it's OK for mainline, it's OK for stable=
=2E At
least that is my understanding of it. Folks are free to verify with Gre=
g if they
disagree.

--=20
Darren Hart
Intel Open Source Technology Center
