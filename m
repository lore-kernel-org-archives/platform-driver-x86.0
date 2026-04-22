Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ECD35F612;
	Wed, 22 Apr 2026 09:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776850486; cv=none; b=pgMBgFublpJ3iAioSIAb5kHxvh/SvpA5JjD8hTp/B+5J+t072V0dlRl6+DDEJVpCn1tM1szitX4H2zBFns0mGUjiYPdAIauBNeIxtDUsarKamy0IF1U0jcmN3sxIGlgJShjfxeIJZ8+am41l1p9zhKHcxYXI5/FcnoTREik+dZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776850486; c=relaxed/simple;
	bh=TIDb+C7OrFo0hh6hGHpJ0zwZDRy+CBZBnCXEiPudzkk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=DJ5ygn/CCcC1BVYsK2BSa8cD+vOtIrWhdIMO+DDaq1Fm3EYz8LmUf0IBi7MckMF0cDvHk1r5kBZLY01jJg9/QSvNyA/sSMBjDEPnxN0Azz+PrmJm5mzmswKur1iedvV7b1A2WzgaiKeFiLE2WXPB6R8ORWgBJ64HGOAT+BZujGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7rRqm0e; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7rRqm0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776850485; x=1808386485;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TIDb+C7OrFo0hh6hGHpJ0zwZDRy+CBZBnCXEiPudzkk=;
  b=P7rRqm0eLqlKR4UtsyWDKOSpjFXCXFsfYm27nRvArVCUSiELZwMJopH4
   f+GlqFajTuRxS/ynih+gLQRrrhJTFcyYvNJm9DzMHrDR9i0dXD7NcdYuD
   h/4a33kzchxfl/hYH9oULM5SbNXnWf5uREwhlhm+AI8N3sCLPS9hm4lJw
   TVnj0Rp/6KeJ1YvDcJRWd3BBmE83c2wDpSZVAzMQIMKdEB5q022bUzsNd
   +rwHCfJxU+AHHBHm9Mnbtv7nHpqnUM191wj3XasXrP1iKm02FQOundxef
   IBVigKNPQI+BEY7PfYloj5MN7YisBfZO7cbZaehAPVAk3m7Ec9EWM9Zro
   w==;
X-CSE-ConnectionGUID: yJgHcwmJQBm9OhMZ12EKmQ==
X-CSE-MsgGUID: RRxOOkR8QPSfO4dYvd+rlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="80386705"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="80386705"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 02:34:44 -0700
X-CSE-ConnectionGUID: f2OgdvkiRwmMvwQRbVlFUw==
X-CSE-MsgGUID: Wh9LdTSvSw2ljO5eNxei5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="229134242"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.4])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 02:34:42 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 22 Apr 2026 12:34:38 +0300 (EEST)
To: Werner Sembach <wse@tuxedocomputers.com>
cc: W_Armin@gmx.de, Hans de Goede <hansg@kernel.org>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 2/3] platform/x86: uniwill-laptop: Implement lightbar
 for XMG Fusion (L19)
In-Reply-To: <20260421201103.142403-3-wse@tuxedocomputers.com>
Message-ID: <248ca98a-6631-b0d1-0ecb-7a00dd3991b4@linux.intel.com>
References: <20260421201103.142403-1-wse@tuxedocomputers.com> <20260421201103.142403-3-wse@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1812197-1776850478=:1863"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1812197-1776850478=:1863
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 21 Apr 2026, Werner Sembach wrote:

> The XMG Fusion (L19) also has a lightbar but with a different max
> brightness value of 36 instead of 200.
>=20
> This patch adds a new feature flag for the driver to correctly handle thi=
s
> case and applies it to the mentioned device.
>=20
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>  drivers/platform/x86/uniwill/uniwill-acpi.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platfo=
rm/x86/uniwill/uniwill-acpi.c
> index 7d1fdbacc6871..62d56cc67e2e8 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -318,7 +318,6 @@
>  #define FAN_TABLE_LENGTH=0916
> =20
>  #define LED_CHANNELS=09=093
> -#define LED_MAX_BRIGHTNESS=09200
> =20
>  #define UNIWILL_FEATURE_FN_LOCK=09=09=09BIT(0)
>  #define UNIWILL_FEATURE_SUPER_KEY=09=09BIT(1)
> @@ -344,6 +343,7 @@ struct uniwill_data {
>  =09acpi_handle handle;
>  =09struct regmap *regmap;
>  =09unsigned int features;
> +=09u8 lightbar_max_brightness;
>  =09struct acpi_battery_hook hook;
>  =09struct mutex battery_lock;=09/* Protects the list of currently regist=
ered batteries */
>  =09union {
> @@ -376,6 +376,7 @@ struct uniwill_battery_entry {
> =20
>  struct uniwill_device_descriptor {
>  =09unsigned int features;
> +=09u8 lightbar_max_brightness;
>  =09/* Executed during driver probing */
>  =09int (*probe)(struct uniwill_data *data);
>  };
> @@ -1340,7 +1341,7 @@ static int uniwill_led_brightness_set(struct led_cl=
assdev *led_cdev, enum led_br
> =20
>  =09for (int i =3D 0; i < LED_CHANNELS; i++) {
>  =09=09/* Prevent the brightness values from overflowing */
> -=09=09value =3D min(LED_MAX_BRIGHTNESS, data->led_mc_subled_info[i].brig=
htness);
> +=09=09value =3D min(data->lightbar_max_brightness, data->led_mc_subled_i=
nfo[i].brightness);
>  =09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i=
], value);
>  =09=09if (ret < 0)
>  =09=09=09return ret;
> @@ -1376,12 +1377,14 @@ static int uniwill_led_init(struct uniwill_data *=
data)
>  =09=09LED_COLOR_ID_GREEN,
>  =09=09LED_COLOR_ID_BLUE,
>  =09};
> -=09unsigned int value;
> +=09unsigned int value, max_brightness;
>  =09int ret;
> =20
>  =09if (!uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR))
>  =09=09return 0;
> =20
> +=09max_brightness =3D data->lightbar_max_brightness;
> +
>  =09ret =3D devm_mutex_init(data->dev, &data->led_lock);
>  =09if (ret < 0)
>  =09=09return ret;
> @@ -1409,14 +1412,14 @@ static int uniwill_led_init(struct uniwill_data *=
data)
>  =09=09return ret;
> =20
>  =09data->led_mc_cdev.led_cdev.color =3D LED_COLOR_ID_MULTI;
> -=09data->led_mc_cdev.led_cdev.max_brightness =3D LED_MAX_BRIGHTNESS;
> +=09data->led_mc_cdev.led_cdev.max_brightness =3D max_brightness;
>  =09data->led_mc_cdev.led_cdev.flags =3D LED_REJECT_NAME_CONFLICT;
>  =09data->led_mc_cdev.led_cdev.brightness_set_blocking =3D uniwill_led_br=
ightness_set;
> =20
>  =09if (value & LIGHTBAR_S0_OFF)
>  =09=09data->led_mc_cdev.led_cdev.brightness =3D 0;
>  =09else
> -=09=09data->led_mc_cdev.led_cdev.brightness =3D LED_MAX_BRIGHTNESS;
> +=09=09data->led_mc_cdev.led_cdev.brightness =3D max_brightness;
> =20
>  =09for (int i =3D 0; i < LED_CHANNELS; i++) {
>  =09=09data->led_mc_subled_info[i].color_index =3D color_indices[i];
> @@ -1429,7 +1432,7 @@ static int uniwill_led_init(struct uniwill_data *da=
ta)
>  =09=09 * Make sure that the initial intensity value is not greater than
>  =09=09 * the maximum brightness.
>  =09=09 */
> -=09=09value =3D min(LED_MAX_BRIGHTNESS, value);
> +=09=09value =3D min(max_brightness, value);
>  =09=09ret =3D regmap_write(data->regmap, uniwill_led_channel_to_ac_reg[i=
], value);
>  =09=09if (ret < 0)
>  =09=09=09return ret;
> @@ -1882,6 +1885,7 @@ static int uniwill_probe(struct platform_device *pd=
ev)
>  =09=09return ret;
> =20
>  =09data->features =3D device_descriptor.features;
> +=09data->lightbar_max_brightness =3D device_descriptor.lightbar_max_brig=
htness;
> =20
>  =09/*
>  =09 * Some devices might need to perform some device-specific initializa=
tion steps
> @@ -2130,11 +2134,13 @@ static struct platform_driver uniwill_driver =3D =
{
> =20
>  static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __i=
nitdata =3D {
>  =09.features =3D UNIWILL_FEATURE_SUPER_KEY |
> +=09=09    UNIWILL_FEATURE_LIGHTBAR |
>  =09=09    UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
>  =09=09    UNIWILL_FEATURE_CPU_TEMP |
>  =09=09    UNIWILL_FEATURE_GPU_TEMP |
>  =09=09    UNIWILL_FEATURE_PRIMARY_FAN |
>  =09=09    UNIWILL_FEATURE_SECONDARY_FAN,
> +=09.lightbar_max_brightness =3D 36,
>  };
> =20
>  static struct uniwill_device_descriptor lapac71h_descriptor __initdata =
=3D {
> @@ -2158,6 +2164,7 @@ static struct uniwill_device_descriptor lapkc71f_de=
scriptor __initdata =3D {
>  =09=09    UNIWILL_FEATURE_GPU_TEMP |
>  =09=09    UNIWILL_FEATURE_PRIMARY_FAN |
>  =09=09    UNIWILL_FEATURE_SECONDARY_FAN,
> +=09.lightbar_max_brightness =3D 200,
>  };
> =20
>  /*
>=20

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

--=20
 i.

--8323328-1812197-1776850478=:1863--
