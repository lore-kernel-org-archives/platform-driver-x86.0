From: Corentin Chary <corentin.chary@gmail.com>
Subject: Re: [PATCH 2/3] platform-drivers-x86: asus-wmi: fix resource leak in asus_wmi_led_exit
Date: Mon, 8 Aug 2011 14:18:14 +0200
Message-ID: <CAHR064jQkgt0B8wHX_j301eqTtEakSPw5+TeiUqPpC4AHL6YXg@mail.gmail.com>
References: <1312794859.21052.2.camel@phoenix>
	<1312794961.21052.4.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:61945 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752196Ab1HHMSP convert rfc822-to-8bit (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 8 Aug 2011 08:18:15 -0400
In-Reply-To: <1312794961.21052.4.camel@phoenix>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Axel Lin <axel.lin@gmail.com>
Cc: linux-kernel@vger.kernel.org, Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org

On Mon, Aug 8, 2011 at 11:16 AM, Axel Lin <axel.lin@gmail.com> wrote:
> This patch fixes wrong test for successful registered led_classdev,
> and also fixes a leak due to missing led_classdev_unregister call
> for asus->kbd_led in asus_wmi_led_exit.
>
> device_create returns &struct device pointer on success, or ERR_PTR()=
 on error.
> Thus if led_classdev_register fails, led_cdev->dev is always not NULL=
=2E
>
> Thus to unregister a successful registered led_classdev, we should ch=
eck
> (!IS_ERR_OR_NULL(asus->tpd_led.dev)) instead of (asus->tpd_led.dev).
>
> we use IS_ERR_OR_NULL instead of IS_ERR because if we havn't call
> led_classdev_register, the led_cdev->dev is NULL.
>
> Signed-off-by: Axel Lin <axel.lin@gmail.com>

Acked-by: Corentin Chary <corentin.chary@gmail.com>

> ---
> =C2=A0drivers/platform/x86/asus-wmi.c | =C2=A0 =C2=A04 +++-
> =C2=A01 files changed, 3 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/a=
sus-wmi.c
> index 95cba9e..d1049ee 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -453,7 +453,9 @@ static enum led_brightness kbd_led_get(struct led=
_classdev *led_cdev)
>
> =C2=A0static void asus_wmi_led_exit(struct asus_wmi *asus)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 if (asus->tpd_led.dev)
> + =C2=A0 =C2=A0 =C2=A0 if (!IS_ERR_OR_NULL(asus->kbd_led.dev))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 led_classdev_unreg=
ister(&asus->kbd_led);
> + =C2=A0 =C2=A0 =C2=A0 if (!IS_ERR_OR_NULL(asus->tpd_led.dev))
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0led_classdev_u=
nregister(&asus->tpd_led);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (asus->led_workqueue)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0destroy_workqu=
eue(asus->led_workqueue);
> --
> 1.7.4.1
>
>
>
>



--=20
Corentin Chary
http://xf.iksaif.net
