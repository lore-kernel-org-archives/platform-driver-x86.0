From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH 3/4] asus-laptop: Pegatron Lucid accelerometer
Date: Sun, 27 Mar 2011 22:43:14 -0700
Message-ID: <20110328054314.GC31692@core.coreip.homeip.net>
References: <1301004130-3294-1-git-send-email-andy.ross@windriver.com>
 <1301004130-3294-4-git-send-email-andy.ross@windriver.com>
 <AANLkTin849Cr2UUv4astP860=_f5xMMoPAhFhA4K+rzZ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:53313 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752751Ab1C1FnV (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 28 Mar 2011 01:43:21 -0400
Received: by iyb14 with SMTP id 14so2741510iyb.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 27 Mar 2011 22:43:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <AANLkTin849Cr2UUv4astP860=_f5xMMoPAhFhA4K+rzZ@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Corentin Chary <corentin.chary@gmail.com>
Cc: Andy Ross <andy.ross@windriver.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg@redhat.com>

On Fri, Mar 25, 2011 at 12:21:20PM +0100, Corentin Chary wrote:
> Ccing Dmitry and Matthew, they may want to comment that one.
>=20
> On Thu, Mar 24, 2011 at 11:02 PM, Andy Ross <andy.ross@windriver.com>=
 wrote:
> > +static int asus_platform_probe(struct platform_device *pd)
> > +{
> > + =A0 =A0 =A0 struct asus_laptop *asus =3D dev_get_drvdata(&pd->dev=
);
> > +
> > + =A0 =A0 =A0 /* This is instantiated during platform driver initia=
lization
> > + =A0 =A0 =A0 =A0* becuase if it's done from underneath asus_acpi_a=
dd(), the
> > + =A0 =A0 =A0 =A0* resulting input device can be grabbed by an earl=
y userspace
> > + =A0 =A0 =A0 =A0* reader before ACPI initialization is finished an=
d something
> > + =A0 =A0 =A0 =A0* oopses underneath the acpi_evaluate_integer() ca=
ll out of
> > + =A0 =A0 =A0 =A0* pega_accel_poll(). =A0Firmware bug? */
> > + =A0 =A0 =A0 pega_accel_probe(asus);
> > +
> > + =A0 =A0 =A0 return 0;
> > +}
>=20
> When is asus_platform_probe called exactly ? Because I'd say it's
> called during asus_platform_probe(), and that doesn't fix your issue
> right ?

This I do not quite understand... Do we bind acpi drivers to devices
before ACPI initialization is done? Then this should be fixed in ACPI
layer, but I doubt even early userspace is active at the time ACPI core
is being initialized. Also, input polling is done in a separate thread
so you not moving the poll out of ACPI binding thread but delay poll
execution by a few microseconds...

--=20
Dmitry
