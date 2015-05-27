From: Darren Hart <dvhart@infradead.org>
Subject: Re: dell_rbtn - kernel panic at boot...
Date: Tue, 26 May 2015 21:24:38 -0700
Message-ID: <20150527042438.GA21644@fury.dvhart.com>
References: <5875.1432260403@turing-police.cc.vt.edu>
 <CAKdAkRQRdFBsgCmvL-aTKL=1xxPN-YYVEa0nTVkEV9jHMbzgYA@mail.gmail.com>
 <201505230305.36633@pali>
 <20150525044432.GA38428@fury.dvhart.com>
 <20150525144014.GC23037@pali>
 <20150527040930.GA14480@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:56624 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751676AbbE0EYk (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 27 May 2015 00:24:40 -0400
Content-Disposition: inline
In-Reply-To: <20150527040930.GA14480@fury.dvhart.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, lkml <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Tue, May 26, 2015 at 09:09:30PM -0700, Darren Hart wrote:
> On Mon, May 25, 2015 at 04:40:14PM +0200, Pali Roh=E1r wrote:
> > On Sunday 24 May 2015 21:44:32 Darren Hart wrote:
> > > On Sat, May 23, 2015 at 03:05:36AM +0200, Pali Roh=E1r wrote:
> > > > On Saturday 23 May 2015 00:53:16 Dmitry Torokhov wrote:
> > > > > On Thu, May 21, 2015 at 7:06 PM, Valdis Kletnieks
> > > > >=20
> > > > > <Valdis.Kletnieks@vt.edu> wrote:
> > > > > > So after I made both config variables =3Dy, the resulting k=
ernel
> > > > > > built, but died a glorious death at boot.
> > > > >=20
> > > > > I guess if both are built-in then, according to link order,
> > > > > dell-laptop starts first, before dell-rbtn, and dies in
> > > > > dell_rbtn_notifier_register() in call to
> > > > > driver_for_each_device(&rbtn_driver.drv, ...) because rbtn_dr=
iver has
> > > > > not been registered yet and thus half-initlalized.
> > > > >=20
> > > > > Thanks.
> > > >=20
> > > > pr_debug() messages could be useful... but no idea if we can ge=
t them.
> > > >=20
> > > > Is there any way to fix that dependency race condition? Could=20
> > > > driver_attach() function call help?
> > >=20
> > > I believe you can avoid this by moving dell-rbtn earlier in the M=
akefile than
> > > dell-laptop - but this is fragile and a hack to resolve a depende=
ncy problem.
> > >=20
> >=20
> > And what about that late_initcall() instead module_init() in dell-l=
aptop?
> > Will it fix this problem?
> >=20
>=20
> No, because late_initcall() for modules is module_init(). See
> include/linux/init.h.

Apologies, in this context we're concerned about built-in, not module.

This might function as desired.

module_init() is defined as device_initcall (level 6) for built-in
late_initcall() is level 7

There is precedent for this under drivers/ - although not in anything t=
hat stood
out to me as a good exemplar. See:

b233020 Input: gpio_keys - move to late_initcall

for an example with a similar purpose.

--=20
Darren Hart
Intel Open Source Technology Center
