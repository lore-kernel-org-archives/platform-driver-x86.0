Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040C4EEC3;
	Sun, 25 Jan 2026 00:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769300975; cv=none; b=sEGrkJneSFlMyhLmu+v4JLE94USetU91Uxdc7VngOa0voBqMbwS/RiChbmeAGLMje7/YS+R5Yx8rxZNxCqNhhZoY8mQK23yJu+CMBydXa7Qy7ZUrs2XRxSBy8RD5BnEYXWwRuTnz48A6e+xPxs+8QWbKgmdquCrd+0m/28087qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769300975; c=relaxed/simple;
	bh=j9MDJdhubS+L1p9mp5awfBFbHjyqmJWEYaHFZCpT/E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LUiJEsmeQ0ebCTMYy6U2iklq/6MwA6HlefDLWBKHrKRgJ2gGWjmsFIHQs/4NOTpSnK4ovJvbXDDMWtD4Ix/XP3qQpvYd2veMrlpFGPcifegr3wY+nMPy44DH4Vasa/YuUB2aX9GmnQvO8YG9UVEDqsOWSWPsIR+Zn5Urlsq+/sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FSbA3LLp; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FSbA3LLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1769300945; x=1769905745; i=w_armin@gmx.de;
	bh=/oUmiEdypOIoDmagP85I98hVhe9Z/s1cL3t7/e+o6Ng=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FSbA3LLpku6gdLYRkP3SIhNfJCiL5Rluw0WvX52+rEbOK8PrvwD/ylH2u1FVKzbx
	 qYCz6UMLHMXHGw7rERrt1GsLxE6Ri/GmxE9Dc+kHJE3Wslrp1kNCUCAHuRMYeyxV5
	 ubAtKQpoYuDWUVhmfUVtO5SDdKl/We7v3nTES1OLKaJKnOXZSEJPr4vpcytJs5XrV
	 pPZpXIORLdcpaMvsXN+wE3u3DcvGUWtjAkxHIXqkTepk+yq1kgoMCBXinDmWTVpCp
	 AYuKj6oXwfIqi7xRFWs3Nl9cr77oJDlRoL2d5iR3pbS5/dDOGDvNvurpaHToyzYNE
	 uN5r+FQrGQEdz0j5OQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1w1kBu15Zz-00wB7M; Sun, 25
 Jan 2026 01:29:05 +0100
Message-ID: <42e2d2d7-e5d1-4f13-88f4-888e8bfb561c@gmx.de>
Date: Sun, 25 Jan 2026 01:29:03 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] platform/x86: tongfang-mifs-wmi: Add new Tongfang MIFS
 WMI driver
To: Mingyou Chen <qby140326@gmail.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 cryolitia.pukngae@linux.dev
References: <20260124143909.84926-1-qby140326@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260124143909.84926-1-qby140326@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:j802qcQdzQjVSasN6HkUklYSzZlau8xF2EYtBSe3MTouwNMA9+Q
 dHbCtFAwJN5hhvNRiWfIYGPXpRvyywOn1FM2lGTjgU7TblIY5KO+6JL4euic5dabZYJtjQd
 LdRCNnLO8euXGEvUDKy24fJgfj0AnNQ/hHE3fNG1VK1YLJqXwhN3w9VZfzfTR272HkcZ9Vq
 93iTvhTQuHPGl6RV8HXpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ptxNWF+oWIM=;b0k31elFtH4UA85ZgOZxwvPMtT6
 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

Am 24.01.26 um 15:39 schrieb Mingyou Chen:

> platform/x86: tongfang-mifs-wmi: Add new Tongfang MIFS WMI driver
>
> Add a WMI-based driver for Tongfang laptops that use the MIFS
> (MiInterface) ACPI WMI interface. These laptops are commonly sold under
> brands like Mechrevo, Schenker, XMG, and Eluktronics.
>
> The driver implements the following features:
> - Platform Profile support: Allows switching between Low Power,
> Balanced,
>    and Performance modes.
> - Hwmon support: Provides monitoring for CPU temperature and fan speeds
>    (CPU, GPU, and System fans).
> - LED support: Standard LED class interface for controlling keyboard
>    backlight brightness.
> - Sysfs interface:
>      - GPU mode switching (Hybrid, Discrete, UMA).
>      - Keyboard RGB mode and color control.
>      - Fan boost (Max fan speed) toggle.
>
> The driver communicates with the BIOS via WMI GUID
> "B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B" using method IDs 250 (GET)
> and 251 (SET).

Hi,

could you write a short description of the WMI classes used by this driver
(with the MOF description) and place it under "Documentation/wmi/devices/"=
?

This would help future developers in understanding and maintaining this dr=
iver.

> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>   drivers/platform/x86/Kconfig             |  11 +
>   drivers/platform/x86/Makefile            |   1 +
>   drivers/platform/x86/tongfang-mifs-wmi.c | 495 +++++++++++++++++++++++
>   3 files changed, 507 insertions(+)
>   create mode 100644 drivers/platform/x86/tongfang-mifs-wmi.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 4cb7d97a9fcc..ff12631561e0 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -113,6 +113,17 @@ config GIGABYTE_WMI
>   	  To compile this driver as a module, choose M here: the module will
>   	  be called gigabyte-wmi.
>  =20
> +config TONGFANG_MIFS_WMI
> +	tristate "Tongfang MIFS WMI temperature, fan and GPU controller driver=
"
> +	depends on ACPI_WMI
> +	depends on HWMON
> +	depends on ACPI_PLATFORM_PROFILE

Please select ACPI_PLATFORM_PROFILE instead of depending on it. Also add a=
 dependency
on LEDS_CLASS_MULTICOLOR for the rgb keyboard controls.

> +	help
> +	  The driver for Tongfang laptops

Please describe here what kind of services this driver provides, and repla=
ce the final lines
with:

	To compile this driver as a module, choose M here: the module will
         be called tongfang-mifs-wmi.

> +
> +	  Say Y here if you want to support WMI-based features on Tongfang
> +	  laptops, such as performance mode switching.
> +
>   config ACERHDF
>   	tristate "Acer Aspire One temperature and fan driver"
>   	depends on ACPI_EC && THERMAL
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
> index d25762f7114f..1160c726bda6 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -14,6 +14,7 @@ obj-$(CONFIG_NVIDIA_WMI_EC_BACKLIGHT)	+=3D nvidia-wmi-=
ec-backlight.o
>   obj-$(CONFIG_XIAOMI_WMI)		+=3D xiaomi-wmi.o
>   obj-$(CONFIG_REDMI_WMI)			+=3D redmi-wmi.o
>   obj-$(CONFIG_GIGABYTE_WMI)		+=3D gigabyte-wmi.o
> +obj-$(CONFIG_TONGFANG_MIFS_WMI)		+=3D tongfang-mifs-wmi.o
>  =20
>   # Acer
>   obj-$(CONFIG_ACERHDF)		+=3D acerhdf.o
> diff --git a/drivers/platform/x86/tongfang-mifs-wmi.c b/drivers/platform=
/x86/tongfang-mifs-wmi.c
> new file mode 100644
> index 000000000000..6e1b7f4e9069
> --- /dev/null
> +++ b/drivers/platform/x86/tongfang-mifs-wmi.c
> @@ -0,0 +1,495 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +#include <linux/acpi.h>
> +#include <linux/bits.h>
> +#include <linux/device.h>
> +#include <linux/hwmon.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/module.h>
> +#include <linux/platform_profile.h>
> +#include <linux/sysfs.h>
> +#include <linux/wmi.h>
> +
> +#define DRV_NAME "tongfang-mifs-wmi"
> +#define TONGFANG_MIFS_GUID "B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
> +#define WMI_BUFFER_SIZE 32
> +
> +enum wmi_method_type {
> +	WMI_METHOD_GET =3D 250,
> +	WMI_METHOD_SET =3D 251,
> +};

The method type might be easily confused with the WMI method id, i suggest=
 you
rename this to "mifs_operation".

> +
> +enum wmi_method_name {
> +	WMI_FN_SYSTEM_PER_MODE =3D 8,
> +	WMI_FN_GPU_MODE =3D 9,
> +	WMI_FN_KBD_TYPE =3D 10,
> +	WMI_FN_FN_LOCK =3D 11,
> +	WMI_FN_TP_LOCK =3D 12,
> +	WMI_FN_FAN_SPEEDS =3D 13,
> +	WMI_FN_RGB_KB_MODE =3D 16,
> +	WMI_FN_RGB_KB_COLOR =3D 17,
> +	WMI_FN_RGB_KB_BRIGHTNESS =3D 18,
> +	WMI_FN_SYSTEM_AC_TYPE =3D 19,
> +	WMI_FN_MAX_FAN_SWITCH =3D 20,
> +	WMI_FN_MAX_FAN_SPEED =3D 21,
> +	WMI_FN_CPU_THERMOMETER =3D 22,
> +	WMI_FN_CPU_POWER =3D 23,
> +};

Same as above, i suggest "mifs_function".

> +
> +struct tongfang_mifs_wmi_data {
> +	struct wmi_device *wdev;
> +	struct mutex lock;

checkpatch complains about a struct mutex definition without a comment, pl=
ease fix.

> +	struct led_classdev kbd_led;
> +	struct device *hwmon_dev;

hwmon_dev is only used during probing, please move this field into a local=
 variable.

> +};
> +
> +static int tongfang_mifs_wmi_call(struct tongfang_mifs_wmi_data *data, =
u8 type,
> +				  u8 method, u8 *payload, size_t payload_len,
> +				  u8 *out_data)
> +{
> +	struct acpi_buffer input =3D { 0, NULL };
> +	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
> +	union acpi_object *obj;
> +	u8 *buffer;
> +	acpi_status status;
> +	int ret =3D 0;
> +
> +	if (!data)
> +		return -EINVAL;

Unnecessary check, please remove.

> +
> +	buffer =3D kzalloc(WMI_BUFFER_SIZE, GFP_KERNEL);
> +	if (!buffer)
> +		return -ENOMEM;

Maybe it would make sense to define the input buffer on the stack of the c=
aller and
just pass a pointer to it. This way you save a memory allocation.

> +
> +	buffer[1] =3D type;
> +	buffer[3] =3D method;

Why not defining a struct for those input parameters:

struct mifs_input {
	u8 reserved1;
	u8 operation;
	u8 reserved2;
	u8 function;
	u8 payload[28];
} __packed;

This way users of this function can populate the buffer as a local variabl=
e and just pass a pointer to it.
Also, could it be that those fields are actually 16-bit little-endian fiel=
ds? If yes then you can model them
like this:

struct mifs_input {
	__le16 operation;
	__le16 function;
	u8 payload[28];
} __packed;

> +
> +	if (payload && payload_len > 0) {
> +		size_t copy_len =3D
> +			min_t(size_t, payload_len, WMI_BUFFER_SIZE - 4);
> +		memcpy(&buffer[4], payload, copy_len);
> +	}
> +
> +	input.length =3D WMI_BUFFER_SIZE;
> +	input.pointer =3D buffer;
> +
> +	status =3D wmi_evaluate_method(TONGFANG_MIFS_GUID, 0, 1, &input, &outp=
ut);

Please do not use the deprecated GUID-based WMI interface, use wmidev_invo=
ke_method()
instead (see Documentation/wmi/driver-development-guide.rst for details). =
Said function
handles the ACPI stuff for you, so you can focus on parsing the output buf=
fer content.

(Please note that this function is currently only available on the for-nex=
t branch inside
the pdx86 kernel tree).

> +	if (ACPI_FAILURE(status)) {
> +		ret =3D -EIO;
> +		goto out_free_in;
> +	}
> +
> +	obj =3D output.pointer;
> +	if (!obj) {
> +		ret =3D -ENODATA;
> +		goto out_free_in;
> +	}
> +
> +	if (obj->type =3D=3D ACPI_TYPE_BUFFER &&
> +	    obj->buffer.length >=3D WMI_BUFFER_SIZE) {
> +		if (out_data)
> +			memcpy(out_data, obj->buffer.pointer, WMI_BUFFER_SIZE);

The MOF definition of this WMI class says that the output buffer contains =
a return code:

[WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x40A"), Description("WMI =
Get Set Method"), guid("{b60bfb48-3e5b-49e4-a0e9-8cffe1b3434b}")]
class MICommonInterface {
   [key, read] string InstanceName;
   [read] boolean Active;

   [WmiMethodId(1), Implemented, read, write, Description("WMI Get Set Met=
hod")] void MiInterface([in] uint8 InData[32], [out] uint8 OutData[30], [o=
ut] uint16 ReturnCode);
};

I suggest that you use a struct for thist that looks like that:

struct mifs_output {
	data[30];
	__le16 return_code;
}

You can then easily check the return code and copy the output data.

> +	} else {
> +		ret =3D -EINVAL;
> +	}
> +
> +	kfree(output.pointer);
> +out_free_in:
> +	kfree(buffer);
> +	return ret;
> +}
> +
> +static int laptop_profile_get(struct device *dev,
> +			      enum platform_profile_option *profile)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	u8 result[WMI_BUFFER_SIZE];
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;

Unnecessary check, please remove.

> +
> +	mutex_lock(&data->lock);

I think tongfang_mifs_wmi_call() should handle the locking itself, maybe y=
ou can
use the new guard() macro in linux/cleanup.h for this.

> +	ret =3D tongfang_mifs_wmi_call(data, WMI_METHOD_GET,
> +				     WMI_FN_SYSTEM_PER_MODE, NULL, 0, result);
> +	mutex_unlock(&data->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	switch (result[4]) {
> +	case 0:
> +		*profile =3D PLATFORM_PROFILE_BALANCED;
> +		break;
> +	case 1:
> +		*profile =3D PLATFORM_PROFILE_BALANCED_PERFORMANCE;
> +		break;
> +	case 2:
> +		*profile =3D PLATFORM_PROFILE_LOW_POWER;
> +		break;
> +	case 3:
> +		*profile =3D PLATFORM_PROFILE_PERFORMANCE;
> +		break; /* Fullspeed */
> +	default:
> +		return -EINVAL;
> +	}
> +	return 0;

Maybe you want to use a enum for those WMI performance profiles here.

> +}
> +
> +static int laptop_profile_set(struct device *dev,
> +			      enum platform_profile_option profile)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	u8 val;
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;

Unnecessary check, please remove.

> +
> +	switch (profile) {
> +	case PLATFORM_PROFILE_LOW_POWER:
> +		val =3D 2;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED:
> +		val =3D 0;
> +		break;
> +	case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
> +		val =3D 1;
> +		break;
> +	case PLATFORM_PROFILE_PERFORMANCE:
> +		val =3D 3; /* Fullspeed */
> +		break;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	mutex_lock(&data->lock);
> +	ret =3D tongfang_mifs_wmi_call(data, WMI_METHOD_SET,
> +				     WMI_FN_SYSTEM_PER_MODE, &val, 1, NULL);
> +	mutex_unlock(&data->lock);

Does the firmware keep the platform profile setting during suspend and hib=
ernation?
If no then please save this value during suspend and restore it during res=
ume.

> +	return ret;
> +}
> +
> +static int platform_profile_probe(void *drvdata, unsigned long *choices=
)
> +{
> +	__set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
> +	__set_bit(PLATFORM_PROFILE_BALANCED, choices);
> +	__set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
> +	__set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);

Please use set_bit() instead.

> +	return 0;
> +}
> +
> +static struct platform_profile_ops laptop_profile_ops =3D {
> +	.probe =3D platform_profile_probe,
> +	.profile_get =3D laptop_profile_get,
> +	.profile_set =3D laptop_profile_set,
> +};

Please make this struct const.

> +
> +static int laptop_hwmon_read(struct device *dev, enum hwmon_sensor_type=
s type,
> +			     u32 attr, int channel, long *val)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	u8 res[WMI_BUFFER_SIZE];
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;

Unnecessary check, please remove.

> +
> +	mutex_lock(&data->lock);
> +	if (type =3D=3D hwmon_temp) {
> +		ret =3D tongfang_mifs_wmi_call(data, WMI_METHOD_GET,
> +					     WMI_FN_CPU_THERMOMETER, NULL, 0,
> +					     res);
> +		if (!ret)
> +			*val =3D res[4] * 1000;
> +	} else if (type =3D=3D hwmon_fan) {
> +		ret =3D tongfang_mifs_wmi_call(data, WMI_METHOD_GET,
> +					     WMI_FN_FAN_SPEEDS, NULL, 0, res);
> +		if (!ret) {
> +			if (channel =3D=3D 0) /* CPU */
> +				*val =3D (res[5] << 8) | res[4];
> +			else if (channel =3D=3D 1) /* GPU */
> +				*val =3D (res[7] << 8) | res[6];
> +			else if (channel =3D=3D 2) /* SYS */
> +				*val =3D (res[11] << 8) | res[10];
> +			else
> +				ret =3D -EINVAL;

Maybe you want to use a switch-case statements for that? Additionally i su=
ggest that you
report the labels of each fan channel ("CPU", "GPU" and "SYS") as HWMON_F_=
LABEL to userspace.

> +		}
> +	} else {
> +		ret =3D -EINVAL;
> +	}
> +	mutex_unlock(&data->lock);
> +	return ret;
> +}
> +
> +static umode_t laptop_hwmon_is_visible(const void *drvdata,
> +				       enum hwmon_sensor_types type, u32 attr,
> +				       int channel)
> +{
> +	if (type =3D=3D hwmon_temp && attr =3D=3D hwmon_temp_input && channel =
=3D=3D 0)
> +		return 0444;
> +	if (type =3D=3D hwmon_fan && attr =3D=3D hwmon_fan_input && channel < =
3)
> +		return 0444;
> +	return 0;
> +}

You can replace this by setting .visible to 0444 inside struct hwmon_ops.

> +
> +static const struct hwmon_channel_info *laptop_hwmon_info[] =3D {
> +	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
> +	NULL
> +};
> +
> +static const struct hwmon_ops laptop_hwmon_ops =3D {
> +	.is_visible =3D laptop_hwmon_is_visible,
> +	.read =3D laptop_hwmon_read,
> +};
> +
> +static const struct hwmon_chip_info laptop_chip_info =3D {
> +	.ops =3D &laptop_hwmon_ops,
> +	.info =3D laptop_hwmon_info,
> +};
> +
> +static int laptop_kbd_led_set(struct led_classdev *led_cdev,
> +			      enum led_brightness value)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D
> +		container_of(led_cdev, struct tongfang_mifs_wmi_data, kbd_led);
> +	u8 val =3D (u8)value;
> +	int ret;
> +
> +	mutex_lock(&data->lock);
> +	ret =3D tongfang_mifs_wmi_call(data, WMI_METHOD_SET,
> +				     WMI_FN_RGB_KB_BRIGHTNESS, &val, 1, NULL);
> +	mutex_unlock(&data->lock);
> +	return ret;
> +}
> +
> +/* GPU Mode: 0:Hybrid, 1:Discrete, 2:UMA */

Please output strings instead of the raw WMI numbers to make it easier for
userspace to understand the resulting data.

> +static ssize_t gpu_mode_show(struct device *dev, struct device_attribut=
e *attr,
> +			     char *buf)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	u8 result[WMI_BUFFER_SIZE];
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;

See the previous comments on this.

> +
> +	mutex_lock(&data->lock);
> +	ret =3D tongfang_mifs_wmi_call(data, WMI_METHOD_GET, WMI_FN_GPU_MODE,
> +				     NULL, 0, result);
> +	mutex_unlock(&data->lock);
> +
> +	if (ret)
> +		return ret;
> +	return sysfs_emit(buf, "%d\n", result[4]);
> +}
> +
> +static ssize_t gpu_mode_store(struct device *dev, struct device_attribu=
te *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	u8 val;
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;
> +
> +	if (kstrtou8(buf, 10, &val) || val > 2)
> +		return -EINVAL;

See comment above, you could use sysfs_match_string() here for this.

> +
> +	mutex_lock(&data->lock);
> +	ret =3D tongfang_mifs_wmi_call(data, WMI_METHOD_SET, WMI_FN_GPU_MODE,
> +				     &val, 1, NULL);
> +	mutex_unlock(&data->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +/* RGB Mode: 0:OFF, 1:Cyclic, 2:Fixed, 3:Custom */

Same as with the GPU sysfs atrtibute, use strings instead of magic numbers=
.

> +static ssize_t kb_mode_show(struct device *dev, struct device_attribute=
 *attr,
> +			    char *buf)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	u8 result[WMI_BUFFER_SIZE];
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;
> +
> +	mutex_lock(&data->lock);
> +	ret =3D tongfang_mifs_wmi_call(data, WMI_METHOD_GET, WMI_FN_RGB_KB_MOD=
E,
> +				     NULL, 0, result);
> +	mutex_unlock(&data->lock);
> +
> +	if (ret)
> +		return ret;
> +	return sysfs_emit(buf, "%d\n", result[4]);
> +}
> +
> +static ssize_t kb_mode_store(struct device *dev, struct device_attribut=
e *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	u8 val;
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;
> +
> +	if (kstrtou8(buf, 10, &val) || val > 3)
> +		return -EINVAL;
> +
> +	mutex_lock(&data->lock);
> +	ret =3D tongfang_mifs_wmi_call(data, WMI_METHOD_SET, WMI_FN_RGB_KB_MOD=
E,
> +				     &val, 1, NULL);
> +	mutex_unlock(&data->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +/* RGB Color: R G B */

Please use the multicolor LED interface for this so that userspace applica=
tions can use
the standard multicolor LED API.

> +static ssize_t kb_color_store(struct device *dev, struct device_attribu=
te *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	unsigned int r, g, b;
> +	u8 color_buf[3];
> +	u8 fixed_mode =3D 2;
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;
> +
> +	if (sscanf(buf, "%u %u %u", &r, &g, &b) !=3D 3)
> +		return -EINVAL;
> +	if (r > 255 || g > 255 || b > 255)
> +		return -EINVAL;
> +
> +	color_buf[0] =3D (u8)r;
> +	color_buf[1] =3D (u8)g;
> +	color_buf[2] =3D (u8)b;
> +
> +	mutex_lock(&data->lock);
> +
> +	ret =3D tongfang_mifs_wmi_call(data, WMI_METHOD_SET, WMI_FN_RGB_KB_MOD=
E,
> +				     &fixed_mode, 1, NULL);
> +	if (ret)
> +		goto unlock;
> +
> +	ret =3D tongfang_mifs_wmi_call(data, WMI_METHOD_SET, WMI_FN_RGB_KB_COL=
OR,
> +				     color_buf, 3, NULL);

Should you move the mutex handling into tongfang_mifs_wmi_call(), then you=
 will
need a separate lock here. I leave it up to you how you handle the locking=
 in this case,
nut please try to use guard() when suitable.

> +
> +unlock:
> +	mutex_unlock(&data->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +/* Fan Boost: 0:Normal, 1:Max Speed */

Here using binary numbers is fine, but please use kstrtobool() instead
of kstrtou8().

> +static ssize_t fan_boost_store(struct device *dev,
> +			       struct device_attribute *attr, const char *buf,
> +			       size_t count)
> +{
> +	struct tongfang_mifs_wmi_data *data =3D dev_get_drvdata(dev);
> +	u8 val, payload[2];
> +	int ret;
> +
> +	if (!data)
> +		return -EINVAL;
> +
> +	if (kstrtou8(buf, 10, &val) || val > 1)
> +		return -EINVAL;
> +
> +	payload[0] =3D 0; /* CPU/GPU Fan */
> +	payload[1] =3D val;
> +
> +	mutex_lock(&data->lock);
> +	ret =3D tongfang_mifs_wmi_call(data, WMI_METHOD_SET,
> +				     WMI_FN_MAX_FAN_SWITCH, payload, 2, NULL);
> +	mutex_unlock(&data->lock);
> +
> +	if (ret)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static DEVICE_ATTR_RW(gpu_mode);
> +static DEVICE_ATTR_RW(kb_mode);
> +static DEVICE_ATTR_WO(kb_color);
> +static DEVICE_ATTR_WO(fan_boost);

Please mark those attributes as const. This also requires you to mark lapt=
op_attrs as const as well.

> +
> +static struct attribute *laptop_attrs[] =3D { &dev_attr_gpu_mode.attr,
> +					    &dev_attr_kb_mode.attr,
> +					    &dev_attr_kb_color.attr,
> +					    &dev_attr_fan_boost.attr, NULL };

Please use the standard kernel array style:

type example[] {
	entry1,
	entry2,
	...
}:

> +ATTRIBUTE_GROUPS(laptop);
> +
> +static int tongfang_mifs_wmi_probe(struct wmi_device *wdev, const void =
*context)
> +{
> +	struct tongfang_mifs_wmi_data *drv_data;
> +	struct device *pp_dev;
> +	int ret;
> +
> +	drv_data =3D devm_kzalloc(&wdev->dev, sizeof(*drv_data), GFP_KERNEL);
> +	if (!drv_data)
> +		return -ENOMEM;
> +
> +	drv_data->wdev =3D wdev;
> +	mutex_init(&drv_data->lock);

Please use devm_mutex_init() here.

> +	dev_set_drvdata(&wdev->dev, drv_data);
> +
> +	/* Register platform profile */
> +	pp_dev =3D devm_platform_profile_register(&wdev->dev, DRV_NAME, drv_da=
ta,
> +						&laptop_profile_ops);
> +	if (IS_ERR(pp_dev))
> +		dev_err(&wdev->dev, "Failed to register platform profile\n");

Please abort probing if you cannot register this feature. The same applies=
 to the hwmon
and LED features.

> +
> +	/* Register hwmon */
> +	drv_data->hwmon_dev =3D devm_hwmon_device_register_with_info(

Lines should not end with a '('.

> +		&wdev->dev, "tongfang_mifs", drv_data, &laptop_chip_info, NULL);
> +	if (IS_ERR(drv_data->hwmon_dev))
> +		dev_err(&wdev->dev, "Failed to register hwmon\n");
> +
> +	/* Register keyboard LED */
> +	drv_data->kbd_led.name =3D "laptop::kbd_backlight";
> +	drv_data->kbd_led.max_brightness =3D 3;
> +	drv_data->kbd_led.brightness_set_blocking =3D laptop_kbd_led_set;
> +	ret =3D devm_led_classdev_register(&wdev->dev, &drv_data->kbd_led);
> +	if (ret)
> +		dev_err(&wdev->dev, "Failed to register keyboard LED\n");
> +
> +	return 0;
> +}
> +
> +static const struct wmi_device_id tongfang_mifs_wmi_id_table[] =3D {
> +	{ TONGFANG_MIFS_GUID, NULL },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(wmi, tongfang_mifs_wmi_id_table);
> +
> +static struct wmi_driver tongfang_mifs_wmi_driver =3D {
> +	.driver =3D {
> +		.name =3D DRV_NAME,
> +		.dev_groups =3D laptop_groups,
> +	},
> +	.id_table =3D tongfang_mifs_wmi_id_table,
> +	.probe =3D tongfang_mifs_wmi_probe,

Please set .no_singleton =3D true. Also please check if the various settin=
gs (RGB LED, platform profile and sysfs)
need to be restored when resuming from hibernation and/or suspend.

All in all the basic structure of the driver seems good, except for the WM=
I method call handling and
the RGB LED integration.

Thanks,
Armin Wolf

> +};
> +
> +module_wmi_driver(tongfang_mifs_wmi_driver);
> +
> +MODULE_AUTHOR("Mingyou Chen <qby104326@gmail.com>");
> +MODULE_DESCRIPTION("Tongfang MIFS (MiInterface) WMI driver");
> +MODULE_LICENSE("GPL");
