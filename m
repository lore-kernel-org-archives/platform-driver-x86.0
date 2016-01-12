From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 2/2] dell-wmi: Process only one event on devices with
 interface version 0
Date: Tue, 12 Jan 2016 12:14:39 +0100
Message-ID: <20160112111439.GA7630@eudyptula.hq.kempniu.pl>
References: <1450991926-20937-1-git-send-email-pali.rohar@gmail.com>
 <1451942796-26574-1-git-send-email-pali.rohar@gmail.com>
 <1451942796-26574-3-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lb0-f194.google.com ([209.85.217.194]:33995 "EHLO
	mail-lb0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752901AbcALLOm (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Jan 2016 06:14:42 -0500
Received: by mail-lb0-f194.google.com with SMTP id oe3so1677317lbb.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Jan 2016 03:14:42 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <1451942796-26574-3-git-send-email-pali.rohar@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

> BIOS/ACPI on devices with WMI interface version 0 does not clear buff=
er
> before filling it. So next time when BIOS/ACPI send WMI event which i=
s
> smaller as previous then it contains garbage in buffer from previous =
event.
>=20
> BIOS/ACPI on devices with WMI interface version 1 clears buffer and
> sometimes send more events in buffer at one call.
>=20
> Since commit 83fc44c32ad8 ("dell-wmi: Update code for processing WMI
> events") dell-wmi process all events in buffer (and not just first).
>=20
> So to prevent reading garbage from buffer we will process only first =
one
> event on devices with WMI interface version 0.
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> ---
>  drivers/platform/x86/dell-wmi.c |   16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/d=
ell-wmi.c
> index 1ad7a7b..5db9efb 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -237,6 +237,22 @@ static void dell_wmi_notify(u32 value, void *con=
text)
> =20
>  	buffer_end =3D buffer_entry + buffer_size;
> =20
> +	/*
> +	 * BIOS/ACPI on devices with WMI interface version 0 does not clear
> +	 * buffer before filling it. So next time when BIOS/ACPI send WMI e=
vent
> +	 * which is smaller as previous then it contains garbage in buffer =
from
> +	 * previous event.
> +	 *
> +	 * BIOS/ACPI on devices with WMI interface version 1 clears buffer =
and
> +	 * sometimes send more events in buffer at one call.
> +	 *
> +	 * So to prevent reading garbage from buffer we will process only f=
irst
> +	 * one event on devices with WMI interface version 0.
> +	 */
> +	if (dell_wmi_interface_version =3D=3D 0 && buffer_entry < buffer_en=
d)
> +		if (buffer_end > buffer_entry + buffer_entry[0] + 1)
> +			buffer_end =3D buffer_entry + buffer_entry[0] + 1;

Wouldn't it be a bit more clear if we clamped buffer_size before settin=
g
buffer_end?  E.g. like this:

	if (buffer_size =3D=3D 0)
		return;

	if (dell_wmi_interface_version =3D=3D 0 &&
	    buffer_size > buffer_entry[0] + 1)
		buffer_size =3D buffer_entry[0] + 1;

	buffer_end =3D buffer_entry + buffer_size;

If I understand correctly, the second check on the first line added by
your patch prevents a bad dereference when accesing buffer_entry[0].
The only case when that may happen is when buffer_size is 0, which mean=
s
we got notified with rubbish anyway, so we can just return (perhaps wit=
h
a log message, which I omitted above).

One more minor nit: you should probably decide between "first" and "one=
"
as the phrase "only first one event" (found both in the commit message
and in the code comment) sounds incorrect to me.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
