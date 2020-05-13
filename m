From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: dell-wmi: Ignore keyboard attached /
 detached events
Date: Wed, 13 May 2020 17:29:11 +0000
Message-ID: <5242ea25f5c94a06beda838dba8c06ef@AUSX13MPC105.AMER.DELL.COM>
References: <20200513130544.90243-1-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200513130544.90243-1-hdegoede@redhat.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: hdegoede@redhat.com, dvhart@infradead.org, andy@infradead.org, pali@kernel.org, mjg59@srcf.ucam.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: Hans de Goede <hdegoede@redhat.com>
> Sent: Wednesday, May 13, 2020 8:06 AM
> To: Darren Hart; Andy Shevchenko; Pali Roh=E1r; Matthew Garrett
> Cc: Hans de Goede; Limonciello, Mario; platform-driver-x86@vger.kernel.or=
g;
> linux-kernel@vger.kernel.org
> Subject: [PATCH] platform/x86: dell-wmi: Ignore keyboard attached / detac=
hed
> events
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Ignore events with a type of 0x0011 and a code of 0xfff2 / 0xfff3,
> this silences the following messages being logged when the keyboard is
> detached / attached on a Dell Venue 11 Pro 7130:
>=20
> [   63.621953] dell_wmi: Unknown key with type 0x0011 and code 0xfff2 pre=
ssed
> [   70.240558] dell_wmi: Unknown key with type 0x0011 and code 0xfff3 pre=
ssed
>=20
> Note SW_TABLET_MODE is already reported through the intel_vbtn driver on
> this and other Dell devices, so dell_wmi should not report this too,
> to avoid duplicate events.

If they didn't also come through on intel-vbtn I would have proposed that w=
e
should have a separate tablet mode switch coming from dell-wmi too.

As a general note the reason for these is that the WMI architecture on Wind=
ows
differs in that applications typically directly receive the events and do t=
hings
with them.

>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-=
wmi.c
> index 86e8dd6a8b33..c25a4286d766 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -310,6 +310,16 @@ static const struct key_entry dell_wmi_keymap_type_0=
011[]
> =3D {
>  	/* Battery inserted */
>  	{ KE_IGNORE, 0xfff1, { KEY_RESERVED } },
>=20
> +	/*
> +	 * Detachable keyboard detached / undocked
> +	 * Note SW_TABLET_MODE is already reported through the intel_vbtn
> +	 * driver for this, so we ignore it.
> +	 */
> +	{ KE_IGNORE, 0xfff2, { KEY_RESERVED } },
> +
> +	/* Detachable keyboard attached / docked */
> +	{ KE_IGNORE, 0xfff3, { KEY_RESERVED } },
> +
>  	/* Keyboard backlight level changed */
>  	{ KE_IGNORE, KBD_LED_OFF_TOKEN,      { KEY_RESERVED } },
>  	{ KE_IGNORE, KBD_LED_ON_TOKEN,       { KEY_RESERVED } },
> --
> 2.26.0

Reviewed-by: Mario Limonciello <Mario.limonciello@dell.com>
