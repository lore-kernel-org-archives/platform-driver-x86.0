Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A20A280A58;
	Thu,  4 Dec 2025 16:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764864229; cv=none; b=mEYXRm/59fX4l19HqbNesn5OERRmxQyZ/mTrjSNOvGphMxhEvhu1SgoM3oyQKftaZZMVspzZT1xoZN5eJnNpi2MPln4F5wHHs82yj50RBz4wOEKX73GP4wrinyhgU78aa4Z09OPra9QxGk4Ii363+FDIAPtGgs+eikuhRZLcDtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764864229; c=relaxed/simple;
	bh=jPmfM8gWwF/Hb71YGh6Wv+Vz3VvhKj8XuZwIrJvLsYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IW8L9HM/PWSyMndRjRx1NCewPq7m6s11x9F3VTACSM0S9TslnGpt4qhgwCrB56B3Zfv1LuTNJCi670LEawxiUvoIQW8CXLwr/3MMkO0lbt6vTMjfYnBokqXk8uFQ5i3MIJ3a3RD0nLJ5zl2damhRbXeuvdo1UFxswsIB5zcEmT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DRqhbRWT; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DRqhbRWT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764864213; x=1765469013; i=w_armin@gmx.de;
	bh=N0nWeXcl1tX7zyTZogqew0OOCV7CqHO1V2piPuhUUUw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DRqhbRWTjiMaHB1h8eyGjJw24Hwks6lDNuzoJcfyl2jkqFVkDGwRqnP6Je7Crf1E
	 t9aBDuvjbmf/w8z1p5/HmnzKk4lDHeJyr9cL25eOC4aY0yQZd0biivHY8NAzy/b8d
	 2rekV9oF7mCB2xtH1Ey/Fnc0S+mLwaiCdrHaLIcp53E/XcgsPbr9v+x7HglhleyFl
	 iaIRcNJajeA3S2Up3hxr1ON+0UPcfN47wxA11UmVv7mrGsoLtqc9+3w7pFSt48H63
	 OGrsqnzDi+Y92boV27xmdmqDHKXcztNT/J8AmU8Z6NKYNqOOfgg7oZ2S7nG9Yg+py
	 mwvpuy/lBTYirrbY+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfHAH-1vyJpO2VoJ-00oXl0; Thu, 04
 Dec 2025 17:03:33 +0100
Message-ID: <a0ecd42d-939b-4b16-bd5d-7b801a5e9b58@gmx.de>
Date: Thu, 4 Dec 2025 17:03:31 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: uniwill-laptop: Introduce device
 descriptor system
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251204135121.435905-1-wse@tuxedocomputers.com>
 <20251204135121.435905-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251204135121.435905-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pcKT/lJ5W2jT9senHe9+irtKbAxI5Bzwz4tFH/ie6jpWzy0ldfZ
 8SOmP1CXzCPm6P25wDfbCUm9sZZSFP41kacaTYlg6nVkMAIL15Gfatd7vSxZD+Vojesl2Cq
 CMLIbibCrXNYrLLZzxzgBhr0UgThxyurB/Y54pt4QUnMWcAm6GriQuxnw6cZc6oSGWrhMMX
 Qfgj8tFwTrV+IzNUjMRGw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MSUYCkk5RYI=;SXBLlUTjSpiG6tPq7x2YCtN95Za
 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
 IPpd6g78a9gAou8oFwEedQeOrOLdJ

Am 04.12.25 um 14:50 schrieb Werner Sembach:

> From: Armin Wolf <W_Armin@gmx.de>
>
> Future additions to the driver will depend on device-specific
> initialization steps. Extend the DMI-based feature detection system
> to include device descriptors. Each descriptor contains a bitmap of
> supported features and a set of callback for performing
> device-specific initialization.
>
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 168 +++++++++++++++++---
>   1 file changed, 142 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index bd7e63dd51810..01192c32608e5 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -322,6 +322,7 @@ struct uniwill_data {
>   	struct device *dev;
>   	acpi_handle handle;
>   	struct regmap *regmap;
> +	unsigned int features;
>   	struct acpi_battery_hook hook;
>   	unsigned int last_charge_ctrl;
>   	struct mutex battery_lock;	/* Protects the list of currently register=
ed batteries */
> @@ -341,12 +342,21 @@ struct uniwill_battery_entry {
>   	struct power_supply *battery;
>   };
>  =20
> +struct uniwill_device_descriptor {
> +	unsigned int features;
> +	/* Executed during driver probing */
> +	int (*probe)(struct uniwill_data *data);
> +};
> +
>   static bool force;
>   module_param_unsafe(force, bool, 0);
>   MODULE_PARM_DESC(force, "Force loading without checking for supported =
devices\n");
>  =20
> -/* Feature bitmask since the associated registers are not reliable */
> -static unsigned int supported_features;
> +/*
> + * Contains device specific data like the feature bitmap since
> + * the associated registers are not always reliable.
> + */
> +static struct uniwill_device_descriptor device_descriptor __ro_after_in=
it;
>  =20
>   static const char * const uniwill_temp_labels[] =3D {
>   	"CPU",
> @@ -411,6 +421,13 @@ static const struct key_entry uniwill_keymap[] =3D =
{
>   	{ KE_END }
>   };
>  =20
> +static inline bool uniwill_device_supports(struct uniwill_data *data,
> +					   unsigned int features_mask,
> +					   unsigned int features)
> +{
> +	return (data->features & features_mask) =3D=3D features;

Hi,

i am not sure if having a separate feature parameter is really useful, as =
there
are currently no real users for it. Please replace features with feature_m=
ask and
remove the associated parameter.

With that being addressed:
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +}
> +
>   static int uniwill_ec_reg_write(void *context, unsigned int reg, unsig=
ned int val)
>   {
>   	union acpi_object params[2] =3D {
> @@ -799,24 +816,31 @@ static struct attribute *uniwill_attrs[] =3D {
>  =20
>   static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct at=
tribute *attr, int n)
>   {
> +	struct device *dev =3D kobj_to_dev(kobj);
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +
>   	if (attr =3D=3D &dev_attr_fn_lock_toggle_enable.attr) {
> -		if (supported_features & UNIWILL_FEATURE_FN_LOCK_TOGGLE)
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK_TOGGLE,
> +					    UNIWILL_FEATURE_FN_LOCK_TOGGLE))
>   			return attr->mode;
>   	}
>  =20
>   	if (attr =3D=3D &dev_attr_super_key_toggle_enable.attr) {
> -		if (supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE)
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
> +					    UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>   			return attr->mode;
>   	}
>  =20
>   	if (attr =3D=3D &dev_attr_touchpad_toggle_enable.attr) {
> -		if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_TOUCHPAD_TOGGLE,
> +					    UNIWILL_FEATURE_TOUCHPAD_TOGGLE))
>   			return attr->mode;
>   	}
>  =20
>   	if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
>   	    attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
> -		if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR,
> +					    UNIWILL_FEATURE_LIGHTBAR))
>   			return attr->mode;
>   	}
>  =20
> @@ -944,7 +968,8 @@ static int uniwill_hwmon_init(struct uniwill_data *d=
ata)
>   {
>   	struct device *hdev;
>  =20
> -	if (!(supported_features & UNIWILL_FEATURE_HWMON))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_HWMON,
> +				     UNIWILL_FEATURE_HWMON))
>   		return 0;
>  =20
>   	hdev =3D devm_hwmon_device_register_with_info(data->dev, "uniwill", d=
ata,
> @@ -1019,7 +1044,8 @@ static int uniwill_led_init(struct uniwill_data *d=
ata)
>   	unsigned int value;
>   	int ret;
>  =20
> -	if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR,
> +				     UNIWILL_FEATURE_LIGHTBAR))
>   		return 0;
>  =20
>   	ret =3D devm_mutex_init(data->dev, &data->led_lock);
> @@ -1232,7 +1258,8 @@ static int uniwill_battery_init(struct uniwill_dat=
a *data)
>   {
>   	int ret;
>  =20
> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
> +				     UNIWILL_FEATURE_BATTERY))
>   		return 0;
>  =20
>   	ret =3D devm_mutex_init(data->dev, &data->battery_lock);
> @@ -1361,6 +1388,19 @@ static int uniwill_probe(struct platform_device *=
pdev)
>   	if (ret < 0)
>   		return ret;
>  =20
> +	data->features =3D device_descriptor.features;
> +
> +	/*
> +	 * Some devices might need to perform some device-specific initializat=
ion steps
> +	 * before the supported features are initialized. Because of this we h=
ave to call
> +	 * this callback just after the EC itself was initialized.
> +	 */
> +	if (device_descriptor.probe) {
> +		ret =3D device_descriptor.probe(data);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>   	ret =3D uniwill_battery_init(data);
>   	if (ret < 0)
>   		return ret;
> @@ -1385,7 +1425,8 @@ static void uniwill_shutdown(struct platform_devic=
e *pdev)
>  =20
>   static int uniwill_suspend_keyboard(struct uniwill_data *data)
>   {
> -	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
> +				     UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>   		return 0;
>  =20
>   	/*
> @@ -1397,7 +1438,8 @@ static int uniwill_suspend_keyboard(struct uniwill=
_data *data)
>  =20
>   static int uniwill_suspend_battery(struct uniwill_data *data)
>   {
> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
> +				     UNIWILL_FEATURE_BATTERY))
>   		return 0;
>  =20
>   	/*
> @@ -1432,7 +1474,8 @@ static int uniwill_resume_keyboard(struct uniwill_=
data *data)
>   	unsigned int value;
>   	int ret;
>  =20
> -	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE,
> +				     UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>   		return 0;
>  =20
>   	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> @@ -1448,7 +1491,8 @@ static int uniwill_resume_keyboard(struct uniwill_=
data *data)
>  =20
>   static int uniwill_resume_battery(struct uniwill_data *data)
>   {
> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY,
> +				     UNIWILL_FEATURE_BATTERY))
>   		return 0;
>  =20
>   	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_C=
TRL_MASK,
> @@ -1496,6 +1540,25 @@ static struct platform_driver uniwill_driver =3D =
{
>   	.shutdown =3D uniwill_shutdown,
>   };
>  =20
> +static struct uniwill_device_descriptor lapac71h_descriptor __initdata =
=3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> +		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> +		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +		    UNIWILL_FEATURE_BATTERY |
> +		    UNIWILL_FEATURE_HWMON
> +};
> +
> +static struct uniwill_device_descriptor lapkc71f_descriptor __initdata =
=3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> +		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> +		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +		    UNIWILL_FEATURE_LIGHTBAR |
> +		    UNIWILL_FEATURE_BATTERY |
> +		    UNIWILL_FEATURE_HWMON
> +};
> +
> +static struct uniwill_device_descriptor empty_descriptor __initdata =3D=
 {};
> +
>   static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D =
{
>   	{
>   		.ident =3D "XMG FUSION 15",
> @@ -1503,6 +1566,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "XMG FUSION 15",
> @@ -1510,6 +1574,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "Intel NUC x15",
> @@ -1517,11 +1582,7 @@ static const struct dmi_system_id uniwill_dmi_tab=
le[] __initconst =3D {
>   			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
>   			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPAC71H"),
>   		},
> -		.driver_data =3D (void *)(UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> -					UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> -					UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> -					UNIWILL_FEATURE_BATTERY |
> -					UNIWILL_FEATURE_HWMON),
> +		.driver_data =3D &lapac71h_descriptor,
>   	},
>   	{
>   		.ident =3D "Intel NUC x15",
> @@ -1529,12 +1590,7 @@ static const struct dmi_system_id uniwill_dmi_tab=
le[] __initconst =3D {
>   			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Intel(R) Client Systems"),
>   			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LAPKC71F"),
>   		},
> -		.driver_data =3D (void *)(UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> -					UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> -					UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> -					UNIWILL_FEATURE_LIGHTBAR |
> -					UNIWILL_FEATURE_BATTERY |
> -					UNIWILL_FEATURE_HWMON),
> +		.driver_data =3D &lapkc71f_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14 Gen6 Intel",
> @@ -1542,6 +1598,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14 Gen6 Intel",
> @@ -1549,6 +1606,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> @@ -1556,6 +1614,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Bo=
ok Pro Gen 7",
> @@ -1563,6 +1622,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia=
-Book Pro Gen 8",
> @@ -1570,6 +1630,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Bo=
ok Pro Gen 8",
> @@ -1577,6 +1638,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> @@ -1584,6 +1646,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> @@ -1591,6 +1654,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia=
-Book 15 Gen9",
> @@ -1598,6 +1662,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -1605,6 +1670,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -1612,6 +1678,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 15 Gen10 Intel",
> @@ -1619,6 +1686,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 15 Gen10 AMD",
> @@ -1626,6 +1694,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -1633,6 +1702,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -1640,6 +1710,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 15 Gen10 Intel",
> @@ -1647,6 +1718,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 Intel",
> @@ -1654,6 +1726,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> @@ -1661,6 +1734,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> @@ -1668,6 +1742,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> @@ -1675,6 +1750,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> @@ -1682,6 +1758,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> @@ -1689,6 +1766,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> @@ -1696,6 +1774,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> @@ -1703,6 +1782,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> @@ -1710,6 +1790,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Trinity 15 Intel Gen1",
> @@ -1717,6 +1798,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Trinity 17 Intel Gen1",
> @@ -1724,6 +1806,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 AMD",
> @@ -1731,6 +1814,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 Intel",
> @@ -1738,6 +1822,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> @@ -1745,6 +1830,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> @@ -1752,6 +1838,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> @@ -1759,6 +1846,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 15 Gen4 Intel",
> @@ -1766,6 +1854,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen5 AMD",
> @@ -1773,6 +1862,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen5 AMD",
> @@ -1780,6 +1870,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5"=
,
> @@ -1787,6 +1878,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 AMD",
> @@ -1794,6 +1886,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim=
 15 Gen6",
> @@ -1801,6 +1894,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1808,6 +1902,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1815,6 +1910,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
> @@ -1822,6 +1918,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 AMD",
> @@ -1829,6 +1926,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1836,6 +1934,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1843,6 +1942,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 14 Gen1 AMD",
> @@ -1850,6 +1950,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 15 Gen1 AMD",
> @@ -1857,6 +1958,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 15 Gen2 AMD",
> @@ -1864,6 +1966,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{ }
>   };
> @@ -1871,6 +1974,7 @@ MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
>  =20
>   static int __init uniwill_init(void)
>   {
> +	const struct uniwill_device_descriptor *descriptor;
>   	const struct dmi_system_id *id;
>   	int ret;
>  =20
> @@ -1880,10 +1984,22 @@ static int __init uniwill_init(void)
>   			return -ENODEV;
>  =20
>   		/* Assume that the device supports all features */
> -		supported_features =3D UINT_MAX;
> +		device_descriptor.features =3D UINT_MAX;
>   		pr_warn("Loading on a potentially unsupported device\n");
>   	} else {
> -		supported_features =3D (uintptr_t)id->driver_data;
> +		/*
> +		 * Some devices might support additional features depending on
> +		 * the BIOS version/date, so we call this callback to let them
> +		 * modify their device descriptor accordingly.
> +		 */
> +		if (id->callback) {
> +			ret =3D id->callback(id);
> +			if (ret < 0)
> +				return ret;
> +		}
> +
> +		descriptor =3D id->driver_data;
> +		device_descriptor =3D *descriptor;
>   	}
>  =20
>   	ret =3D platform_driver_register(&uniwill_driver);
