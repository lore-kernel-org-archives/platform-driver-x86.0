From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: intel-hid: Use hp-wireless for rfkill on HP
 platforms
Date: Thu, 11 Jun 2020 13:14:54 +0000
Message-ID: <3b47d04a379a4c709d38f0ca4c17dff4@AUSX13MPC105.AMER.DELL.COM>
References: <20200610153747.27040-1-kai.heng.feng@canonical.com>
 <4d0714fe5e2548b6b638ea447ad19490@AUSX13MPC105.AMER.DELL.COM>
 <82013BD4-B247-4E4E-94AB-1BEF8403E6E6@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <82013BD4-B247-4E4E-94AB-1BEF8403E6E6@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: kai.heng.feng@canonical.com
Cc: alex.hung@canonical.com, dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> > Just having the ACPI device present doesn't actually mean that the user
> > has a kernel compiled with hp-wireless or that it has finished
> initializing.
>=20
> We can use IS_REACHEABLE() to see if it's compiled.

Yes that was going to be my first suggestion.

>=20
> >
> > I would think this needs a better handshake in case hp-wireless was
> unloaded
> > or not present so the event could still come through intel-hid in this
> > circumstance.
>=20
> However, it's hard to determine if the other driver has finished
> initialization or any form of cross module handshake.
> Can you please point me to any good example if there's one?

Take a look at how drivers that use dell-wmi-descriptor work.  They can rel=
y
upon looking at -EPROBE_DEFER return code when trying to access the functio=
nality
and do a handoff.

>=20
> >
> >> +
> >> 	return AE_OK;
> >> }
> >>
> >> --
> >> 2.17.1
