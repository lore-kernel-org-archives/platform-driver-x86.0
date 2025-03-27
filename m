Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7496282E1
	for <platform-driver-x86@vger.kernel.org>; Thu, 27 Mar 2025 13:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081583; cv=none; b=HaeB38HSQbRAluJ4OcBj6Hr0X9A/5lDDklFYSAsrXzrPLXb5p7JD9QnkXbTXf/i0x1UN50nG5m52keJ2YX8puxpWSufAJuQf71yQsusbEQSUbtjOQt42QU9MWoUDflBB1Q9sbMlROmz/sqddrX/ogoxigE8me7UAx9NCwpjH8ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081583; c=relaxed/simple;
	bh=cAyz5A0uv0OYvydZYpSkTVdZ2jlEeIzYd17Bu8aDCZQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=jbkMrGf7J4lbIDGTWT1Qfiu7UMf5gDCUaZDiy3pdtc9EveqmJbv5MnP90GXL8sKLM8nOcWzXbrGUhCg2VNSJfiS2jFBDiJQhFMApCxYTkNdL3SpiEG+JUI2bi3xkgLFZw+DgGCchbSyzxYI5QFCrSn0/kqGhg3r3bmMi3lIllWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dhViZvZ0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dhViZvZ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743081582; x=1774617582;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=cAyz5A0uv0OYvydZYpSkTVdZ2jlEeIzYd17Bu8aDCZQ=;
  b=dhViZvZ0u88W3fq59pZKDeRnxkVRG4hqLeD2tm8urcNZYLlHFwQ86SXM
   G/NB1aHxrZoAyVBwq3GsPHM3l1wKjzeOJjNSVuYFpPsTfcdWrOKbMAPxd
   1SHFYCZcDnLngTSdmFYdnliBrrVwIaM5wxwRLwwOxHiTY2DRlBAAtmtTK
   T1sFDopWpRWOe4jdPNS0m5TZHKiUJv5KToJWP7To7EilVy2uMhcEvqp08
   c4WR6dbLRsukYLv//rU/Iw+O0gC1e8rUlluk/47MATyvRxMHMaB4vbbXZ
   eyWu4RRG5vKDvgi36rS4ur8maW94FCCj/bRYbdB0O3YZ/juexF+9W/6Di
   A==;
X-CSE-ConnectionGUID: pCq7A3FHTE2rKoXJAPnFow==
X-CSE-MsgGUID: A48QcPC4RTyg+X9tCcB1JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44428392"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="44428392"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 06:19:40 -0700
X-CSE-ConnectionGUID: hSIZ8CODTGOuVggw/pnliw==
X-CSE-MsgGUID: SZKZpXfpQSqSyACY3x0CdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="125356125"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.180])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 06:19:38 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 27 Mar 2025 15:19:34 +0200 (EET)
To: =?ISO-8859-2?Q?Micha=B3_Kope=E6?= <michal.kopec@3mdeb.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    piotr.krol@3mdeb.com, maciej.pijanowski@3mdeb.com
Subject: Re: [PATCH 1/1] platform/x86: Introduce dasharo-acpi platform
 driver
In-Reply-To: <20250327113634.314746-2-michal.kopec@3mdeb.com>
Message-ID: <0d56dbf3-1ca7-ecc5-fe21-4cad6113ab36@linux.intel.com>
References: <20250327113634.314746-1-michal.kopec@3mdeb.com> <20250327113634.314746-2-michal.kopec@3mdeb.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1772403479-1743081274=:927"
Content-ID: <cddfb2ba-69aa-137f-b76a-5aaa8601964b@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1772403479-1743081274=:927
Content-Type: text/plain; CHARSET=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <ffb798ad-19ab-584f-cf43-6648a01bf66e@linux.intel.com>

On Thu, 27 Mar 2025, Micha=B3 Kope=E6 wrote:

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
> Signed-off-by: Micha=B3 Kope=E6 <michal.kopec@3mdeb.com>
> ---
>  drivers/platform/x86/Kconfig        |  10 +
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/dasharo-acpi.c | 399 ++++++++++++++++++++++++++++
>  3 files changed, 412 insertions(+)
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
> index 000000000000..0f3bdf6bd463
> --- /dev/null
> +++ b/drivers/platform/x86/dasharo-acpi.c
> @@ -0,0 +1,399 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Dasharo ACPI Driver
> + *
> + * Copyright (C) 2025 3mdeb Sp. z o.o.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.

SPDX header covers the licensing already so please drop the license text.

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
> +=09DASHARO_FEATURE_FAN_POINTS,
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
> +static char *dasharo_temp_group_name[DASHARO_TEMPERATURE_MAX] =3D {
> +=09[DASHARO_TEMPERATURE_CPU_PACKAGE] =3D "CPU Package",
> +=09[DASHARO_TEMPERATURE_CPU_CORE] =3D "CPU Core",
> +=09[DASHARO_TEMPERATURE_GPU] =3D "GPU",
> +=09[DASHARO_TEMPERATURE_BOARD] =3D "Board",
> +=09[DASHARO_TEMPERATURE_CHASSIS] =3D "Chassis",
> +};
> +
> +static char *dasharo_fan_group_name[DASHARO_FAN_MAX] =3D {
> +=09[DASHARO_FAN_CPU] =3D "CPU",
> +=09[DASHARO_FAN_GPU] =3D "GPU",
> +=09[DASHARO_FAN_CHASSIS] =3D "Chassis",
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
> +=09int sensors_count;
> +=09int fan_tachs_count;
> +=09int fan_pwms_count;
> +=09struct dasharo_capability sensors[MAX_CAPS_PER_FEAT];
> +=09struct dasharo_capability fan_tachs[MAX_CAPS_PER_FEAT];
> +=09struct dasharo_capability fan_pwms[MAX_CAPS_PER_FEAT];
> +=09struct device *hwmon;
> +};
> +
> +static int dasharo_get_feature_cap_count(struct dasharo_data *data, int =
feat, int cap)
> +{
> +=09union acpi_object obj[2];
> +=09struct acpi_object_list obj_list;
> +=09acpi_handle handle;
> +=09acpi_status status;
> +=09unsigned long long ret =3D 0;

I think it's bad idea to make "ret" unsigned as people expect it to be=20
int (or ssize_t) so please use some other name.

Please also try to order the variables to reverse-xmas tree order=20
(longest line first). If there are internal dependencies, you may violate=
=20
the ordering in that case.

> +=09obj[0].type =3D ACPI_TYPE_INTEGER;
> +=09obj[0].integer.value =3D feat;
> +=09obj[1].type =3D ACPI_TYPE_INTEGER;
> +=09obj[1].integer.value =3D cap;
> +=09obj_list.count =3D 2;
> +=09obj_list.pointer =3D &obj[0];
> +
> +=09handle =3D acpi_device_handle(data->acpi_dev);
> +=09status =3D acpi_evaluate_integer(handle, "GFCP", &obj_list, &ret);
> +=09if (ACPI_SUCCESS(status))
> +=09=09return ret;
> +=09return -ENODEV;

Please reverse the logic so that error handling occurs first.

> +}
> +
> +static int dasharo_read_value_by_cap_idx(struct dasharo_data *data, char=
 *method, int cap, int index, long *value)
> +{
> +=09union acpi_object obj[2];
> +=09struct acpi_object_list obj_list;
> +=09acpi_handle handle;
> +=09acpi_status status;
> +=09unsigned long long ret =3D 0;
> +
> +=09obj[0].type =3D ACPI_TYPE_INTEGER;
> +=09obj[0].integer.value =3D cap;
> +=09obj[1].type =3D ACPI_TYPE_INTEGER;
> +=09obj[1].integer.value =3D index;
> +=09obj_list.count =3D 2;
> +=09obj_list.pointer =3D &obj[0];
> +
> +=09handle =3D acpi_device_handle(data->acpi_dev);
> +=09status =3D acpi_evaluate_integer(handle, method, &obj_list, &ret);
> +=09if (ACPI_SUCCESS(status)) {
> +=09=09*value =3D ret;
> +=09=09return ret;
> +=09}
> +=09return -ENODEV;
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
> +=09if (type =3D=3D hwmon_temp) {
> +=09=09if (attr =3D=3D hwmon_temp_input) {
> +=09=09=09ret =3D dasharo_read_value_by_cap_idx(data,
> +=09=09=09=09=09=09=09    "GTMP",
> +=09=09=09=09=09=09=09    data->sensors[channel].cap,
> +=09=09=09=09=09=09=09    data->sensors[channel].index,
> +=09=09=09=09=09=09=09    &value);
> +
> +=09=09=09if (ret > 0)
> +=09=09=09=09*val =3D value * 1000;
> +=09=09}
> +=09} else if (type =3D=3D hwmon_fan) {
> +=09=09if (attr =3D=3D hwmon_fan_input) {
> +=09=09=09ret =3D dasharo_read_value_by_cap_idx(data,
> +=09=09=09=09=09=09=09    "GFTH",
> +=09=09=09=09=09=09=09    data->fan_tachs[channel].cap,
> +=09=09=09=09=09=09=09    data->fan_tachs[channel].index,
> +=09=09=09=09=09=09=09    &value);
> +
> +=09=09=09if (ret > 0)
> +=09=09=09=09*val =3D value;
> +=09=09}
> +=09} else if (type =3D=3D hwmon_pwm) {
> +=09=09if (attr =3D=3D hwmon_pwm_input) {
> +=09=09=09ret =3D dasharo_read_value_by_cap_idx(data,
> +=09=09=09=09=09=09=09    "GFDC",
> +=09=09=09=09=09=09=09    data->fan_tachs[channel].cap,
> +=09=09=09=09=09=09=09    data->fan_tachs[channel].index,
> +=09=09=09=09=09=09=09    &value);
> +
> +=09=09=09if (ret > 0)
> +=09=09=09=09*val =3D value;
> +=09=09}
> +=09}

Convert to switch/case.

> +
> +=09return ret;

This is probably wrong, should you really return positive values from this=
=20
function??

> +}
> +
> +static int dasharo_hwmon_read_string(struct device *dev, enum hwmon_sens=
or_types type,
> +=09=09=09=09     u32 attr, int channel, const char **str)
> +{
> +=09struct dasharo_data *data =3D dev_get_drvdata(dev);
> +
> +=09if (channel < data->sensors_count && type =3D=3D hwmon_temp && attr =
=3D=3D hwmon_temp_label) {
> +=09=09*str =3D data->sensors[channel].name;
> +=09=09return 0;
> +=09} else if (channel < data->fan_tachs_count && type =3D=3D hwmon_fan &=
& attr =3D=3D hwmon_fan_label) {
> +=09=09*str =3D data->fan_tachs[channel].name;
> +=09=09return 0;
> +=09}

Please make a switch/case out of type.

> +
> +=09return -EOPNOTSUPP;
> +}
> +
> +static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_=
sensor_types type,
> +=09=09=09=09=09u32 attr, int channel)
> +{
> +=09const struct dasharo_data *data =3D drvdata;
> +
> +=09if (channel < data->sensors_count && type =3D=3D hwmon_temp)
> +=09=09return 0444;
> +
> +=09if (channel < data->fan_pwms_count && type =3D=3D hwmon_pwm)
> +=09=09return 0444;
> +
> +=09if (channel < data->fan_tachs_count && type =3D=3D hwmon_fan)
> +=09=09return 0444;

Please make switch/case from type.

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
> +static void dasharo_fill_sensors(struct dasharo_data *data)
> +{
> +=09int group =3D 0;
> +=09int count =3D 0;
> +
> +=09while (group < DASHARO_TEMPERATURE_MAX) {

Convert to for loop.

> +=09=09count =3D dasharo_get_feature_cap_count(data, DASHARO_FEATURE_TEMP=
ERATURE, group);
> +
> +=09=09for (int i =3D 0; i < count && data->sensors_count < MAX_CAPS_PER_=
FEAT; ++i) {

Use unsigned type for i.

> +=09=09=09data->sensors[data->sensors_count].cap =3D group;
> +=09=09=09data->sensors[data->sensors_count].index =3D i;

Please add a local variable for data->sensors[data->sensors_count].

> +=09=09=09snprintf(data->sensors[data->sensors_count].name, MAX_CAP_NAME_=
LEN, "%s %d", dasharo_temp_group_name[group], i);

Even if you don't use the return value, please use scnprintf().

> +=09=09=09data->sensors_count++;
> +=09=09}
> +
> +=09=09group++;
> +=09}
> +}
> +
> +static void dasharo_fill_fan_tachs(struct dasharo_data *data)
> +{
> +=09int group =3D 0;
> +=09int count =3D 0;
> +
> +=09while (group < DASHARO_FAN_MAX) {
> +=09=09count =3D dasharo_get_feature_cap_count(data, DASHARO_FEATURE_FAN_=
TACH, group);
> +
> +=09=09for (int i =3D 0; i < count && data->fan_tachs_count < MAX_CAPS_PE=
R_FEAT; ++i) {
> +=09=09=09data->fan_tachs[data->fan_tachs_count].cap =3D group;
> +=09=09=09data->fan_tachs[data->fan_tachs_count].index =3D i;
> +=09=09=09snprintf(data->fan_tachs[data->fan_tachs_count].name, MAX_CAP_N=
AME_LEN, "%s %d", dasharo_fan_group_name[group], i);
> +=09=09=09data->fan_tachs_count++;
> +=09=09}
> +
> +=09=09group++;
> +=09}

Ditto.

> +}
> +
> +static void dasharo_fill_fan_pwms(struct dasharo_data *data)
> +{
> +=09int group =3D 0;
> +=09int count =3D 0;
> +
> +=09while (group < DASHARO_FAN_MAX) {
> +=09=09count =3D dasharo_get_feature_cap_count(data, DASHARO_FEATURE_FAN_=
PWM, group);
> +
> +=09=09for (int i =3D 0; i < count && data->fan_pwms_count < MAX_CAPS_PER=
_FEAT; ++i) {
> +=09=09=09data->fan_pwms[data->fan_pwms_count].cap =3D group;
> +=09=09=09data->fan_pwms[data->fan_pwms_count].index =3D i;
> +=09=09=09snprintf(data->fan_pwms[data->fan_pwms_count].name, MAX_CAP_NAM=
E_LEN, "%s %d", dasharo_fan_group_name[group], i);
> +=09=09=09data->fan_pwms_count++;
> +=09=09}
> +
> +=09=09group++;
> +=09}

Hmm, is all the code duplication really necessary or could a helper be=20
created with parameters to cover the variations?

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
> +=09pr_info("Dasharo driver loading\n");

Please keep the "ok" path silent.

> +
> +=09dasharo_fill_sensors(data);
> +=09dasharo_fill_fan_tachs(data);
> +=09dasharo_fill_fan_pwms(data);
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
> +=09{"", 0},

{ } is enough for the terminator entry, also note the lack of ,.

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
> +MODULE_AUTHOR("Micha=B3 Kope=E6 <michal.kopec@3mdeb.com>");
> +MODULE_LICENSE("GPL");
>=20

--=20
 i.
--8323328-1772403479-1743081274=:927--
