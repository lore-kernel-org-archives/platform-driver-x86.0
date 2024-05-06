Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A7153834
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 May 2024 15:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715007760; cv=none; b=kWYZsF2fZfHEaBNQTdpoH10bIoBph2Fvk42fXtwJ2WXt1HYl2pbdYDLaD1zCAbMpsa/OOxWNH9THA+IBpzdysgwqwi2boRamTNKUXhEgU1JqATJ0CRyZeh7+ugjB/dvmkx/sO+JZ9urmYIbegUH8ETj6WdnkPvqgfy/0BiwP4uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715007760; c=relaxed/simple;
	bh=vlYHtWOO+V7rhojDmo+iEscwjzTrTLwmjXtdyuYDDzM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Bej9fgX+OCFZr58f/jVMlhDVQ5NO4m7fj4dqggVLkPqi6SzN5RI+nz3zaTKyQ36fwS7Jl3qbsnOb+Mtt50CRDOSKBI5a9ICcYKN1gw5cxVEFRoxTYGveMEx+m5bfqO8VJRvXc5ZkXbEiocGjP8vQfnoNZdvabQm9Cj9082i18fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXXUeC48; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXXUeC48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715007760; x=1746543760;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vlYHtWOO+V7rhojDmo+iEscwjzTrTLwmjXtdyuYDDzM=;
  b=EXXUeC48reVLm/DJJtu9NbjA11uOpUWFsxE0Vi13zA7Cm8aEvyA7NZn1
   QIgHAYUGRDOPrbL0UR2BK4tEny/BoaoBc0Nd9M1aBGTRCoH11gSFQUHV7
   kgEK7Bs83pwdhyKjpcx6fVNfydyhzAa69fZBwBcAECleuYFlVAUDteZGv
   m0+SzusCRMCVR6tjy616X5yHQ4sKrQMmtlJBj8/fXr8+snYOFsFxPAId8
   wFMv/01FWWkbqF2SuDGjn8yRvrNBwaqmqWeVFwpD6BWN2aidunLp6idOX
   Zy7mEvMLKCzKgbwPDG/yxTZgQ5DdIbimF3nfWKcUVZHlHhNg4CyCsd12B
   g==;
X-CSE-ConnectionGUID: dpcRoH4bQ12w+f9BQ3lOSw==
X-CSE-MsgGUID: cp1b0tNbQta07K26SE2vPw==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="28232720"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28232720"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 08:02:38 -0700
X-CSE-ConnectionGUID: bBx+nVbjRbGGnuvu1sd/8A==
X-CSE-MsgGUID: m/z82VmQSpiS8kz+lfb9uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; 
   d="scan'208";a="28191277"
Received: from ijarvine-desk1.ger.corp.intel.com (HELO localhost) ([10.245.247.68])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 08:02:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 6 May 2024 18:02:32 +0300 (EEST)
To: Hans de Goede <hdegoede@redhat.com>
cc: Andy Shevchenko <andy@kernel.org>, platform-driver-x86@vger.kernel.org, 
    Kate Hsuan <hpa@redhat.com>
Subject: Re: [PATCH 2/2] platform/x86: x86-android-tablets: Create LED device
 for Xiaomi Pad 2 bottom bezel touch buttons
In-Reply-To: <20240505160832.44216-2-hdegoede@redhat.com>
Message-ID: <6c60058f-8a2d-321f-34f0-3b11b4334d40@linux.intel.com>
References: <20240505160832.44216-1-hdegoede@redhat.com> <20240505160832.44216-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1709853423-1715007752=:1111"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1709853423-1715007752=:1111
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 5 May 2024, Hans de Goede wrote:

> The Xiaomi [Mi]Pad 2 has 3 menu / home / back capacitive touch-buttons
> on its bottom bezel. These are backlit by LEDs attached to a TPS61158 LED
> controller which is controlled by the "pwm_soc_lpss_2" PWM output.
>=20
> Create a LED class device for this, using the new input-events trigger
> as default trigger so that the buttons automatically light up on any
> input activity.
>=20
> Note alternatively a "leds_pwm" platform device could be created together
> with the necessary fwnode_s_ and a fwnode link to the PWM controller.
> There are 2 downsides to this approach:
>=20
> 1. The code would still need to pwm_get() the PWM controller to get/attac=
h
> a fwnode for the PWM controller fwnode link and setting up the necessary
> fwnodes is non trivial. So this would likely require more code then simpl=
y

non-trivial

> registering the LED class device directly.
>=20
> 2. Currently the leds_pwm driver and its devicetree bindings do not suppo=
rt
> limiting the maximum dutycycle to less then 100% which is required in thi=
s
> case (the leds_pwm driver can probably  be extended to allow this).

Double space.
=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../platform/x86/x86-android-tablets/other.c  | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>=20
> diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/p=
latform/x86/x86-android-tablets/other.c
> index ff7b1d0abaa3..aa95645f3f24 100644
> --- a/drivers/platform/x86/x86-android-tablets/other.c
> +++ b/drivers/platform/x86/x86-android-tablets/other.c
> @@ -11,7 +11,9 @@
>  #include <linux/acpi.h>
>  #include <linux/gpio/machine.h>
>  #include <linux/input.h>
> +#include <linux/leds.h>
>  #include <linux/platform_device.h>
> +#include <linux/pwm.h>
> =20
>  #include <dt-bindings/leds/common.h>
> =20
> @@ -662,8 +664,50 @@ static const struct software_node *ktd2026_node_grou=
p[] =3D {
>  =09NULL
>  };
> =20
> +/*
> + * For the LEDs which backlight the menu / home / back capacitive button=
s on
> + * the bottom bezel. These are attached to a TPS61158 LED controller whi=
ch
> + * is controlled by the "pwm_soc_lpss_2" PWM output.
> + */
> +#define XIAOMI_MIPAD2_LED_PERIOD_NS=09=0919200
> +#define XIAOMI_MIPAD2_LED_MAX_DUTY=09=09 6000 /* From Android kernel */
> +
> +static struct pwm_device *xiaomi_mipad2_led_pwm;
> +
> +static int xiaomi_mipad2_brightness_set(struct led_classdev *led_cdev,
> +=09=09=09=09=09enum led_brightness val)
> +{
> +=09struct pwm_state state =3D {
> +=09=09.period =3D XIAOMI_MIPAD2_LED_PERIOD_NS,
> +=09=09.duty_cycle =3D val,
> +=09=09.enabled =3D !!val,
> +=09};
> +
> +=09return pwm_apply_might_sleep(xiaomi_mipad2_led_pwm, &state);
> +}
> +
>  static int __init xiaomi_mipad2_init(struct device *dev)
>  {
> +=09struct led_classdev *led_cdev;
> +=09int ret;
> +
> +=09xiaomi_mipad2_led_pwm =3D devm_pwm_get(dev, "pwm_soc_lpss_2");
> +=09if (IS_ERR(xiaomi_mipad2_led_pwm))
> +=09=09return dev_err_probe(dev, PTR_ERR(xiaomi_mipad2_led_pwm), "getting=
 pwm\n");
> +
> +=09led_cdev =3D devm_kzalloc(dev, sizeof(*led_cdev), GFP_KERNEL);
> +=09if (!led_cdev)
> +=09=09return -ENOMEM;
> +
> +=09led_cdev->name =3D "mipad2:white:touch-buttons-backlight";
> +=09led_cdev->max_brightness =3D XIAOMI_MIPAD2_LED_MAX_DUTY;
> +=09led_cdev->brightness_set_blocking =3D xiaomi_mipad2_brightness_set;
> +=09led_cdev->default_trigger =3D "input-events";
> +
> +=09ret =3D devm_led_classdev_register(dev, led_cdev);
> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret, "registering LED\n");
> +
>  =09return software_node_register_node_group(ktd2026_node_group);
>  }

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>


--=20
 i.

--8323328-1709853423-1715007752=:1111--
