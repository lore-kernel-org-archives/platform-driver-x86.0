From: Pali =?utf-8?q?Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] Keyboard backlight on Dell E7470 not adjustable from /sys entry
Date: Sun, 23 Apr 2017 21:41:23 +0200
Message-ID: <201704232141.23690@pali>
References: <20170423055648.25711-1-arcadiy@ivanov.biz>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart3649349.dxsKAjh63g";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:34205 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1045928AbdDWTl0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Apr 2017 15:41:26 -0400
Received: by mail-wm0-f66.google.com with SMTP id z129so13571279wmb.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 23 Apr 2017 12:41:26 -0700 (PDT)
In-Reply-To: <20170423055648.25711-1-arcadiy@ivanov.biz>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Arcadiy Ivanov <arcadiy@ivanov.biz>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Mario Limonciello <mario.limonciello@dell.com>

--nextPart3649349.dxsKAjh63g
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sunday 23 April 2017 07:56:48 Arcadiy Ivanov wrote:
> @@ -1115,6 +1131,7 @@ struct kbd_state {
>  	u8 als_setting;
>  	u8 als_value;
>  	u8 level;
> +	u8 timeout_ac;

It is timeout value + timeout units. It needs to be used later in
function for getting and setting timeout.

>  };
> =20
>  static const int kbd_tokens[] =3D {
> @@ -1140,6 +1157,25 @@ static u8 kbd_previous_mode_bit;
> =20
>  static bool kbd_led_present;
> =20
> +#define pr_kbd_smi(x) \
> +    pr_debug("func %s\n\tinputs: %#010x %#010x %#010x %#010x, outputs: %=
#010x %#010x %#010x %#010x", \
> +        __func__, \
> +        x->input[0], x->input[1], x->input[2], x->input[3],\
> +        x->output[0], x->output[1], x->output[2], x->output[3])
> +
> +#define pr_kbd_state(x) \
> +    pr_debug("func %s\n\tmode_bit: %#04x, triggers: %#04x, timeout_value=
: %#04x, timeout_unit: %#04x, " \
> +            "als_setting: %#04x, als_value: %#04x, level: %#04x, timeout=
_ac: %#04x", \
> +        __func__, \
> +        x->mode_bit, x->triggers, x->timeout_value, x->timeout_unit, x->=
als_setting, x->als_value, x-
>level, \
> +        x->timeout_ac)
> +
> +#define pr_kbd_info(x) \
> +    pr_debug("func %s\n\tmodes: %#06x, type: %#04x, triggers: %#04x, lev=
els: %#04x, seconds: %#04x, " \
> +            "minutes: %#04x, hours: %#04x, days: %#04x", \
> +        __func__, \
> +        x->modes, x->type, x->triggers, x->levels, x->seconds, x->minute=
s, x->hours, x->days)
> +

Such macros are not needed in mainline code. They are probably useful
in time of writing patch, but not later to have them present in final
driver code.

I sent a new patch (you are in recipients list too) which fixes getting
and setting timeout value when on AC. It also handles detection of
timeout AC value based on existence of 0x0451 SMBIOS token like Mario
suggested.

=2D-=20
Pali Roh=C3=A1r
pali.rohar@gmail.com

--nextPart3649349.dxsKAjh63g
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAlj9A2MACgkQi/DJPQPkQ1Js3ACdFMVnlq1dgegPSibH23RenRel
MFgAniQjNZMz9YxeGztHBSVr9U0gqHxK
=ji0K
-----END PGP SIGNATURE-----

--nextPart3649349.dxsKAjh63g--
