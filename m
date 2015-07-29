From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] asus-laptop: Add key found on Asus F3M
Date: Tue, 28 Jul 2015 21:43:29 -0700
Message-ID: <20150729044329.GA80946@vmdeb7>
References: <1437758231-5909-1-git-send-email-stlman@poczta.fm>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.9]:49385 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751384AbbG2PXa (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 29 Jul 2015 11:23:30 -0400
Content-Disposition: inline
In-Reply-To: <1437758231-5909-1-git-send-email-stlman@poczta.fm>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?Q?=C5=81ukasz?= Stelmach <stlman@poczta.fm>
Cc: Corentin Chary <corentin.chary@gmail.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

Thanks =C5=81ukasz,

The following change seems reasonable.

While it's trivial, please provide some context in your commit message.=
 I do not
merge commits with empty messages. There is always something to say. Di=
d you see
a dmesg error, the key just didn't work, the 0x6A is new on model XYZ b=
ut you
don't know if others have it, it's from your personal experience, or ca=
me from
an ASUS manual, etc. There is always something to provide context which=
 will be
useful to someone looking at this change - or looking for this fix when=
 they hit
this problem on an older kernel.

Thanks,

On Fri, Jul 24, 2015 at 07:17:11PM +0200, =C5=81ukasz Stelmach wrote:
> Signed-off-by: =C5=81ukasz Stelmach <stlman@poczta.fm>
> ---
>  drivers/platform/x86/asus-laptop.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x8=
6/asus-laptop.c
> index 58d29c4..f2b5d0a 100644
> --- a/drivers/platform/x86/asus-laptop.c
> +++ b/drivers/platform/x86/asus-laptop.c
> @@ -332,6 +332,7 @@ static const struct key_entry asus_keymap[] =3D {
>  	{KE_KEY, 0x65, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + TV */
>  	{KE_KEY, 0x66, { KEY_SWITCHVIDEOMODE } }, /* SDSP CRT + TV */
>  	{KE_KEY, 0x67, { KEY_SWITCHVIDEOMODE } }, /* SDSP LCD + CRT + TV */
> +	{KE_KEY, 0x6A, { KEY_TOUCHPAD_TOGGLE } }, /* Lock Touchpad Fn + F9 =
*/
>  	{KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } }, /* Lock Touchpad */
>  	{KE_KEY, 0x6C, { KEY_SLEEP } }, /* Suspend */
>  	{KE_KEY, 0x6D, { KEY_SLEEP } }, /* Hibernate */
> --=20
> 2.1.4
>=20
>=20

--=20
Darren Hart
Intel Open Source Technology Center
