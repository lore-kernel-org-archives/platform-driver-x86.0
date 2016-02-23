From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 5/5] dell-rbtn: Add a comment about the XPS 13 9350
Date: Tue, 23 Feb 2016 13:01:00 +0100
Message-ID: <20160223120100.GN4606@pali>
References: <cover.1455553470.git.luto@kernel.org>
 <17238db9f090e8b2c80756ccd4bcd8f4f1e3bfab.1455553470.git.luto@kernel.org>
 <20160217111634.GQ1476@pali>
 <56C47090.1050106@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:37143 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750918AbcBWMBD (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 23 Feb 2016 07:01:03 -0500
Received: by mail-wm0-f45.google.com with SMTP id g62so206607189wme.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Feb 2016 04:01:03 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <56C47090.1050106@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: Andy Lutomirski <luto@kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>

On Wednesday 17 February 2016 07:07:28 Mario Limonciello wrote:
>=20
>=20
> On 02/17/2016 05:16 AM, Pali Roh=C3=A1r wrote:
> > On Monday 15 February 2016 08:32:37 Andy Lutomirski wrote:
> >> On the XPS 13 9350, the dell-rbtn mechanism has a new device id, a=
nd
> >> the DSDT turns it off if a new enough _OSI is supported.  Add a
> >> comment about why we don't bother supporting it.
> >>
> >> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> >> ---
> >>  drivers/platform/x86/dell-rbtn.c | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> >> diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x=
86/dell-rbtn.c
> >> index cd410e392550..b51a2008d782 100644
> >> --- a/drivers/platform/x86/dell-rbtn.c
> >> +++ b/drivers/platform/x86/dell-rbtn.c
> >> @@ -217,6 +217,21 @@ static void rbtn_notify(struct acpi_device *d=
evice, u32 event);
> >>  static const struct acpi_device_id rbtn_ids[] =3D {
> >>  	{ "DELRBTN", 0 },
> >>  	{ "DELLABCE", 0 },
> >> +
> >> +	/*
> >> +	 * This driver can also handle the "DELLABC6" device that
> >> +	 * appears on the XPS 13 9350, but that device is disabled
> >> +	 * by the DSDT unless booted with acpi_osi=3D"!Windows 2012"
> >> +	 * acpi_osi=3D"!Windows 2013".  Even if we boot that and bind
> >> +	 * the driver, we seem to have inconsistent behavior in
> >> +	 * which NetworkManager can get out of sync with the rfkill
> >> +	 * state.
> > Do you know reason for such behaviour? It is because event is send
> > duplicated (by dell-rbtn and also by intel-hid)?
> DELLABC6 is a custom interface that was created solely to have airpla=
ne
> mode support for Windows 7.=20
> For Windows 10 the proper interface is to use that which is handled b=
y
> intel-hid.  A OEM airplane mode driver is not used.
>=20
> Since the kernel doesn't identify as Windows 7 it would be incorrect =
to
> do attempt to use that interface.

Ok, I understand. But what user can is to tell linux kernel to identify
as Windows 7.

And I would like to know reason for that inconsistent behaviour. It is
because of bug in NetworkManager or because of some hidden bug in
dell-rbnt.c or in rfkill kernel subsystem? If it is in kernel there is
really big change that it can occur also on other machines which uses
dell-rbtn and so we should fix it.

Andy, can you look at it and try identify where is the problem?

> >> +	 * On the XPS 13 9350 and similar laptops, we're not supposed to
> >> +	 * use DELLABC6 at all.  Instead, we handle the rfkill button
> >> +	 * via the intel-hid driver.
> >> +	 */
> >> +
> >>  	{ "", 0 },
> >>  };
> >> =20
>=20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
