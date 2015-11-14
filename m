From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/3] dell_wmi: Improve unknown hotkey handling
Date: Sat, 14 Nov 2015 10:33:41 +0100
Message-ID: <20151114093341.GC25957@pali>
References: <cover.1447479930.git.luto@kernel.org>
 <b7fd494ac6d51c13a66fec20ec336080479b0f5f.1447479930.git.luto@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:38894 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751273AbbKNJdo (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 14 Nov 2015 04:33:44 -0500
Received: by wmec201 with SMTP id c201so60347203wme.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 14 Nov 2015 01:33:42 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <b7fd494ac6d51c13a66fec20ec336080479b0f5f.1447479930.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, Matthew Garrett <mjg59@srcf.ucam.org>

On Friday 13 November 2015 21:49:32 Andy Lutomirski wrote:
> If DMI lists a hotkey that we don't recognize, log and ignore it
> instead of trying to map it to keycode 0.  I haven't seen this happen=
,
> but it will help maintain the key map in the future and it will help
> avoid sending bogus events.
>=20
> This also improves the message that we log when we get an unknown key
> event.
>=20
> Signed-off-by: Andy Lutomirski <luto@kernel.org>
> ---
>  drivers/platform/x86/dell-wmi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index 92b0149fa4a7..e43228a35f6b 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -180,7 +180,7 @@ static void dell_wmi_process_key(int reported_key=
)
>  	key =3D sparse_keymap_entry_from_scancode(dell_wmi_input_dev,
>  						reported_key);
>  	if (!key) {
> -		pr_info("Unknown key %x pressed\n", reported_key);
> +		pr_info("Unknown key with scancode 0x%x pressed\n", reported_key);
>  		return;
>  	}
> =20
> @@ -343,6 +343,11 @@ static const struct key_entry * __init dell_wmi_=
prepare_new_keymap(void)
>  				    bios_to_linux_keycode[bios_entry->keycode] :
>  				    KEY_RESERVED;
> =20
> +		if (keycode =3D=3D 0) {
> +			pr_info("firmware scancode %d maps to unrecognized keycode %d\n",=
 bios_entry->keycode, bios_entry->scancode);
> +			continue;
> +		}
> +

This line is too long and checkpatch.pl will probably blame you.

Anyway, have you already found some missing mapping which comes from
bios/firmware (because your patches do not change that bios table)?

>  		if (keycode =3D=3D KEY_KBDILLUMTOGGLE)
>  			keymap[pos].type =3D KE_IGNORE;
>  		else

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
