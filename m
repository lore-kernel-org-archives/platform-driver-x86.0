From: <Mario.Limonciello@dell.com>
Subject: RE: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
Date: Mon, 8 Jun 2020 15:40:53 +0000
Message-ID: <83fe431cacbc4708962767668ac8f06f@AUSX13MPC105.AMER.DELL.COM>
References: <cover.1591584631.git.y.linux@paritcher.com>
 <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0dc191a3d16f0e114f6a8976433e248018e10c43.1591584631.git.y.linux@paritcher.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: y.linux@paritcher.com
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, mjg59@srcf.ucam.org, pali@kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> -----Original Message-----
> From: platform-driver-x86-owner@vger.kernel.org <platform-driver-x86-
> owner@vger.kernel.org> On Behalf Of Y Paritcher
> Sent: Sunday, June 7, 2020 11:22 PM
> Cc: linux-kernel@vger.kernel.org; platform-driver-x86@vger.kernel.org;
> Matthew Garrett; Pali Roh=E1r
> Subject: [PATCH 2/3] platform/x86: dell-wmi: add new keymap type 0x0012
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> Ignore events with a type of 0x0012 and a code of 0xe035,
> this silences the following messages being logged when
> pressing the Fn-lock key on a Dell Inspiron 5593:
>=20
> dell_wmi: Unknown WMI event type 0x12
> dell_wmi: Unknown key with type 0x0012 and code 0xe035 pressed

Event type 0x12 is for "System Events".  This is the type of events that
you typically would see come in for things "like" the wrong power adapter
being plugged in on Windows or stuff about plugging a Thunderbolt dock into
a port that doesn't support Thunderbolt.

A message might look something like (paraphrased)
"Your system requires a 180W power adapter to charge effectively, but you
plugged in a 60W adapter."

There often is extended data with these events.  As such I don't believe al=
l
information in event type 0x0012 should be treated like scan codes like tho=
se in
0x10 or 0x11.

I would guess that Fn-lock on this machine probably has extended data in th=
e next
showing whether it was turned on and off.  If it does, perhaps it makes sen=
se to
send this information to userspace as an evdev switch instead.

>=20
> Signed-off-by: Y Paritcher <y.linux@paritcher.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-
> wmi.c
> index 0b4f72f923cd..f37e7e9093c2 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -334,6 +334,14 @@ static const struct key_entry
> dell_wmi_keymap_type_0011[] =3D {
>  	{ KE_IGNORE, KBD_LED_AUTO_100_TOKEN, { KEY_RESERVED } },
>  };
>=20
> +/*
> + * Keymap for WMI events of type 0x0012
> + */
> +static const struct key_entry dell_wmi_keymap_type_0012[] =3D {
> +	/* Fn-lock button pressed */
> +	{ KE_IGNORE, 0xe035, { KEY_RESERVED } },
> +};
> +
>  static void dell_wmi_process_key(struct wmi_device *wdev, int type, int
> code)
>  {
>  	struct dell_wmi_priv *priv =3D dev_get_drvdata(&wdev->dev);
> @@ -425,6 +433,7 @@ static void dell_wmi_notify(struct wmi_device *wdev,
>  			break;
>  		case 0x0010: /* Sequence of keys pressed */
>  		case 0x0011: /* Sequence of events occurred */
> +		case 0x0012: /* Sequence of events occurred */
>  			for (i =3D 2; i < len; ++i)
>  				dell_wmi_process_key(wdev, buffer_entry[1],
>  						     buffer_entry[i]);
> @@ -556,6 +565,7 @@ static int dell_wmi_input_setup(struct wmi_device
> *wdev)
>  			 ARRAY_SIZE(dell_wmi_keymap_type_0000) +
>  			 ARRAY_SIZE(dell_wmi_keymap_type_0010) +
>  			 ARRAY_SIZE(dell_wmi_keymap_type_0011) +
> +			 ARRAY_SIZE(dell_wmi_keymap_type_0012) +
>  			 1,
>  			 sizeof(struct key_entry), GFP_KERNEL);
>  	if (!keymap) {
> @@ -600,6 +610,13 @@ static int dell_wmi_input_setup(struct wmi_device
> *wdev)
>  		pos++;
>  	}
>=20
> +	/* Append table with events of type 0x0012 */
> +	for (i =3D 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0012); i++) {
> +		keymap[pos] =3D dell_wmi_keymap_type_0012[i];
> +		keymap[pos].code |=3D (0x0012 << 16);
> +		pos++;
> +	}
> +
>  	/*
>  	 * Now append also table with "legacy" events of type 0x0000. Some of
>  	 * them are reported also on laptops which have scancodes in DMI.
> --
> 2.27.0
