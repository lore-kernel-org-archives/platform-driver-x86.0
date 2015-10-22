From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [Bug 106031] Regression in 4.2.x: in airplane mode each time I
 open my laptop lid
Date: Thu, 22 Oct 2015 10:27:22 +0200
Message-ID: <20151022082722.GP15219@pali>
References: <bug-106031-5380@https.bugzilla.kernel.org/>
 <bug-106031-5380-zVXKHiyrZU@https.bugzilla.kernel.org/>
 <20151021085724.GA87951@vmdeb7>
 <20151021091954.GD15219@pali>
 <20151021110059.GF15219@pali>
 <20151021111243.GB87951@vmdeb7>
 <20151022081725.GC2581@malice.jf.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:36077 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751338AbbJVI1Z (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 22 Oct 2015 04:27:25 -0400
Received: by wicfx6 with SMTP id fx6so124591308wic.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Oct 2015 01:27:24 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20151022081725.GC2581@malice.jf.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Alex Hung <alex.hung@canonical.com>

On Thursday 22 October 2015 10:17:25 Darren Hart wrote:
> On Wed, Oct 21, 2015 at 01:12:43PM +0200, Darren Hart wrote:
> > From what I can tell, the XPS 13 has a TOGGLE type rfkill button (F=
n-PrtScrn):
> >=20
> > http://www.trustedreviews.com/dell-xps-13-2015-photos-11
>=20
> The reporter states his radio toggle is on F2, so it is not the above=
 machine,
> probably this one:
>=20
> http://www.ibtimes.co.uk/dell-xps-13-review-ultrabook-341773
>=20
> In any case, his logs confirm we are seeing a TOGGLE type which is us=
ing the
> input mechanism.
>=20

So my assumption that turning rfkill on (airplane mode) is done by
userspace (and not by kernel itself) is correct.

Now we need to know if we can drop that event input key after resuming
from suspend on all dell machines which has toggle key.

Alex, do you know more? Can you help us?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
