From: joeyli <jlee@suse.com>
Subject: Re: [PATCH] acer-wmi: add Aspire 5741G touchpad toggle key
Date: Tue, 27 Nov 2012 14:31:52 +0800
Message-ID: <1353997912.21227.862.camel@linux-s257.site>
References: <20121126183502.GA2749@swordfish>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:50611 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755906Ab2K0Gcx (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 27 Nov 2012 01:32:53 -0500
In-Reply-To: <20121126183502.GA2749@swordfish>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Joey Lee <jlee@novell.com>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

=E6=96=BC =E4=B8=80=EF=BC=8C2012-11-26 =E6=96=BC 21:35 +0300=EF=BC=8CSe=
rgey Senozhatsky =E6=8F=90=E5=88=B0=EF=BC=9A
> Add Aspire 5741G KEY_TOUCHPAD_TOGGLE to wmi keymap, preventing
> "acer_wmi: Unknown key number - 0x85" error.
>=20
>=20
> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

Signed-off-by: Lee, Chun-Yi <jlee@suse.com>

Thanks for you resend your patch.=20

Joey Lee

>=20
> ---
>=20
>  drivers/platform/x86/acer-wmi.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/a=
cer-wmi.c
> index 934d861..9a6ee9a 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -127,6 +127,7 @@ static const struct key_entry acer_wmi_keymap[] =3D=
 {
>  	{KE_IGNORE, 0x81, {KEY_SLEEP} },
>  	{KE_KEY, 0x82, {KEY_TOUCHPAD_TOGGLE} },	/* Touch Pad On/Off */
>  	{KE_IGNORE, 0x83, {KEY_TOUCHPAD_TOGGLE} },
> +	{KE_KEY, 0x85, {KEY_TOUCHPAD_TOGGLE} },
>  	{KE_END, 0}
>  };
>=20
>=20
