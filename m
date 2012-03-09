From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: ignore missing Aspire 5741G keys
Date: Fri, 09 Mar 2012 12:17:49 +0800
Message-ID: <1331266669.10557.107.camel@linux-s257.site>
References: <20120306123355.GA3904@swordfish.minsk.epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from victor.provo.novell.com ([137.65.250.26]:38497 "EHLO
	victor.provo.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756927Ab2CIETb (ORCPT
	<rfc822;groupwise-platform-driver-x86@vger.kernel.org:0:0>);
	Thu, 8 Mar 2012 23:19:31 -0500
In-Reply-To: <20120306123355.GA3904@swordfish.minsk.epam.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Joey Lee <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Sergey,=20

=E6=96=BC =E4=BA=8C=EF=BC=8C2012-03-06 =E6=96=BC 15:33 +0300=EF=BC=8CSe=
rgey Senozhatsky =E6=8F=90=E5=88=B0=EF=BC=9A
> acer-wmi: ignore missing Aspire 5741G keys
>=20
> Ignore Aspire's 5741G:
>  KEY_PREVIOUSSONG
>  KEY_NEXTSONG
>  KEY_PLAYPAUSE
>  KEY_STOP
>  KEY_VOLUMEDOWN
>=20
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
>=20
> ---
>=20
>  drivers/platform/x86/acer-wmi.c |    5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index b848277..d8a67cc 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -107,11 +107,16 @@ static const struct key_entry acer_wmi_keymap[]=
 =3D {
>  	{KE_KEY, 0x24, {KEY_PROG4} },    /* Social networking_Key */
>  	{KE_IGNORE, 0x41, {KEY_MUTE} },
>  	{KE_IGNORE, 0x42, {KEY_PREVIOUSSONG} },
> +	{KE_IGNORE, 0x4d, {KEY_PREVIOUSSONG} },=09

Here have trailing whitespace.

Please kindly use script/checkpatch.pl to check your patch before send
to upstream.
Please re-send after you fix.

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
>=20

And,=20
Please kindly send acpidump and dmidecode log to me for regression test
reference.


Thanks a lot!
Joey Lee
