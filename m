From: Darren Hart <dvhart@infradead.org>
Subject: Re: dell_rbtn - kernel panic at boot...
Date: Sun, 24 May 2015 21:44:32 -0700
Message-ID: <20150525044432.GA38428@fury.dvhart.com>
References: <5875.1432260403@turing-police.cc.vt.edu>
 <CAKdAkRQRdFBsgCmvL-aTKL=1xxPN-YYVEa0nTVkEV9jHMbzgYA@mail.gmail.com>
 <201505230305.36633@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:35380 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751099AbbEYEof (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 25 May 2015 00:44:35 -0400
Content-Disposition: inline
In-Reply-To: <201505230305.36633@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, lkml <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Sat, May 23, 2015 at 03:05:36AM +0200, Pali Roh=E1r wrote:
> On Saturday 23 May 2015 00:53:16 Dmitry Torokhov wrote:
> > On Thu, May 21, 2015 at 7:06 PM, Valdis Kletnieks
> >=20
> > <Valdis.Kletnieks@vt.edu> wrote:
> > > So after I made both config variables =3Dy, the resulting kernel
> > > built, but died a glorious death at boot.
> >=20
> > I guess if both are built-in then, according to link order,
> > dell-laptop starts first, before dell-rbtn, and dies in
> > dell_rbtn_notifier_register() in call to
> > driver_for_each_device(&rbtn_driver.drv, ...) because rbtn_driver h=
as
> > not been registered yet and thus half-initlalized.
> >=20
> > Thanks.
>=20
> pr_debug() messages could be useful... but no idea if we can get them=
=2E
>=20
> Is there any way to fix that dependency race condition? Could=20
> driver_attach() function call help?

I believe you can avoid this by moving dell-rbtn earlier in the Makefil=
e than
dell-laptop - but this is fragile and a hack to resolve a dependency pr=
oblem.

I suppose this is why thinkpad-acpi.c is huge, and why having separate =
drivers
talk to eachother is discouraged.

dell-laptop seems to be the base, while dell-rbtn is the more specific =
of the
two - which makes dell-laptop calling a dell-rbtn function which requir=
es
dell-rbtn to have been initialized prior a poor approach.

Greg, Matthew, I'm tempted to recommend this 434 line driver be rolled =
into
dell-laptop.c. Any strong opinions?

--=20
Darren Hart
Intel Open Source Technology Center
