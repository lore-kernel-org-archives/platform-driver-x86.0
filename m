From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 1/3] dell_wmi: Support new hotkeys on the XPS 13 Skylake
Date: Sat, 14 Nov 2015 10:27:04 +0100
Message-ID: <20151114092704.GA25957@pali>
References: <cover.1447479930.git.luto@kernel.org>
 <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:32807 "EHLO
	mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751001AbbKNJ1K (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Nov 2015 04:27:10 -0500
Received: by wmec201 with SMTP id c201so113049395wme.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2015 01:27:09 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <db83b63cc163ecc640d5d1c5554f8aa87beaadfc.1447479930.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Friday 13 November 2015 21:49:30 Andy Lutomirski wrote:
> The XPS 13 Skylake has an rfkill button and a switchvideomode button
> that aren't enumerated in the DMI table AFAICT.  Add a table listing
> extra un-enumerated hotkeys.  To avoid breaking things that worked
> before, these un-enumerated hotkeys won't be used if the DMI table
> maps them to something else.
>=20

Do you have any (Dell) documentation which specify list of these wmi
codes send to dell-wmi driver?

> This also adds the Fn-lock key as a KE_IGNORE entry.
>=20
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>  drivers/platform/x86/dell-wmi.c | 48 +++++++++++++++++++++++++++++++=
++++------
>  1 file changed, 41 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index f2d77fe696ac..5be1abec4f64 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -142,6 +142,16 @@ static const u16 bios_to_linux_keycode[256] __in=
itconst =3D {
>  	0, 0, 0, 0, 0, 0, 0, 0, 0, KEY_PROG3
>  };
> =20
> +/* These are applied if the hk table is present and doesn't override=
 them. */
> +static const struct key_entry dell_wmi_extra_keymap[] __initconst =3D=
 {
> +	/* Fn-lock -- no action is required by the kernel. */
> +	{ KE_IGNORE, 0x151, { KEY_RESERVED } },
> +
> +	/* Keys that need our help (on XPS 13 Skylake and maybe others. */
> +	{ KE_KEY, 0x152, { KEY_SWITCHVIDEOMODE } },
> +	{ KE_KEY, 0x153, { KEY_RFKILL } },

On more Dell laptops rfkill events are handed by ACPI driver
dell-rbtn.ko. Are you sure that dell-rbtn.ko does not send keypress
event and you really need it from dell-wmi? We already masked KEY_RFKIL=
L
in dell-wmi to prevent double events...

> +};
> +
>  static struct input_dev *dell_wmi_input_dev;
> =20
>  static void dell_wmi_process_key(int reported_key)
> @@ -300,9 +310,10 @@ static const struct key_entry * __init dell_wmi_=
prepare_new_keymap(void)
>  	int hotkey_num =3D (dell_bios_hotkey_table->header.length - 4) /
>  				sizeof(struct dell_bios_keymap_entry);
>  	struct key_entry *keymap;
> -	int i;
> +	int i, pos =3D 0, num_bios_keys;
> =20
> -	keymap =3D kcalloc(hotkey_num + 1, sizeof(struct key_entry), GFP_KE=
RNEL);
> +	keymap =3D kcalloc(hotkey_num + ARRAY_SIZE(dell_wmi_extra_keymap),
> +			 sizeof(struct key_entry), GFP_KERNEL);
>  	if (!keymap)
>  		return NULL;
> =20
> @@ -314,14 +325,37 @@ static const struct key_entry * __init dell_wmi=
_prepare_new_keymap(void)
>  				    KEY_RESERVED;
> =20
>  		if (keycode =3D=3D KEY_KBDILLUMTOGGLE)
> -			keymap[i].type =3D KE_IGNORE;
> +			keymap[pos].type =3D KE_IGNORE;
>  		else
> -			keymap[i].type =3D KE_KEY;
> -		keymap[i].code =3D bios_entry->scancode;
> -		keymap[i].keycode =3D keycode;
> +			keymap[pos].type =3D KE_KEY;
> +		keymap[pos].code =3D bios_entry->scancode;
> +		keymap[pos].keycode =3D keycode;
> +
> +		pos++;
> +	}
> +
> +	num_bios_keys =3D pos;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(dell_wmi_extra_keymap); i++) {
> +		int j;
> +
> +		/*
> +		 * Check if we've already found this scancode.  This takes
> +		 * quadratic time, but it doesn't matter unless the list
> +		 * of extra keys gets very long.
> +		 */
> +		for (j =3D 0; j < num_bios_keys; j++)
> +			if (keymap[j].code =3D=3D dell_wmi_extra_keymap[i].code)
> +				goto skip;

Rather move this code into separate boolean function and for return
value here. This will prevent using hacky goto...

> +
> +		keymap[pos] =3D dell_wmi_extra_keymap[i];
> +		pos++;
> +
> +skip:
> +		;
>  	}
> =20
> -	keymap[hotkey_num].type =3D KE_END;
> +	keymap[pos].type =3D KE_END;
> =20
>  	return keymap;
>  }

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
