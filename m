From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: dell_rbtn - kernel panic at boot...
Date: Mon, 25 May 2015 16:40:14 +0200
Message-ID: <20150525144014.GC23037@pali>
References: <5875.1432260403@turing-police.cc.vt.edu>
 <CAKdAkRQRdFBsgCmvL-aTKL=1xxPN-YYVEa0nTVkEV9jHMbzgYA@mail.gmail.com>
 <201505230305.36633@pali>
 <20150525044432.GA38428@fury.dvhart.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150525044432.GA38428@fury.dvhart.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Valdis Kletnieks <Valdis.Kletnieks@vt.edu>, lkml <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sunday 24 May 2015 21:44:32 Darren Hart wrote:
> On Sat, May 23, 2015 at 03:05:36AM +0200, Pali Roh=C3=A1r wrote:
> > On Saturday 23 May 2015 00:53:16 Dmitry Torokhov wrote:
> > > On Thu, May 21, 2015 at 7:06 PM, Valdis Kletnieks
> > >=20
> > > <Valdis.Kletnieks@vt.edu> wrote:
> > > > So after I made both config variables =3Dy, the resulting kerne=
l
> > > > built, but died a glorious death at boot.
> > >=20
> > > I guess if both are built-in then, according to link order,
> > > dell-laptop starts first, before dell-rbtn, and dies in
> > > dell_rbtn_notifier_register() in call to
> > > driver_for_each_device(&rbtn_driver.drv, ...) because rbtn_driver=
 has
> > > not been registered yet and thus half-initlalized.
> > >=20
> > > Thanks.
> >=20
> > pr_debug() messages could be useful... but no idea if we can get th=
em.
> >=20
> > Is there any way to fix that dependency race condition? Could=20
> > driver_attach() function call help?
>=20
> I believe you can avoid this by moving dell-rbtn earlier in the Makef=
ile than
> dell-laptop - but this is fragile and a hack to resolve a dependency =
problem.
>=20

And what about that late_initcall() instead module_init() in dell-lapto=
p?
Will it fix this problem?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
