From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: ignore missing Aspire 5741G keys
 (checkpatched)
Date: Tue, 13 Mar 2012 10:58:19 +0800
Message-ID: <1331607499.10557.143.camel@linux-s257.site>
References: <20120306123355.GA3904@swordfish.minsk.epam.com>
	 <1331266669.10557.107.camel@linux-s257.site>
	 <20120312100643.GA24726@swordfish.minsk.epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from nat.nue.novell.com ([195.135.221.2]:12602 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754541Ab2CMC75 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 12 Mar 2012 22:59:57 -0400
In-Reply-To: <20120312100643.GA24726@swordfish.minsk.epam.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Joey Lee <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

=E6=96=BC =E4=B8=80=EF=BC=8C2012-03-12 =E6=96=BC 13:07 +0300=EF=BC=8CSe=
rgey Senozhatsky =E6=8F=90=E5=88=B0=EF=BC=9A
> acer-wmi: ignore missing Aspire 5741G keys
>=20
> Ignore Aspire's 5741G:
>  KEY_PREVIOUSSONG
>  KEY_NEXTSONG
>  KEY_PLAYPAUSE
>  KEY_STOP
>  KEY_VOLUMEDOWN
> =20
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
>=20
> ---
>=20
>  drivers/platform/x86/acer-wmi.c |    5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index b848277..e45b9ad 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -107,11 +107,16 @@ static const struct key_entry acer_wmi_keymap[]=
 =3D {
>  	{KE_KEY, 0x24, {KEY_PROG4} },    /* Social networking_Key */
>  	{KE_IGNORE, 0x41, {KEY_MUTE} },
>  	{KE_IGNORE, 0x42, {KEY_PREVIOUSSONG} },
> +	{KE_IGNORE, 0x4d, {KEY_PREVIOUSSONG} },
>  	{KE_IGNORE, 0x43, {KEY_NEXTSONG} },
> +	{KE_IGNORE, 0x4e, {KEY_NEXTSONG} },
>  	{KE_IGNORE, 0x44, {KEY_PLAYPAUSE} },
> +	{KE_IGNORE, 0x4f, {KEY_PLAYPAUSE} },
>  	{KE_IGNORE, 0x45, {KEY_STOP} },
> +	{KE_IGNORE, 0x50, {KEY_STOP} },
>  	{KE_IGNORE, 0x48, {KEY_VOLUMEUP} },
>  	{KE_IGNORE, 0x49, {KEY_VOLUMEDOWN} },
> +	{KE_IGNORE, 0x4a, {KEY_VOLUMEDOWN} },
>  	{KE_IGNORE, 0x61, {KEY_SWITCHVIDEOMODE} },
>  	{KE_IGNORE, 0x62, {KEY_BRIGHTNESSUP} },
>  	{KE_IGNORE, 0x63, {KEY_BRIGHTNESSDOWN} },
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>=20

Acked-by: Lee, Chun-Yi <jlee@suse.com>


Thanks for your patch!
Joey Lee
