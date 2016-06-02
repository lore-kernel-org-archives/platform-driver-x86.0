From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 3/4] dell-wmi: Add information about other WMI event codes
Date: Thu, 2 Jun 2016 12:41:53 +0200
Message-ID: <20160602104153.GB2456@eudyptula.hq.kempniu.pl>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <1463916983-12562-4-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1463916983-12562-4-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> ACPI DSDT tables have defined other WMI codes, but does not contain a=
ny
> description when those codes are emitted. Some other codes can be fou=
nd in
> logs on internet. In this patch are all which I saw, but lot of them =
are
> not tested properly (e.g. for duplicate events with AT keyboard). Now=
 we
> have all WMI event codes at one place and in future after proper test=
ing
> those codes can be correctly enabled or disabled...
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> ---
>  drivers/platform/x86/dell-wmi.c |   32 +++++++++++++++++++++++++++++=
+++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index 363d927..7aac1dc 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -110,6 +110,9 @@ static const struct key_entry dell_wmi_legacy_key=
map[] __initconst =3D {
>  	/* BIOS error detected */
>  	{ KE_IGNORE, 0xe00d, { KEY_RESERVED } },
> =20
> +	/* Unknown, defined in ACPI DSDT */
> +	/* { KE_IGNORE, 0xe00e, { KEY_RESERVED } }, */
> +
>  	/* Wifi Catcher */
>  	{ KE_KEY,    0xe011, { KEY_PROG2 } },
> =20
> @@ -118,21 +121,45 @@ static const struct key_entry dell_wmi_legacy_k=
eymap[] __initconst =3D {
> =20
>  	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
> =20
> +	/* Unknown, defined in ACPI DSDT */
> +	/* { KE_IGNORE, 0xe023, { KEY_RESERVED } }, */
> +
> +	/* Untested, Dell Instant Launch key on Inspiron 7520 */
> +	/* { KE_IGNORE, 0xe024, { KEY_RESERVED } }, */
> +
>  	/* Dell Instant Launch key */
>  	{ KE_KEY,    0xe025, { KEY_PROG4 } },
> =20
>  	/* Audio panel key */
>  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> =20
> +	/* Untested, Multimedia key on Dell Vostro 3560 */
> +	/* { KE_IGNORE, 0xe028, { KEY_RESERVED } }, */
> +
>  	/* Dell Instant Launch key */
>  	{ KE_KEY,    0xe029, { KEY_PROG4 } },
> =20
> +	/* Untested, Windows Mobility Center button on Inspiron 7520 */
> +	/* { KE_IGNORE, 0xe02a, { KEY_RESERVED } }, */
> +
> +	/* Unknown, defined in ACPI DSDT */
> +	/* { KE_IGNORE, 0xe02b, { KEY_RESERVED } }, */
> +
> +	/* Untested, Dell Audio With Preset Switch button on Inspiron 7520 =
*/
> +	/* { KE_IGNORE, 0xe02c, { KEY_RESERVED } }, */
> +
>  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
>  	{ KE_IGNORE, 0xe030, { KEY_VOLUMEUP } },
>  	{ KE_IGNORE, 0xe033, { KEY_KBDILLUMUP } },
>  	{ KE_IGNORE, 0xe034, { KEY_KBDILLUMDOWN } },
>  	{ KE_IGNORE, 0xe03a, { KEY_CAPSLOCK } },
> =20
> +	/* NIC Link is Up */
> +	{ KE_IGNORE, 0xe043, { KEY_RESERVED } },
> +
> +	/* NIC Link is Down */
> +	{ KE_IGNORE, 0xe044, { KEY_RESERVED } },
> +
>  	/*
>  	 * This entry is very suspicious!
>  	 * Originally Matthew Garrett created this dell-wmi driver speciall=
y for
> @@ -145,7 +172,12 @@ static const struct key_entry dell_wmi_legacy_ke=
ymap[] __initconst =3D {
>  	 */
>  	{ KE_IGNORE, 0xe045, { KEY_NUMLOCK } },
> =20
> +	/* Scroll lock and also going to tablet mode on portable devices */
>  	{ KE_IGNORE, 0xe046, { KEY_SCROLLLOCK } },
> +
> +	/* Untested, going from tablet mode on portable devices */
> +	/* { KE_IGNORE, 0xe047, { KEY_RESERVED } }, */
> +

I have one more entry to add here:

    { KE_IGNORE, 0xe06e, { KEY_RESERVED } },

WMI event 0xe06e is emitted on a Vostro V131 when the Dell Support
Center hotkey is pressed, along with an i8042 interrupt.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
