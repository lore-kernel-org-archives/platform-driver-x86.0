From: Darren Hart <dvhart@infradead.org>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Thu, 22 Oct 2015 10:53:00 +0200
Message-ID: <20151022085300.GB23490@malice.jf.intel.com>
References: <bug-106031-5380@https.bugzilla.kernel.org/>
 <bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
 <20151021085724.GA87951@vmdeb7>
 <20151021091954.GD15219@pali>
 <20151021110059.GF15219@pali>
 <20151021111243.GB87951@vmdeb7>
 <20151022081725.GC2581@malice.jf.intel.com>
 <20151022082722.GP15219@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:54473 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756178AbbJVIyI (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 04:54:08 -0400
Content-Disposition: inline
In-Reply-To: <20151022082722.GP15219@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>

On Thu, Oct 22, 2015 at 10:27:22AM +0200, Pali Roh=E1r wrote:
> On Thursday 22 October 2015 10:17:25 Darren Hart wrote:
> > On Wed, Oct 21, 2015 at 01:12:43PM +0200, Darren Hart wrote:
> > > From what I can tell, the XPS 13 has a TOGGLE type rfkill button =
(Fn-PrtScrn):
> > >=20
> > > http://www.trustedreviews.com/dell-xps-13-2015-photos-11
> >=20
> > The reporter states his radio toggle is on F2, so it is not the abo=
ve machine,
> > probably this one:
> >=20
> > http://www.ibtimes.co.uk/dell-xps-13-review-ultrabook-341773
> >=20
> > In any case, his logs confirm we are seeing a TOGGLE type which is =
using the
> > input mechanism.
> >=20
>=20
> So my assumption that turning rfkill on (airplane mode) is done by
> userspace (and not by kernel itself) is correct.

Agreed.

>=20
> Now we need to know if we can drop that event input key after resumin=
g
> from suspend on all dell machines which has toggle key.
>=20

Well, as Gabriele points out, it seems it is dependent on the system, a=
s some
with the TOGGLE emit the event on resume, and others do not.

We could of course do this on a case by case DMI match, but I'd really =
like to
avoid that if at all possible.

> Alex, do you know more? Can you help us?
>=20
> --=20
> Pali Roh=E1r
> pali.rohar@gmail.com
>=20

--=20
Darren Hart
Intel Open Source Technology Center
