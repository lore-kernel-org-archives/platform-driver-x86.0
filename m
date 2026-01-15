Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA8930DED8;
	Thu, 15 Jan 2026 20:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768509685; cv=none; b=ZTZ42OKViSJJwAKByphmid266HnJmZk/EFBEPGOI7YGcNlOfvBnodHwr/QZthTNwIRvmVx6puQ4pH8DSLS/aTFjMuKbuS0F1nsbVHnPODP/kSDHMPTQn9XojgCBUbq10hiTIkQNBLeN2ZQIrBQxpCtGhbPWBgCgpudoJzwBGAhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768509685; c=relaxed/simple;
	bh=iMWx1KI0G6DC9SOzHG3RclyntzfXxTAdoCS8KTRYJGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=enSDQkDD8o//Nf0UvUidVECLJ7KnPqtAKOeEd8Iiy/Bi5LThaIpPHddjaiLufa79ha4CbDJZGe06eTAjvFEeVBw3n/c3rf3aIrYwZlpG2V6chB6H+CxfANYFNhi6973aX3f0+GWQ11nEjAAUlk4zJev61QgyH7da5JxJWWBHwm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=qHh3OspB; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="qHh3OspB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1768509669; x=1769114469; i=w_armin@gmx.de;
	bh=irQoFQEbAo7CPhqJ7cmsyiwqZsf+fHq7fOdppVQr814=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qHh3OspBefTVK0vzhUOgmVhjOt6+mhUh1mDufu4XQcdxzGYlTGkv2U10ZWA+920W
	 yuYCpZyzIwSS9JajpjwJVskRz8xHH6YqrVAmwVs+bRdYMRoycEqSmSBGtUvYSc2ug
	 LbfecCZavkUZrgvgjRFbe1bTUdnow2noKuPARSVQwmb3etQ6z9ikmMdJ7nSU43VLf
	 h+MawCl50cfP+49BeHoIGaDgpwgslIk4LMrbCq3KicM/vButz2fkxFrXt4m3gNsso
	 kXIMMBibWVDM9PD0CVdXPEN2lsdfsSOR/WrJBhn82fiKVRvA7qPqQdjtiXJpIm1C1
	 KDwGQTM1JhtY3Udmmg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mbir8-1wFHjv0GDe-00fpyQ; Thu, 15
 Jan 2026 21:41:09 +0100
Message-ID: <dcdca55c-ab8e-445a-9d42-f6e82e836bd2@gmx.de>
Date: Thu, 15 Jan 2026 21:41:07 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] platform/x86: uniwill-laptop: Introduce device
 descriptor system
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260115154332.402873-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260115154332.402873-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:05z+FcK8cXYy3dVo4Lshb13a6y1muwIHJxFDMm6jkDXiiNgJAZo
 Mf+17CSqM4zeyosyXRcxdVbnKXRcXZe7DR2CiIwiLoE5uHahJDvc7382nmiQAp6IGraRLBM
 SdKpX+RInHwUFDKm+1xIgWo0UTxIvDoZHRvto7dPi4ziwwlgaGshvEPUjmcTsZA5XlRu7Ga
 9EBR0kHLetpCH3jSjOnIA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0DeI7GMd6g4=;dJlH120t894ag60SEWg91fGjT/2
 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

Am 15.01.26 um 16:42 schrieb Werner Sembach:

> From: Armin Wolf <W_Armin@gmx.de>
>
> Future additions to the driver will depend on device-specific
> initialization steps. Extend the DMI-based feature detection system
> to include device descriptors. Each descriptor contains a bitmap of
> supported features and a set of callback for performing
> device-specific initialization.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> Co-developed-by: Werner Sembach <wse@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 157 ++++++++++++++++----
>   1 file changed, 131 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 0f935532f2504..3d8c136e36219 100644
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
> @@ -411,6 +421,12 @@ static const struct key_entry uniwill_keymap[] =3D =
{
>   	{ KE_END }
>   };
>  =20
> +static inline bool uniwill_device_supports(struct uniwill_data *data,
> +					   unsigned int features)
> +{
> +	return (data->features & features) =3D=3D features;
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
> @@ -1503,6 +1554,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "XMG FUSION 15",
> @@ -1510,6 +1562,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),
>   		},
> +		.driver_data =3D &empty_descriptor,
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
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14 Gen6 Intel",
> @@ -1549,6 +1594,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> @@ -1556,6 +1602,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Bo=
ok Pro Gen 7",
> @@ -1563,6 +1610,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia=
-Book Pro Gen 8",
> @@ -1570,6 +1618,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Bo=
ok Pro Gen 8",
> @@ -1577,6 +1626,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> @@ -1584,6 +1634,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> @@ -1591,6 +1642,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia=
-Book 15 Gen9",
> @@ -1598,6 +1650,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -1605,6 +1658,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -1612,6 +1666,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 15 Gen10 Intel",
> @@ -1619,6 +1674,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 15 Gen10 AMD",
> @@ -1626,6 +1682,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -1633,6 +1690,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -1640,6 +1698,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 15 Gen10 Intel",
> @@ -1647,6 +1706,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 Intel",
> @@ -1654,6 +1714,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> @@ -1661,6 +1722,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> @@ -1668,6 +1730,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> @@ -1675,6 +1738,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> @@ -1682,6 +1746,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> @@ -1689,6 +1754,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> @@ -1696,6 +1762,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> @@ -1703,6 +1770,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> @@ -1710,6 +1778,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Trinity 15 Intel Gen1",
> @@ -1717,6 +1786,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Trinity 17 Intel Gen1",
> @@ -1724,6 +1794,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 AMD",
> @@ -1731,6 +1802,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 Intel",
> @@ -1738,6 +1810,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> @@ -1745,6 +1818,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> @@ -1752,6 +1826,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> @@ -1759,6 +1834,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 15 Gen4 Intel",
> @@ -1766,6 +1842,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen5 AMD",
> @@ -1773,6 +1850,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen5 AMD",
> @@ -1780,6 +1858,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5"=
,
> @@ -1787,6 +1866,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 AMD",
> @@ -1794,6 +1874,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim=
 15 Gen6",
> @@ -1801,6 +1882,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1808,6 +1890,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1815,6 +1898,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
> @@ -1822,6 +1906,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 AMD",
> @@ -1829,6 +1914,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1836,6 +1922,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1843,6 +1930,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Book BA15 Gen10 AMD",
> @@ -1850,6 +1938,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 14 Gen1 AMD",
> @@ -1857,6 +1946,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 15 Gen1 AMD",
> @@ -1864,6 +1954,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 15 Gen2 AMD",
> @@ -1871,6 +1962,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
>   		},
> +		.driver_data =3D &empty_descriptor,
>   	},
>   	{ }
>   };
> @@ -1878,6 +1970,7 @@ MODULE_DEVICE_TABLE(dmi, uniwill_dmi_table);
>  =20
>   static int __init uniwill_init(void)
>   {
> +	const struct uniwill_device_descriptor *descriptor;
>   	const struct dmi_system_id *id;
>   	int ret;
>  =20
> @@ -1887,10 +1980,22 @@ static int __init uniwill_init(void)
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
