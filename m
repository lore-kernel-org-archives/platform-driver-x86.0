Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2667F4EE872;
	Wed, 14 Oct 2026 10:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791973162; cv=none; b=OzrInxH5UC3OcwMkX9RzpvFm6unNOYSBjFcQsJiPQnLdX0pSniIzTs0w38SKuZ1qgog+T9jMHWrETwCkvlPKzKDji6+UcVa4xLrgZstvcyYhKXdSr2HCAaQr1mdCrh/A4BnYcuKmM1czF8bWBLXAs7jMWjtUyxXfWwZaDtNXvxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791973162; c=relaxed/simple;
	bh=sO4OVMN/vSAEerk+8FGEdY9qKfrIkn6N6rblEaJnZR4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=p79ZhcJ/enWYnLmRaWxf4coaF2jT2hZdwFnR5IkmqG22WWDmSC7CTF571m5LEC/mfJ/UIIO0ZnED16sKcwkk1j5Xuw8VsIUZwp/qR33BlYV/EIjgLO5m5lw1b5tmfiyvejP3N9OTlJiDtNEle1YY1e1yNStUOmkH0HVCsdIMXk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VYrlXImD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VYrlXImD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791973159; x=1823509159;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=sO4OVMN/vSAEerk+8FGEdY9qKfrIkn6N6rblEaJnZR4=;
  b=VYrlXImDOLIO/7QRefZSXbbtG69tQUmmfO5YyT9UreRycO8jpWmI+8rm
   4/gEjYcQSvpY28UNiA6vh1thNeSPBu+Pxymf1e+ps88jwAaj/kWwLxJrk
   caNQhuwcMBeilF3Ao2ZncDySBYXsuREvlV9YVbvvqq0Rp6Sg+ltsEbI3+
   ufcTMOHO/nFMRak4vXQ9MpzGM8h0Rwf6Mpvi+ZqAJFDg8sJhB4uarcwaW
   zet9h0q4ORoyOD8G/jc+gQchfjhHOekP1Hp7hmtQKCPw57m2Omr1ME8Nn
   zS2kObPLUeCO6M7d5xm/kycrYeFfqZA9rtJfwC3hYg8pmsEBHHi2qYY33
   w==;
X-CSE-ConnectionGUID: DqjofrRbSlqYkDhiXvytdg==
X-CSE-MsgGUID: v7NeAmZ2Re+baCmh2UqHAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="722901"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="722901"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 03:19:18 -0700
X-CSE-ConnectionGUID: n3i/xexmTxmQaTw9IMMkXA==
X-CSE-MsgGUID: hhV1+KZjQOOSuBd3MkMJPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1724530"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 03:19:14 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Oct 2026 13:19:07 +0300 (EEST)
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
    Hans de Goede <hansg@kernel.org>, 
    "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Kurt Borja <kuurtb@gmail.com>
cc: sre@kernel.org, bryan.odonoghue@linaro.org, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
    stephan.gerhold@linaro.org
Subject: Re: [RFC PATCH] platform/arm64: lenovo-thinkpad-t14s: Adjust thermal
 trip with platform profile
In-Reply-To: <20261001181917.9367-1-daniel.lezcano@oss.qualcomm.com>
Message-ID: <1eb6d74f-28c7-8f0a-4001-dfe717196836@linux.intel.com>
References: <20261001181917.9367-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1170719270-1791973147=:1157"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1170719270-1791973147=:1157
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

+ more people.

On Thu, 1 Oct 2026, Daniel Lezcano wrote:

> Tie the keyboard thermal mitigation temperature to the platform profile
> selected through the ThinkPad embedded controller.
>=20
> The EC reports Fn+L, Fn+M and Fn+H events corresponding to low-power,
> balanced and performance operating modes. Use these events to update the
> passive trip point of the "keyboard-thermal" zone to 49.85=C2=B0C, 57.85=
=C2=B0C
> and 59.85=C2=B0C respectively.
>=20
> These thresholds match the thermal mitigation temperatures used by the
> platform for the corresponding operating profiles.
>=20
> Look up the keyboard thermal zone at probe time and locate the passive
> trip named "keyboard-ec-alert". The trip name is used deliberately so
> the EC driver can identify the device-tree trip associated with the
> platform thermal profile without depending on its position in the trip
> table.
>=20
> Initialize the thermal mitigation threshold to the balanced profile,
> matching the default platform behaviour, and update the thermal zone
> whenever a profile change event is reported by the EC so that the new
> mitigation temperature takes effect immediately.
>=20
> Using the platform_profile API would provide a more appropriate interface
> for exposing and managing these operating modes. However, while the API
> itself is generic, the platform profile core implementation currently
> lives under the ACPI framework. Making it available to device-tree based
> platforms requires separating the generic infrastructure from ACPI,
> which is a larger and independent piece of work.

So the only problem is that platform profile resides underneath acpi=20
namespace in sysfs?

--
 i.

> For now, handle the EC profile events directly and use them to adjust the
> thermal mitigation threshold while keeping the thermal policy described
> in the device tree.
>=20
> This change depends on the keyboard thermal zone and the
> "keyboard-ec-alert" trip introduced by the following series.
>=20
> Link: https://lore.kernel.org/all/20261001181055.9149-1-daniel.lezcano@os=
s.qualcomm.com/
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/lenovo-thinkpad-t14s.c | 109 ++++++++++++++++++
>  1 file changed, 109 insertions(+)
>=20
> diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/plat=
form/arm64/lenovo-thinkpad-t14s.c
> index e7acb66b77f2..ee39b0382219 100644
> --- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> +++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
> @@ -18,8 +18,10 @@
>  #include <linux/leds.h>
>  #include <linux/lockdep.h>
>  #include <linux/module.h>
> +#include <linux/platform_profile.h>
>  #include <linux/regmap.h>
>  #include <linux/slab.h>
> +#include <linux/thermal.h>
>  #include <linux/pm.h>
> =20
>  #define T14S_EC_CMD_ECRD=090x02
> @@ -93,9 +95,16 @@ struct t14s_ec_led_classdev {
>  =09struct t14s_ec *ec;
>  };
> =20
> +struct t14s_ec_thermal_profile {
> +=09struct thermal_zone_device *tzd;
> +=09struct thermal_trip *keyboard_alert;
> +=09enum platform_profile_option current_profile;
> +};
> +
>  struct t14s_ec {
>  =09struct regmap *regmap;
>  =09struct device *dev;
> +=09struct t14s_ec_thermal_profile profile;
>  =09struct t14s_ec_led_classdev led_pwr_btn;
>  =09struct t14s_ec_led_classdev led_chrg_orange;
>  =09struct t14s_ec_led_classdev led_chrg_white;
> @@ -472,6 +481,99 @@ static int t14s_input_probe(struct t14s_ec *ec)
>  =09return input_register_device(ec->inputdev);
>  }
> =20
> +static int t14s_platform_profile_temp(enum platform_profile_option profi=
le)
> +{
> +=09/*
> +=09 * These thresholds match the temperatures used by the
> +=09 * platform firmware for the corresponding operating profiles.
> +=09 */
> +=09switch (profile) {
> +=09case PLATFORM_PROFILE_LOW_POWER:
> +=09=09return 49850;
> +=09case PLATFORM_PROFILE_BALANCED:
> +=09=09return 57850;
> +=09case PLATFORM_PROFILE_PERFORMANCE:
> +=09=09return 59850;
> +=09default:
> +=09=09return THERMAL_TEMP_INVALID;
> +=09}
> +}
> +
> +static int t14s_platform_profile_set(struct t14s_ec_thermal_profile *tp,
> +=09=09=09=09     enum platform_profile_option profile)
> +{
> +=09int temp;
> +
> +=09if (!tp->tzd)
> +=09=09return -ENODEV;
> +
> +=09if (tp->current_profile =3D=3D profile)
> +=09=09return 0;
> +
> +=09temp =3D t14s_platform_profile_temp(profile);
> +=09if (temp =3D=3D THERMAL_TEMP_INVALID)
> +=09=09return -EINVAL;
> +
> +=09thermal_zone_set_trip_temp(tp->tzd, tp->keyboard_alert, temp);
> +=09thermal_zone_device_update(tp->tzd, THERMAL_TRIP_CHANGED);
> +
> +=09tp->current_profile =3D profile;
> +
> +=09return 0;
> +}
> +
> +static int t14s_profile_find_keyboard_alert(struct thermal_trip *tt, voi=
d *data)
> +{
> +=09struct device_node *np;
> +=09struct t14s_ec_thermal_profile *tp =3D data;
> +
> +=09if (tt->type !=3D THERMAL_TRIP_PASSIVE)
> +=09=09return 0;
> +
> +=09np =3D tt->priv;
> +
> +=09if (!np)
> +=09=09return -EINVAL;
> +
> +=09if (!of_node_name_eq(np, "keyboard-ec-alert"))
> +=09=09return 0;
> +
> +=09tp->keyboard_alert =3D tt;
> +
> +=09return 1;
> +}
> +
> +static int t14s_profile_probe(struct t14s_ec_thermal_profile *tp)
> +{
> +=09struct thermal_zone_device *tzd;
> +=09int ret;
> +
> +=09tzd =3D thermal_zone_get_zone_by_name("keyboard-thermal");
> +=09if (IS_ERR(tzd)) {
> +=09=09ret =3D PTR_ERR(tzd);
> +
> +=09=09if (ret =3D=3D -ENODEV)
> +=09=09=09return -EPROBE_DEFER;
> +
> +=09=09return ret;
> +=09}
> +
> +=09tp->tzd =3D tzd;
> +
> +=09ret =3D thermal_zone_for_each_trip(tzd, t14s_profile_find_keyboard_al=
ert, tp);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09if (!tp->keyboard_alert)
> +=09=09return -ENODEV;
> +
> +=09ret =3D t14s_platform_profile_set(tp, PLATFORM_PROFILE_BALANCED);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09return 0;
> +}
> +
>  static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
>  {
>  =09struct t14s_ec *ec =3D data;
> @@ -534,12 +636,15 @@ static irqreturn_t t14s_ec_irq_handler(int irq, voi=
d *data)
>  =09=09break;
>  =09case T14S_EC_EVT_KEY_FN_L:
>  =09=09dev_dbg(ec->dev, "FN + L - low performance mode\n");
> +=09=09t14s_platform_profile_set(&ec->profile, PLATFORM_PROFILE_LOW_POWER=
);
>  =09=09break;
>  =09case T14S_EC_EVT_KEY_FN_M:
>  =09=09dev_dbg(ec->dev, "FN + M - medium performance mode\n");
> +=09=09t14s_platform_profile_set(&ec->profile, PLATFORM_PROFILE_BALANCED)=
;
>  =09=09break;
>  =09case T14S_EC_EVT_KEY_FN_H:
>  =09=09dev_dbg(ec->dev, "FN + H - high performance mode\n");
> +=09=09t14s_platform_profile_set(&ec->profile, PLATFORM_PROFILE_PERFORMAN=
CE);
>  =09=09break;
>  =09case T14S_EC_EVT_KEY_FN_T:
>  =09=09dev_dbg(ec->dev, "FN + T - toggle intelligent cooling mode\n");
> @@ -590,6 +695,10 @@ static int t14s_ec_probe(struct i2c_client *client)
>  =09if (ret < 0)
>  =09=09return ret;
> =20
> +=09ret =3D t14s_profile_probe(&ec->profile);
> +=09if (ret < 0)
> +=09=09return ret;
> +
>  =09ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
>  =09=09=09=09=09t14s_ec_irq_handler,
>  =09=09=09=09=09IRQF_ONESHOT, dev_name(dev), ec);
>=20

--=20
 i.

--8323328-1170719270-1791973147=:1157--
