Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94567224FA
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Jun 2025 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749462393; cv=none; b=qQ+vbNq+etlGaAo7lj5PsEphkV/DlIj8KQGOoPmkCMRPl+osocUbxw6ou1Lh79woEDWEnJ0X5X9MEr2wb+mg0FGw6ETdlgh3jc31KI6aetEzmZ9RmjcRBTKA58WwGdm4REbkb/PCKjhIyJLzJCbtqFcPwsLJWUj1vJ1ZPYk0EXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749462393; c=relaxed/simple;
	bh=7rBKiIO3F4lXeGkrt3J2+jQAhhQCJ7EoZ13JrUYw8Go=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=iTZldeIqEcmpbOAqTA1gZEyIUIR1mkDaZ3SfGvgrVHoVu92kaVa4S/8ZxRQj+azdL9ot98TrIuKiLfiAFPQBxi6ia3VzwXKLS9rIcCp038F6TsZKObA8sRJM1sV3q+C+As0RyHRgq8AxOGEqu11rSVVwBwZ1TxpCvE2Ty70gSz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hwtthTKd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hwtthTKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749462391; x=1780998391;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=7rBKiIO3F4lXeGkrt3J2+jQAhhQCJ7EoZ13JrUYw8Go=;
  b=hwtthTKdsdOtDjC6ysNjGJizELObSNxMqlF3kp8Nqf6PpixIRwtpwwMG
   v+rsm3i2ixaJAjK21YwSE/mZLzbtaOyGMz89fYiVXaRyC82xyaTS5Hrbo
   CxyWw96ZzREDzjIZWdIxxILiWNahglMV2NfjN05pyPJPn/COn74UzCkK0
   y/k+q5tNJrK1fKj6hkG1ju2JIYB9pwrJXYtY/kQzy3E74ZSVpe28fhVv/
   wvYxVO5Df6v2M8pVySN+hCgVII1NXjcoHP9qm3srXvXlyJJnJUQTmRBZd
   GJKSpytTrElqfA+YOZl+lAUOcGR/WAu0TJmb2hbuZEuI4gXgfi4goTn2k
   w==;
X-CSE-ConnectionGUID: E/QQA27kQNqrrOQtH3kFBA==
X-CSE-MsgGUID: C6h1iIG3RYOrLAutGR2kJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11458"; a="76928641"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="76928641"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 02:46:31 -0700
X-CSE-ConnectionGUID: V/esX+yzS/a3XCkNu8sHGg==
X-CSE-MsgGUID: KplZ1Ax3TsWrbWx7oBQIiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; 
   d="scan'208";a="146458239"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 02:46:28 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 9 Jun 2025 12:46:18 +0300 (EEST)
To: Jelle van der Waa <jvanderwaa@redhat.com>
cc: Ike Panhc <ikepanhc@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v3] platform/x86: ideapad: Expose charge_types
In-Reply-To: <20250514201054.381320-1-jvanderwaa@redhat.com>
Message-ID: <90ca7248-9a73-3a9d-ba25-5c093ff9e313@linux.intel.com>
References: <20250514201054.381320-1-jvanderwaa@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-2101725742-1749462378=:948"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-2101725742-1749462378=:948
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 14 May 2025, Jelle van der Waa wrote:

> Some Ideapad models support a battery conservation mode which limits the
> battery charge threshold for longer battery longevity. This is currently
> exposed via a custom conservation_mode attribute in sysfs.
>=20
> The newly introduced charge_types sysfs attribute is a standardized
> replacement for laptops with a fixed end charge threshold. Setting it to
> `Long Life` would enable battery conservation mode. The standardized
> user space API would allow applications such as UPower to detect laptops
> which support this battery longevity mode and set it.
>=20
> Tested on an Lenovo ideapad U330p.
>=20
> Signed-off-by: Jelle van der Waa <jvanderwaa@redhat.com>
> Suggested-By: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>

I've applied this into the review-ilpo-next branch for the second time.

--
 i.

> ---
> V2 -> V3: Add Reviewed-By/Suggested-By
>=20
>  .../obsolete/sysfs-platform-ideapad-laptop    |   8 ++
>  .../ABI/testing/sysfs-platform-ideapad-laptop |   9 --
>  drivers/platform/x86/Kconfig                  |   1 +
>  drivers/platform/x86/ideapad-laptop.c         | 110 +++++++++++++++++-
>  4 files changed, 116 insertions(+), 12 deletions(-)
>  create mode 100644 Documentation/ABI/obsolete/sysfs-platform-ideapad-lap=
top
>=20
> diff --git a/Documentation/ABI/obsolete/sysfs-platform-ideapad-laptop b/D=
ocumentation/ABI/obsolete/sysfs-platform-ideapad-laptop
> new file mode 100644
> index 000000000000..c1dbd19c679c
> --- /dev/null
> +++ b/Documentation/ABI/obsolete/sysfs-platform-ideapad-laptop
> @@ -0,0 +1,8 @@
> +What:=09=09/sys/bus/platform/devices/VPC2004:*/conservation_mode
> +Date:=09=09Aug 2017
> +KernelVersion:=094.14
> +Contact:=09platform-driver-x86@vger.kernel.org
> +Description:
> +=09=09Controls whether the conservation mode is enabled or not.
> +=09=09This feature limits the maximum battery charge percentage to
> +=09=09around 50-60% in order to prolong the lifetime of the battery.
> diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Do=
cumentation/ABI/testing/sysfs-platform-ideapad-laptop
> index 4989ab266682..5ec0dee9e707 100644
> --- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> +++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
> @@ -27,15 +27,6 @@ Description:
>  =09=09=09* 1 -> Switched On
>  =09=09=09* 0 -> Switched Off
> =20
> -What:=09=09/sys/bus/platform/devices/VPC2004:*/conservation_mode
> -Date:=09=09Aug 2017
> -KernelVersion:=094.14
> -Contact:=09platform-driver-x86@vger.kernel.org
> -Description:
> -=09=09Controls whether the conservation mode is enabled or not.
> -=09=09This feature limits the maximum battery charge percentage to
> -=09=09around 50-60% in order to prolong the lifetime of the battery.
> -
>  What:=09=09/sys/bus/platform/devices/VPC2004:*/fn_lock
>  Date:=09=09May 2018
>  KernelVersion:=094.18
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 43407e76476b..5ea12d6cbb38 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -462,6 +462,7 @@ config IBM_RTL
>  config IDEAPAD_LAPTOP
>  =09tristate "Lenovo IdeaPad Laptop Extras"
>  =09depends on ACPI
> +=09depends on ACPI_BATTERY
>  =09depends on RFKILL && INPUT
>  =09depends on SERIO_I8042
>  =09depends on BACKLIGHT_CLASS_DEVICE
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86=
/ideapad-laptop.c
> index ede483573fe0..21db9646443e 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -27,6 +27,7 @@
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_profile.h>
> +#include <linux/power_supply.h>
>  #include <linux/rfkill.h>
>  #include <linux/seq_file.h>
>  #include <linux/sysfs.h>
> @@ -34,6 +35,7 @@
>  #include <linux/wmi.h>
>  #include "ideapad-laptop.h"
> =20
> +#include <acpi/battery.h>
>  #include <acpi/video.h>
> =20
>  #include <dt-bindings/leds/common.h>
> @@ -162,6 +164,7 @@ struct ideapad_private {
>  =09struct backlight_device *blightdev;
>  =09struct ideapad_dytc_priv *dytc;
>  =09struct dentry *debug;
> +=09struct acpi_battery_hook battery_hook;
>  =09unsigned long cfg;
>  =09unsigned long r_touchpad_val;
>  =09struct {
> @@ -589,6 +592,11 @@ static ssize_t camera_power_store(struct device *dev=
,
> =20
>  static DEVICE_ATTR_RW(camera_power);
> =20
> +static void show_conservation_mode_deprecation_warning(struct device *de=
v)
> +{
> +=09dev_warn_once(dev, "conservation_mode attribute has been deprecated, =
see charge_types.\n");
> +}
> +
>  static ssize_t conservation_mode_show(struct device *dev,
>  =09=09=09=09      struct device_attribute *attr,
>  =09=09=09=09      char *buf)
> @@ -597,6 +605,8 @@ static ssize_t conservation_mode_show(struct device *=
dev,
>  =09unsigned long result;
>  =09int err;
> =20
> +=09show_conservation_mode_deprecation_warning(dev);
> +
>  =09err =3D eval_gbmd(priv->adev->handle, &result);
>  =09if (err)
>  =09=09return err;
> @@ -612,6 +622,8 @@ static ssize_t conservation_mode_store(struct device =
*dev,
>  =09bool state;
>  =09int err;
> =20
> +=09show_conservation_mode_deprecation_warning(dev);
> +
>  =09err =3D kstrtobool(buf, &state);
>  =09if (err)
>  =09=09return err;
> @@ -1973,10 +1985,90 @@ static const struct dmi_system_id ctrl_ps2_aux_po=
rt_list[] =3D {
>  =09{}
>  };
> =20
> -static void ideapad_check_features(struct ideapad_private *priv)
> +static int ideapad_psy_ext_set_prop(struct power_supply *psy,
> +=09=09=09=09    const struct power_supply_ext *ext,
> +=09=09=09=09    void *ext_data,
> +=09=09=09=09    enum power_supply_property psp,
> +=09=09=09=09    const union power_supply_propval *val)
> +{
> +=09struct ideapad_private *priv =3D ext_data;
> +
> +=09switch (val->intval) {
> +=09case POWER_SUPPLY_CHARGE_TYPE_LONGLIFE:
> +=09=09return exec_sbmc(priv->adev->handle, SBMC_CONSERVATION_ON);
> +=09case POWER_SUPPLY_CHARGE_TYPE_STANDARD:
> +=09=09return exec_sbmc(priv->adev->handle, SBMC_CONSERVATION_OFF);
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +}
> +
> +static int ideapad_psy_ext_get_prop(struct power_supply *psy,
> +=09=09=09=09    const struct power_supply_ext *ext,
> +=09=09=09=09    void *ext_data,
> +=09=09=09=09    enum power_supply_property psp,
> +=09=09=09=09    union power_supply_propval *val)
> +{
> +=09struct ideapad_private *priv =3D ext_data;
> +=09unsigned long result;
> +=09int err;
> +
> +=09err =3D eval_gbmd(priv->adev->handle, &result);
> +=09if (err)
> +=09=09return err;
> +
> +=09if (test_bit(GBMD_CONSERVATION_STATE_BIT, &result))
> +=09=09val->intval =3D POWER_SUPPLY_CHARGE_TYPE_LONGLIFE;
> +=09else
> +=09=09val->intval =3D POWER_SUPPLY_CHARGE_TYPE_STANDARD;
> +
> +=09return 0;
> +}
> +
> +static int ideapad_psy_prop_is_writeable(struct power_supply *psy,
> +=09=09=09=09=09 const struct power_supply_ext *ext,
> +=09=09=09=09=09 void *data,
> +=09=09=09=09=09 enum power_supply_property psp)
> +{
> +=09return true;
> +}
> +
> +static const enum power_supply_property ideapad_power_supply_props[] =3D=
 {
> +=09POWER_SUPPLY_PROP_CHARGE_TYPES,
> +};
> +
> +static const struct power_supply_ext ideapad_battery_ext =3D {
> +=09.name=09=09=09=3D "ideapad_laptop",
> +=09.properties=09=09=3D ideapad_power_supply_props,
> +=09.num_properties=09=09=3D ARRAY_SIZE(ideapad_power_supply_props),
> +=09.charge_types=09=09=3D (BIT(POWER_SUPPLY_CHARGE_TYPE_STANDARD) |
> +=09=09=09=09   BIT(POWER_SUPPLY_CHARGE_TYPE_LONGLIFE)),
> +=09.get_property=09=09=3D ideapad_psy_ext_get_prop,
> +=09.set_property=09=09=3D ideapad_psy_ext_set_prop,
> +=09.property_is_writeable=09=3D ideapad_psy_prop_is_writeable,
> +};
> +
> +static int ideapad_battery_add(struct power_supply *battery, struct acpi=
_battery_hook *hook)
> +{
> +=09struct ideapad_private *priv =3D container_of(hook, struct ideapad_pr=
ivate, battery_hook);
> +
> +=09return power_supply_register_extension(battery, &ideapad_battery_ext,
> +=09=09=09=09=09       &priv->platform_device->dev, priv);
> +}
> +
> +static int ideapad_battery_remove(struct power_supply *battery,
> +=09=09=09=09  struct acpi_battery_hook *hook)
> +{
> +=09power_supply_unregister_extension(battery, &ideapad_battery_ext);
> +
> +=09return 0;
> +}
> +
> +static int ideapad_check_features(struct ideapad_private *priv)
>  {
>  =09acpi_handle handle =3D priv->adev->handle;
>  =09unsigned long val;
> +=09int err;
> =20
>  =09priv->features.set_fn_lock_led =3D
>  =09=09set_fn_lock_led || dmi_check_system(set_fn_lock_led_list);
> @@ -1991,8 +2083,16 @@ static void ideapad_check_features(struct ideapad_=
private *priv)
>  =09if (!read_ec_data(handle, VPCCMD_R_FAN, &val))
>  =09=09priv->features.fan_mode =3D true;
> =20
> -=09if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"=
))
> +=09if (acpi_has_method(handle, "GBMD") && acpi_has_method(handle, "SBMC"=
)) {
>  =09=09priv->features.conservation_mode =3D true;
> +=09=09priv->battery_hook.add_battery =3D ideapad_battery_add;
> +=09=09priv->battery_hook.remove_battery =3D ideapad_battery_remove;
> +=09=09priv->battery_hook.name =3D "Ideapad Battery Extension";
> +
> +=09=09err =3D devm_battery_hook_register(&priv->platform_device->dev, &p=
riv->battery_hook);
> +=09=09if (err)
> +=09=09=09return err;
> +=09}
> =20
>  =09if (acpi_has_method(handle, "DYTC"))
>  =09=09priv->features.dytc =3D true;
> @@ -2027,6 +2127,8 @@ static void ideapad_check_features(struct ideapad_p=
rivate *priv)
>  =09=09=09}
>  =09=09}
>  =09}
> +
> +=09return 0;
>  }
> =20
>  #if IS_ENABLED(CONFIG_ACPI_WMI)
> @@ -2175,7 +2277,9 @@ static int ideapad_acpi_add(struct platform_device =
*pdev)
>  =09if (err)
>  =09=09return err;
> =20
> -=09ideapad_check_features(priv);
> +=09err =3D ideapad_check_features(priv);
> +=09if (err)
> +=09=09return err;
> =20
>  =09ideapad_debugfs_init(priv);
> =20
>=20
--8323328-2101725742-1749462378=:948--
