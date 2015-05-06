From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v2 0/3] Dell Airplane Mode Switch driver
Date: Wed, 6 May 2015 09:58:04 +0200
Message-ID: <20150506075804.GC30910@pali>
References: <1416755361-17357-1-git-send-email-pali.rohar@gmail.com>
 <1430301066-22870-1-git-send-email-pali.rohar@gmail.com>
 <201505031238.14772@pali>
 <20150505203710.GC33977@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:34006 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750770AbbEFH6I (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 6 May 2015 03:58:08 -0400
Content-Disposition: inline
In-Reply-To: <20150505203710.GC33977@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriele Mazzotta <gabriele.mzt@gmail.com>

On Tuesday 05 May 2015 13:37:10 Darren Hart wrote:
> On Sun, May 03, 2015 at 12:38:14PM +0200, Pali Roh=C3=A1r wrote:
> > On Wednesday 29 April 2015 11:51:03 Pali Roh=C3=A1r wrote:
> > > This patch series add new acpi Dell Airplane Mode Switch
> > > driver (DELLABCE and DELRBTN acpi devices). It provides radio
> > > HW switch events (together with current state of radio
> > > devices) and export them via rfkill interface. These events
> > > are also used in dell-laptop driver instead i8042 filter hook
> > > function (when acpi device is available).
> > >=20
> > > In v2 was added support for laptops which have toggle button
> > > instead HW slider switch. For that I reused code done by Alex
> > > Hung.
> > >=20
> > > Pali Roh=C3=A1r (3):
> > >   platform: x86: dell-rbtn: Dell Airplane Mode Switch driver
> > >   platform: x86: dell-rbtn: Export notifier for other kernel
> > > modules platform: x86: dell-laptop: Use dell-rbtn instead
> > > i8042 filter when possible
> > >=20
> > >  drivers/platform/x86/Kconfig       |   14 ++
> > >  drivers/platform/x86/Makefile      |    1 +
> > >  drivers/platform/x86/dell-laptop.c |   67 +++++-
> > >  drivers/platform/x86/dell-rbtn.c   |  430
> > > ++++++++++++++++++++++++++++++++++++
> > > drivers/platform/x86/dell-rbtn.h   |   35 +++
> > >  5 files changed, 542 insertions(+), 5 deletions(-)
> > >  create mode 100644 drivers/platform/x86/dell-rbtn.c
> > >  create mode 100644 drivers/platform/x86/dell-rbtn.h
> >=20
> > Alex, can you rested this patch series on all your machines like=20
> > you did previous in this sheet?
> >=20
> > https://docs.google.com/spreadsheets/d/1voffS6dNglwAExSGh3UmG__UAO2=
qfZ829CkJLPo06aI/edit?usp=3Dsharing
> >=20
> > Ideally do more tests:
> > 1) only with first patch 1/3
> > 2) with full patch series 1/3, 2/3, 3/3 *with* loaded dell-laptop
> > 3) same as 2) but without loaded dell-laptop
> >=20
> > If everything pass then this patch series is OK from my side.
> >=20
> > Looks like Gabriele's problem is irrelevant to this patch series,=20
> > but we probably hit some rfkill bug in dell-laptop.ko :-(
> >=20
> > Matthew or Darren, can you review code in this patch series? So=20
> > if everything will be fine, dell-rbtn could be ready for 4.2.
>=20
> Yes - but I need some additional context.
>=20
> There wasn't a "Since v1..." changelog below the --- line in the patc=
hes. It's
> always good practice to include it - but especially after this much t=
ime has
> passed - it really helps page back in all the relevant issues.
>=20

2/3 and 3/3 patches were not changed (just rebased). And to patch 1/3
was added input device for reporting wireless toggle button (for laptop=
s
which have toggle button instead hw slider switch). Plus patch contains
some code cleanup.

> After the discussion on this list, I'm not sure where we are with how=
 this patch
> series impacts the machines that Alex and Garbiele are working on.
>=20

As wrote in previous email, now we are waiting for Alex's tests to make
sure that everything is working fine as expected.

> What I would like is this: amongst yourselves, please agree on a solu=
tion and
> provide a patch series with a Signed-off-by from the author(s) and at=
 least a
> Tested-by from the others.
>=20
> If this is it, each of you please reply here stating as much.
>=20
> Thanks,
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
