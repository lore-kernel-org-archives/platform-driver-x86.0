From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 1/2] dell-smbios: Add a helper function for complex
 SMI requests
Date: Mon, 9 May 2016 14:02:12 +0200
Message-ID: <20160509120212.GA2875@eudyptula.hq.kempniu.pl>
References: <1462636364-25644-1-git-send-email-mario_limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:32942 "EHLO
	mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751645AbcEIMCS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 9 May 2016 08:02:18 -0400
Received: by mail-lf0-f67.google.com with SMTP id j8so11985858lfd.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 May 2016 05:02:17 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1462636364-25644-1-git-send-email-mario_limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario_limonciello@dell.com>
Cc: dvhart@infradead.org, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org

> More complex SMI requests can return data that exceeds the 4 32 byte

32-bit

> arguments that are traditionally part of a request.
>=20
> To support more complex requests, the first input argument can be a
> 32 bit physical address with a buffer properly built in advance.
>=20
> This helper function prepares the buffer as the BIOS will look for
> it in these requests.
>=20
> Signed-off-by: Mario Limonciello <mario_limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-smbios.c | 28 ++++++++++++++++++++++++++++
>  drivers/platform/x86/dell-smbios.h |  1 +
>  2 files changed, 29 insertions(+)
>=20
> diff --git a/drivers/platform/x86/dell-smbios.c b/drivers/platform/x8=
6/dell-smbios.c
> index d2412ab..00b29df 100644
> --- a/drivers/platform/x86/dell-smbios.c
> +++ b/drivers/platform/x86/dell-smbios.c
> @@ -92,6 +92,34 @@ void dell_smbios_send_request(int class, int selec=
t)
>  }
>  EXPORT_SYMBOL_GPL(dell_smbios_send_request);
> =20
> +/* More complex requests are served by sending
> + * a pointer to a pre-allocated buffer
> + * Bytes 0:3 are the size of the return value
> + * Bytes 4:length are the returned value
> + *
> + * This helper function prepares it properly
> + * with the size length to be provided
> + *
> + * caller still needs to pre-allocate and clear
> + * the input buffer

Which input buffer, the original one (struct calling_interface_buffer)
or the one for "complex requests"?

If the former, pre-allocation is done by dell_smbios_init() while
dell_smbios_get_buffer() clears the buffer before use, so the comment
above may be misleading.

If the latter, then the caller in patch 2/2 doesn't clear the input
buffer, it just allocates it using __get_free_page().

> + */
> +void dell_smbios_prepare_v2_call(u8 *input, size_t length)
> +{
> +	u32 i;
> +	u32 *data =3D (u32 *) input;
> +
> +	data[0] =3D length - 4;
> +	for (i =3D 4; i < length; i +=3D 4) {
> +		if (length - i > 4) {
> +			input[i]   =3D 'D';
> +			input[i+1] =3D 'S';
> +			input[i+2] =3D 'C';
> +			input[i+3] =3D 'I';

memcpy(&input[i], "DSCI", 4) or something along those lines?

Anyway, I'm confused about filling the buffer with repeating "DSCI"
strings.  The buffer's length is provided explicitly in its first four
bytes.  Some bytes at the end will always be left uninitialized.  So wh=
y
bother initializing anything besides length at all?

> +		}
> +	}
> +}
> +EXPORT_SYMBOL_GPL(dell_smbios_prepare_v2_call);
> +
>  struct calling_interface_token *dell_smbios_find_token(int tokenid)
>  {
>  	int i;
> diff --git a/drivers/platform/x86/dell-smbios.h b/drivers/platform/x8=
6/dell-smbios.h
> index ec7d40a..5d4184c 100644
> --- a/drivers/platform/x86/dell-smbios.h
> +++ b/drivers/platform/x86/dell-smbios.h
> @@ -41,6 +41,7 @@ struct calling_interface_buffer *dell_smbios_get_bu=
ffer(void);
>  void dell_smbios_clear_buffer(void);
>  void dell_smbios_release_buffer(void);
>  void dell_smbios_send_request(int class, int select);
> +void dell_smbios_prepare_v2_call(u8 *input, size_t length);

I will send my remarks regarding the proposed changes to dell-smbios AP=
I
in response to patch 2/2.

--=20
Best regards,
Micha=C5=82 K=C4=99pie=C5=84
