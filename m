Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D030F3451AB;
	Tue, 18 Nov 2025 11:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464343; cv=none; b=cvpX1REQhoo/08q+g6xgVV7pYCSdfpkZ8opyGvryEpT7J6z9ZLckMqgbxsULjDWn4jczZ8ldgaI29aTZQLGsvsAEF5iCev5dP5JgHiMMLo57AsWHj1UhzKEVCF9k9QR2hKcsSKPAO9/L+olt0SXK4ZocSd86snFqQ19b/xkL77Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464343; c=relaxed/simple;
	bh=CU+v0UTNeIM6i6ynCzbyFrAKWz4X+aBubQ0fP/M3dF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cqzCZzErXWxYZYvIy/UQoEeXam9nGJqlqC4r9GihEr/7ozCEwvePYtoSut4QTnFTTvZTbcsctm6SwGl8ExwNhXZySRB+eHN7pd/nLGCKlgrmY/6z2+lpxIEgPyMmLSDXU6BNBNTm9zqDluwnU6IjbMcoixEQz0pEoxXqKU1lRWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FygJtjvQ; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FygJtjvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1763464337; x=1764069137; i=w_armin@gmx.de;
	bh=76twVmUWde5ZfYgmqyw3DHOQmT/q+4TkNHv2VG8MBf8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FygJtjvQ8XQzdRZFnojm4qM1ARdpbuFW/0PYSjxEmOfFXuuJFjrm/iGUoe93Phow
	 +sIKs39LaAOf8vNZQ6WmF9gLLMnqw7HdTyFnFhtPajGmHV6M5Jvu0lkLzrh7uSTOl
	 oYOrZqc5FA95UH1/oVqIL1PznxoZITvf4NzcAWJvq8fvZS8GwbDtqH7Af2NVrqF6G
	 SDcmUHCztXWuN4N9mj0Yr8IcXcnB+bNnlBcL8pGNDz65LovxEykoWWfIVJ3C4kIMQ
	 h+7pYXTuTv3uG4LffJzuKBlIPeE/tE5zGVFhAtDYSqHm7P4gk2iw4CSU/+XrRTGbu
	 wmD8fCnCz3Qu3xItHw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [172.16.23.146] ([141.76.8.146]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnJhO-1w2Ncq37Aq-00nEdj; Tue, 18
 Nov 2025 12:12:16 +0100
Message-ID: <9c5205e8-d3f2-4dbd-8863-5347bb5e77c9@gmx.de>
Date: Tue, 18 Nov 2025 12:12:15 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] platform/x86/uniwill: Implement cTGP setting
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251117132530.32460-1-wse@tuxedocomputers.com>
 <20251117132530.32460-4-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251117132530.32460-4-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LHusJaBNy4lEl9D+91VuCA1SwCL2YFVy/Lf13Yp1pogoaSwH/QT
 N8rtbyeI+7KZVRLE647gBGqUYE4SyWzwrNRHBsPH5EJ8qGPgaZsOv7nMYI1ufagUDmDTI2l
 /r/zuksaCJdK2RemycVWqHgA0KaovYazTKPn2TioWeNbsUxeRWm9o/IJkn5feG/67Phs3AM
 XA55tDjkJ54gFmhjkwIFA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P3qzOTcBaQw=;JgGUGgztQwndhkzv2TIQFW5TPCN
 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

Am 17.11.25 um 14:24 schrieb Werner Sembach:

> Uniwill offers user setable cTGP for their EC on devices using NVIDIA 30=
00
> Series and newer GPUs. This patch implements this setting as a sysfs
> attribute.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 110 +++++++++++++++++++-
>   1 file changed, 107 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index 0cb86a701b2e1..de3417d9d1ac0 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -122,11 +122,11 @@
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
> @@ -317,6 +317,7 @@
>   #define UNIWILL_FEATURE_LIGHTBAR		BIT(3)
>   #define UNIWILL_FEATURE_BATTERY			BIT(4)
>   #define UNIWILL_FEATURE_HWMON			BIT(5)
> +#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(6)
>  =20
>   struct uniwill_data {
>   	struct device *dev;
> @@ -498,6 +499,10 @@ static bool uniwill_writeable_reg(struct device *de=
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
> @@ -531,6 +536,10 @@ static bool uniwill_readable_reg(struct device *dev=
, unsigned int reg)
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
> @@ -786,6 +795,68 @@ static ssize_t breathing_in_suspend_show(struct dev=
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
> +DEVICE_ATTR_RW(ctgp_offset);
> +
> +static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
> +{
> +	int ret;
> +
> +	if (!(supported_features & UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
> +		return 0;
> +
> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
> +				 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE,
> +				 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE);

I think we should initialize the power limits before enabling them, otherw=
ise
the relevant registers might still contain invalid data.

> +	if (ret < 0)
> +		return ret;
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

Are those values the maximum values supported by the platform? If yes then
we should enforce them for sysfs writes.

Also, why is only cTGP accessible from user space?

Thanks,
Armin Wolf

> +
> +	return 0;
> +}
> +
>   static struct attribute *uniwill_attrs[] =3D {
>   	/* Keyboard-related */
>   	&dev_attr_fn_lock_toggle_enable.attr,
> @@ -794,6 +865,8 @@ static struct attribute *uniwill_attrs[] =3D {
>   	/* Lightbar-related */
>   	&dev_attr_rainbow_animation.attr,
>   	&dev_attr_breathing_in_suspend.attr,
> +	/* Power-management-related */
> +	&dev_attr_ctgp_offset.attr,
>   	NULL
>   };
>  =20
> @@ -820,6 +893,11 @@ static umode_t uniwill_attr_is_visible(struct kobje=
ct *kobj, struct attribute *a
>   			return attr->mode;
>   	}
>  =20
> +	if (attr =3D=3D &dev_attr_ctgp_offset.attr) {
> +		if (supported_features & UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL)
> +			return attr->mode;
> +	}
> +
>   	return 0;
>   }
>  =20
> @@ -1371,6 +1449,10 @@ static int uniwill_probe(struct platform_device *=
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
> @@ -1547,6 +1629,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> @@ -1554,6 +1637,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Bo=
ok Pro Gen 7",
> @@ -1561,6 +1645,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia=
-Book Pro Gen 8",
> @@ -1575,6 +1660,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> @@ -1582,6 +1668,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> @@ -1694,6 +1781,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 Intel",
> @@ -1701,6 +1789,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> @@ -1708,6 +1797,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> @@ -1715,6 +1805,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> @@ -1722,6 +1813,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 15 Gen4 Intel",
> @@ -1729,6 +1821,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen5 AMD",
> @@ -1736,6 +1829,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen5 AMD",
> @@ -1743,6 +1837,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5"=
,
> @@ -1750,6 +1845,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 AMD",
> @@ -1757,6 +1853,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim=
 15 Gen6",
> @@ -1764,6 +1861,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1771,6 +1869,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1778,6 +1877,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
> @@ -1785,6 +1885,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 AMD",
> @@ -1792,6 +1893,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1799,6 +1901,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1806,6 +1909,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>   		},
> +		.driver_data =3D (void *)(UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL),
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 14 Gen1 AMD",
