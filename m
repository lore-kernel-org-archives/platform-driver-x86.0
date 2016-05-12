From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v3 2/2] dell-laptop: Expose auxiliary MAC address if
 available
Date: Thu, 12 May 2016 10:40:33 +0200
Message-ID: <20160512084033.GW29844@pali>
References: <1462811099-16897-1-git-send-email-mario_limonciello@dell.com>
 <1462811099-16897-2-git-send-email-mario_limonciello@dell.com>
 <20160511133251.GA3440@eudyptula.hq.kempniu.pl>
 <201605111841.54411@pali>
 <3afbad44903b4da88b1362e938850da8@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:34303 "EHLO
	mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752058AbcELIkh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 12 May 2016 04:40:37 -0400
Content-Disposition: inline
In-Reply-To: <3afbad44903b4da88b1362e938850da8@ausx13mpc120.AMER.DELL.COM>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario_Limonciello@Dell.com
Cc: kernel@kempniu.pl, mjg59@srcf.ucam.org, dvhart@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org

On Wednesday 11 May 2016 22:41:16 Mario_Limonciello@Dell.com wrote:
> > > > +static DEVICE_ATTR_RO(auxiliary_mac); static struct attribute
> > > > +*dell_attributes[] =3D {
> > > > +	&dev_attr_auxiliary_mac.attr,
> > > > +	NULL
> > > > +};
> > > > +
> > > > +static const struct attribute_group dell_attr_group =3D {
> > > > +	.attrs =3D dell_attributes,
> > > > +};
> > > > +
> >=20
> > In my opinion this is not correct way to export "random" sysfs attr=
ibutes to
> > userspace. If it is possible we should use existing API/ABI for ker=
nel and not
> > to invent new ABI for userspace.
> >=20
> > Dell-laptop driver has already documented ABI for non standard thin=
gs (like
> > extended settings for keyboard backlight), see:
> > https://www.kernel.org/doc/Documentation/ABI/testing/sysfs-platform=
-
> > dell-laptop
> >=20
> > And exporting MAC address sounds for me like bad idea. I think it s=
hould
> > handle kernel itself (maybe send it to driver which use it?).
> >=20
> > And most important question: Who is going to use that sysfs file? I=
s there any
> > application? It is not possible to query for that address from user=
space, e.g.
> > from libsmbios tools?
> >=20
> > We have libsmbios functionality in kernel just for things which hav=
e exiting
> > API/ABI/interface in kernel. Not those which do not have...
> >=20
> > So why is needed to have such sysfs attribute exported by kernel?
> >=20
>=20
> I skipped your other comments because of this one.  My original plan =
for this was to do it in udev or Network Manager but you raise a good p=
oint.=20
> Maybe this patch should be scrapped all together. =20
>=20
> Mical - if you think patch 1/2 could still be useful to have as a gen=
eral interface I'll update it for your other comments and get it resubm=
itted.

What is first patch doing? Can you send me link to it?

> We do mirror the information in ACPI under the system bus:
>=20
>     Scope (_SB)
>     {
>         Name (AMAC, Buffer (0x17)
>         {
>             "_AUXMAC_#847BEB5992D2#"
>         })
>     }
>=20
> I don't know how to properly access this from the kernel side.  I not=
iced that most drivers that reference ACPI nodes refer to devices, not =
something hanging off the system bus.=20
> If you could advise the right way to go about that, I would appreciat=
e it.

So there are two ways how to read that MAC address. One is via SMM and
one via ACPI.

You can also read ACPI buffer (name is probably \_SB.AMAC) with ACPI
functions in kernel. Ask ACPI people, for correct API. I'm sure this is
possible also without creating new ACPI driver...

> If I can access that, maybe it's better to do this directly as a patc=
h to the Ethernet driver in question (r8152). =20
> That's actually how it's handled on the OS side for Windows too from =
what I understand.
> We have some FW bit set in them to indicate they're Dell Realtek prod=
ucts (don't have this detail yet).
> When they see that bit they look for that ACPI buffer and use it to s=
et the MAC address the OS sees.

Maybe it should be better to chose same way as Windows drivers? Better
ask on netdev mailing list and ping maintainers of that ethernet driver
what they think about it.

=46or me it sounds like a better solution (patching that ethernet drive=
r)
as exporting some non-standard sysfs node from kernel with MAC address
and then using another tool which send that MAC address back to kernel.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
