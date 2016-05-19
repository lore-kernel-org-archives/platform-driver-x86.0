From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH] thinkpad_acpi: save kbdlight state on suspend and
 restore it on resume
Date: Thu, 19 May 2016 09:52:43 +0200
Message-ID: <20160519075243.GI29844@pali>
References: <1463620982-21058-1-git-send-email-mail@3v1n0.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:32841 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751362AbcESHwq (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 19 May 2016 03:52:46 -0400
Received: by mail-wm0-f66.google.com with SMTP id r12so18756516wme.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 May 2016 00:52:46 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1463620982-21058-1-git-send-email-mail@3v1n0.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Marco Trevisan <mail@3v1n0.net>
Cc: platform-driver-x86@vger.kernel.org, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>

On Thursday 19 May 2016 03:23:02 Marco Trevisan wrote:
> From: Marco Trevisan (Trevi=C3=B1o) <mail@3v1n0.net>
>=20
> Override default LED class suspend/resume handles, by keeping track o=
f
> the brightness level before suspending so that it can be automaticall=
y
> restored on resume by calling default resume handler.
>=20
> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 43 ++++++++++++++++++++++++++=
+++++++---
>  1 file changed, 40 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/=
x86/thinkpad_acpi.c
> index 1f9783c..10111c2 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -5041,6 +5041,8 @@ static int kbdlight_set_level(int level)
>  	return 0;
>  }
> =20
> +static int kbdlight_set_level_and_update(int level);
> +
>  static int kbdlight_get_level(void)
>  {
>  	int status =3D 0;
> @@ -5108,7 +5110,7 @@ static void kbdlight_set_worker(struct work_str=
uct *work)
>  			container_of(work, struct tpacpi_led_classdev, work);
> =20
>  	if (likely(tpacpi_lifecycle =3D=3D TPACPI_LIFE_RUNNING))
> -		kbdlight_set_level(data->new_state);
> +		kbdlight_set_level_and_update(data->new_state);
>  }
> =20
>  static void kbdlight_sysfs_set(struct led_classdev *led_cdev,
> @@ -5139,7 +5141,6 @@ static struct tpacpi_led_classdev tpacpi_led_kb=
dlight =3D {
>  		.max_brightness	=3D 2,
>  		.brightness_set	=3D &kbdlight_sysfs_set,
>  		.brightness_get	=3D &kbdlight_sysfs_get,
> -		.flags		=3D LED_CORE_SUSPENDRESUME,
>  	}
>  };
> =20
> @@ -5177,6 +5178,20 @@ static void kbdlight_exit(void)
>  	flush_workqueue(tpacpi_wq);
>  }
> =20
> +static int kbdlight_set_level_and_update(int level)
> +{
> +	int ret;
> +	struct led_classdev *led_cdev;
> +
> +	ret =3D kbdlight_set_level(level);
> +	led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> +
> +	if (ret =3D=3D 0 && !(led_cdev->flags & LED_SUSPENDED))
> +		led_cdev->brightness =3D level;
> +
> +	return ret;
> +}
> +
>  static int kbdlight_read(struct seq_file *m)
>  {
>  	int level;
> @@ -5217,13 +5232,35 @@ static int kbdlight_write(char *buf)
>  	if (level =3D=3D -1)
>  		return -EINVAL;
> =20
> -	return kbdlight_set_level(level);
> +	return kbdlight_set_level_and_update(level);
> +}
> +
> +static void kbdlight_suspend(void)
> +{
> +	struct led_classdev *led_cdev;
> +
> +	if (!tp_features.kbdlight)
> +		return;
> +
> +	led_cdev =3D &tpacpi_led_kbdlight.led_classdev;
> +	led_update_brightness(led_cdev);
> +	led_classdev_suspend(led_cdev);
> +}
> +
> +static void kbdlight_resume(void)
> +{
> +	if (!tp_features.kbdlight)
> +		return;
> +
> +	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
>  }
> =20
>  static struct ibm_struct kbdlight_driver_data =3D {
>  	.name =3D "kbdlight",
>  	.read =3D kbdlight_read,
>  	.write =3D kbdlight_write,
> +	.suspend =3D kbdlight_suspend,
> +	.resume =3D kbdlight_resume,
>  	.exit =3D kbdlight_exit,
>  };
> =20

=46or me whole patch looks like a big hack because LED_CORE_SUSPENDRESU=
ME
does not work correctly... I would rather see fixed support for flag
LED_CORE_SUSPENDRESUME, not adding another suspend/resume hook if
possible. Any idea?

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
