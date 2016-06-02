From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 4/4] dell-wmi: Rework code for generating sparse keymap
 and processing WMI events
Date: Thu, 2 Jun 2016 12:42:11 +0200
Message-ID: <20160602104211.GC2456@eudyptula.hq.kempniu.pl>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <1463916983-12562-5-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33495 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932558AbcFBKmR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2016 06:42:17 -0400
Received: by mail-lf0-f68.google.com with SMTP id w16so4664874lfd.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jun 2016 03:42:16 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1463916983-12562-5-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> This patch unify procedure for generating sparse keymap and unify als=
o big
> switch code for processing WMI events of different types. After this =
patch
> dell-wmi driver does not differ between "old" and "new" hotkey type.
>=20
> It construct sparse keymap table with all WMI codes. It is because on=
 some
> laptops (e.g. Dell Latitude E6440) ACPI/firmware send both event type=
s (old
> and new).
>=20
> Each WMI code in sparse keymap table is prefixed by 16bit event type,=
 so it
> does not change functionality on laptops with "old" hotkey support (t=
hose
> without scancodes in DMI).
>=20
> This allow us to distinguish between same WMI codes with different ty=
pes in
> sparse keymap. Thanks to this WMI events of type 0x0011 were moved fr=
om big
> switch into sparse keymap table too.
>=20
> This patch also fixes possible bug in parsing WMI event buffer introd=
uced
> in commit 5ea2559726b7 ("dell-wmi: Add support for new Dell systems")=
=2E That
> commit changed buffer type from int* to u16* without fixing code. Mor=
e at:
> http://lkml.iu.edu/hypermail/linux/kernel/1507.0/01950.html
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

=46irst of all, thanks for your tireless efforts to get this code clean=
ed
up.  I like that there is now a common path for all models as this
means, among other things, that the "Process buffer" debug message will
be printed even for "old style" events, which makes it easier to see
which part of the WMI event buffer is actually processed.

> ---
>  drivers/platform/x86/dell-wmi.c |  213 +++++++++++++++++++----------=
----------
>  1 file changed, 106 insertions(+), 107 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index 7aac1dc..24b8103 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -80,12 +80,13 @@ static const struct dmi_system_id dell_wmi_smbios=
_list[] __initconst =3D {
>  };
> =20
>  /*
> + * Keymap for WMI events of type 0x0000
> + *
>   * Certain keys are flagged as KE_IGNORE. All of these are either
>   * notifications (rather than requests for change) or are also sent
>   * via the keyboard controller so should not be sent again.
>   */
> -
> -static const struct key_entry dell_wmi_legacy_keymap[] __initconst =3D=
 {
> +static const struct key_entry dell_wmi_keymap_type_0000[] __initcons=
t =3D {
> =20
>  	{ KE_IGNORE, 0x003a, { KEY_CAPSLOCK } },
> =20
> @@ -182,12 +183,8 @@ static const struct key_entry dell_wmi_legacy_ke=
ymap[] __initconst =3D {
>  	{ KE_IGNORE, 0xe0f8, { KEY_VOLUMEDOWN } },
>  	{ KE_IGNORE, 0xe0f9, { KEY_VOLUMEUP } },
> =20
> -	{ KE_END, 0 }
> -
>  };
> =20
> -static bool dell_new_hk_type;
> -
>  struct dell_bios_keymap_entry {
>  	u16 scancode;
>  	u16 keycode;
> @@ -201,6 +198,7 @@ struct dell_bios_hotkey_table {
> =20
>  struct dell_dmi_results {
>  	int err;
> +	int keymap_size;
>  	struct key_entry *keymap;
>  };
> =20
> @@ -249,10 +247,12 @@ static const u16 bios_to_linux_keycode[256] __i=
nitconst =3D {
>  };
> =20
>  /*
> + * Keymap for WMI events of type 0x0010
> + *
>   * These are applied if the 0xB2 DMI hotkey table is present and doe=
sn't
>   * override them.
>   */
> -static const struct key_entry dell_wmi_extra_keymap[] __initconst =3D=
 {
> +static const struct key_entry dell_wmi_keymap_type_0010[] __initcons=
t =3D {
>  	/* Fn-lock */
>  	{ KE_IGNORE, 0x151, { KEY_RESERVED } },
> =20
> @@ -272,21 +272,39 @@ static const struct key_entry dell_wmi_extra_ke=
ymap[] __initconst =3D {
>  	{ KE_IGNORE, 0x155, { KEY_RESERVED } },
>  };
> =20
> +/*
> + * Keymap for WMI events of type 0x0011
> + */
> +static const struct key_entry dell_wmi_keymap_type_0011[] __initcons=
t =3D {
> +	/* Battery unplugged */
> +	{ KE_IGNORE, 0xfff0, { KEY_RESERVED } },
> +
> +	/* Battery inserted */
> +	{ KE_IGNORE, 0xfff1, { KEY_RESERVED } },
> +
> +	/* Keyboard backlight level changed */
> +	{ KE_IGNORE, 0x01e1, { KEY_RESERVED } },
> +	{ KE_IGNORE, 0x02ea, { KEY_RESERVED } },
> +	{ KE_IGNORE, 0x02eb, { KEY_RESERVED } },
> +	{ KE_IGNORE, 0x02ec, { KEY_RESERVED } },
> +	{ KE_IGNORE, 0x02f6, { KEY_RESERVED } },
> +};
> +
>  static struct input_dev *dell_wmi_input_dev;
> =20
> -static void dell_wmi_process_key(int reported_key)
> +static void dell_wmi_process_key(int type, int code)
>  {
>  	const struct key_entry *key;
> =20
>  	key =3D sparse_keymap_entry_from_scancode(dell_wmi_input_dev,
> -						reported_key);
> +						(type << 16) | code);
>  	if (!key) {
> -		pr_info("Unknown key with scancode 0x%x pressed\n",
> -			reported_key);
> +		pr_info("Unknown key with type 0x%x and code 0x%x pressed\n",
> +			type, code);

Since you updated the switch cases below so that each of them now
consists of four digits, maybe it's a good idea to change the format
specifiers for type and code to %04x for coherency?

>  		return;
>  	}
> =20
> -	pr_debug("Key %x pressed\n", reported_key);
> +	pr_debug("Key with type 0x%x and code 0x%x pressed\n", type, code);

The same applies here.

> =20
>  	/* Don't report brightness notifications that will also come via AC=
PI */
>  	if ((key->keycode =3D=3D KEY_BRIGHTNESSUP ||
> @@ -294,7 +312,7 @@ static void dell_wmi_process_key(int reported_key=
)
>  	    acpi_video_handles_brightness_key_presses())
>  		return;
> =20
> -	if (reported_key =3D=3D 0xe025 && !wmi_requires_smbios_request)
> +	if (type =3D=3D 0x0000 && code =3D=3D 0xe025 && !wmi_requires_smbio=
s_request)
>  		return;
> =20
>  	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
> @@ -332,18 +350,6 @@ static void dell_wmi_notify(u32 value, void *con=
text)
> =20
>  	buffer_entry =3D (u16 *)obj->buffer.pointer;
>  	buffer_size =3D obj->buffer.length/2;
> -
> -	if (!dell_new_hk_type) {
> -		if (buffer_size >=3D 3 && buffer_entry[1] =3D=3D 0x0)
> -			dell_wmi_process_key(buffer_entry[2]);
> -		else if (buffer_size >=3D 2)
> -			dell_wmi_process_key(buffer_entry[1]);
> -		else
> -			pr_info("Received unknown WMI event\n");
> -		kfree(obj);
> -		return;
> -	}
> -
>  	buffer_end =3D buffer_entry + buffer_size;
> =20
>  	/*
> @@ -378,59 +384,21 @@ static void dell_wmi_notify(u32 value, void *co=
ntext)
>  		pr_debug("Process buffer (%*ph)\n", len*2, buffer_entry);
> =20
>  		switch (buffer_entry[1]) {
> -		case 0x00:
> -			for (i =3D 2; i < len; ++i) {
> -				switch (buffer_entry[i]) {
> -				case 0xe043:
> -					/* NIC Link is Up */
> -					pr_debug("NIC Link is Up\n");
> -					break;
> -				case 0xe044:
> -					/* NIC Link is Down */
> -					pr_debug("NIC Link is Down\n");
> -					break;
> -				case 0xe045:
> -					/* Unknown event but defined in DSDT */
> -				default:
> -					/* Unknown event */
> -					pr_info("Unknown WMI event type 0x00: "
> -						"0x%x\n", (int)buffer_entry[i]);
> -					break;
> -				}
> -			}
> +		case 0x0000:
> +			/* One key pressed or event occurred */
> +			if (len > 2)
> +				dell_wmi_process_key(0x0000, buffer_entry[2]);

I am sure you spent way more time analysing this than me, but is this
documented anywhere?  Technically speaking, this is a behavioral change
which causes events to be lost on any Dell model which is capable of
stuffing more than one key code into a single type 0x0000 WMI event (no=
t
that I know of any such model).

> +			/* Other entries in buffer could contain additional information *=
/

This comment exceeds 80 characters, but do you think it is needed at
all?  What does the reader gain by reading it?  Any additional
information that follows the key code is ignored by kernel code anyway.

>  			break;
> -		case 0x10:
> -			/* Keys pressed */
> +		case 0x0010:
> +			/* Sequence of keys pressed */
>  			for (i =3D 2; i < len; ++i)
> -				dell_wmi_process_key(buffer_entry[i]);
> +				dell_wmi_process_key(0x0010, buffer_entry[i]);
>  			break;
> -		case 0x11:
> -			for (i =3D 2; i < len; ++i) {
> -				switch (buffer_entry[i]) {
> -				case 0xfff0:
> -					/* Battery unplugged */
> -					pr_debug("Battery unplugged\n");
> -					break;
> -				case 0xfff1:
> -					/* Battery inserted */
> -					pr_debug("Battery inserted\n");
> -					break;
> -				case 0x01e1:
> -				case 0x02ea:
> -				case 0x02eb:
> -				case 0x02ec:
> -				case 0x02f6:
> -					/* Keyboard backlight level changed */
> -					pr_debug("Keyboard backlight level "
> -						 "changed\n");
> -					break;
> -				default:
> -					/* Unknown event */
> -					pr_info("Unknown WMI event type 0x11: "
> -						"0x%x\n", (int)buffer_entry[i]);
> -					break;
> -				}
> -			}
> +		case 0x0011:
> +			/* Sequence of events occurred */
> +			for (i =3D 2; i < len; ++i)
> +				dell_wmi_process_key(0x0011, buffer_entry[i]);
>  			break;
>  		default:
>  			/* Unknown event */
> @@ -458,7 +426,6 @@ static bool have_scancode(u32 scancode, const str=
uct key_entry *keymap, int len)
>  }
> =20
>  static void __init handle_dmi_entry(const struct dmi_header *dm,
> -
>  				    void *opaque)
> =20
>  {
> @@ -466,7 +433,6 @@ static void __init handle_dmi_entry(const struct =
dmi_header *dm,
>  	struct dell_bios_hotkey_table *table;
>  	int hotkey_num, i, pos =3D 0;
>  	struct key_entry *keymap;
> -	int num_bios_keys;
> =20
>  	if (results->err || results->keymap)
>  		return;		/* We already found the hotkey table. */
> @@ -490,8 +456,7 @@ static void __init handle_dmi_entry(const struct =
dmi_header *dm,
>  		return;
>  	}
> =20
> -	keymap =3D kcalloc(hotkey_num + ARRAY_SIZE(dell_wmi_extra_keymap) +=
 1,
> -			 sizeof(struct key_entry), GFP_KERNEL);
> +	keymap =3D kcalloc(hotkey_num, sizeof(struct key_entry), GFP_KERNEL=
);
>  	if (!keymap) {
>  		results->err =3D -ENOMEM;
>  		return;
> @@ -528,31 +493,15 @@ static void __init handle_dmi_entry(const struc=
t dmi_header *dm,
>  		pos++;
>  	}
> =20
> -	num_bios_keys =3D pos;
> -
> -	for (i =3D 0; i < ARRAY_SIZE(dell_wmi_extra_keymap); i++) {
> -		const struct key_entry *entry =3D &dell_wmi_extra_keymap[i];
> -
> -		/*
> -		 * Check if we've already found this scancode.  This takes
> -		 * quadratic time, but it doesn't matter unless the list
> -		 * of extra keys gets very long.
> -		 */
> -		if (!have_scancode(entry->code, keymap, num_bios_keys)) {
> -			keymap[pos] =3D *entry;
> -			pos++;
> -		}
> -	}
> -
> -	keymap[pos].type =3D KE_END;
> -
>  	results->keymap =3D keymap;
> +	results->keymap_size =3D pos;
>  }
> =20
>  static int __init dell_wmi_input_setup(void)
>  {
>  	struct dell_dmi_results dmi_results =3D {};
> -	int err;
> +	struct key_entry *keymap;
> +	int err, i, pos =3D 0;
> =20
>  	dell_wmi_input_dev =3D input_allocate_device();
>  	if (!dell_wmi_input_dev)
> @@ -576,21 +525,71 @@ static int __init dell_wmi_input_setup(void)
>  		goto err_free_dev;
>  	}
> =20
> +	keymap =3D kcalloc(dmi_results.keymap_size +
> +			 ARRAY_SIZE(dell_wmi_keymap_type_0000) +
> +			 ARRAY_SIZE(dell_wmi_keymap_type_0010) +
> +			 ARRAY_SIZE(dell_wmi_keymap_type_0011) +
> +			 1,
> +			 sizeof(struct key_entry), GFP_KERNEL);
> +	if (!keymap) {
> +		err =3D -ENOMEM;
> +		goto err_free_dev;

You're potentially leaking dmi_results.keymap here.

> +	}
> +
> +	/* Append table with events of type 0x0010 which comes from DMI */
>  	if (dmi_results.keymap) {
> -		dell_new_hk_type =3D true;
> +		for (i =3D 0; i < dmi_results.keymap_size; i++) {
> +			keymap[pos] =3D dmi_results.keymap[i];
> +			keymap[pos].code |=3D (0x0010 << 16);
> +			pos++;
> +		}
> +		kfree(dmi_results.keymap);
> +	}

Nit, but is the enclosing conditional expression needed any more, now
that you got rid of dell_new_hk_type?  If the 0xB2 DMI table is not
found then dmi_results.keymap_size will be 0 and thus the for loop abov=
e
doesn't do anything and it is okay to pass a null pointer to kfree().

> =20
> -		err =3D sparse_keymap_setup(dell_wmi_input_dev,
> -					  dmi_results.keymap, NULL);
> +	/* Append table with extra events of type 0x0010 which are not in D=
MI */
> +	for (i =3D 0; i < ARRAY_SIZE(dell_wmi_keymap_type_0010); i++) {
> +		const struct key_entry *entry =3D &dell_wmi_keymap_type_0010[i];
> =20
>  		/*
> -		 * Sparse keymap library makes a copy of keymap so we
> -		 * don't need the original one that was allocated.
> +		 * Check if we've already found this scancode.  This takes
> +		 * quadratic time, but it doesn't matter unless the list
> +		 * of extra keys gets very long.
>  		 */
> -		kfree(dmi_results.keymap);
> -	} else {
> -		err =3D sparse_keymap_setup(dell_wmi_input_dev,
> -					  dell_wmi_legacy_keymap, NULL);
> +		if (dmi_results.keymap_size &&
> +		    have_scancode(entry->code | (0x0010 << 16),
> +				  keymap, dmi_results.keymap_size)
> +		   )
> +			continue;

Is the first part of this conditional expression really needed?  If
dmi_results.keymap_size is 0 then have_scancode() will simply return
false, so the only disadvantage of removing this check is the overhead
of calling have_scancode() for every iteration of the loop, but I
believe that overhead is negligible as this is not performance-critical
code.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
