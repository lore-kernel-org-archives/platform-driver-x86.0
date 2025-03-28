Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E9F214A90
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Mar 2025 11:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743162801; cv=none; b=DdxuUKmHBsraU/1hqH1Sz2xo36vQvZm7IBwpWFcNRNC4Aj1yrChS79l4IFz5bHy/Qnh4ZVpfldRgrYLmm3YXTXT+eyHvE9I7ZKB5ZF1FL0JrzwqkqkBurailOPF0dj/F0GJbspLoj+KDm1j5vEuCb85tyrYXEO8IZd0/grTCf9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743162801; c=relaxed/simple;
	bh=XPwyZJxbbxsZAIpLQwPXzVZP8yet2lvP8KTciYNjyWo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Wq1aAH7WnbIIK40jshUhAn+Bt2oUpDRukrelyAYI70VgabessexwXDhCa473GAyMkIVUPFmuVryKZn/3a6QFKVemyyobI+TEGMQxsvpGRtPF1J4BjwWFwoJlniisSQYQE383O8ANs3S776HgNBpfq3iXpuq/D6AgkA2oRWhpsDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CIz0coqW; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CIz0coqW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743162800; x=1774698800;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=XPwyZJxbbxsZAIpLQwPXzVZP8yet2lvP8KTciYNjyWo=;
  b=CIz0coqWrPaDu1pL3pqIgDomlvOrvDBLQ3g3khp6gvKhfRC1IKfm31lO
   VkbvyG79NkbUzTcLb09bgMlJip4TljxRYX1mkD+NXoil26c3GAqG1zuBL
   Bj//8fqapvfFVB0guGIcS1MfOhusCXIdtp/58i25DM7ujoMNrisilNQe7
   IOYavgQEZJ/5mBRuKXQglZW9aCiiIlNobhokKVZAvZATfS6CufFa2d8jv
   2eQRON/IgnUtQ3L4JGyQvhdxAXB6aUboYnRP6nc6DYPcBGY1dhKWcGMIE
   bY+dj6ajM7XwZiM8EtRLSWkSbNnc+bdo/mfqYAKoovQFNaPizlvniAITj
   Q==;
X-CSE-ConnectionGUID: K/XMhCuRRPanqDGguhZcfQ==
X-CSE-MsgGUID: D2csHIrIRKyeqNxqV6aGmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55890213"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="55890213"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 04:53:19 -0700
X-CSE-ConnectionGUID: kVRiZHeiR+ai2JiUPso8OQ==
X-CSE-MsgGUID: qMNCZum4SlS4ornkP+DXQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125879050"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 04:53:16 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 13:53:13 +0200 (EET)
To: =?ISO-8859-2?Q?Micha=B3_Kope=E6?= <michal.kopec@3mdeb.com>
cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
    platform-driver-x86@vger.kernel.org, piotr.krol@3mdeb.com, 
    maciej.pijanowski@3mdeb.com
Subject: Re: [PATCH v2 1/1] platform/x86: Introduce dasharo-acpi platform
 driver
In-Reply-To: <20250327162113.571940-2-michal.kopec@3mdeb.com>
Message-ID: <b9f1c1a1-8a24-f0a6-e5e9-b35e99fac632@linux.intel.com>
References: <20250327162113.571940-1-michal.kopec@3mdeb.com> <20250327162113.571940-2-michal.kopec@3mdeb.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-827702470-1743162793=:932"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-827702470-1743162793=:932
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 27 Mar 2025, Micha=C5=82 Kope=C4=87 wrote:

> Introduce a driver for devices running Dasharo firmware. The driver
> supports thermal monitoring using a new ACPI interface in Dasharo. The
> initial version supports monitoring fan speeds, fan PWM duty cycles and
> system temperatures as well as determining which specific interfaces are
> implemented by firmware.
>=20
> It has been tested on a NovaCustom laptop running pre-release Dasharo
> firmware, which implements fan and thermal monitoring for the CPU and
> the discrete GPU, if present.
>=20
> Signed-off-by: Micha=C5=82 Kope=C4=87 <michal.kopec@3mdeb.com>
> ---
>  drivers/platform/x86/Kconfig        |  10 +
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/dasharo-acpi.c | 375 ++++++++++++++++++++++++++++
>  3 files changed, 388 insertions(+)
>  create mode 100644 drivers/platform/x86/dasharo-acpi.c
>=20
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..8168c5274a08 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1060,6 +1060,16 @@ config LENOVO_WMI_CAMERA
>  =09  To compile this driver as a module, choose M here: the module
>  =09  will be called lenovo-wmi-camera.
> =20
> +config DASHARO_ACPI
> +=09tristate "Dasharo ACPI Platform Driver"
> +=09depends on ACPI
> +=09depends on HWMON
> +=09help
> +=09  This driver provides HWMON support for devices running Dasharo
> +=09  firmware.
> +
> +=09  If you have a device with Dasharo firmware, choose Y or M here.
> +
>  source "drivers/platform/x86/x86-android-tablets/Kconfig"
> =20
>  config FW_ATTR_CLASS
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index e1b142947067..3ca53ae01d93 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -110,6 +110,9 @@ obj-$(CONFIG_ACPI_TOSHIBA)=09+=3D toshiba_acpi.o
>  # Inspur
>  obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)=09+=3D inspur_platform_profile.o
> =20
> +# Dasharo
> +obj-$(CONFIG_DASHARO_ACPI)=09+=3D dasharo-acpi.o
> +
>  # Laptop drivers
>  obj-$(CONFIG_ACPI_CMPC)=09=09+=3D classmate-laptop.o
>  obj-$(CONFIG_COMPAL_LAPTOP)=09+=3D compal-laptop.o
> diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/d=
asharo-acpi.c
> new file mode 100644
> index 000000000000..f1fbf7a9074d
> --- /dev/null
> +++ b/drivers/platform/x86/dasharo-acpi.c
> @@ -0,0 +1,375 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Dasharo ACPI Driver
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +
> +enum dasharo_feature {
> +=09DASHARO_FEATURE_TEMPERATURE =3D 0,
> +=09DASHARO_FEATURE_FAN_PWM,
> +=09DASHARO_FEATURE_FAN_TACH,
> +=09DASHARO_FEATURE_MAX,
> +};
> +
> +enum dasharo_temperature {
> +=09DASHARO_TEMPERATURE_CPU_PACKAGE =3D 0,
> +=09DASHARO_TEMPERATURE_CPU_CORE,
> +=09DASHARO_TEMPERATURE_GPU,
> +=09DASHARO_TEMPERATURE_BOARD,
> +=09DASHARO_TEMPERATURE_CHASSIS,
> +=09DASHARO_TEMPERATURE_MAX,
> +};
> +
> +enum dasharo_fan {
> +=09DASHARO_FAN_CPU =3D 0,
> +=09DASHARO_FAN_GPU,
> +=09DASHARO_FAN_CHASSIS,
> +=09DASHARO_FAN_MAX,
> +};
> +
> +#define MAX_GROUPS_PER_FEAT 8
> +
> +static char *dasharo_group_names[DASHARO_FEATURE_MAX][MAX_GROUPS_PER_FEA=
T] =3D {
> +=09[DASHARO_FEATURE_TEMPERATURE] =3D {
> +=09=09[DASHARO_TEMPERATURE_CPU_PACKAGE] =3D "CPU Package",
> +=09=09[DASHARO_TEMPERATURE_CPU_CORE] =3D "CPU Core",
> +=09=09[DASHARO_TEMPERATURE_GPU] =3D "GPU",
> +=09=09[DASHARO_TEMPERATURE_BOARD] =3D "Board",
> +=09=09[DASHARO_TEMPERATURE_CHASSIS] =3D "Chassis",
> +=09},
> +=09[DASHARO_FEATURE_FAN_PWM] =3D {
> +=09=09[DASHARO_FAN_CPU] =3D "CPU",
> +=09=09[DASHARO_FAN_GPU] =3D "GPU",
> +=09=09[DASHARO_FAN_CHASSIS] =3D "Chassis",
> +=09},
> +=09[DASHARO_FEATURE_FAN_TACH] =3D {
> +=09=09[DASHARO_FAN_CPU] =3D "CPU",
> +=09=09[DASHARO_FAN_GPU] =3D "GPU",
> +=09=09[DASHARO_FAN_CHASSIS] =3D "Chassis",
> +=09},
> +};
> +
> +#define MAX_CAP_NAME_LEN 16
> +
> +struct dasharo_capability {
> +=09int cap;
> +=09int index;
> +=09char name[MAX_CAP_NAME_LEN];
> +};
> +
> +#define MAX_CAPS_PER_FEAT 24
> +
> +struct dasharo_data {
> +=09struct acpi_device *acpi_dev;
> +=09int cap_counts[DASHARO_FEATURE_MAX];
> +=09struct dasharo_capability capabilities[DASHARO_FEATURE_MAX][MAX_CAPS_=
PER_FEAT];
> +=09struct device *hwmon;
> +};
> +
> +static int dasharo_get_feature_cap_count(struct dasharo_data *data, int =
feat, int cap)
> +{
> +=09struct acpi_object_list obj_list;
> +=09unsigned long long count =3D 0;
> +=09union acpi_object obj[2];
> +=09acpi_handle handle;
> +=09acpi_status status;
> +
> +=09obj[0].type =3D ACPI_TYPE_INTEGER;
> +=09obj[0].integer.value =3D feat;
> +=09obj[1].type =3D ACPI_TYPE_INTEGER;
> +=09obj[1].integer.value =3D cap;
> +=09obj_list.count =3D 2;
> +=09obj_list.pointer =3D &obj[0];
> +
> +=09handle =3D acpi_device_handle(data->acpi_dev);
> +=09status =3D acpi_evaluate_integer(handle, "GFCP", &obj_list, &count);
> +=09if (!ACPI_SUCCESS(status))
> +=09=09return -ENODEV;
> +
> +=09return count;
> +}
> +
> +static int dasharo_read_value_by_cap_idx(struct dasharo_data *data, char=
 *method, int cap, int index, long *value)
> +{
> +=09struct acpi_object_list obj_list;
> +=09unsigned long long val =3D 0;
> +=09union acpi_object obj[2];
> +=09acpi_handle handle;
> +=09acpi_status status;
> +
> +=09obj[0].type =3D ACPI_TYPE_INTEGER;
> +=09obj[0].integer.value =3D cap;
> +=09obj[1].type =3D ACPI_TYPE_INTEGER;
> +=09obj[1].integer.value =3D index;
> +=09obj_list.count =3D 2;
> +=09obj_list.pointer =3D &obj[0];
> +
> +=09handle =3D acpi_device_handle(data->acpi_dev);
> +=09status =3D acpi_evaluate_integer(handle, method, &obj_list, &val);
> +=09if (!ACPI_SUCCESS(status))
> +=09=09return -ENODEV;
> +
> +=09*value =3D val;
> +=09return val;
> +}
> +
> +static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +=09=09=09      u32 attr, int channel, long *val)
> +{
> +=09struct dasharo_data *data =3D dev_get_drvdata(dev);
> +=09int ret =3D 0;
> +=09long value;
> +
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09if (attr =3D=3D hwmon_temp_input) {
> +=09=09=09ret =3D dasharo_read_value_by_cap_idx(data,
> +=09=09=09=09"GTMP",
> +=09=09=09=09data->capabilities[DASHARO_FEATURE_TEMPERATURE][channel].cap=
,
> +=09=09=09=09data->capabilities[DASHARO_FEATURE_TEMPERATURE][channel].ind=
ex,
> +=09=09=09=09&value);
> +
> +=09=09=09if (ret > 0)
> +=09=09=09=09*val =3D value * 1000;
> +=09=09}
> +=09=09break;
> +=09case hwmon_fan:
> +=09=09if (attr =3D=3D hwmon_fan_input) {
> +=09=09=09ret =3D dasharo_read_value_by_cap_idx(data,
> +=09=09=09=09"GFTH",
> +=09=09=09=09data->capabilities[DASHARO_FEATURE_FAN_TACH][channel].cap,
> +=09=09=09=09data->capabilities[DASHARO_FEATURE_FAN_TACH][channel].index,
> +=09=09=09=09&value);
> +
> +=09=09=09if (ret > 0)
> +=09=09=09=09*val =3D value;

So now if ret =3D=3D 0, what that means? *val is not going to be filled and=
=20
this function will return 0 (=3D no error) so the caller assumes *val=20
contains a valid value which is incorrect.

> +=09=09}
> +=09=09break;
> +=09case hwmon_pwm:
> +=09=09if (attr =3D=3D hwmon_pwm_input) {
> +=09=09=09ret =3D dasharo_read_value_by_cap_idx(data,
> +=09=09=09=09"GFDC",
> +=09=09=09=09data->capabilities[DASHARO_FEATURE_FAN_PWM][channel].cap,
> +=09=09=09=09data->capabilities[DASHARO_FEATURE_FAN_PWM][channel].index,
> +=09=09=09=09&value);
> +
> +=09=09=09if (ret > 0)
> +=09=09=09=09*val =3D value;
> +=09=09}
> +=09=09break;
> +=09default:
> +=09=09break;

Should this return an error?

> +=09}
> +
> +=09return 0;
> +}
> +
> +static int dasharo_hwmon_read_string(struct device *dev, enum hwmon_sens=
or_types type,
> +=09=09=09=09     u32 attr, int channel, const char **str)
> +{
> +=09struct dasharo_data *data =3D dev_get_drvdata(dev);
> +
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09if (attr =3D=3D hwmon_temp_label && channel < data->cap_counts[DAS=
HARO_FEATURE_TEMPERATURE])
> +=09=09*str =3D data->capabilities[DASHARO_FEATURE_TEMPERATURE][channel].=
name;
> +=09=09break;
> +=09case hwmon_fan:
> +=09=09if (attr =3D=3D hwmon_fan_label && channel < data->cap_counts[DASH=
ARO_FEATURE_FAN_TACH])
> +=09=09*str =3D data->capabilities[DASHARO_FEATURE_FAN_TACH][channel].nam=
e;
> +=09=09break;
> +=09default:
> +=09=09return -EOPNOTSUPP;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_=
sensor_types type,
> +=09=09=09=09=09u32 attr, int channel)
> +{
> +=09const struct dasharo_data *data =3D drvdata;
> +
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09if (channel < data->cap_counts[DASHARO_FEATURE_TEMPERATURE])
> +=09=09=09return 0444;
> +=09=09break;
> +=09case hwmon_pwm:
> +=09=09if (channel < data->cap_counts[DASHARO_FEATURE_FAN_PWM])
> +=09=09=09return 0444;
> +=09=09break;
> +=09case hwmon_fan:
> +=09=09if (channel < data->cap_counts[DASHARO_FEATURE_FAN_TACH])
> +=09=09=09return 0444;
> +=09=09break;
> +=09default:
> +=09=09break;
> +=09}
> +
> +=09return 0;
> +}
> +static const struct hwmon_ops dasharo_hwmon_ops =3D {
> +=09.is_visible =3D dasharo_hwmon_is_visible,
> +=09.read_string =3D dasharo_hwmon_read_string,
> +=09.read =3D dasharo_hwmon_read,
> +};
> +
> +// Max 24 capabilities per feature
> +static const struct hwmon_channel_info * const dasharo_hwmon_info[] =3D =
{
> +=09HWMON_CHANNEL_INFO(fan,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL,
> +=09=09HWMON_F_INPUT | HWMON_F_LABEL),
> +=09HWMON_CHANNEL_INFO(temp,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09HWMON_T_INPUT | HWMON_T_LABEL),
> +=09HWMON_CHANNEL_INFO(pwm,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT,
> +=09=09HWMON_PWM_INPUT),
> +=09NULL
> +};
> +
> +static const struct hwmon_chip_info dasharo_hwmon_chip_info =3D {
> +=09.ops =3D &dasharo_hwmon_ops,
> +=09.info =3D dasharo_hwmon_info,
> +};
> +
> +static void dasharo_fill_feature_caps(struct dasharo_data *data, int fea=
t)
> +{
> +=09int cap_count =3D 0;
> +=09int count =3D 0;

I'd suggest trying to come with better names as these "count" also means=20
"cap count" currently. Maybe rename cap_count to total_caps or found_caps

> +
> +=09for (int group =3D 0; group < MAX_GROUPS_PER_FEAT; ++group) {

unsigned int

> +=09=09count =3D dasharo_get_feature_cap_count(data, feat, group);
> +
> +=09=09for (unsigned int i =3D 0; i < count && cap_count < MAX_CAPS_PER_F=
EAT; ++i) {
> +=09=09=09data->capabilities[feat][cap_count].cap =3D group;
> +=09=09=09data->capabilities[feat][cap_count].index =3D i;

Please add the local variable so you don't have to repeat=20
data->capabilities[feat][cap_count].

> +=09=09=09scnprintf(data->capabilities[feat][cap_count].name, MAX_CAP_NAM=
E_LEN, "%s %d", dasharo_group_names[feat][group], i);
> +=09=09=09cap_count++;
> +=09=09}
> +=09}
> +=09data->cap_counts[feat] =3D cap_count;
> +}
> +
> +static int dasharo_add(struct acpi_device *acpi_dev)
> +{
> +=09struct dasharo_data *data;
> +
> +=09data =3D devm_kzalloc(&acpi_dev->dev, sizeof(*data), GFP_KERNEL);
> +=09if (!data)
> +=09=09return -ENOMEM;
> +=09acpi_dev->driver_data =3D data;
> +=09data->acpi_dev =3D acpi_dev;
> +
> +=09for (unsigned int i =3D 0; i < DASHARO_FEATURE_MAX; ++i) {
> +=09=09dasharo_fill_feature_caps(data, i);
> +=09}
> +
> +=09data->hwmon =3D devm_hwmon_device_register_with_info(&acpi_dev->dev,
> +=09=09"dasharo_acpi", data, &dasharo_hwmon_chip_info, NULL);
> +
> +=09return 0;
> +}
> +
> +static void dasharo_remove(struct acpi_device *acpi_dev)
> +{
> +=09struct dasharo_data *data =3D acpi_driver_data(acpi_dev);
> +
> +=09hwmon_device_unregister(data->hwmon);
> +}
> +
> +static const struct acpi_device_id device_ids[] =3D {
> +=09{"DSHR0001", 0},
> +=09{}
> +};
> +MODULE_DEVICE_TABLE(acpi, device_ids);
> +
> +static struct acpi_driver dasharo_driver =3D {
> +=09.name =3D "Dasharo ACPI Driver",
> +=09.class =3D "Dasharo",
> +=09.ids =3D device_ids,
> +=09.ops =3D {
> +=09=09.add =3D dasharo_add,
> +=09=09.remove =3D dasharo_remove,
> +=09},
> +};
> +module_acpi_driver(dasharo_driver);
> +
> +MODULE_DESCRIPTION("Dasharo ACPI Driver");
> +MODULE_AUTHOR("Micha=C5=82 Kope=C4=87 <michal.kopec@3mdeb.com>");
> +MODULE_LICENSE("GPL");
>=20

--=20
 i.

--8323328-827702470-1743162793=:932--
