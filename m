From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 1/3] platform-drivers-x86: eeepc-laptop: fix wrong test
 for successful registered led_classdev
Date: Mon, 8 Aug 2011 14:17:58 +0200
Message-ID: <CAHR064ggiMvUm1m6g9fpxV-5Bk2PShZQiwjPRrukj0w_EwskWA@mail.gmail.com>
References: <1312794859.21052.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:61945 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751982Ab1HHMR7 convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 8 Aug 2011 08:17:59 -0400
In-Reply-To: <1312794859.21052.2.camel@phoenix>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

Good catch ! It would be great to have a coccinel script to check that
in scripts/coccinelle/null/.

On Mon, Aug 8, 2011 at 11:14 AM, Axel Lin <axel.lin@gmail.com> wrote:
> device_create returns &struct device pointer on success, or ERR_PTR()=
 on error.
> Thus if led_classdev_register fails, led_cdev->dev is always not NULL=
=2E
>
> If IS_ERR(eeepc->tpd_led.dev) is ture, it means led_classdev_register=
 fails.
> If (asus->tpd_led.dev) is NULL, it means we call eeepc_led_exit befor=
e
> calling led_classdev_register for &eeepc->tpd_led.
>
> We only want to call led_classdev_unregister for sucessfully register=
ed
> led_classdev, then we should check (!IS_ERR_OR_NULL(eeepc->tpd_led.de=
v)).
>
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Acked-by: Corentin Chary <corentin.chary@gmail.com>

> ---
> =C2=A0drivers/platform/x86/eeepc-laptop.c | =C2=A0 =C2=A02 +-
> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/platform/x86/eeepc-laptop.c b/drivers/platform/x=
86/eeepc-laptop.c
> index 1c45d92..29a216a 100644
> --- a/drivers/platform/x86/eeepc-laptop.c
> +++ b/drivers/platform/x86/eeepc-laptop.c
> @@ -568,7 +568,7 @@ static int eeepc_led_init(struct eeepc_laptop *ee=
epc)
>
> =C2=A0static void eeepc_led_exit(struct eeepc_laptop *eeepc)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 if (eeepc->tpd_led.dev)
> + =C2=A0 =C2=A0 =C2=A0 if (!IS_ERR_OR_NULL(eeepc->tpd_led.dev))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0led_classdev_u=
nregister(&eeepc->tpd_led);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (eeepc->led_workqueue)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0destroy_workqu=
eue(eeepc->led_workqueue);
> --
> 1.7.4.1
>
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe platform-dr=
iver-x86" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>



--=20
Corentin Chary
http://xf.iksaif.net
