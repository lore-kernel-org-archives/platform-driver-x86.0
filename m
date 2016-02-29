From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v4 4/5] dell-wmi: properly process Dell Instant Launch
 hotkey
Date: Mon, 29 Feb 2016 13:59:48 +0100
Message-ID: <20160229125948.GI21814@pali>
References: <1455634230-1487-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-1-git-send-email-kernel@kempniu.pl>
 <1456298416-29683-5-git-send-email-kernel@kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456298416-29683-5-git-send-email-kernel@kempniu.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Darek Stojaczyk <darek.stojaczyk@gmail.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday 24 February 2016 08:20:14 Micha=C5=82 K=C4=99pie=C5=84 wro=
te:
> On models on which an SMBIOS request needs to be issued in order for =
WMI
> events to be generated, pressing the Dell Instant Launch hotkey does =
not
> raise an i8042 interrupt - only a WMI event is generated (0xe025 on D=
ell
> Vostro V131).  Thus, the 0xe025 event should only be ignored on machi=
nes
> which do not require an SMBIOS request for enabling WMI.
>=20
> Signed-off-by: Micha=C5=82 K=C4=99pie=C5=84 <kernel@kempniu.pl>
> ---
>  drivers/platform/x86/dell-wmi.c |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index 65edd93..ffc957b5 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -111,7 +111,7 @@ static const struct key_entry dell_wmi_legacy_key=
map[] __initconst =3D {
>  	{ KE_IGNORE, 0xe020, { KEY_MUTE } },
> =20
>  	/* Shortcut and audio panel keys */
> -	{ KE_IGNORE, 0xe025, { KEY_RESERVED } },
> +	{ KE_KEY, 0xe025, { KEY_PROG4 } },
>  	{ KE_IGNORE, 0xe026, { KEY_RESERVED } },
> =20
>  	{ KE_IGNORE, 0xe02e, { KEY_VOLUMEDOWN } },
> @@ -235,6 +235,9 @@ static void dell_wmi_process_key(int reported_key=
)
>  	    acpi_video_handles_brightness_key_presses())
>  		return;
> =20
> +	if (key->keycode =3D=3D KEY_PROG4 && !wmi_requires_smbios_request)
> +		return;
> +

Here I would rather test against reported_key, not keycode. If somebody
in future adds KEY_PROG4 for something else we will have problem...

>  	sparse_keymap_report_entry(dell_wmi_input_dev, key, 1, true);
>  }
> =20

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
