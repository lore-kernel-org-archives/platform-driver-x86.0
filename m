Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8148025F797;
	Tue, 25 Nov 2025 20:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764101920; cv=none; b=uSplmxOeeE9SD157AECGOJCWLnW/j/zst9+P5AIrHnXNma7bQ4hs/Bl5M+rvH/jxo2rqMwbhMqE2lsqNempOSKEduWj3V2NJVV8UAHqJukA9icjgy9LQcUEJHts5e6XAKmb9N6HF4pytv6F1QAbHYOUJzLJvQDrlxdWC+jRqCUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764101920; c=relaxed/simple;
	bh=clmatG8fGXKXeuQ4f+5IFtV8eGGZOIO8MIKth79xLHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O+QYo4uMte44d4jG34VBDsAPWHfSHNH5hVR5Tqx6pPzVxpgQbuyF7PNfdDA/Yw1zBhZGam/jYCOUpEFSfB9HljlQvIlFrgGjT3rZZsZZRMN3MhzF/PPM4Pk+CFhJBz5zpiE099B8cj3E5ecKz+K9qs8nIr6I23wWk3k6Kg2bt+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=skfkq7nb; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="skfkq7nb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764101909; x=1764706709; i=w_armin@gmx.de;
	bh=Ydo51GlXmuqtqK7GFt8gcEr/d75PBVp8LNYc51xl4pk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=skfkq7nb08kNHnRnACwkBIR+4l2/w3MPzL2KQGh5vKODFN78EHWlx/vBGxR3h9kV
	 40h/UpCnqiUxXJe56RyfnyJVJLzEC9XTssvd++hUcZdN9jZqXnn9iuKtfW6TAVb6n
	 r9kTGbx9AYhm0h00acgBYSlEHeOmwg2/Lb2YX5M3ms2a4epw54lR7OBGGd+ObF9Oj
	 c5U7VDGqY2VWc35pocOrGm/5myN3s1uAM/IGwt/9vDBLGcr1TXGXs5IbjeOYpu0nv
	 TaagqQ23avEcbotI3SChcHrxyuHSvoGFTDK41ZMdTqTBtR19A0SUQs7AJH0RYCItZ
	 LG1FNlmnbFcQT58ydg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MS3mz-1vYo5W17QB-00Qp2P; Tue, 25
 Nov 2025 21:18:29 +0100
Message-ID: <0fe18501-35e5-41c5-9f05-c1408e11daa9@gmx.de>
Date: Tue, 25 Nov 2025 21:18:27 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/2] platform/x86: uniwill-laptop: Introduce device
 descriptor system
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251125135729.487837-1-wse@tuxedocomputers.com>
 <20251125135729.487837-2-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251125135729.487837-2-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GVVvQfKBwlmjbJZQoFPw2r8wXg96dp4M7QbcHtPgOlsMgjkKfGy
 wHQB3v+NeQxFBiaI1D7O7upChpbM6zQgPVfPx+VEl/3ykkHeGTRgIlM+zAinFml2H9QVwpu
 XbLxA1R5JJwHGoo4enbMJeJg+xvvLAcPEaW9yCIxuUpMh+3er2bxn1HHAy8KVV4QoI8WZNQ
 7BXLwXXx+U8a57N4SYXIw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b5BSP5mta8E=;cb/hOg1vtdXJ1vHvHpfXEZILZTL
 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

Am 25.11.25 um 14:49 schrieb Werner Sembach:

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
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 156 ++++++++++++++++----
>   1 file changed, 130 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index bd7e63dd51810..f6a1054379ee1 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -334,6 +334,7 @@ struct uniwill_data {
>   	struct mutex input_lock;	/* Protects input sequence during notify */
>   	struct input_dev *input_device;
>   	struct notifier_block nb;
> +	unsigned int features;

Hi,

could you please move this field just below the regmap field? This would b=
e a good way
to signal the importance of said field for the remaining fields.

>   };
>  =20
>   struct uniwill_battery_entry {
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
> @@ -411,6 +421,12 @@ static const struct key_entry uniwill_keymap[] =3D =
{
>   	{ KE_END }
>   };
>  =20
> +static inline bool uniwill_device_supports(struct uniwill_data *data,
> +					   unsigned int feature_mask)
> +{
> +	return data->features & feature_mask;

Do we want to support for testing multiple features at once? If yes then
please change this to:

	return (data->features & feature_mask) =3D=3D feature_mask;

If no then please rename "feature_mask" to "feature".

> +}
> +
>   static int uniwill_ec_reg_write(void *context, unsigned int reg, unsig=
ned int val)
>   {
>   	union acpi_object params[2] =3D {
> @@ -799,24 +815,27 @@ static struct attribute *uniwill_attrs[] =3D {
>  =20
>   static umode_t uniwill_attr_is_visible(struct kobject *kobj, struct at=
tribute *attr, int n)
>   {
> +	struct device *dev =3D kobj_to_dev(kobj);
> +	struct uniwill_data *data =3D dev_get_drvdata(dev);
> +
>   	if (attr =3D=3D &dev_attr_fn_lock_toggle_enable.attr) {
> -		if (supported_features & UNIWILL_FEATURE_FN_LOCK_TOGGLE)
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_FN_LOCK_TOGGLE))
>   			return attr->mode;
>   	}
>  =20
>   	if (attr =3D=3D &dev_attr_super_key_toggle_enable.attr) {
> -		if (supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE)
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>   			return attr->mode;
>   	}
>  =20
>   	if (attr =3D=3D &dev_attr_touchpad_toggle_enable.attr) {
> -		if (supported_features & UNIWILL_FEATURE_TOUCHPAD_TOGGLE)
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_TOUCHPAD_TOGGLE))
>   			return attr->mode;
>   	}
>  =20
>   	if (attr =3D=3D &dev_attr_rainbow_animation.attr ||
>   	    attr =3D=3D &dev_attr_breathing_in_suspend.attr) {
> -		if (supported_features & UNIWILL_FEATURE_LIGHTBAR)
> +		if (uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR))
>   			return attr->mode;
>   	}
>  =20
> @@ -944,7 +963,7 @@ static int uniwill_hwmon_init(struct uniwill_data *d=
ata)
>   {
>   	struct device *hdev;
>  =20
> -	if (!(supported_features & UNIWILL_FEATURE_HWMON))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_HWMON))
>   		return 0;
>  =20
>   	hdev =3D devm_hwmon_device_register_with_info(data->dev, "uniwill", d=
ata,
> @@ -1019,7 +1038,7 @@ static int uniwill_led_init(struct uniwill_data *d=
ata)
>   	unsigned int value;
>   	int ret;
>  =20
> -	if (!(supported_features & UNIWILL_FEATURE_LIGHTBAR))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_LIGHTBAR))
>   		return 0;
>  =20
>   	ret =3D devm_mutex_init(data->dev, &data->led_lock);
> @@ -1232,7 +1251,7 @@ static int uniwill_battery_init(struct uniwill_dat=
a *data)
>   {
>   	int ret;
>  =20
> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>   		return 0;
>  =20
>   	ret =3D devm_mutex_init(data->dev, &data->battery_lock);
> @@ -1361,6 +1380,19 @@ static int uniwill_probe(struct platform_device *=
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
> @@ -1385,7 +1417,7 @@ static void uniwill_shutdown(struct platform_devic=
e *pdev)
>  =20
>   static int uniwill_suspend_keyboard(struct uniwill_data *data)
>   {
> -	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>   		return 0;
>  =20
>   	/*
> @@ -1397,7 +1429,7 @@ static int uniwill_suspend_keyboard(struct uniwill=
_data *data)
>  =20
>   static int uniwill_suspend_battery(struct uniwill_data *data)
>   {
> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>   		return 0;
>  =20
>   	/*
> @@ -1432,7 +1464,7 @@ static int uniwill_resume_keyboard(struct uniwill_=
data *data)
>   	unsigned int value;
>   	int ret;
>  =20
> -	if (!(supported_features & UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_SUPER_KEY_TOGGLE))
>   		return 0;
>  =20
>   	ret =3D regmap_read(data->regmap, EC_ADDR_SWITCH_STATUS, &value);
> @@ -1448,7 +1480,7 @@ static int uniwill_resume_keyboard(struct uniwill_=
data *data)
>  =20
>   static int uniwill_resume_battery(struct uniwill_data *data)
>   {
> -	if (!(supported_features & UNIWILL_FEATURE_BATTERY))
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_BATTERY))
>   		return 0;
>  =20
>   	return regmap_update_bits(data->regmap, EC_ADDR_CHARGE_CTRL, CHARGE_C=
TRL_MASK,
> @@ -1496,6 +1528,25 @@ static struct platform_driver uniwill_driver =3D =
{
>   	.shutdown =3D uniwill_shutdown,
>   };
>  =20
> +struct uniwill_device_descriptor lapac71h_descriptor __initdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> +		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> +		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +		    UNIWILL_FEATURE_BATTERY |
> +		    UNIWILL_FEATURE_HWMON
> +};
> +
> +struct uniwill_device_descriptor lapkc71f_descriptor __initdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK_TOGGLE |
> +		    UNIWILL_FEATURE_SUPER_KEY_TOGGLE |
> +		    UNIWILL_FEATURE_TOUCHPAD_TOGGLE |
> +		    UNIWILL_FEATURE_LIGHTBAR |
> +		    UNIWILL_FEATURE_BATTERY |
> +		    UNIWILL_FEATURE_HWMON
> +};
> +
> +struct uniwill_device_descriptor void_descriptor __initdata =3D {};

void_descriptor -> empty_descriptor.

With the above issues being fixed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +
>   static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D =
{
>   	{
>   		.ident =3D "XMG FUSION 15",
> @@ -1503,6 +1554,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "XMG FUSION 15",
> @@ -1510,6 +1562,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "Intel NUC x15",
> @@ -1517,11 +1570,7 @@ static const struct dmi_system_id uniwill_dmi_tab=
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
> @@ -1529,12 +1578,7 @@ static const struct dmi_system_id uniwill_dmi_tab=
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
> @@ -1542,6 +1586,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14 Gen6 Intel",
> @@ -1549,6 +1594,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> @@ -1556,6 +1602,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Bo=
ok Pro Gen 7",
> @@ -1563,6 +1610,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia=
-Book Pro Gen 8",
> @@ -1570,6 +1618,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Bo=
ok Pro Gen 8",
> @@ -1577,6 +1626,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> @@ -1584,6 +1634,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> @@ -1591,6 +1642,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia=
-Book 15 Gen9",
> @@ -1598,6 +1650,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -1605,6 +1658,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -1612,6 +1666,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 15 Gen10 Intel",
> @@ -1619,6 +1674,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 15 Gen10 AMD",
> @@ -1626,6 +1682,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -1633,6 +1690,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -1640,6 +1698,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 15 Gen10 Intel",
> @@ -1647,6 +1706,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 Intel",
> @@ -1654,6 +1714,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> @@ -1661,6 +1722,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> @@ -1668,6 +1730,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> @@ -1675,6 +1738,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> @@ -1682,6 +1746,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> @@ -1689,6 +1754,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> @@ -1696,6 +1762,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> @@ -1703,6 +1770,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> @@ -1710,6 +1778,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Trinity 15 Intel Gen1",
> @@ -1717,6 +1786,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Trinity 17 Intel Gen1",
> @@ -1724,6 +1794,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 AMD",
> @@ -1731,6 +1802,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 Intel",
> @@ -1738,6 +1810,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> @@ -1745,6 +1818,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> @@ -1752,6 +1826,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> @@ -1759,6 +1834,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 15 Gen4 Intel",
> @@ -1766,6 +1842,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen5 AMD",
> @@ -1773,6 +1850,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen5 AMD",
> @@ -1780,6 +1858,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5"=
,
> @@ -1787,6 +1866,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 AMD",
> @@ -1794,6 +1874,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim=
 15 Gen6",
> @@ -1801,6 +1882,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1808,6 +1890,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1815,6 +1898,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
> @@ -1822,6 +1906,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 AMD",
> @@ -1829,6 +1914,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1836,6 +1922,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1843,6 +1930,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 14 Gen1 AMD",
> @@ -1850,6 +1938,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 15 Gen1 AMD",
> @@ -1857,6 +1946,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 15 Gen2 AMD",
> @@ -1864,6 +1954,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
>   		},
> +		.driver_data =3D &void_descriptor,
>   	},
>   	{ }
>   };
> @@ -1871,6 +1962,7 @@ MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
>  =20
>   static int __init uniwill_init(void)
>   {
> +	const struct uniwill_device_descriptor *descriptor;
>   	const struct dmi_system_id *id;
>   	int ret;
>  =20
> @@ -1880,10 +1972,22 @@ static int __init uniwill_init(void)
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
