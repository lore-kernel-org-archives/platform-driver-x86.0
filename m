Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B412D73AE;
	Thu, 15 Jan 2026 20:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768509697; cv=none; b=Py0MD2xsoW0VN1lEzfV/JiogdPMpHy2PMudUfXrF9nxkwm7iKA7tHI2Swa1kec1wCTU9Ld3n+xhWeYD86BbEYImFAx4H5uE6Z3wVf0XYcZ+4MzV8j3vSx89Uo+JIwvQdPdrCL1jOTvwv+SFMKm2VcEz2VcQs7aIsKk4XYuSlFsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768509697; c=relaxed/simple;
	bh=gd7km78Y96pYIyZ67ps5hIwGI8hrBo+A/y8zHPdMB9M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kUeNi9N7nHVxc9AT6OU9/XLcR5yqxh6uaGzM1uDx8xcoS40QVG6j8kt2Z4++iTFvglyBUngIIzIGOgjxxzcutWeR0qX7Bz5KJhs/Stewb0p2lUrj9Sk0F8HR1dv4KDRj6qp1+mZR/OjFTDsRgTk67n/FdA0eJ/vZ5l8Ca/JTNf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=EBrf6ii7; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="EBrf6ii7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768509689; x=1769114489; i=w_armin@gmx.de;
	bh=lbeoEuxd5hDytzt/L4NZB/mxpNvfE4kbiE+x0M0GnaQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=EBrf6ii7hJuvervds/y1Wdxt+fExxCSGMFJ9/bpVhPuZo1qx50lZKAkQb5pdVZx1
	 drKeuNX6FEc82ojl3cgCNzc59f8mqz1Vx0jVFqRJj19C7L4cvzO56t49R/QbNQFko
	 3e+Qic4o7LGpf2dWiB8U0qu1or+pXV+6V5nQ4tUZQsEVf8qFYVoJZU5eCDN74Vp97
	 yDpLFnT8XNTTrO1l0OGTNrLxDyRQR9kE/GcXWqIbNODFeOF7k7Z030PAxW6zVbAXx
	 R+nxgEPZHinfpB1KE1Z58L3QCL0cp/hzO+c8KIMqIPIhLJgYSbXAp0WoQ+ryveIlS
	 fq8MnmPMmkl6rEYSDA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzBp-1vOXlY1plR-00QNyM; Thu, 15
 Jan 2026 21:41:29 +0100
Message-ID: <f07ab255-0783-480d-b224-b007099f469e@gmx.de>
Date: Thu, 15 Jan 2026 21:41:27 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] platform/x86/uniwill: Implement cTGP setting
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260115154332.402873-1-wse@tuxedocomputers.com>
 <20260115154332.402873-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260115154332.402873-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gct6IgELKIUWK0Cml6OYQ8b0nrtzTaD+qK+VdS/QOu6ulTeGAhC
 BrapeSqjP0X6hLz6z5oHFoc82zO2MHsiDrr5tDwTW45vczMRKumkKqzkuhoXQfyYxOmhU9v
 2ZXV4MWjPQldR0dJj2jKr3fa2IA8+d2WX3Up9ZHF60iAsy+/8pPAsFBaT/qT86iTNPJKuJs
 23tG7xlLwHzYA2K9ud5nw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:y/E+4cBZ67E=;xyuIzucWSb0i3S0pXocyW6590yo
 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
 xrFo/Pwc=

Am 15.01.26 um 16:42 schrieb Werner Sembach:

> Uniwill offers user setable cTGP for their EC on devices using NVIDIA 30=
00
> Series and newer GPUs. This patch implements this setting as a sysfs
> attribute.
>
> For one device, the TUXEDO InfinityBook Gen7, the variant with and witho=
ut
> NVIDIA GPU can't be differentiated using only the DMI strings, so the ne=
w
> probe callback needs to be used to test a bit from the EC memory.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Co-developed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 189 +++++++++++++++++---
>   1 file changed, 163 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 3d8c136e36219..8f843b5d7e4bd 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -88,6 +88,9 @@
>  =20
>   #define EC_ADDR_GPU_TEMP		0x044F
>  =20
> +#define EC_ADDR_SYSTEM_ID		0x0456
> +#define HAS_GPU				BIT(7)
> +
>   #define EC_ADDR_MAIN_FAN_RPM_1		0x0464
>  =20
>   #define EC_ADDR_MAIN_FAN_RPM_2		0x0465
> @@ -122,11 +125,11 @@
>   #define CTGP_DB_DB_ENABLE		BIT(1)
>   #define CTGP_DB_CTGP_ENABLE		BIT(2)
>  =20
> -#define EC_ADDR_CTGP_OFFSET		0x0744
> +#define EC_ADDR_CTGP_DB_CTGP_OFFSET	0x0744
>  =20
> -#define EC_ADDR_TPP_OFFSET		0x0745
> +#define EC_ADDR_CTGP_DB_TPP_OFFSET	0x0745
>  =20
> -#define EC_ADDR_MAX_TGP			0x0746
> +#define EC_ADDR_CTGP_DB_DB_OFFSET	0x0746
>  =20
>   #define EC_ADDR_LIGHTBAR_AC_CTRL	0x0748
>   #define LIGHTBAR_APP_EXISTS		BIT(0)
> @@ -317,6 +320,7 @@
>   #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
>   #define UNIWILL_FEATURE_BATTERY			BIT(4)
>   #define UNIWILL_FEATURE_HWMON			BIT(5)
> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(6)
>  =20
>   struct uniwill_data {
>   	struct device *dev;
> @@ -514,6 +518,10 @@ static bool uniwill_writeable_reg(struct device *de=
v, unsigned int reg)
>   	case EC_ADDR_LIGHTBAR_BAT_RED:
>   	case EC_ADDR_LIGHTBAR_BAT_GREEN:
>   	case EC_ADDR_LIGHTBAR_BAT_BLUE:
> +	case EC_ADDR_CTGP_DB_CTRL:
> +	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
> +	case EC_ADDR_CTGP_DB_TPP_OFFSET:
> +	case EC_ADDR_CTGP_DB_DB_OFFSET:
>   		return true;
>   	default:
>   		return false;
> @@ -547,6 +555,11 @@ static bool uniwill_readable_reg(struct device *dev=
, unsigned int reg)
>   	case EC_ADDR_LIGHTBAR_BAT_RED:
>   	case EC_ADDR_LIGHTBAR_BAT_GREEN:
>   	case EC_ADDR_LIGHTBAR_BAT_BLUE:
> +	case EC_ADDR_SYSTEM_ID:
> +	case EC_ADDR_CTGP_DB_CTRL:
> +	case EC_ADDR_CTGP_DB_CTGP_OFFSET:
> +	case EC_ADDR_CTGP_DB_TPP_OFFSET:
> +	case EC_ADDR_CTGP_DB_DB_OFFSET:
>   		return true;
>   	default:
>   		return false;
> @@ -802,6 +815,70 @@ static ssize_t breathing_in_suspend_show(struct dev=
ice *dev, struct device_attri
>  =20
>   static DEVICE_ATTR_RW(breathing_in_suspend);
>  =20
> +static ssize_t ctgp_offset_store(struct device *dev, struct device_attr=
ibute *attr,
> +				 const char *buf, size_t count)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D kstrtouint(buf, 0, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (value > U8_MAX)
> +		return -EINVAL;
> +
> +	ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, value)=
;
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static ssize_t ctgp_offset_show(struct device *dev, struct device_attri=
bute *attr,
> +				char *buf)
> +{
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, &value)=
;
> +	if (ret < 0)
> +		return ret;
> +
> +	return sysfs_emit(buf, "%u\n", value);
> +}
> +
> +static DEVICE_ATTR_RW(ctgp_offset);
> +
> +static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
> +{
> +	int ret;
> +
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=
))
> +		return 0;
> +
> +	ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_DB_TPP_OFFSET, 255);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_write(data->regmap, EC_ADDR_CTGP_DB_DB_OFFSET, 25);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D regmap_set_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
> +			      CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENAB=
LE);
> +	if (ret < 0)
> +		return ret;
> +
> +	return 0;
> +}
> +
>   static struct attribute *uniwill_attrs[] =3D {
>   	/* Keyboard-related */
>   	&dev_attr_fn_lock_toggle_enable.attr,
> @@ -810,6 +887,8 @@ static struct attribute *uniwill_attrs[] =3D {
>   	/* Lightbar-related */
>   	&dev_attr_rainbow_animation.attr,
>   	&dev_attr_breathing_in_suspend.attr,
> +	/* Power-management-related */
> +	&dev_attr_ctgp_offset.attr,
>   	NULL
>   };
>  =20
> @@ -839,6 +918,11 @@ static umode_t uniwill_attr_is_visible(struct kobje=
ct *kobj, struct attribute *a
>   			return attr->mode;
>   	}
>  =20
> +	if (attr =3D=3D &dev_attr_ctgp_offset.attr) {
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=
))
> +			return attr->mode;
> +	}
> +
>   	return 0;
>   }
>  =20
> @@ -1405,6 +1489,10 @@ static int uniwill_probe(struct platform_device *=
pdev)
>   	if (ret < 0)
>   		return ret;
>  =20
> +	ret =3D uniwill_nvidia_ctgp_init(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	return uniwill_input_init(data);
>   }
>  =20
> @@ -1440,6 +1528,15 @@ static int uniwill_suspend_battery(struct uniwill=
_data *data)
>   	return regmap_read(data->regmap, EC_ADDR_CHARGE_CTRL, &data->last_cha=
rge_ctrl);
>   }
>  =20
> +static int uniwill_suspend_nvidia_ctgp(struct uniwill_data *data)
> +{
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=
))
> +		return 0;
> +
> +	return regmap_clear_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
> +				 CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE);
> +}
> +
>   static int uniwill_suspend(struct device *dev)
>   {
>   	struct uniwill_data *data =3D dev_get_drvdata(dev);
> @@ -1453,6 +1550,10 @@ static int uniwill_suspend(struct device *dev)
>   	if (ret < 0)
>   		return ret;
>  =20
> +	ret =3D uniwill_suspend_nvidia_ctgp(data);
> +	if (ret < 0)
> +		return ret;
> +
>   	regcache_cache_only(data->regmap, true);
>   	regcache_mark_dirty(data->regmap);
>  =20
> @@ -1487,6 +1588,15 @@ static int uniwill_resume_battery(struct uniwill_=
data *data)
>   				  data->last_charge_ctrl);
>   }
>  =20
> +static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
> +{
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=
))
> +		return 0;
> +
> +	return regmap_set_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
> +			       CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE);
> +}
> +
>   static int uniwill_resume(struct device *dev)
>   {
>   	struct uniwill_data *data =3D dev_get_drvdata(dev);
> @@ -1502,7 +1612,11 @@ static int uniwill_resume(struct device *dev)
>   	if (ret < 0)
>   		return ret;
>  =20
> -	return uniwill_resume_battery(data);
> +	ret =3D uniwill_resume_battery(data);
> +	if (ret < 0)
> +		return ret;
> +
> +	return uniwill_resume_nvidia_ctgp(data);
>   }
>  =20
>   static DEFINE_SIMPLE_DEV_PM_OPS(uniwill_pm_ops, uniwill_suspend, uniwi=
ll_resume);
> @@ -1545,6 +1659,29 @@ static struct uniwill_device_descriptor lapkc71f_=
descriptor __initdata =3D {
>   		    UNIWILL_FEATURE_HWMON
>   };
>  =20
> +static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_SYSTEM_ID, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (value & HAS_GPU)
> +		data->features |=3D UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
> +
> +	return 0;
> +};
> +
> +static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __in=
itdata =3D {
> +	.probe =3D phxarx1_phxaqf1_probe
> +};
> +
> +static struct uniwill_device_descriptor tux_featureset_1_descriptor __i=
nitdata =3D {
> +	.features =3D UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL
> +};
> +
>   static struct uniwill_device_descriptor empty_descriptor __initdata =
=3D {};
>  =20
>   static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D =
{
> @@ -1594,7 +1731,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> @@ -1602,7 +1739,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &phxarx1_phxaqf1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Bo=
ok Pro Gen 7",
> @@ -1610,7 +1747,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia=
-Book Pro Gen 8",
> @@ -1626,7 +1763,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> @@ -1634,7 +1771,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> @@ -1802,7 +1939,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 Intel",
> @@ -1810,7 +1947,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> @@ -1818,7 +1955,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> @@ -1826,7 +1963,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> @@ -1834,7 +1971,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 15 Gen4 Intel",
> @@ -1842,7 +1979,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen5 AMD",
> @@ -1850,7 +1987,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen5 AMD",
> @@ -1858,7 +1995,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5"=
,
> @@ -1866,7 +2003,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 AMD",
> @@ -1874,7 +2011,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim=
 15 Gen6",
> @@ -1882,7 +2019,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1890,7 +2027,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1898,7 +2035,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
> @@ -1906,7 +2043,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 AMD",
> @@ -1914,7 +2051,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1922,7 +2059,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1930,7 +2067,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Book BA15 Gen10 AMD",
