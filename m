From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] dell-wmi: Ignore WMI event 0xe00e
Date: Wed, 27 Jul 2016 10:12:44 -0700
Message-ID: <20160727171244.GG2565@f23x64.localdomain>
References: <1469604882-22169-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1469604882-22169-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario_Limonciello@Dell.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jul 27, 2016 at 09:34:42AM +0200, Pali Roh=E1r wrote:
> WMI event 0xe00e is received when battery was removed or inserted.
>=20
> Signed-off-by: Pali Roh=E1r <pali.rohar@gmail.com>

Queued for 4.8, thanks.

> ---
>  drivers/platform/x86/dell-wmi.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index d2bc092..da2fe18 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -110,8 +110,8 @@ static const struct key_entry dell_wmi_keymap_typ=
e_0000[] __initconst =3D {
>  	/* BIOS error detected */
>  	{ KE_IGNORE, 0xe00d, { KEY_RESERVED } },
> =20
> -	/* Unknown, defined in ACPI DSDT */
> -	/* { KE_IGNORE, 0xe00e, { KEY_RESERVED } }, */
> +	/* Battery was removed or inserted */
> +	{ KE_IGNORE, 0xe00e, { KEY_RESERVED } },
> =20
>  	/* Wifi Catcher */
>  	{ KE_KEY,    0xe011, { KEY_PROG2 } },
> --=20
> 1.7.10.4
>=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center
