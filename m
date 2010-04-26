From: Alan Cox <alan@linux.intel.com>
Subject: Re: [PATCH] IPC driver for Intel Mobile Internet Device (MID)
 platforms
Date: Mon, 26 Apr 2010 16:39:58 +0100
Message-ID: <20100426163958.2b5f16b7@linux.intel.com>
References: <20100423143037.6744.87450.stgit@localhost.localdomain>
	<20100426150934.GA9422@srcf.ucam.org>
	<20100426155534.6dcaca0c@linux.intel.com>
	<20100426154300.GA10782@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga10.intel.com ([192.55.52.92]:57679 "EHLO
	fmsmga102.fm.intel.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752989Ab0DZQP6 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Apr 2010 12:15:58 -0400
In-Reply-To: <20100426154300.GA10782@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, akpm@linux-foundation.org, sreedhara.ds@intel.com, mingo@elte.hu

> The case I'm worried about is where the graphics driver never gets
> into a mergable state and we end up with a pile of mainline code that
> can't sanely run on the hardware. As long as the plan is to get it to
> avoid duplicating the entire Intel modesetting code and including its
> own TTM then that seems fair enough, but Intel's track record on this
> side of things hasn't been great.

I don't track the public DRM lists but the last I saw on that on the
archives was Keith Packard blocking patches to enable such a merge.
You'd have to ask him about it. On the acceleration side mrst/psb
graphics are not i9xx style.

> > There are patches further down the pile that correct that one
> > funnily enough.
>=20
> Good to know. Worth getting them in before merging, given that it=20
> changes the interface?

I'll pull that one in and push the I=C2=B2C out.

> Ok. I'd prefer it if passing random numbers resulted in failure
> rather than default behaviour, but if there's never going to be
> another platform that uses the Moorestown format then that's not a
> real problem.

I'd like to think the format would remain the same.=20

> > One is the exposed external API, the other is a little one line
> > internal helper that does unrelated things.
>=20
> It just made me double-take.

Good reason to rename it.

> > > > +int intel_scu_ipc_battery_cc_read(u32 *value)
> > >=20
> > > I'm a bit confused by the cc functions. The actual battery code
> > > isn't in this driver, so why are these functions not in the
> > > battery driver?
> >=20
> > Because the locking is in this driver. You can either smear the
> > locking all over the kernel or put the message format aware
> > functions in one place. I have some ideas how to tackle this better
> > longer term.
>=20
> Ok.

Having had a wander down the beach and watched the waves a bit I've got
a cunning plan. Watch this space...

> > That is how I inherited the driver code and it's not a driver
> > internal interface so I believe EXPORT_SYMBOL is correct based upon
> > Linus description of _GPL.
>=20
> Ok. We expect the platform to be usable without non-GPL drivers that=20
> require the IPC mechanism?

Certainly. The Meego tree as is should give you a usable platform
(barring X graphics accel which isn't something I am in a position to
fix unfortunately). There is lots in that tree which isn't pretty and
I'm trying to get stuff out of that tree into the kernel while doing
the laundry on the way.

Alan
--
To unsubscribe from this list: send the line "unsubscribe platform-driv=
er-x86" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
