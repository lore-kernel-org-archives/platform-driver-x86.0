Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C411D95AA
	for <platform-driver-x86@vger.kernel.org>; Thu, 17 Oct 2024 09:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158775; cv=none; b=qYAS5oNm3n00rpe5JWM3hq+aRW2lzHP3F5ABhAsjmBO06a+Ub1rKKWlDmEHCsxXKDwxm+F/gduLOR8jGRV+IH6REvkDYyXm79USwCMb1dHcubtDvE/n+32lMFtHTLoTlKV4bk6Nc7ZBpGjHVXea3nA+KKuh81Gi8SY3kP/Q8ztA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158775; c=relaxed/simple;
	bh=cI4kXoTMK6v1/UJmhGfbNWJm+oxK/M9C1JbE2fqAksE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WL/HtOqXY7zh7lPEd7tm9M6KVVlIcxPd9jBYU8kL+YADbqpJhxN8w2dOX/3d724aSgU+IZyC0oIhPU/o2GAnDcRz0ylt0ZnVBroTZ/ro99zDOp1EEK6RzTiMXFU9McX4R51FLZMG+b3oqnKiMX92xdIC4rReo8UhJPoM0STUsPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hKXQJWFT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hKXQJWFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729158771; x=1760694771;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cI4kXoTMK6v1/UJmhGfbNWJm+oxK/M9C1JbE2fqAksE=;
  b=hKXQJWFT1ICVSBShB+y6rwNNBrjKvwDcL24jVQ+XqTFGs7CKgLAOLQ+Q
   fBbio98paxXA8b9duMdVUn9zf1jzW6fFyxDjP931B6IV5tsAQtQ5wFEsw
   f/U2ywAG39RPoOOYemw9olkckTFhryyDt9GXCVRK3r4N4cdP6vl1ZjalC
   Ju+Icd4M9ZQhpxXwbz4BsXt0Fl2xQaGfdvwXn/Pur/y5VWBadvtZ5y9lW
   tWp/Ilq5Z3roWGJk5F8VhpO656cHgmUmJCdB19FsWw1Xs3MrfWlVE8E47
   vlEHZKMYvYbSKpHpiw1to8IhKIwS4P/rIa4syJxZMpiIj06UPphaNUFao
   Q==;
X-CSE-ConnectionGUID: 4kfVw+vURLudRrDGPXysZw==
X-CSE-MsgGUID: z4r+9k1uQUmgVHQt82zegA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51180440"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51180440"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:52:49 -0700
X-CSE-ConnectionGUID: h4MVFg9cR1GcRJjijn0wAQ==
X-CSE-MsgGUID: 5JEVpGGOTSyyiFAjgcp6fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="78534641"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.91])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 02:52:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 17 Oct 2024 12:52:44 +0300 (EEST)
To: =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: Switch back to struct
 platform_driver::remove()
In-Reply-To: <20241017073802.53235-2-u.kleine-koenig@baylibre.com>
Message-ID: <734d8937-a111-789a-4e0b-83c623408255@linux.intel.com>
References: <20241017073802.53235-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2130711391-1729158764=:929"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2130711391-1729158764=:929
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 17 Oct 2024, Uwe Kleine-K=C3=B6nig wrote:

> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all platform drivers below drivers/platform/x86/ to use
> .remove(), with the eventual goal to drop struct
> platform_driver::remove_new(). As .remove() and .remove_new() have the
> same prototypes, conversion is done by just changing the structure
> member name in the driver initializer.
>=20
> While touching these files, make indention of the struct initializer
> consistent in several files.

Thanks.

I've applied this patch now to review-ilpo branch, it applied conflict=20
free (unsurprisingly).

Next time, please make PATCH x/y out of indentation or any other unrelated=
=20
change (I'm happy to take them too). I often validate large-scale=20
mechanical changes like this using tools because it's harder to fool=20
a pattern matcher than my eyes/mind. Any unrelated change creates noise
I have to deal with.

--=20
 i.

> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
> Hello,
>=20
> given the simplicity of the individual changes I do this all in a single
> patch. I you don't agree, please tell and I will happily split it.
>=20
> It's based on yesterday's next. Feel free to drop changes that result in
> a conflict when you come around to apply this. I'll care for the fallout
> at a later time then. (Having said that, if you use b4 am -3 and git am
> -3, there should be hardly any conflict.)
>=20
> Note I didn't Cc: all the individual driver maintainers to not trigger
> sending limits and spam filters.
>=20
> Best regards
> Uwe
>=20
>  drivers/platform/x86/acer-wmi.c                             | 2 +-
>  drivers/platform/x86/adv_swbutton.c                         | 2 +-
>  drivers/platform/x86/amd/hsmp.c                             | 2 +-
>  drivers/platform/x86/amd/pmc/pmc.c                          | 2 +-
>  drivers/platform/x86/amd/pmf/core.c                         | 2 +-
>  drivers/platform/x86/amilo-rfkill.c                         | 6 +++---
>  drivers/platform/x86/asus-wmi.c                             | 2 +-
>  drivers/platform/x86/barco-p50-gpio.c                       | 2 +-
>  drivers/platform/x86/compal-laptop.c                        | 4 ++--
>  drivers/platform/x86/dell/dcdbas.c                          | 2 +-
>  drivers/platform/x86/dell/dell-smo8800.c                    | 2 +-
>  drivers/platform/x86/dell/dell-uart-backlight.c             | 2 +-
>  drivers/platform/x86/hp/hp-wmi.c                            | 2 +-
>  drivers/platform/x86/hp/hp_accel.c                          | 2 +-
>  drivers/platform/x86/hp/tc1100-wmi.c                        | 2 +-
>  drivers/platform/x86/huawei-wmi.c                           | 2 +-
>  drivers/platform/x86/ideapad-laptop.c                       | 2 +-
>  drivers/platform/x86/intel/bxtwc_tmu.c                      | 2 +-
>  drivers/platform/x86/intel/bytcrc_pwrsrc.c                  | 2 +-
>  drivers/platform/x86/intel/chtdc_ti_pwrbtn.c                | 2 +-
>  drivers/platform/x86/intel/chtwc_int33fe.c                  | 2 +-
>  drivers/platform/x86/intel/hid.c                            | 2 +-
>  drivers/platform/x86/intel/int0002_vgpio.c                  | 4 ++--
>  drivers/platform/x86/intel/int1092/intel_sar.c              | 2 +-
>  drivers/platform/x86/intel/int3472/discrete.c               | 2 +-
>  drivers/platform/x86/intel/mrfld_pwrbtn.c                   | 2 +-
>  drivers/platform/x86/intel/pmc/core.c                       | 2 +-
>  drivers/platform/x86/intel/telemetry/pltdrv.c               | 2 +-
>  drivers/platform/x86/intel/vbtn.c                           | 2 +-
>  .../platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c    | 2 +-
>  drivers/platform/x86/lenovo-yogabook.c                      | 2 +-
>  drivers/platform/x86/mlx-platform.c                         | 2 +-
>  drivers/platform/x86/samsung-q10.c                          | 2 +-
>  drivers/platform/x86/sel3350-platform.c                     | 2 +-
>  drivers/platform/x86/serial-multi-instantiate.c             | 2 +-
>  drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c  | 2 +-
>  drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c | 2 +-
>  drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c      | 2 +-
>  drivers/platform/x86/siemens/simatic-ipc-batt.c             | 2 +-
>  drivers/platform/x86/wmi.c                                  | 2 +-
>  drivers/platform/x86/x86-android-tablets/core.c             | 2 +-
>  drivers/platform/x86/xo1-rfkill.c                           | 2 +-
>  42 files changed, 46 insertions(+), 46 deletions(-)
>=20
> diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-=
wmi.c
> index 7169b84ccdb6..ba8accb2e47e 100644
> --- a/drivers/platform/x86/acer-wmi.c
> +++ b/drivers/platform/x86/acer-wmi.c
> @@ -2641,7 +2641,7 @@ static struct platform_driver acer_platform_driver =
=3D {
>  =09=09.pm =3D &acer_pm,
>  =09},
>  =09.probe =3D acer_platform_probe,
> -=09.remove_new =3D acer_platform_remove,
> +=09.remove =3D acer_platform_remove,
>  =09.shutdown =3D acer_platform_shutdown,
>  };
> =20
> diff --git a/drivers/platform/x86/adv_swbutton.c b/drivers/platform/x86/a=
dv_swbutton.c
> index 6b23ba78e028..6fa60f3fc53c 100644
> --- a/drivers/platform/x86/adv_swbutton.c
> +++ b/drivers/platform/x86/adv_swbutton.c
> @@ -110,7 +110,7 @@ static struct platform_driver adv_swbutton_driver =3D=
 {
>  =09=09.acpi_match_table =3D button_device_ids,
>  =09},
>  =09.probe =3D adv_swbutton_probe,
> -=09.remove_new =3D adv_swbutton_remove,
> +=09.remove =3D adv_swbutton_remove,
>  };
>  module_platform_driver(adv_swbutton_driver);
> =20
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/h=
smp.c
> index 8fcf38eed7f0..fe8948729bba 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -883,7 +883,7 @@ static void hsmp_pltdrv_remove(struct platform_device=
 *pdev)
> =20
>  static struct platform_driver amd_hsmp_driver =3D {
>  =09.probe=09=09=3D hsmp_pltdrv_probe,
> -=09.remove_new=09=3D hsmp_pltdrv_remove,
> +=09.remove=09=09=3D hsmp_pltdrv_remove,
>  =09.driver=09=09=3D {
>  =09=09.name=09=3D DRIVER_NAME,
>  =09=09.acpi_match_table =3D amd_hsmp_acpi_ids,
> diff --git a/drivers/platform/x86/amd/pmc/pmc.c b/drivers/platform/x86/am=
d/pmc/pmc.c
> index bbb8edb62e00..71abc6276e89 100644
> --- a/drivers/platform/x86/amd/pmc/pmc.c
> +++ b/drivers/platform/x86/amd/pmc/pmc.c
> @@ -1156,7 +1156,7 @@ static struct platform_driver amd_pmc_driver =3D {
>  =09=09.pm =3D pm_sleep_ptr(&amd_pmc_pm),
>  =09},
>  =09.probe =3D amd_pmc_probe,
> -=09.remove_new =3D amd_pmc_remove,
> +=09.remove =3D amd_pmc_remove,
>  };
>  module_platform_driver(amd_pmc_driver);
> =20
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/a=
md/pmf/core.c
> index d6af0ca036f1..47126abd13ca 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -496,7 +496,7 @@ static struct platform_driver amd_pmf_driver =3D {
>  =09=09.pm =3D pm_sleep_ptr(&amd_pmf_pm),
>  =09},
>  =09.probe =3D amd_pmf_probe,
> -=09.remove_new =3D amd_pmf_remove,
> +=09.remove =3D amd_pmf_remove,
>  };
>  module_platform_driver(amd_pmf_driver);
> =20
> diff --git a/drivers/platform/x86/amilo-rfkill.c b/drivers/platform/x86/a=
milo-rfkill.c
> index 2423dc91debb..18397c527eab 100644
> --- a/drivers/platform/x86/amilo-rfkill.c
> +++ b/drivers/platform/x86/amilo-rfkill.c
> @@ -132,10 +132,10 @@ static void amilo_rfkill_remove(struct platform_dev=
ice *device)
> =20
>  static struct platform_driver amilo_rfkill_driver =3D {
>  =09.driver =3D {
> -=09=09.name=09=3D KBUILD_MODNAME,
> +=09=09.name =3D KBUILD_MODNAME,
>  =09},
> -=09.probe=09=3D amilo_rfkill_probe,
> -=09.remove_new =3D amilo_rfkill_remove,
> +=09.probe =3D amilo_rfkill_probe,
> +=09.remove =3D amilo_rfkill_remove,
>  };
> =20
>  static int __init amilo_rfkill_init(void)
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-=
wmi.c
> index 7a48220b4f5a..2ccc23b259d3 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -5066,7 +5066,7 @@ int __init_or_module asus_wmi_register_driver(struc=
t asus_wmi_driver *driver)
>  =09=09return -EBUSY;
> =20
>  =09platform_driver =3D &driver->platform_driver;
> -=09platform_driver->remove_new =3D asus_wmi_remove;
> +=09platform_driver->remove =3D asus_wmi_remove;
>  =09platform_driver->driver.owner =3D driver->owner;
>  =09platform_driver->driver.name =3D driver->name;
>  =09platform_driver->driver.pm =3D &asus_pm_ops;
> diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86=
/barco-p50-gpio.c
> index af566f712057..143d14548565 100644
> --- a/drivers/platform/x86/barco-p50-gpio.c
> +++ b/drivers/platform/x86/barco-p50-gpio.c
> @@ -385,7 +385,7 @@ static struct platform_driver p50_gpio_driver =3D {
>  =09=09.name =3D DRIVER_NAME,
>  =09},
>  =09.probe =3D p50_gpio_probe,
> -=09.remove_new =3D p50_gpio_remove,
> +=09.remove =3D p50_gpio_remove,
>  };
> =20
>  /* Board setup */
> diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/=
compal-laptop.c
> index 5546fb189491..4e1d44670bd1 100644
> --- a/drivers/platform/x86/compal-laptop.c
> +++ b/drivers/platform/x86/compal-laptop.c
> @@ -1023,8 +1023,8 @@ static struct platform_driver compal_driver =3D {
>  =09.driver =3D {
>  =09=09.name =3D DRIVER_NAME,
>  =09},
> -=09.probe=09=3D compal_probe,
> -=09.remove_new =3D compal_remove,
> +=09.probe =3D compal_probe,
> +=09.remove =3D compal_remove,
>  };
> =20
>  static int __init compal_init(void)
> diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/de=
ll/dcdbas.c
> index a60e35056387..c7dcb5d2dc77 100644
> --- a/drivers/platform/x86/dell/dcdbas.c
> +++ b/drivers/platform/x86/dell/dcdbas.c
> @@ -709,7 +709,7 @@ static struct platform_driver dcdbas_driver =3D {
>  =09=09.name=09=3D DRIVER_NAME,
>  =09},
>  =09.probe=09=09=3D dcdbas_probe,
> -=09.remove_new=09=3D dcdbas_remove,
> +=09.remove=09=09=3D dcdbas_remove,
>  };
> =20
>  static const struct platform_device_info dcdbas_dev_info __initconst =3D=
 {
> diff --git a/drivers/platform/x86/dell/dell-smo8800.c b/drivers/platform/=
x86/dell/dell-smo8800.c
> index f7ec17c56833..87fe03f23f24 100644
> --- a/drivers/platform/x86/dell/dell-smo8800.c
> +++ b/drivers/platform/x86/dell/dell-smo8800.c
> @@ -179,7 +179,7 @@ MODULE_DEVICE_TABLE(acpi, smo8800_ids);
> =20
>  static struct platform_driver smo8800_driver =3D {
>  =09.probe =3D smo8800_probe,
> -=09.remove_new =3D smo8800_remove,
> +=09.remove =3D smo8800_remove,
>  =09.driver =3D {
>  =09=09.name =3D DRIVER_NAME,
>  =09=09.acpi_match_table =3D smo8800_ids,
> diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/pl=
atform/x86/dell/dell-uart-backlight.c
> index 3995f90add45..6e5dc7e3674f 100644
> --- a/drivers/platform/x86/dell/dell-uart-backlight.c
> +++ b/drivers/platform/x86/dell/dell-uart-backlight.c
> @@ -393,7 +393,7 @@ static void dell_uart_bl_pdev_remove(struct platform_=
device *pdev)
> =20
>  static struct platform_driver dell_uart_bl_pdev_driver =3D {
>  =09.probe =3D dell_uart_bl_pdev_probe,
> -=09.remove_new =3D dell_uart_bl_pdev_remove,
> +=09.remove =3D dell_uart_bl_pdev_remove,
>  =09.driver =3D {
>  =09=09.name =3D "dell-uart-backlight",
>  =09},
> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/h=
p-wmi.c
> index 8c05e0dd2a21..81ccc96ffe40 100644
> --- a/drivers/platform/x86/hp/hp-wmi.c
> +++ b/drivers/platform/x86/hp/hp-wmi.c
> @@ -1748,7 +1748,7 @@ static struct platform_driver hp_wmi_driver __refda=
ta =3D {
>  =09=09.pm =3D &hp_wmi_pm_ops,
>  =09=09.dev_groups =3D hp_wmi_groups,
>  =09},
> -=09.remove_new =3D __exit_p(hp_wmi_bios_remove),
> +=09.remove =3D __exit_p(hp_wmi_bios_remove),
>  };
> =20
>  static umode_t hp_wmi_hwmon_is_visible(const void *data,
> diff --git a/drivers/platform/x86/hp/hp_accel.c b/drivers/platform/x86/hp=
/hp_accel.c
> index 52535576772a..39a6530f5072 100644
> --- a/drivers/platform/x86/hp/hp_accel.c
> +++ b/drivers/platform/x86/hp/hp_accel.c
> @@ -372,7 +372,7 @@ static SIMPLE_DEV_PM_OPS(hp_accel_pm, lis3lv02d_suspe=
nd, lis3lv02d_resume);
>  /* For the HP MDPS aka 3D Driveguard */
>  static struct platform_driver lis3lv02d_driver =3D {
>  =09.probe=09=3D lis3lv02d_probe,
> -=09.remove_new =3D lis3lv02d_remove,
> +=09.remove=09=3D lis3lv02d_remove,
>  =09.driver=09=3D {
>  =09=09.name=09=3D "hp_accel",
>  =09=09.pm=09=3D &hp_accel_pm,
> diff --git a/drivers/platform/x86/hp/tc1100-wmi.c b/drivers/platform/x86/=
hp/tc1100-wmi.c
> index 5298b0f6804f..146716d81442 100644
> --- a/drivers/platform/x86/hp/tc1100-wmi.c
> +++ b/drivers/platform/x86/hp/tc1100-wmi.c
> @@ -221,7 +221,7 @@ static struct platform_driver tc1100_driver =3D {
>  =09=09.pm =3D &tc1100_pm_ops,
>  #endif
>  =09},
> -=09.remove_new =3D tc1100_remove,
> +=09.remove =3D tc1100_remove,
>  };
> =20
>  static int __init tc1100_init(void)
> diff --git a/drivers/platform/x86/huawei-wmi.c b/drivers/platform/x86/hua=
wei-wmi.c
> index d81fd5df4a00..c3772df34679 100644
> --- a/drivers/platform/x86/huawei-wmi.c
> +++ b/drivers/platform/x86/huawei-wmi.c
> @@ -842,7 +842,7 @@ static struct platform_driver huawei_wmi_driver =3D {
>  =09=09.name =3D "huawei-wmi",
>  =09},
>  =09.probe =3D huawei_wmi_probe,
> -=09.remove_new =3D huawei_wmi_remove,
> +=09.remove =3D huawei_wmi_remove,
>  };
> =20
>  static __init int huawei_wmi_init(void)
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86=
/ideapad-laptop.c
> index c64dfc56651d..9d8c3f064050 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -2306,7 +2306,7 @@ MODULE_DEVICE_TABLE(acpi, ideapad_device_ids);
> =20
>  static struct platform_driver ideapad_acpi_driver =3D {
>  =09.probe =3D ideapad_acpi_add,
> -=09.remove_new =3D ideapad_acpi_remove,
> +=09.remove =3D ideapad_acpi_remove,
>  =09.driver =3D {
>  =09=09.name   =3D "ideapad_acpi",
>  =09=09.pm     =3D &ideapad_pm,
> diff --git a/drivers/platform/x86/intel/bxtwc_tmu.c b/drivers/platform/x8=
6/intel/bxtwc_tmu.c
> index 9ac801b929b9..99437b2ccc25 100644
> --- a/drivers/platform/x86/intel/bxtwc_tmu.c
> +++ b/drivers/platform/x86/intel/bxtwc_tmu.c
> @@ -121,7 +121,7 @@ MODULE_DEVICE_TABLE(platform, bxt_wcove_tmu_id_table)=
;
> =20
>  static struct platform_driver bxt_wcove_tmu_driver =3D {
>  =09.probe =3D bxt_wcove_tmu_probe,
> -=09.remove_new =3D bxt_wcove_tmu_remove,
> +=09.remove =3D bxt_wcove_tmu_remove,
>  =09.driver =3D {
>  =09=09.name =3D "bxt_wcove_tmu",
>  =09=09.pm     =3D &bxtwc_tmu_pm_ops,
> diff --git a/drivers/platform/x86/intel/bytcrc_pwrsrc.c b/drivers/platfor=
m/x86/intel/bytcrc_pwrsrc.c
> index 418b71af27ff..3edc2a9dab38 100644
> --- a/drivers/platform/x86/intel/bytcrc_pwrsrc.c
> +++ b/drivers/platform/x86/intel/bytcrc_pwrsrc.c
> @@ -167,7 +167,7 @@ static void crc_pwrsrc_remove(struct platform_device =
*pdev)
> =20
>  static struct platform_driver crc_pwrsrc_driver =3D {
>  =09.probe =3D crc_pwrsrc_probe,
> -=09.remove_new =3D crc_pwrsrc_remove,
> +=09.remove =3D crc_pwrsrc_remove,
>  =09.driver =3D {
>  =09=09.name =3D "crystal_cove_pwrsrc",
>  =09},
> diff --git a/drivers/platform/x86/intel/chtdc_ti_pwrbtn.c b/drivers/platf=
orm/x86/intel/chtdc_ti_pwrbtn.c
> index 615f8d1a0c68..53f01e198047 100644
> --- a/drivers/platform/x86/intel/chtdc_ti_pwrbtn.c
> +++ b/drivers/platform/x86/intel/chtdc_ti_pwrbtn.c
> @@ -84,7 +84,7 @@ static struct platform_driver chtdc_ti_pwrbtn_driver =
=3D {
>  =09=09.name=09=3D KBUILD_MODNAME,
>  =09},
>  =09.probe=09=09=3D chtdc_ti_pwrbtn_probe,
> -=09.remove_new=09=3D chtdc_ti_pwrbtn_remove,
> +=09.remove=09=09=3D chtdc_ti_pwrbtn_remove,
>  =09.id_table=09=3D chtdc_ti_pwrbtn_id_table,
>  };
>  module_platform_driver(chtdc_ti_pwrbtn_driver);
> diff --git a/drivers/platform/x86/intel/chtwc_int33fe.c b/drivers/platfor=
m/x86/intel/chtwc_int33fe.c
> index 11503b1c85f3..29e8b5432f4c 100644
> --- a/drivers/platform/x86/intel/chtwc_int33fe.c
> +++ b/drivers/platform/x86/intel/chtwc_int33fe.c
> @@ -427,7 +427,7 @@ static struct platform_driver cht_int33fe_typec_drive=
r =3D {
>  =09=09.acpi_match_table =3D ACPI_PTR(cht_int33fe_acpi_ids),
>  =09},
>  =09.probe =3D cht_int33fe_typec_probe,
> -=09.remove_new =3D cht_int33fe_typec_remove,
> +=09.remove =3D cht_int33fe_typec_remove,
>  };
> =20
>  module_platform_driver(cht_int33fe_typec_driver);
> diff --git a/drivers/platform/x86/intel/hid.c b/drivers/platform/x86/inte=
l/hid.c
> index 445e7a59beb4..97174834dc31 100644
> --- a/drivers/platform/x86/intel/hid.c
> +++ b/drivers/platform/x86/intel/hid.c
> @@ -747,7 +747,7 @@ static struct platform_driver intel_hid_pl_driver =3D=
 {
>  =09=09.pm =3D &intel_hid_pl_pm_ops,
>  =09},
>  =09.probe =3D intel_hid_probe,
> -=09.remove_new =3D intel_hid_remove,
> +=09.remove =3D intel_hid_remove,
>  };
> =20
>  /*
> diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platfor=
m/x86/intel/int0002_vgpio.c
> index 527d8fbc7cc1..0cc80603a8a9 100644
> --- a/drivers/platform/x86/intel/int0002_vgpio.c
> +++ b/drivers/platform/x86/intel/int0002_vgpio.c
> @@ -266,13 +266,13 @@ static const struct acpi_device_id int0002_acpi_ids=
[] =3D {
>  MODULE_DEVICE_TABLE(acpi, int0002_acpi_ids);
> =20
>  static struct platform_driver int0002_driver =3D {
> -=09.driver =3D {
> +=09.driver=09=3D {
>  =09=09.name=09=09=09=3D DRV_NAME,
>  =09=09.acpi_match_table=09=3D int0002_acpi_ids,
>  =09=09.pm=09=09=09=3D &int0002_pm_ops,
>  =09},
>  =09.probe=09=3D int0002_probe,
> -=09.remove_new =3D int0002_remove,
> +=09.remove=09=3D int0002_remove,
>  };
> =20
>  module_platform_driver(int0002_driver);
> diff --git a/drivers/platform/x86/intel/int1092/intel_sar.c b/drivers/pla=
tform/x86/intel/int1092/intel_sar.c
> index 6246c066ade2..e526841aff60 100644
> --- a/drivers/platform/x86/intel/int1092/intel_sar.c
> +++ b/drivers/platform/x86/intel/int1092/intel_sar.c
> @@ -308,7 +308,7 @@ static void sar_remove(struct platform_device *device=
)
> =20
>  static struct platform_driver sar_driver =3D {
>  =09.probe =3D sar_probe,
> -=09.remove_new =3D sar_remove,
> +=09.remove =3D sar_remove,
>  =09.driver =3D {
>  =09=09.name =3D DRVNAME,
>  =09=09.acpi_match_table =3D ACPI_PTR(sar_device_ids)
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/plat=
form/x86/intel/int3472/discrete.c
> index 3de463c3d13b..d881b2cfcdfc 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -392,7 +392,7 @@ static struct platform_driver int3472_discrete =3D {
>  =09=09.acpi_match_table =3D int3472_device_id,
>  =09},
>  =09.probe =3D skl_int3472_discrete_probe,
> -=09.remove_new =3D skl_int3472_discrete_remove,
> +=09.remove =3D skl_int3472_discrete_remove,
>  };
>  module_platform_driver(int3472_discrete);
> =20
> diff --git a/drivers/platform/x86/intel/mrfld_pwrbtn.c b/drivers/platform=
/x86/intel/mrfld_pwrbtn.c
> index 549a3f586f3b..6c43f801c467 100644
> --- a/drivers/platform/x86/intel/mrfld_pwrbtn.c
> +++ b/drivers/platform/x86/intel/mrfld_pwrbtn.c
> @@ -97,7 +97,7 @@ static struct platform_driver mrfld_pwrbtn_driver =3D {
>  =09=09.name=09=3D "mrfld_bcove_pwrbtn",
>  =09},
>  =09.probe=09=09=3D mrfld_pwrbtn_probe,
> -=09.remove_new=09=3D mrfld_pwrbtn_remove,
> +=09.remove=09=09=3D mrfld_pwrbtn_remove,
>  =09.id_table=09=3D mrfld_pwrbtn_id_table,
>  };
>  module_platform_driver(mrfld_pwrbtn_driver);
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86=
/intel/pmc/core.c
> index 0431a599ba26..4e20fd37226e 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1724,7 +1724,7 @@ static struct platform_driver pmc_core_driver =3D {
>  =09=09.dev_groups =3D pmc_dev_groups,
>  =09},
>  =09.probe =3D pmc_core_probe,
> -=09.remove_new =3D pmc_core_remove,
> +=09.remove =3D pmc_core_remove,
>  };
> =20
>  module_platform_driver(pmc_core_driver);
> diff --git a/drivers/platform/x86/intel/telemetry/pltdrv.c b/drivers/plat=
form/x86/intel/telemetry/pltdrv.c
> index 767a0bc6c7ad..9a499efa1e4d 100644
> --- a/drivers/platform/x86/intel/telemetry/pltdrv.c
> +++ b/drivers/platform/x86/intel/telemetry/pltdrv.c
> @@ -1163,7 +1163,7 @@ static void telemetry_pltdrv_remove(struct platform=
_device *pdev)
> =20
>  static struct platform_driver telemetry_soc_driver =3D {
>  =09.probe=09=09=3D telemetry_pltdrv_probe,
> -=09.remove_new=09=3D telemetry_pltdrv_remove,
> +=09.remove=09=09=3D telemetry_pltdrv_remove,
>  =09.driver=09=09=3D {
>  =09=09.name=09=3D DRIVER_NAME,
>  =09},
> diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/int=
el/vbtn.c
> index a353e830b65f..232cd12e3c9f 100644
> --- a/drivers/platform/x86/intel/vbtn.c
> +++ b/drivers/platform/x86/intel/vbtn.c
> @@ -387,7 +387,7 @@ static struct platform_driver intel_vbtn_pl_driver =
=3D {
>  =09=09.pm =3D &intel_vbtn_pm_ops,
>  =09},
>  =09.probe =3D intel_vbtn_probe,
> -=09.remove_new =3D intel_vbtn_remove,
> +=09.remove =3D intel_vbtn_remove,
>  };
> =20
>  static acpi_status __init
> diff --git a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c=
 b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> index d525bdc8ca9b..d2699ca24f34 100644
> --- a/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> +++ b/drivers/platform/x86/lenovo-yoga-tab2-pro-1380-fastcharger.c
> @@ -298,7 +298,7 @@ static void yt2_1380_fc_pdev_remove(struct platform_d=
evice *pdev)
> =20
>  static struct platform_driver yt2_1380_fc_pdev_driver =3D {
>  =09.probe =3D yt2_1380_fc_pdev_probe,
> -=09.remove_new =3D yt2_1380_fc_pdev_remove,
> +=09.remove =3D yt2_1380_fc_pdev_remove,
>  =09.driver =3D {
>  =09=09.name =3D YT2_1380_FC_PDEV_NAME,
>  =09=09.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> diff --git a/drivers/platform/x86/lenovo-yogabook.c b/drivers/platform/x8=
6/lenovo-yogabook.c
> index fd62bf746ebd..31b298dc5046 100644
> --- a/drivers/platform/x86/lenovo-yogabook.c
> +++ b/drivers/platform/x86/lenovo-yogabook.c
> @@ -536,7 +536,7 @@ static void yogabook_pdev_remove(struct platform_devi=
ce *pdev)
> =20
>  static struct platform_driver yogabook_pdev_driver =3D {
>  =09.probe =3D yogabook_pdev_probe,
> -=09.remove_new =3D yogabook_pdev_remove,
> +=09.remove =3D yogabook_pdev_remove,
>  =09.driver =3D {
>  =09=09.name =3D YB_PDEV_NAME,
>  =09=09.pm =3D pm_sleep_ptr(&yogabook_pm_ops),
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/m=
lx-platform.c
> index 9d70146fd742..671021cd1f59 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -6633,7 +6633,7 @@ static struct platform_driver mlxplat_driver =3D {
>  =09=09.probe_type =3D PROBE_FORCE_SYNCHRONOUS,
>  =09},
>  =09.probe=09=09=3D mlxplat_probe,
> -=09.remove_new=09=3D mlxplat_remove,
> +=09.remove=09=09=3D mlxplat_remove,
>  };
> =20
>  static int __init mlxplat_init(void)
> diff --git a/drivers/platform/x86/samsung-q10.c b/drivers/platform/x86/sa=
msung-q10.c
> index 134e2c3d91ca..8160d45f8a23 100644
> --- a/drivers/platform/x86/samsung-q10.c
> +++ b/drivers/platform/x86/samsung-q10.c
> @@ -78,7 +78,7 @@ static struct platform_driver samsungq10_driver =3D {
>  =09=09.name=09=3D KBUILD_MODNAME,
>  =09},
>  =09.probe=09=09=3D samsungq10_probe,
> -=09.remove_new=09=3D samsungq10_remove,
> +=09.remove=09=09=3D samsungq10_remove,
>  };
> =20
>  static struct platform_device *samsungq10_device;
> diff --git a/drivers/platform/x86/sel3350-platform.c b/drivers/platform/x=
86/sel3350-platform.c
> index d09e976e7148..02e2081e2333 100644
> --- a/drivers/platform/x86/sel3350-platform.c
> +++ b/drivers/platform/x86/sel3350-platform.c
> @@ -235,7 +235,7 @@ MODULE_DEVICE_TABLE(acpi, sel3350_device_ids);
> =20
>  static struct platform_driver sel3350_platform_driver =3D {
>  =09.probe =3D sel3350_probe,
> -=09.remove_new =3D sel3350_remove,
> +=09.remove =3D sel3350_remove,
>  =09.driver =3D {
>  =09=09.name =3D "sel3350-platform",
>  =09=09.acpi_match_table =3D sel3350_device_ids,
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/pl=
atform/x86/serial-multi-instantiate.c
> index 7c04cc9e5891..ed6b28505cd6 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -409,7 +409,7 @@ static struct platform_driver smi_driver =3D {
>  =09=09.acpi_match_table =3D smi_acpi_ids,
>  =09},
>  =09.probe =3D smi_probe,
> -=09.remove_new =3D smi_remove,
> +=09.remove =3D smi_remove,
>  };
>  module_platform_driver(smi_driver);
> =20
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c b=
/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
> index 5edc294de6e4..6ff6f3de492b 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt-apollolake.c
> @@ -37,7 +37,7 @@ static int simatic_ipc_batt_apollolake_probe(struct pla=
tform_device *pdev)
> =20
>  static struct platform_driver simatic_ipc_batt_driver =3D {
>  =09.probe =3D simatic_ipc_batt_apollolake_probe,
> -=09.remove_new =3D simatic_ipc_batt_apollolake_remove,
> +=09.remove =3D simatic_ipc_batt_apollolake_remove,
>  =09.driver =3D {
>  =09=09.name =3D KBUILD_MODNAME,
>  =09},
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c =
b/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
> index e6a56d14b505..83f532498c8c 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt-elkhartlake.c
> @@ -37,7 +37,7 @@ static int simatic_ipc_batt_elkhartlake_probe(struct pl=
atform_device *pdev)
> =20
>  static struct platform_driver simatic_ipc_batt_driver =3D {
>  =09.probe =3D simatic_ipc_batt_elkhartlake_probe,
> -=09.remove_new =3D simatic_ipc_batt_elkhartlake_remove,
> +=09.remove =3D simatic_ipc_batt_elkhartlake_remove,
>  =09.driver =3D {
>  =09=09.name =3D KBUILD_MODNAME,
>  =09},
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c b/dri=
vers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
> index f8849d0e48a8..c6a79338f1d0 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt-f7188x.c
> @@ -73,7 +73,7 @@ static int simatic_ipc_batt_f7188x_probe(struct platfor=
m_device *pdev)
> =20
>  static struct platform_driver simatic_ipc_batt_driver =3D {
>  =09.probe =3D simatic_ipc_batt_f7188x_probe,
> -=09.remove_new =3D simatic_ipc_batt_f7188x_remove,
> +=09.remove =3D simatic_ipc_batt_f7188x_remove,
>  =09.driver =3D {
>  =09=09.name =3D KBUILD_MODNAME,
>  =09},
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt.c b/drivers/pl=
atform/x86/siemens/simatic-ipc-batt.c
> index d9aff10608cf..7cfe991cba00 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt.c
> @@ -239,7 +239,7 @@ static int simatic_ipc_batt_io_probe(struct platform_=
device *pdev)
> =20
>  static struct platform_driver simatic_ipc_batt_driver =3D {
>  =09.probe =3D simatic_ipc_batt_io_probe,
> -=09.remove_new =3D simatic_ipc_batt_io_remove,
> +=09.remove =3D simatic_ipc_batt_io_remove,
>  =09.driver =3D {
>  =09=09.name =3D KBUILD_MODNAME,
>  =09},
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index a01223c23d10..2d6885c67ac0 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1328,7 +1328,7 @@ static struct platform_driver acpi_wmi_driver =3D {
>  =09=09.acpi_match_table =3D wmi_device_ids,
>  =09},
>  =09.probe =3D acpi_wmi_probe,
> -=09.remove_new =3D acpi_wmi_remove,
> +=09.remove =3D acpi_wmi_remove,
>  };
> =20
>  static int __init acpi_wmi_init(void)
> diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/pl=
atform/x86/x86-android-tablets/core.c
> index ef572b90e06b..1e93112972da 100644
> --- a/drivers/platform/x86/x86-android-tablets/core.c
> +++ b/drivers/platform/x86/x86-android-tablets/core.c
> @@ -458,7 +458,7 @@ static struct platform_driver x86_android_tablet_driv=
er =3D {
>  =09.driver =3D {
>  =09=09.name =3D KBUILD_MODNAME,
>  =09},
> -=09.remove_new =3D x86_android_tablet_remove,
> +=09.remove =3D x86_android_tablet_remove,
>  };
> =20
>  static int __init x86_android_tablet_init(void)
> diff --git a/drivers/platform/x86/xo1-rfkill.c b/drivers/platform/x86/xo1=
-rfkill.c
> index 5fe68296501c..5fedb99b9d94 100644
> --- a/drivers/platform/x86/xo1-rfkill.c
> +++ b/drivers/platform/x86/xo1-rfkill.c
> @@ -68,7 +68,7 @@ static struct platform_driver xo1_rfkill_driver =3D {
>  =09=09.name =3D "xo1-rfkill",
>  =09},
>  =09.probe=09=09=3D xo1_rfkill_probe,
> -=09.remove_new=09=3D xo1_rfkill_remove,
> +=09.remove=09=09=3D xo1_rfkill_remove,
>  };
> =20
>  module_platform_driver(xo1_rfkill_driver);
>=20
> base-commit: 15e7d45e786a62a211dd0098fee7c57f84f8c681
>=20
--8323328-2130711391-1729158764=:929--
