From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: add Aspire 5741G touchpad toggle key
Date: Fri, 30 Mar 2012 18:25:36 +0800
Message-ID: <1333103136.7293.18.camel@linux-s257.site>
References: <20120306123355.GA3904@swordfish.minsk.epam.com>
	 <1331266669.10557.107.camel@linux-s257.site>
	 <20120312101956.GA8522@swordfish.minsk.epam.com>
	 <1331607878.10557.145.camel@linux-s257.site>
	 <20120329095322.GA3576@swordfish.minsk.epam.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from charybdis-ext.suse.de ([195.135.221.2]:49342 "EHLO
	nat.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933663Ab2C3K1l (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 30 Mar 2012 06:27:41 -0400
In-Reply-To: <20120329095322.GA3576@swordfish.minsk.epam.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Joey Lee <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Sergey,=20

=E6=96=BC =E5=9B=9B=EF=BC=8C2012-03-29 =E6=96=BC 12:53 +0300=EF=BC=8CSe=
rgey Senozhatsky =E6=8F=90=E5=88=B0=EF=BC=9A
> acer-wmi: add Aspire 5741G touchpad toggle key
>=20
> add Aspire 5741G KEY_TOUCHPAD_TOGGLE to wmi keymap.
>=20
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
>=20
> ---
>=20
>  drivers/platform/x86/acer-wmi.c |    1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index c1a3fd8..94a6747 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -125,6 +125,7 @@ static const struct key_entry acer_wmi_keymap[] =3D=
 {
>  	{KE_KEY, 0x64, {KEY_SWITCHVIDEOMODE} },	/* Display Switch */
>  	{KE_IGNORE, 0x81, {KEY_SLEEP} },
>  	{KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} },	/* Touch Pad On/Off */
> +	{KE_KEY, 0x85, {KEY_TOUCHPAD_TOGGLE} },
>  	{KE_IGNORE, 0x83, {KEY_TOUCHPAD_TOGGLE} },
>  	{KE_END, 0}
>  };
>=20

Acked-by: Lee, Chun-Yi <jlee@suse.com>


This patch is OK to me!


Thanks for your patch!
Joey Lee
