From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v5 5/5] dell-rbtn: Add a comment about the XPS 13 9350
Date: Wed, 17 Feb 2016 12:16:34 +0100
Message-ID: <20160217111634.GQ1476@pali>
References: <cover.1455553470.git.luto@kernel.org>
 <17238db9f090e8b2c80756ccd4bcd8f4f1e3bfab.1455553470.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f42.google.com ([74.125.82.42]:37962 "EHLO
	mail-wm0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161108AbcBQLQh (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 17 Feb 2016 06:16:37 -0500
Received: by mail-wm0-f42.google.com with SMTP id a4so22902745wme.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Feb 2016 03:16:36 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <17238db9f090e8b2c80756ccd4bcd8f4f1e3bfab.1455553470.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario_limonciello@dell.com>

On Monday 15 February 2016 08:32:37 Andy Lutomirski wrote:
> On the XPS 13 9350, the dell-rbtn mechanism has a new device id, and
> the DSDT turns it off if a new enough _OSI is supported.  Add a
> comment about why we don't bother supporting it.
>=20
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>  drivers/platform/x86/dell-rbtn.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/=
dell-rbtn.c
> index cd410e392550..b51a2008d782 100644
> --- a/drivers/platform/x86/dell-rbtn.c
> +++ b/drivers/platform/x86/dell-rbtn.c
> @@ -217,6 +217,21 @@ static void rbtn_notify(struct acpi_device *devi=
ce, u32 event);
>  static const struct acpi_device_id rbtn_ids[] =3D {
>  	{ "DELRBTN", 0 },
>  	{ "DELLABCE", 0 },
> +
> +	/*
> +	 * This driver can also handle the "DELLABC6" device that
> +	 * appears on the XPS 13 9350, but that device is disabled
> +	 * by the DSDT unless booted with acpi_osi=3D"!Windows 2012"
> +	 * acpi_osi=3D"!Windows 2013".  Even if we boot that and bind
> +	 * the driver, we seem to have inconsistent behavior in
> +	 * which NetworkManager can get out of sync with the rfkill
> +	 * state.

Do you know reason for such behaviour? It is because event is send
duplicated (by dell-rbtn and also by intel-hid)?

> +	 * On the XPS 13 9350 and similar laptops, we're not supposed to
> +	 * use DELLABC6 at all.  Instead, we handle the rfkill button
> +	 * via the intel-hid driver.
> +	 */
> +
>  	{ "", 0 },
>  };
> =20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
