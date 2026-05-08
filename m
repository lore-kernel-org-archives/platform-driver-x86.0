Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272AF23507B;
	Fri,  8 May 2026 15:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778253794; cv=none; b=J7yhvraZG72QmsT9L1tiaFpXeHiIIDm/TBkNLTytBYe5hGXBQo7zkYa0Eh89Y/D1ZWOrNEqu91Ya9a812m03cbW+lHRxIpSPArhgcYGydPk54aZTgw9Rqe1hmhdKDEUyXLwZjqMQxOmSJndy1O+7paPGF0DmrWPbtjXhjzaICR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778253794; c=relaxed/simple;
	bh=ilIzgNVsVNxbjOG4i8hdYf+164ZmwgW7Cyhci8gz6sQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nCnZvi/j/H8hkXPKqiRb3ddkjHwrEiYgvyOxBSxV8b+m8DWAkmh0BVPPRhlW1+8h3Sbcsp/RAEuO8CB6AdEwnF6flOD9hNBYhvK/qNoWhpahNhveQ+8p7aEQGKbECfOJI6K7kUAyvOfY8Zi//k+UxEJfSo+9iyz6DDW9AxV9DYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMqXzVTc; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMqXzVTc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778253792; x=1809789792;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=ilIzgNVsVNxbjOG4i8hdYf+164ZmwgW7Cyhci8gz6sQ=;
  b=nMqXzVTctsc+5UArezkmUgrNjxRmRHe2OFWbwIYQaOL0zU61cgak/lCJ
   Rsn5ZU8C5AiQJkJHwhYxp2WknUPk7iYh8na93jVXpRI6bmt2j1nuue7mY
   ljLH+Gkr6bVcbgEgyXwLkq+Zrq3PXnyJY6LF6YRqWpUDO9/MqCI+ahR99
   C0fCDuTEK/CPgObcHA6AXQVd7j4E4StjPdT0Sw+rh+IGZZDVCACM5usWl
   ZktUBlbyecO0kLnGDP6GCAFLqORioigf7MKnzZIgkyAUn2UU3UcyI/X80
   vqK6wpJOElfQh30Ks7sE+4baNgdt7hMnAEWX/KkXARfdhQtLKhQCnamE8
   w==;
X-CSE-ConnectionGUID: GFnZ0KGIQe2LXRz4v3mp7Q==
X-CSE-MsgGUID: W0Fx+tFIQYS6GuE/ONTHig==
X-IronPort-AV: E=McAfee;i="6800,10657,11780"; a="89535338"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="89535338"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 08:23:11 -0700
X-CSE-ConnectionGUID: fwcdRvx6Qi+/lq+XN5UN3w==
X-CSE-MsgGUID: ZTF/CfrdSwuYoeJ/94ainA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="240776703"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.100])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 08:23:06 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 8 May 2026 18:23:03 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, 
    Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>, 
    Rong Zhang <i@rong.moe>, Kurt Borja <kuurtb@gmail.com>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    =?ISO-8859-15?Q?N=EDcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
    marshall@shzj.cc, hyacinth@shzj.cc, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 13/15] platform/x86: lenovo-wmi-other: Add WMI battery
 charge limiting
In-Reply-To: <A1CD0F5E-6675-4C97-B6B7-DE77817AC5C0@gmail.com>
Message-ID: <01546195-e459-b20c-3bf1-1e03166edbbf@linux.intel.com>
References: <20260507180507.912966-1-derekjohn.clark@gmail.com> <20260507180507.912966-14-derekjohn.clark@gmail.com> <9b51fdc2-5429-9fb8-830b-6e20fd27e3b2@linux.intel.com> <A1CD0F5E-6675-4C97-B6B7-DE77817AC5C0@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1808775927-1778253783=:1002"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1808775927-1778253783=:1002
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 8 May 2026, Derek J. Clark wrote:

> On May 8, 2026 7:52:45 AM PDT, "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.=
intel.com> wrote:
> >On Thu, 7 May 2026, Derek J. Clark wrote:
> >
> >> Add charge_behaviour and charge_control_end_threshold attributes throu=
gh
> >> a power supply extension for devices that support WMI based charge ena=
ble
> >> & disable.
> >>=20
> >> Lenovo Legion devices that implement WMI function and capdata ID
> >> 0x03010001 in their BIOS are able to enable or disable charging at 80%
> >> through the lenovo-wmi-other interface. Add a charge_control_end_thres=
hold
> >> attribute for BATX devices to expose this capability. The GET method f=
or
> >> this attribute is bugged. After analyzing the DSDT and some testing it
> >> appears the method grabs bit(3) instead of bit(4) from the EC register
> >> that stores the current status, and will only report if charging has
> >> been inhibited or not. To work around this, store and report the last
> >> setting written to the attribute.
> >>=20
> >> Additionally, devices that support WMI function and capdata ID 0x03020=
000
> >> are able to force discharge of the battery. Expose this capability wit=
h
> >> a charge_behaviour attribute in the power supply extension, with the
> >> AUTO and FORCE_DISCHARGE behaviors enabled.
> >>=20
> >> As some devices only expose one attribute or the other, a bitmask is
> >> added with a lookup table and some helper macros to select the correct
> >> configuration for the hardware at runtime.
> >>=20
> >> The ideapad_laptop driver provides the charge_type attribute to provid=
e
> >> similar functionality. When the WMI method is set this can corrupt the
> >> ACPI method return and cause hardware and driver errors. To avoid
> >> conflicts between the drivers, we get the acpi_handle and do the same
> >> check that ideapad_laptop does when it enables the feature. If the
> >> feature is supported in ideapad_laptop, abort adding the extension fro=
m
> >> lenovo-wmi-other. The ACPI method is more reliable when both are
> >> present, from my testing, so we can prefer that implementation and do
> >> not need to worry about de-conflicting from inside that driver. A new
> >> module parameter, force_load_psy_ext, is provided to bypass this ACPI
> >> check, as well as feature supported checks, if desired.
> >>=20
> >> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >> ---
> >> v11:
> >>   - Refactor to use charge_behaviour and charge_control_end_threshold,
> >>     per the class documentation. The ideapad_laptop driver will be fix=
ed
> >>     in a separate patch series.
> >>   - Due to the extensive refactoring, I have removed the reviewed-by
> >>     tags from Rong and Mark to allow them to recertify the code in its
> >>     current state.
> >> v7:
> >>   - Use devm_battery_hook_register, manually unregister during unbind.
> >> v6:
> >>   - Check feature flags to determine if the extension should be loaded
> >>     and if it is writable.
> >>   - Zero initialize wmi_method_args_32.
> >>   - Fix formatting.
> >> v5:
> >>   - Use switch statement instead of if for battery charge state set/ge=
t.
> >>   - use force_load_psy_ext to skip all ACPI interactions.
> >>   - Various formatting fixes.
> >> v4:
> >>   - Remove unused defines.
> >>   - Disambiguate charging defines by renaming them to be more consiste=
nt
> >>     with the kernel modes they represent.
> >>   - Add module parameter to ignore ACPI checks.
> >>   - Don't fail if the ACPI handle isn't found, skip the ACPI check
> >>     instead.
> >> ---
> >>  drivers/platform/x86/lenovo/Kconfig       |   1 +
> >>  drivers/platform/x86/lenovo/wmi-capdata.h |   1 +
> >>  drivers/platform/x86/lenovo/wmi-other.c   | 401 +++++++++++++++++++++=
+
> >>  3 files changed, 403 insertions(+)
> >>=20
> >> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x8=
6/lenovo/Kconfig
> >> index 09b1b055d2e0..b9a5d18caa1e 100644
> >> --- a/drivers/platform/x86/lenovo/Kconfig
> >> +++ b/drivers/platform/x86/lenovo/Kconfig
> >> @@ -262,6 +262,7 @@ config LENOVO_WMI_GAMEZONE
> >>  config LENOVO_WMI_TUNING
> >>  =09tristate "Lenovo Other Mode WMI Driver"
> >>  =09depends on ACPI_WMI
> >> +=09depends on ACPI_BATTERY
> >>  =09select HWMON
> >>  =09select FW_ATTR_CLASS
> >>  =09select LENOVO_WMI_CAPDATA
> >> diff --git a/drivers/platform/x86/lenovo/wmi-capdata.h b/drivers/platf=
orm/x86/lenovo/wmi-capdata.h
> >> index 891b12ca1db6..e0a30f2c0c87 100644
> >> --- a/drivers/platform/x86/lenovo/wmi-capdata.h
> >> +++ b/drivers/platform/x86/lenovo/wmi-capdata.h
> >> @@ -21,6 +21,7 @@
> >>  enum lwmi_device_id {
> >>  =09LWMI_DEVICE_ID_CPU =3D 0x01,
> >>  =09LWMI_DEVICE_ID_GPU =3D 0x02,
> >> +=09LWMI_DEVICE_ID_PSU =3D 0x03,
> >>  =09LWMI_DEVICE_ID_FAN =3D 0x04,
> >>  };
> >> =20
> >> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platfor=
m/x86/lenovo/wmi-other.c
> >> index fb301c54d26d..4939a71e8fca 100644
> >> --- a/drivers/platform/x86/lenovo/wmi-other.c
> >> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> >> @@ -41,9 +41,12 @@
> >>  #include <linux/limits.h>
> >>  #include <linux/module.h>
> >>  #include <linux/platform_profile.h>
> >> +#include <linux/power_supply.h>
> >>  #include <linux/types.h>
> >>  #include <linux/wmi.h>
> >> =20
> >> +#include <acpi/battery.h>
> >> +
> >>  #include "wmi-capdata.h"
> >>  #include "wmi-events.h"
> >>  #include "wmi-helpers.h"
> >> @@ -75,9 +78,15 @@ enum lwmi_feature_id_gpu {
> >>  =09LWMI_FEATURE_ID_GPU_NV_CPU_BOOST =3D=090x0b,
> >>  };
> >> =20
> >> +enum lwmi_feature_id_psu {
> >> +=09LWMI_FEATURE_ID_PSU_CHARGE_END_THRESHOLD =3D=090x01,
> >> +=09LWMI_FEATURE_ID_PSU_CHARGE_BEHAVIOR =3D=09=090x02,
> >> +};
> >> +
> >>  #define LWMI_FEATURE_ID_FAN_RPM 0x03
> >> =20
> >>  #define LWMI_TYPE_ID_CROSSLOAD=090x01
> >> +#define LWMI_TYPE_ID_PSU_AC=090x01
> >> =20
> >>  #define LWMI_FEATURE_VALUE_GET 17
> >>  #define LWMI_FEATURE_VALUE_SET 18
> >> @@ -88,10 +97,19 @@ enum lwmi_feature_id_gpu {
> >> =20
> >>  #define LWMI_FAN_DIV 100
> >> =20
> >> +#define LWMI_CHARGE_BEHAVIOR_DISCHARGE=090x00
> >> +#define LWMI_CHARGE_BEHAVIOR_AUTO=090x01
> >> +#define LWMI_CHARGE_END_100=09=090x00
> >> +#define LWMI_CHARGE_END_80=09=090x01
> >> +
> >>  #define LWMI_ATTR_ID_FAN_RPM(x)                                   \
> >>  =09lwmi_attr_id(LWMI_DEVICE_ID_FAN, LWMI_FEATURE_ID_FAN_RPM, \
> >>  =09=09     LWMI_GZ_THERMAL_MODE_NONE, LWMI_FAN_ID(x))
> >> =20
> >> +#define LWMI_ATTR_ID_PSU(feat, type)=09=09=09\
> >> +=09lwmi_attr_id(LWMI_DEVICE_ID_PSU, feat,=09=09\
> >> +=09=09     LWMI_GZ_THERMAL_MODE_NONE, type)
> >> +
> >>  #define LWMI_OM_SYSFS_NAME "lenovo-wmi-other"
> >>  #define LWMI_OM_HWMON_NAME "lenovo_wmi_other"
> >> =20
> >> @@ -131,6 +149,11 @@ struct lwmi_om_priv {
> >>  =09=09bool capdata00_collected : 1;
> >>  =09=09bool capdata_fan_collected : 1;
> >>  =09} fan_flags;
> >> +
> >> +=09enum power_supply_charge_behaviour charge_behaviour;
> >> +=09const struct power_supply_ext *battery_ext;
> >> +=09struct acpi_battery_hook battery_hook;
> >> +=09bool bh_registered;
> >>  };
> >> =20
> >>  /*
> >> @@ -555,6 +578,381 @@ static void lwmi_om_fan_info_collect_cd_fan(stru=
ct device *dev, struct cd_list *
> >>  =09lwmi_om_hwmon_add(priv);
> >>  }
> >> =20
> >> +/* =3D=3D=3D=3D=3D=3D=3D=3D Power Supply Extension (component: lenovo=
-wmi-capdata 00) =3D=3D=3D=3D=3D=3D=3D=3D */
> >> +
> >> +/**
> >> + * lwmi_psy_ext_get_prop() - Get a power_supply_ext property
> >> + * @ps: The battery that was extended
> >> + * @ext: The extension
> >> + * @ext_data: Pointer to the lwmi_om_priv drvdata
> >> + * @prop: The property to read
> >> + * @val: The value to return
> >> + *
> >> + * Writes the given value to the power_supply_ext property
> >> + *
> >> + * Return: 0 on success, or an error
> >> + */
> >> +static int lwmi_psy_ext_get_prop(struct power_supply *ps,
> >> +=09=09=09=09 const struct power_supply_ext *ext,
> >> +=09=09=09=09 void *ext_data,
> >> +=09=09=09=09 enum power_supply_property prop,
> >> +=09=09=09=09 union power_supply_propval *val)
> >> +{
> >> +=09struct lwmi_om_priv *priv =3D ext_data;
> >> +=09struct wmi_method_args_32 args =3D {};
> >> +=09u32 retval;
> >> +=09int ret;
> >> +
> >> +=09switch (prop) {
> >> +=09case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> >> +=09=09/* Reading from BIOS reads the wrong bit. Use cached value */
> >> +=09=09val->intval =3D priv->charge_behaviour;
> >> +=09=09return 0;
> >> +=09case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> >> +=09=09args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_END_T=
HRESHOLD,
> >> +=09=09=09=09=09     LWMI_TYPE_ID_PSU_AC);
> >> +=09=09break;
> >> +=09default:
> >> +=09=09return -EINVAL;
> >> +=09}
> >> +
> >> +=09ret =3D lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_=
GET,
> >> +=09=09=09=09    (unsigned char *)&args, sizeof(args),
> >> +=09=09=09=09    &retval);
> >> +=09if (ret)
> >> +=09=09return ret;
> >> +
> >> +=09dev_dbg(&priv->wdev->dev, "Got return value %#x for property %#x\n=
", retval, prop);
> >> +
> >> +=09switch (retval) {
> >> +=09case LWMI_CHARGE_END_80:
> >> +=09=09val->intval =3D 80;
> >> +=09=09break;
> >> +=09case LWMI_CHARGE_END_100:
> >> +=09=09val->intval =3D 100;
> >> +=09=09break;
> >> +=09default:
> >> +=09=09dev_err(&priv->wdev->dev, "Got invalid charge limit value: %#x\=
n", retval);
> >> +=09=09return -EINVAL;
> >> +=09}
> >> +
> >> +=09return 0;
> >> +}
> >> +
> >> +/**
> >> + * lwmi_psy_ext_set_prop() - Set a power_supply_ext property
> >> + * @ps: The battery that was extended
> >> + * @ext: The extension
> >> + * @ext_data: Pointer to the lwmi_om_priv drvdata
> >> + * @prop: The property to write
> >> + * @val: The value to write
> >> + *
> >> + * Writes the given value to the power_supply_ext property
> >> + *
> >> + * Return: 0 on success, or an error
> >> + */
> >> +static int lwmi_psy_ext_set_prop(struct power_supply *ps,
> >> +=09=09=09=09 const struct power_supply_ext *ext,
> >> +=09=09=09=09 void *ext_data,
> >> +=09=09=09=09 enum power_supply_property prop,
> >> +=09=09=09=09 const union power_supply_propval *val)
> >> +{
> >> +=09struct lwmi_om_priv *priv =3D ext_data;
> >> +=09struct wmi_method_args_32 args =3D {};
> >> +
> >> +=09switch (prop) {
> >> +=09case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> >> +=09=09args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BEHAV=
IOR,
> >> +=09=09=09=09=09     LWMI_TYPE_ID_NONE);
> >> +=09=09switch (val->intval) {
> >> +=09=09case POWER_SUPPLY_CHARGE_BEHAVIOUR_AUTO:
> >> +=09=09=09args.arg1 =3D LWMI_CHARGE_BEHAVIOR_AUTO;
> >> +=09=09=09break;
> >> +=09=09case POWER_SUPPLY_CHARGE_BEHAVIOUR_FORCE_DISCHARGE:
> >> +=09=09=09args.arg1 =3D LWMI_CHARGE_BEHAVIOR_DISCHARGE;
> >> +=09=09=09break;
> >> +=09=09default:
> >> +=09=09=09dev_err(&priv->wdev->dev, "Got invalid charge behavior value=
: %#x\n",
> >> +=09=09=09=09val->intval);
> >> +=09=09=09return -EINVAL;
> >> +=09=09}
> >> +=09=09priv->charge_behaviour =3D val->intval;
> >> +=09=09break;
> >> +=09case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> >> +=09=09args.arg0 =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_END_T=
HRESHOLD,
> >> +=09=09=09=09=09     LWMI_TYPE_ID_PSU_AC);
> >> +=09=09switch (val->intval) {
> >> +=09=09case 0 ... 80:
> >> +=09=09=09args.arg1 =3D LWMI_CHARGE_END_80;
> >> +=09=09=09break;
> >> +=09=09case 81 ... 100:
> >> +=09=09=09args.arg1 =3D LWMI_CHARGE_END_100;
> >> +=09=09=09break;
> >> +=09=09default:
> >> +=09=09=09dev_err(&priv->wdev->dev, "Got invalid charge limit value: %=
#x\n",
> >> +=09=09=09=09val->intval);
> >> +=09=09=09return -EINVAL;
> >> +=09=09}
> >> +=09=09break;
> >> +=09default:
> >> +=09=09return false;
> >> +=09}
> >> +
> >> +=09dev_dbg(&priv->wdev->dev, "Attempting to set %#010x for property %=
#x to %#x\n",
> >> +=09=09args.arg0, prop, args.arg1);
> >> +
> >> +=09return lwmi_dev_evaluate_int(priv->wdev, 0x0, LWMI_FEATURE_VALUE_S=
ET,
> >> +=09=09=09=09     (unsigned char *)&args, sizeof(args), NULL);
> >
> >unsigned char * is for real "text", u8 * is the correct type for anythin=
g=20
> >that is binary data.
> >
> >I've apparently missed it earlier and you don't necessarily need to fix=
=20
> >this in the context of this series (I'd prefer to finally be able to mov=
e=20
> >on from this series) but the distinction between two types is good to ke=
ep=20
> >in mind.
> >
> >> +}
> >> +
> >> +/**
> >> + * lwmi_psy_prop_is_suppported() - Determine if the property is suppo=
rted
> >> + * @priv: Pointer to the lwmi_om_priv drvdata
> >> + * @prop: The power supply property to be evaluated
> >> + *
> >> + * Checks capdata 00 to determine if the property is supported.
> >> + *
> >> + * Return: true if readable, or false
> >> + */
> >> +static bool lwmi_psy_prop_is_supported(struct lwmi_om_priv *priv, enu=
m power_supply_property prop)
> >> +{
> >> +=09struct capdata00 capdata;
> >> +=09u32 attribute_id;
> >> +=09int ret;
> >> +
> >> +=09switch (prop) {
> >> +=09case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> >> +=09=09attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BE=
HAVIOR,
> >> +=09=09=09=09=09=09LWMI_TYPE_ID_NONE);
> >> +=09=09break;
> >> +=09case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> >> +=09=09attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_EN=
D_THRESHOLD,
> >> +=09=09=09=09=09=09LWMI_TYPE_ID_PSU_AC);
> >> +=09=09break;
> >> +=09default:
> >> +=09=09return false;
> >> +=09}
> >> +
> >> +=09ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata=
);
> >> +=09if (ret)
> >> +=09=09return false;
> >> +
> >> +=09dev_dbg(&priv->wdev->dev, "Battery charge feature (%#010x) support=
 level: %#x\n",
> >> +=09=09attribute_id, capdata.supported);
> >> +
> >> +=09return ((capdata.supported & LWMI_SUPP_VALID) && (capdata.supporte=
d & LWMI_SUPP_GET));
> >
> >The outer parenthesis seem unnecessary.
> >
> >> +}
> >> +
> >> +/**
> >> + * lwmi_psy_prop_is_writeable() - Determine if the property is writea=
ble
> >> + * @ps: The battery that was extended
> >> + * @ext: The extension
> >> + * @ext_data: Pointer the lwmi_om_priv drvdata
> >> + * @prop: The property to check
> >> + *
> >> + * Checks capdata 00 to determine if the property is writable.
> >> + *
> >> + * Return: true if writable, or false
> >> + */
> >> +static int lwmi_psy_prop_is_writeable(struct power_supply *ps,
> >> +=09=09=09=09      const struct power_supply_ext *ext,
> >> +=09=09=09=09      void *ext_data,
> >> +=09=09=09=09      enum power_supply_property prop)
> >> +{
> >> +=09struct lwmi_om_priv *priv =3D ext_data;
> >> +=09struct capdata00 capdata;
> >> +=09u32 attribute_id;
> >> +=09int ret;
> >> +
> >> +=09switch (prop) {
> >> +=09case POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR:
> >> +=09=09attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_BE=
HAVIOR,
> >> +=09=09=09=09=09=09LWMI_TYPE_ID_NONE);
> >> +=09=09break;
> >> +=09case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
> >> +=09=09attribute_id =3D LWMI_ATTR_ID_PSU(LWMI_FEATURE_ID_PSU_CHARGE_EN=
D_THRESHOLD,
> >> +=09=09=09=09=09=09LWMI_TYPE_ID_PSU_AC);
> >> +=09=09break;
> >> +=09default:
> >> +=09=09return false;
> >> +=09}
> >> +
> >> +=09ret =3D lwmi_cd00_get_data(priv->cd00_list, attribute_id, &capdata=
);
> >> +=09if (ret)
> >> +=09=09return false;
> >> +
> >> +=09return !!(capdata.supported & LWMI_SUPP_SET);
> >> +}
> >> +
> >> +static const enum power_supply_property lwmi_psy_ext_props_all[] =3D =
{
> >> +=09POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
> >> +=09POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> >> +};
> >> +
> >> +static const enum power_supply_property lwmi_psy_ext_props_threshold[=
] =3D {
> >> +=09POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
> >> +};
> >> +
> >> +static const enum power_supply_property lwmi_psy_ext_props_behaviour[=
] =3D {
> >> +=09POWER_SUPPLY_PROP_CHARGE_BEHAVIOUR,
> >> +};
> >> +
> >> +#define DEFINE_LWMI_POWER_SUPPLY_EXTENSION(_name, _props, _behaviours=
)=09\
> >> +=09static const struct power_supply_ext _name =3D {=09=09=09\
> >> +=09=09.name=09=09=09=3D LWMI_OM_SYSFS_NAME,=09=09\
> >> +=09=09.properties=09=09=3D _props,=09=09=09\
> >> +=09=09.num_properties=09=09=3D ARRAY_SIZE(_props),=09=09\
> >> +=09=09.charge_behaviours=09=3D _behaviours,=09=09=09\
> >> +=09=09.get_property=09=09=3D lwmi_psy_ext_get_prop,=09\
> >> +=09=09.set_property=09=09=3D lwmi_psy_ext_set_prop,=09\
> >> +=09=09.property_is_writeable=09=3D lwmi_psy_prop_is_writeable,=09\
> >> +=09}
> >> +
> >> +#define LWMI_CHARGE_BEHAVIOURS (BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_AUT=
O) | \
> >> +=09=09=09=09BIT(POWER_SUPPLY_CHARGE_BEHAVIOUR_INHIBIT_CHARGE))
> >> +
> >> +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_all, lwmi_psy_ext_pro=
ps_all,
> >> +=09=09=09=09   LWMI_CHARGE_BEHAVIOURS);
> >> +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_threshold,
> >> +=09=09=09=09   lwmi_psy_ext_props_threshold, 0);
> >> +DEFINE_LWMI_POWER_SUPPLY_EXTENSION(lwmi_psy_ext_behaviour,
> >> +=09=09=09=09   lwmi_psy_ext_props_behaviour,
> >> +=09=09=09=09   LWMI_CHARGE_BEHAVIOURS);
> >> +
> >> +#define LWMI_PSY_PROP_BEHAVIOUR BIT(0)
> >> +#define LWMI_PSY_PROP_THRESHOLD BIT(1)
> >> +
> >> +static const struct power_supply_ext *lwmi_psy_exts[] =3D {
> >> +=09[LWMI_PSY_PROP_BEHAVIOUR] =3D=09=09=09=09&lwmi_psy_ext_behaviour,
> >> +=09[LWMI_PSY_PROP_THRESHOLD] =3D=09=09=09=09&lwmi_psy_ext_threshold,
> >> +=09[LWMI_PSY_PROP_BEHAVIOUR | LWMI_PSY_PROP_THRESHOLD] =3D=09&lwmi_ps=
y_ext_all,
> >> +};
> >> +
> >> +/**
> >> + * lwmi_add_battery() - Connect the power_supply_ext
> >> + * @battery: The battery to extend
> >> + * @hook: The driver hook used to extend the battery
> >> + *
> >> + * Return: 0 on success, or an error.
> >> + */
> >> +static int lwmi_add_battery(struct power_supply *battery, struct acpi=
_battery_hook *hook)
> >> +{
> >> +=09struct lwmi_om_priv *priv =3D container_of(hook, struct lwmi_om_pr=
iv, battery_hook);
> >> +
> >> +=09return power_supply_register_extension(battery, priv->battery_ext,=
 &priv->wdev->dev, priv);
> >> +}
> >> +
> >> +/**
> >> + * lwmi_remove_battery() - Disconnect the power_supply_ext
> >> + * @battery: The battery that was extended
> >> + * @hook: The driver hook used to extend the battery
> >> + *
> >> + * Return: 0 on success, or an error.
> >> + */
> >> +static int lwmi_remove_battery(struct power_supply *battery, struct a=
cpi_battery_hook *hook)
> >> +{
> >> +=09struct lwmi_om_priv *priv =3D container_of(hook, struct lwmi_om_pr=
iv, battery_hook);
> >> +
> >> +=09power_supply_unregister_extension(battery, priv->battery_ext);
> >> +=09return 0;
> >> +}
> >> +
> >> +/**
> >> + * lwmi_acpi_match() - Attempts to return the ideapad acpi handle
> >> + * @handle: The ACPI handle that manages battery charging
> >> + * @lvl: Unused
> >> + * @context: Void pointer to the acpi_handle object to return
> >> + * @retval: Unused
> >> + *
> >> + * Checks if the ideapad_laptop driver is going to manage charge_type=
 first,
> >> + * then if not, hooks the battery to our WMI methods.
> >> + *
> >> + * Return: AE_CTRL_TERMINATE if found, AE_OK if not found.
> >> + */
> >> +static acpi_status lwmi_acpi_match(acpi_handle handle, u32 lvl,
> >> +=09=09=09=09   void *context, void **retval)
> >> +{
> >> +=09acpi_handle *ahand =3D context;
> >> +
> >> +=09if (!handle)
> >> +=09=09return AE_OK;
> >> +
> >> +=09*ahand =3D handle;
> >> +
> >> +=09return AE_CTRL_TERMINATE;
> >> +}
> >> +
> >> +static bool force_load_psy_ext;
> >> +module_param(force_load_psy_ext, bool, 0444);
> >> +MODULE_PARM_DESC(force_load_psy_ext,
> >> +=09"This option will skip checking if the ideapad_laptop driver will =
conflict "
> >> +=09"with adding an extension to set the battery charge type. It is re=
commended "
> >> +=09"to blacklist the ideapad driver before using this option.");
> >
> >What is the usecase for this parameter from ordinary user's perspective?
> >
>=20
> It would mostly be for advanced users to test hardware support/behavior=
=20
> if either the capdata is malformed while the functions are usable, or if=
=20
> the ideapad_laptop implementation wasn't working on a specific BIOS.

Do we then have a way to move forward from that? That is, to get into a=20
state where the parameter is no longer needed?

You've attempted to codify the rules as do not use this feature if ideapad=
=20
does it (as per the description in the changelog, I didn't go checking all=
=20
the code in both drivers), so if user find with the help of this parameter=
=20
ideapad is not working this one is found working, how can we handle that=20
case without the user needing to keep using parameter + blacklist?

It would probably be better to introduce this force parameter in own patch=
=20
which covers these aspects in the changelog description, as is, it's kind=
=20
of lost into the sea of surrounding noise.

> Thinking further, it should probably also cause is_writable to return=20
> true always when set (assuming you want to keep it).
>=20
> >Usually module params are near the top of file (it seems that only a ver=
y=20
> >few drivers have one midfile, some had it near the end).
> >
>=20
> I can move it to live with the rest of the params. They appeared to be=20
> next to the implementation functions for hwmon, soni followed that=20
> pattern.


--=20
 i.
--8323328-1808775927-1778253783=:1002--
