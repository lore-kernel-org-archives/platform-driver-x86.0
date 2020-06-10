From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH] platform/x86: intel-hid: Use hp-wireless for rfkill on HP
 platforms
Date: Wed, 10 Jun 2020 15:49:37 +0000
Message-ID: <4d0714fe5e2548b6b638ea447ad19490@AUSX13MPC105.AMER.DELL.COM>
References: <20200610153747.27040-1-kai.heng.feng@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200610153747.27040-1-kai.heng.feng@canonical.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: kai.heng.feng@canonical.com, alex.hung@canonical.com
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
> owner@vger.kernel.org> On Behalf Of Kai-Heng Feng
> Sent: Wednesday, June 10, 2020 10:38 AM
> To: alex.hung@canonical.com
> Cc: Kai-Heng Feng; Darren Hart; Andy Shevchenko; open list:INTEL HID EVEN=
T
> DRIVER; open list
> Subject: [PATCH] platform/x86: intel-hid: Use hp-wireless for rfkill on H=
P
> platforms
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Wireless hotkey on HP platforms can trigger two events, if both
> hp-wireless and intel-hid are supported. Two events at the same time
> renders wireless hotkey useless.
>=20
> HP confirmed that hp-wireless (HPQ6001) should always be the canonical
> source of wireless hotkey event, so skip registering rfkill hotkey if
> HPQ6001 is present.
>=20
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/platform/x86/intel-hid.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/inte=
l-
> hid.c
> index 9ee79b74311c..31091c8faf70 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -25,6 +25,8 @@ static const struct acpi_device_id intel_hid_ids[] =3D =
{
>  };
>  MODULE_DEVICE_TABLE(acpi, intel_hid_ids);
>=20
> +static bool hp_wireless_present;
> +
>  /* In theory, these are HID usages. */
>  static const struct key_entry intel_hid_keymap[] =3D {
>  	/* 1: LSuper (Page 0x07, usage 0xE3) -- unclear what to do */
> @@ -49,6 +51,29 @@ static const struct key_entry intel_hid_keymap[] =3D {
>  	{ KE_END },
>  };
>=20
> +static const struct key_entry intel_hid_no_rfkill_keymap[] =3D {
> +	/* 1: LSuper (Page 0x07, usage 0xE3) -- unclear what to do */
> +	/* 2: Toggle SW_ROTATE_LOCK -- easy to implement if seen in wild */
> +	{ KE_KEY, 3, { KEY_NUMLOCK } },
> +	{ KE_KEY, 4, { KEY_HOME } },
> +	{ KE_KEY, 5, { KEY_END } },
> +	{ KE_KEY, 6, { KEY_PAGEUP } },
> +	{ KE_KEY, 7, { KEY_PAGEDOWN } },
> +	/* 8: rfkill -- use hp-wireless instead */
> +	{ KE_KEY, 9, { KEY_POWER } },
> +	{ KE_KEY, 11, { KEY_SLEEP } },
> +	/* 13 has two different meanings in the spec -- ignore it. */
> +	{ KE_KEY, 14, { KEY_STOPCD } },
> +	{ KE_KEY, 15, { KEY_PLAYPAUSE } },
> +	{ KE_KEY, 16, { KEY_MUTE } },
> +	{ KE_KEY, 17, { KEY_VOLUMEUP } },
> +	{ KE_KEY, 18, { KEY_VOLUMEDOWN } },
> +	{ KE_KEY, 19, { KEY_BRIGHTNESSUP } },
> +	{ KE_KEY, 20, { KEY_BRIGHTNESSDOWN } },
> +	/* 27: wake -- needs special handling */
> +	{ KE_END },
> +};
> +
>  /* 5 button array notification value. */
>  static const struct key_entry intel_array_keymap[] =3D {
>  	{ KE_KEY,    0xC2, { KEY_LEFTMETA } },                /* Press */
> @@ -317,7 +342,8 @@ static int intel_hid_input_setup(struct platform_devi=
ce
> *device)
>  	if (!priv->input_dev)
>  		return -ENOMEM;
>=20
> -	ret =3D sparse_keymap_setup(priv->input_dev, intel_hid_keymap, NULL);
> +	ret =3D sparse_keymap_setup(priv->input_dev, hp_wireless_present ?
> +			intel_hid_no_rfkill_keymap : intel_hid_keymap, NULL);
>  	if (ret)
>  		return ret;
>=20
> @@ -575,6 +601,9 @@ check_acpi_dev(acpi_handle handle, u32 lvl, void
> *context, void **rv)
>  			dev_info(&dev->dev,
>  				 "intel-hid: created platform device\n");
>=20
> +	if (!strcmp(acpi_device_hid(dev), "HPQ6001"))
> +		hp_wireless_present =3D true;

Just having the ACPI device present doesn't actually mean that the user
has a kernel compiled with hp-wireless or that it has finished initializing=
.

I would think this needs a better handshake in case hp-wireless was unloade=
d
or not present so the event could still come through intel-hid in this
circumstance.

> +
>  	return AE_OK;
>  }
>=20
> --
> 2.17.1
