From: Ike Panhc <ike.pan@canonical.com>
Subject: Re: [PATCH linux-3.1.y] ideapad: Check if acpi already handle backlight
 power to avoid a page fault
Date: Wed, 11 Jan 2012 19:47:33 +0800
Message-ID: <4F0D76D5.2080704@canonical.com>
References: <CAFVLVSOp750X4L+qgR16Qc53V+jOKsxA-ujskx3K0BX9kQOzTw@mail.gmail.com> <20120111004256.GS22184@burratino>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:54002 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756841Ab2AKLrf (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 11 Jan 2012 06:47:35 -0500
In-Reply-To: <20120111004256.GS22184@burratino>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Nieder <jrnieder@gmail.com>
Cc: stable@vger.kernel.org, platform-driver-x86@vger.kernel.org, Artem X <artem.brz@gmail.com>, Rene Bolldorf <xsecute@googlemail.com>, Matthew Garrett <mjg@redhat.com>, Corentin Chary <corentin.chary@gmail.com>

Thanks, and this is necessary for 3.1.y

On 01/11/2012 08:42 AM, Jonathan Nieder wrote:
> From: Ren=C3=A9 Bollford <xsecute@googlemail.com>
> Date: Sun, 23 Oct 2011 09:56:42 +0200
>=20
> commit d4afc7754a60b885b63ef23fd194984e2d53a4e6 upstream.
>=20
> This patch avoid a page fault in the ideapad-laptop extras when
> turning the backlight power on or off.
>=20
> Signed-off-by: Rene Bolldorf <xsecute@googlemail.com>
> Signed-off-by: Matthew Garrett <mjg@redhat.com>
> Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
> Tested-by: Artem X <artem.brz@gmail.com>

Acked-by: Ike Panhc <ike.pan@canonical.com>

> ---
> Artem X wrote:
>=20
>> I've compiled vanilla 3.1.6 with that patch and turning off blacklig=
ht
>> was working.
>=20
> This fixes an oops reported by a few people in the new ideapad-laptop
> backlight driver.  See:
>=20
>  - http://thread.gmane.org/gmane.linux.kernel/1205259
>  - http://thread.gmane.org/gmane.linux.drivers.platform.x86.devel/240=
5
>  - http://bugs.debian.org/655377
>=20
> Luckily the ideapad-laptop backlight driver was introduced in
> v3.1-rc1~14^2~29, so older kernels do not have this bug.  Fix is
> already included in v3.2.
>=20
>  drivers/platform/x86/ideapad-laptop.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform=
/x86/ideapad-laptop.c
> index 0c595410e788..0d94eec00f4d 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -493,6 +493,8 @@ static void ideapad_backlight_notify_power(struct=
 ideapad_private *priv)
>  	unsigned long power;
>  	struct backlight_device *blightdev =3D priv->blightdev;
> =20
> +	if (!blightdev)
> +		return;
>  	if (read_ec_data(ideapad_handle, 0x18, &power))
>  		return;
>  	blightdev->props.power =3D power ? FB_BLANK_UNBLANK : FB_BLANK_POWE=
RDOWN;
