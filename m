Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2BD2F24
	for <platform-driver-x86@vger.kernel.org>; Sun, 30 Mar 2025 16:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743353333; cv=none; b=Bo6zSbJANd0IbSFkxkkHgUVnJyK9uK4RiALmBWch1IL6/WahfWc1ojvJhcrAjsWW/A204Jp+7LIQnCuaD69cjKtykpXuUWyPhLInlcNJopTFdxafeoOhjvKi43J+rUJmNI/B1RIgCNe546luazOjW4S+ccRZcDbU1QW4nVGU+Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743353333; c=relaxed/simple;
	bh=9d0zXXojNpHIilMMtC/GPpVJ669hL1VYTupbogzHR0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3+7QyNSonGAQXWQbiCoqh1pJjdpoTDAAfooU5R5fTss+lOjFRnwldYmAIlMSdgY5qoFsI1IxLWrNRraXSVzgIgzg3Nd472ZvOqW5fHcW+TqaxMKgpjZcW2uIFNI0HQeNVLOd808dlipdsFcCB9l5n52Li9s9p2usZSdGdaYSvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=jM7U8y9c; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="jM7U8y9c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1743353317;
	bh=9d0zXXojNpHIilMMtC/GPpVJ669hL1VYTupbogzHR0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jM7U8y9cOkwL6GjdTSXoIAJ3Yx953hG+Hw7SU8+2CZR800Wn5kb1aIsmfmAiuvDsF
	 ZAolGGGk7h+jY/+TNTUorOTfoKE7v0RCdRtqamE4+z2qhnjOfUMDm2s4ge4K45XUhe
	 6bk5dvm6WFFl8AURVm8R0J74Y8A/SLx24vvdikyk=
Date: Sun, 30 Mar 2025 18:48:37 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: =?utf-8?B?TWljaGHFgiBLb3BlxIc=?= <michal.kopec@3mdeb.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, 
	tomasz.pakula.oficjalny@gmail.com, platform-driver-x86@vger.kernel.org, piotr.krol@3mdeb.com, 
	maciej.pijanowski@3mdeb.com
Subject: Re: [PATCH v3 1/1] platform/x86: Introduce dasharo-acpi platform
 driver
Message-ID: <01916112-6553-47d8-b06d-37890461a883@t-8ch.de>
References: <20250328140344.1304995-1-michal.kopec@3mdeb.com>
 <20250328140344.1304995-2-michal.kopec@3mdeb.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328140344.1304995-2-michal.kopec@3mdeb.com>

On 2025-03-28 15:03:44+0100, Michał Kopeć wrote:
> Introduce a driver for devices running Dasharo firmware. The driver
> supports thermal monitoring using a new ACPI interface in Dasharo. The
> initial version supports monitoring fan speeds, fan PWM duty cycles and
> system temperatures as well as determining which specific interfaces are
> implemented by firmware.
> 
> It has been tested on a NovaCustom laptop running pre-release Dasharo
> firmware, which implements fan and thermal monitoring for the CPU and
> the discrete GPU, if present.

This patch should also be sent to the hwmon maintainers.
"HARDWARE MONITORING" in MAINTAINERS.

> 
> Signed-off-by: Michał Kopeć <michal.kopec@3mdeb.com>
> ---
>  drivers/platform/x86/Kconfig        |  10 +
>  drivers/platform/x86/Makefile       |   3 +
>  drivers/platform/x86/dasharo-acpi.c | 375 ++++++++++++++++++++++++++++

A MAINTAINERS entry is missing.

>  3 files changed, 388 insertions(+)
>  create mode 100644 drivers/platform/x86/dasharo-acpi.c
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0258dd879d64..8168c5274a08 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1060,6 +1060,16 @@ config LENOVO_WMI_CAMERA
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called lenovo-wmi-camera.
>  
> +config DASHARO_ACPI
> +	tristate "Dasharo ACPI Platform Driver"
> +	depends on ACPI
> +	depends on HWMON
> +	help
> +	  This driver provides HWMON support for devices running Dasharo
> +	  firmware.
> +
> +	  If you have a device with Dasharo firmware, choose Y or M here.
> +
>  source "drivers/platform/x86/x86-android-tablets/Kconfig"
>  
>  config FW_ATTR_CLASS
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index e1b142947067..3ca53ae01d93 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -110,6 +110,9 @@ obj-$(CONFIG_ACPI_TOSHIBA)	+= toshiba_acpi.o
>  # Inspur
>  obj-$(CONFIG_INSPUR_PLATFORM_PROFILE)	+= inspur_platform_profile.o
>  
> +# Dasharo
> +obj-$(CONFIG_DASHARO_ACPI)	+= dasharo-acpi.o
> +
>  # Laptop drivers
>  obj-$(CONFIG_ACPI_CMPC)		+= classmate-laptop.o
>  obj-$(CONFIG_COMPAL_LAPTOP)	+= compal-laptop.o
> diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
> new file mode 100644
> index 000000000000..a18e2ea52117
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

hwmon-sysfs.h, sysfs.h and init.h seem unnecessary.

> +
> +enum dasharo_feature {
> +	DASHARO_FEATURE_TEMPERATURE = 0,
> +	DASHARO_FEATURE_FAN_PWM,
> +	DASHARO_FEATURE_FAN_TACH,
> +	DASHARO_FEATURE_MAX,
> +};
> +
> +enum dasharo_temperature {
> +	DASHARO_TEMPERATURE_CPU_PACKAGE = 0,
> +	DASHARO_TEMPERATURE_CPU_CORE,
> +	DASHARO_TEMPERATURE_GPU,
> +	DASHARO_TEMPERATURE_BOARD,
> +	DASHARO_TEMPERATURE_CHASSIS,
> +	DASHARO_TEMPERATURE_MAX,
> +};
> +
> +enum dasharo_fan {
> +	DASHARO_FAN_CPU = 0,
> +	DASHARO_FAN_GPU,
> +	DASHARO_FAN_CHASSIS,
> +	DASHARO_FAN_MAX,
> +};
> +
> +#define MAX_GROUPS_PER_FEAT 8
> +
> +static char *dasharo_group_names[DASHARO_FEATURE_MAX][MAX_GROUPS_PER_FEAT] = {

static const *char const

> +	[DASHARO_FEATURE_TEMPERATURE] = {
> +		[DASHARO_TEMPERATURE_CPU_PACKAGE] = "CPU Package",
> +		[DASHARO_TEMPERATURE_CPU_CORE] = "CPU Core",
> +		[DASHARO_TEMPERATURE_GPU] = "GPU",
> +		[DASHARO_TEMPERATURE_BOARD] = "Board",
> +		[DASHARO_TEMPERATURE_CHASSIS] = "Chassis",
> +	},
> +	[DASHARO_FEATURE_FAN_PWM] = {
> +		[DASHARO_FAN_CPU] = "CPU",
> +		[DASHARO_FAN_GPU] = "GPU",
> +		[DASHARO_FAN_CHASSIS] = "Chassis",
> +	},
> +	[DASHARO_FEATURE_FAN_TACH] = {
> +		[DASHARO_FAN_CPU] = "CPU",
> +		[DASHARO_FAN_GPU] = "GPU",
> +		[DASHARO_FAN_CHASSIS] = "Chassis",
> +	},
> +};
> +
> +#define MAX_CAP_NAME_LEN 16
> +
> +struct dasharo_capability {
> +	int cap;
> +	int index;
> +	char name[MAX_CAP_NAME_LEN];
> +};
> +
> +#define MAX_CAPS_PER_FEAT 24
> +
> +struct dasharo_data {
> +	struct acpi_device *acpi_dev;
> +	int cap_counts[DASHARO_FEATURE_MAX];
> +	struct dasharo_capability capabilities[DASHARO_FEATURE_MAX][MAX_CAPS_PER_FEAT];
> +	struct device *hwmon;
> +};
> +
> +static int dasharo_get_feature_cap_count(struct dasharo_data *data, int feat, int cap)

The "feat" argument could be an "enum dasharo_feature".

> +{
> +	struct acpi_object_list obj_list;
> +	unsigned long long count = 0;

u64, also no need to initialize it.

> +	union acpi_object obj[2];
> +	acpi_handle handle;
> +	acpi_status status;
> +
> +	obj[0].type = ACPI_TYPE_INTEGER;
> +	obj[0].integer.value = feat;
> +	obj[1].type = ACPI_TYPE_INTEGER;
> +	obj[1].integer.value = cap;
> +	obj_list.count = 2;
> +	obj_list.pointer = &obj[0];
> +
> +	handle = acpi_device_handle(data->acpi_dev);
> +	status = acpi_evaluate_integer(handle, "GFCP", &obj_list, &count);
> +	if (!ACPI_SUCCESS(status))
> +		return -ENODEV;
> +
> +	return count;
> +}
> +
> +static int dasharo_read_channel(struct dasharo_data *data, char *method, int feat, int channel, long *value)
> +{
> +	struct acpi_object_list obj_list;
> +	unsigned long long val = 0;

Same as above.

> +	union acpi_object obj[2];
> +	acpi_handle handle;
> +	acpi_status status;
> +
> +	obj[0].type = ACPI_TYPE_INTEGER;
> +	obj[0].integer.value = data->capabilities[feat][channel].cap;
> +	obj[1].type = ACPI_TYPE_INTEGER;
> +	obj[1].integer.value = data->capabilities[feat][channel].index;
> +	obj_list.count = 2;
> +	obj_list.pointer = &obj[0];
> +
> +	handle = acpi_device_handle(data->acpi_dev);
> +	status = acpi_evaluate_integer(handle, method, &obj_list, &val);
> +	if (!ACPI_SUCCESS(status))
> +		return -ENODEV;
> +
> +	*value = val;
> +	return val;

This return value protocol is weird.
Are negative values not valid?
Return "0" on success.

> +}
> +
> +static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
> +			      u32 attr, int channel, long *val)
> +{
> +	struct dasharo_data *data = dev_get_drvdata(dev);
> +	int ret = 0;

No need to initialize this.

> +	long value;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr == hwmon_temp_input) {
> +			ret = dasharo_read_channel(data,
> +				"GTMP",
> +				DASHARO_FEATURE_TEMPERATURE,
> +				channel,
> +				&value);

Unnecessary linebreaks. Use the 100 columns.

> +
> +			if (ret > 0)

Is ret == 0 not valid?

> +				*val = value * 1000;
> +		}
> +		break;
> +	case hwmon_fan:
> +		if (attr == hwmon_fan_input) {
> +			ret = dasharo_read_channel(data,
> +				"GFTH",
> +				DASHARO_FEATURE_FAN_TACH,
> +				channel,
> +				&value);
> +
> +			if (ret > 0)
> +				*val = value;
> +		}
> +		break;
> +	case hwmon_pwm:
> +		if (attr == hwmon_pwm_input) {
> +			ret = dasharo_read_channel(data,
> +				"GFDC",
> +				DASHARO_FEATURE_FAN_PWM,
> +				channel,
> +				&value);
> +
> +			if (ret > 0)
> +				*val = value;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dasharo_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
> +				     u32 attr, int channel, const char **str)
> +{
> +	struct dasharo_data *data = dev_get_drvdata(dev);
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (attr == hwmon_temp_label && channel < data->cap_counts[DASHARO_FEATURE_TEMPERATURE])
> +		*str = data->capabilities[DASHARO_FEATURE_TEMPERATURE][channel].name;

Broken indentation.

> +		break;
> +	case hwmon_fan:
> +		if (attr == hwmon_fan_label && channel < data->cap_counts[DASHARO_FEATURE_FAN_TACH])
> +		*str = data->capabilities[DASHARO_FEATURE_FAN_TACH][channel].name;

Same.

> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static umode_t dasharo_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
> +					u32 attr, int channel)
> +{
> +	const struct dasharo_data *data = drvdata;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		if (channel < data->cap_counts[DASHARO_FEATURE_TEMPERATURE])
> +			return 0444;
> +		break;
> +	case hwmon_pwm:
> +		if (channel < data->cap_counts[DASHARO_FEATURE_FAN_PWM])
> +			return 0444;
> +		break;
> +	case hwmon_fan:
> +		if (channel < data->cap_counts[DASHARO_FEATURE_FAN_TACH])
> +			return 0444;
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}

Missing empty line.

> +static const struct hwmon_ops dasharo_hwmon_ops = {
> +	.is_visible = dasharo_hwmon_is_visible,
> +	.read_string = dasharo_hwmon_read_string,
> +	.read = dasharo_hwmon_read,
> +};
> +
> +// Max 24 capabilities per feature
> +static const struct hwmon_channel_info * const dasharo_hwmon_info[] = {
> +	HWMON_CHANNEL_INFO(fan,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL,
> +		HWMON_F_INPUT | HWMON_F_LABEL),
> +	HWMON_CHANNEL_INFO(temp,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL,
> +		HWMON_T_INPUT | HWMON_T_LABEL),
> +	HWMON_CHANNEL_INFO(pwm,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT,
> +		HWMON_PWM_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_chip_info dasharo_hwmon_chip_info = {
> +	.ops = &dasharo_hwmon_ops,
> +	.info = dasharo_hwmon_info,
> +};
> +
> +static void dasharo_fill_feature_caps(struct dasharo_data *data, int feat)
> +{
> +	int cap_count = 0;
> +	int count = 0;

No need to initialize.

> +
> +	for (int group = 0; group < MAX_GROUPS_PER_FEAT; ++group) {
> +		count = dasharo_get_feature_cap_count(data, feat, group);

Check the result

> +
> +		for (unsigned int i = 0; i < count && cap_count < MAX_CAPS_PER_FEAT; ++i) {

ARRAY_SIZE()

> +			data->capabilities[feat][cap_count].cap = group;
> +			data->capabilities[feat][cap_count].index = i;
> +			scnprintf(data->capabilities[feat][cap_count].name, MAX_CAP_NAME_LEN, "%s %d", dasharo_group_names[feat][group], i);

Use sizeof() for the length. Then you can also drop the define.

> +			cap_count++;
> +		}
> +	}
> +	data->cap_counts[feat] = cap_count;
> +}
> +
> +static int dasharo_add(struct acpi_device *acpi_dev)
> +{
> +	struct dasharo_data *data;
> +
> +	data = devm_kzalloc(&acpi_dev->dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +	acpi_dev->driver_data = data;

When the .remove handler is gone (see below), this is not necessary
anymore.

> +	data->acpi_dev = acpi_dev;
> +
> +	for (unsigned int i = 0; i < DASHARO_FEATURE_MAX; ++i) {
> +		dasharo_fill_feature_caps(data, i);
> +	}

No need for braces.

> +
> +	data->hwmon = devm_hwmon_device_register_with_info(&acpi_dev->dev,
> +		"dasharo_acpi", data, &dasharo_hwmon_chip_info, NULL);

Check for error.

When .remove is gone, there is no need for the "hwmon" entry in the
private struct.

> +
> +	return 0;
> +}
> +
> +static void dasharo_remove(struct acpi_device *acpi_dev)
> +{
> +	struct dasharo_data *data = acpi_driver_data(acpi_dev);
> +
> +	hwmon_device_unregister(data->hwmon);

devm_hwmon_decice_register_with_info() automatically takes care of
unregistering. Drop the remove handler.

> +}
> +
> +static const struct acpi_device_id device_ids[] = {

Use "dasharo_" prefix.

> +	{"DSHR0001", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, device_ids);
> +
> +static struct acpi_driver dasharo_driver = {
> +	.name = "Dasharo ACPI Driver",
> +	.class = "Dasharo",
> +	.ids = device_ids,
> +	.ops = {
> +		.add = dasharo_add,
> +		.remove = dasharo_remove,
> +	},
> +};
> +module_acpi_driver(dasharo_driver);

struct acpi_driver is being deprecated.
The replacement is a 'struct platform_driver'.

> +
> +MODULE_DESCRIPTION("Dasharo ACPI Driver");
> +MODULE_AUTHOR("Michał Kopeć <michal.kopec@3mdeb.com>");
> +MODULE_LICENSE("GPL");
> -- 
> 2.49.0
> 
> 
