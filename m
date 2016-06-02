From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 2/4] dell-wmi: Sort WMI event codes and update comments
Date: Thu, 2 Jun 2016 12:41:42 +0200
Message-ID: <20160602104142.GA2456@eudyptula.hq.kempniu.pl>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com>
 <1463916983-12562-3-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34921 "EHLO
	mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932086AbcFBKlt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 2 Jun 2016 06:41:49 -0400
Received: by mail-lf0-f68.google.com with SMTP id q63so4693079lfi.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jun 2016 03:41:48 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1463916983-12562-3-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>

My guess is that Darren won't let you off without at least a short
commit message.

> ---
>  drivers/platform/x86/dell-wmi.c |   31 ++++++++++++++++++-----------=
--
>  1 file changed, 18 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index 4d23c91..363d927 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -86,31 +86,32 @@ static const struct dmi_system_id dell_wmi_smbios=
_list[] __initconst =3D {
>   */
> =20
>  static const struct key_entry dell_wmi_legacy_keymap[] __initconst =3D=
 {
> -	{ KE_IGNORE, 0x003a, { KEY_CAPSLOCK } },
> =20
> -	{ KE_KEY, 0xe009, { KEY_EJECTCD } },
> +	{ KE_IGNORE, 0x003a, { KEY_CAPSLOCK } },
> =20
> -	/* These also contain the brightness level at offset 6 */
> -	{ KE_KEY, 0xe006, { KEY_BRIGHTNESSUP } },
> -	{ KE_KEY, 0xe005, { KEY_BRIGHTNESSDOWN } },
> +	/* These also contain the brightness level after key code */
> +	{ KE_KEY,    0xe006, { KEY_BRIGHTNESSUP } },
> +	{ KE_KEY,    0xe005, { KEY_BRIGHTNESSDOWN } },

These two entries were left unsorted.

> =20
>  	/* Battery health status button */
> -	{ KE_KEY, 0xe007, { KEY_BATTERY } },
> +	{ KE_KEY,    0xe007, { KEY_BATTERY } },
> =20
> -	/* Radio devices state change */
> +	/* Radio devices state change, also contains additional information=
 */
>  	{ KE_IGNORE, 0xe008, { KEY_RFKILL } },
> =20
> -	/* The next device is at offset 6, the active devices are at
> -	   offset 8 and the attached devices at offset 10 */
> -	{ KE_KEY, 0xe00b, { KEY_SWITCHVIDEOMODE } },
> +	{ KE_KEY,    0xe009, { KEY_EJECTCD } },
> =20
> +	/* After key code is: next device, active devices, attached devices=
 */
> +	{ KE_KEY,    0xe00b, { KEY_SWITCHVIDEOMODE } },
> +
> +	/* Also contains keyboard illumination level after key code */

I know I'm being really pedantic here, but as this is a cleanup patch,
maybe it makes sense to unify the comments a bit?  After this patch is
applied, the comments are:

    /* These also contain the brightness level after key code */
    /* Radio devices state change, also contains additional information=
 */
    /* After key code is: next device, active devices, attached devices=
 */
    /* Also contains keyboard illumination level after key code */

How about changing them to something like:

    /* Key code is followed by brightness level */
    /* Radio devices state change, key code is followed by additional i=
nformation */
    /* Key code is followed by: next device, active devices, attached d=
evices */
    /* Key code is followed by keyboard illumination level */

And looking at the bigger picture, do you think these comments
(especially the generic one: "also contains additional information") ar=
e
actually needed?  Anything that follows the key code is ignored by
kernel code anyway.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
