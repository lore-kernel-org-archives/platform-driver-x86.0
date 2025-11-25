Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62338EED8;
	Tue, 25 Nov 2025 20:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764102722; cv=none; b=WsrlvHV0aKiQUio/KXsznF+/YTpHMf0eaugJWKzQnFh+EETs1t88S3JbYbZvh12ZKWW9pmw9BNoZ1VyQvhWSIf7i3pgzilNEBEJsNKX3Mu9xW7qyukkl/CMuE3xHYjW/fFPagL9L1Z4MkA2gh14E6l918tiyWQRpV+vYz9aIo+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764102722; c=relaxed/simple;
	bh=cWSCqKYmu1bUIsAWbBuTRMvxLuA9GNNVsQvvZlYvPvs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UdkjFmtrOC0Fd1W3dtInbnvbGhX85R+q8EEYw25KvwJA+7fIm7wnJZoP0gqriL5EvxE1ik7u0SUYaMzF+aPnbb4KMef0AaCW10qX73eHqrcRp5j0pjMtCNdODcLy419N6qbP6iOztimDfILhaAgOvRMcxvOFD4FXSAQQmBk/ksQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FzeaMxwy; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FzeaMxwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1764102717; x=1764707517; i=w_armin@gmx.de;
	bh=Ix0vxjWQEKtSSFcsZbwBBHYaR6f8MZe5IsCzSY1zX8g=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FzeaMxwyUsYG8W5/ZGrWioZY4WyG/1uwie6dPfAuj8RzXMWyg3ocJOr2dfmp7U4i
	 H4GDeK9n/ASuOr0xcHgIDOTcu1tEN5CtCGOOVCO//fuYnhbLIXJXfWQoI9aUAWzYQ
	 Trs1AFUh/cxsqtMBusxw1pq7RMo9h/qVG8BjtPp6qGwmJZVRQkUKpq2BQGmpX7UMG
	 Jx/DWg/V50aruh+T3ZbxwNue8LYcRNkLnwhSmVPT1m3CopbhAqCBPGpLXpX4yxclA
	 g1oP8mZlLufts4r9Hre1k29tlmETdyiu0cyC8IlDE79aD+8x27PU+b7YGwYGt3F6R
	 KoxkEclhzipKoajUWQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.247.91]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmUHj-1voqC41J9l-00pOeO; Tue, 25
 Nov 2025 21:31:57 +0100
Message-ID: <f28cdf60-39b1-4b81-977a-ec494a868614@gmx.de>
Date: Tue, 25 Nov 2025 21:31:55 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/2] platform/x86/uniwill: Implement cTGP setting
To: Werner Sembach <wse@tuxedocomputers.com>, hansg@kernel.org,
 ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251125135729.487837-1-wse@tuxedocomputers.com>
 <20251125135729.487837-3-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20251125135729.487837-3-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R8EURycQchi5rlvOYaYeKl5426Kf5k9LFVNQsUNOrTPXQOSqnA3
 V3zZ8/q6mwjODpR2FPQG7kNCajml5qaqCkoVgmAldM3/sd7U+AEvCI2e518H0OResvgJ4OL
 SBStq0Oh5gRyQJ/Vui02f/cv3O9EdkQ+gQp35lWZr0+ne1CUgKZ+wyQV0csuufS2VzUMErw
 vUg4yqjSfigMZZ9Mb0afA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lAD9azdB7e8=;ETwfVWimy3aB2lH9ONG3H8xW+B9
 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
 WfpEAuJ0=

Am 25.11.25 um 14:49 schrieb Werner Sembach:

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
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 157 ++++++++++++++++----
>   1 file changed, 132 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index f6a1054379ee1..503de3858cc0b 100644
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
> @@ -547,6 +555,10 @@ static bool uniwill_readable_reg(struct device *dev=
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
> @@ -802,6 +814,68 @@ static ssize_t breathing_in_suspend_show(struct dev=
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
> Please check for input values larger than 255 and return -EINVAL in such=
 a case.
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

Please mark this device attribute as static.

> +
> +static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
> +{
> +	int ret;
> +
> +	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL=
))
> +		return 0;
> +
> +	ret =3D regmap_update_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
> +				 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE,
> +				 CTGP_DB_GENERAL_ENABLE | CTGP_DB_DB_ENABLE | CTGP_DB_CTGP_ENABLE);

Please initialize the power limits before enabling them. Also, maybe disab=
ling those power limits during
suspend and re-enabling them during resume would be a good idea? This way =
we can avoid overheating the
device should the fan stop too early.

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
> +
> +	return 0;
> +}
> +
>   static struct attribute *uniwill_attrs[] =3D {
>   	/* Keyboard-related */
>   	&dev_attr_fn_lock_toggle_enable.attr,
> @@ -810,6 +884,8 @@ static struct attribute *uniwill_attrs[] =3D {
>   	/* Lightbar-related */
>   	&dev_attr_rainbow_animation.attr,
>   	&dev_attr_breathing_in_suspend.attr,
> +	/* Power-management-related */
> +	&dev_attr_ctgp_offset.attr,
>   	NULL
>   };
>  =20
> @@ -839,6 +915,11 @@ static umode_t uniwill_attr_is_visible(struct kobje=
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
> @@ -1405,6 +1486,10 @@ static int uniwill_probe(struct platform_device *=
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
> @@ -1545,6 +1630,28 @@ struct uniwill_device_descriptor lapkc71f_descrip=
tor __initdata =3D {
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

Please add an empty line here.

> +	if (value & HAS_GPU)
> +		data->features |=3D UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
> +
> +	return 0;
> +};
> +
> +struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __initdata =
=3D {
> +	.probe =3D phxarx1_phxaqf1_probe
> +};
> +
> +struct uniwill_device_descriptor tux_featureset_1_descriptor __initdata=
 =3D {
> +	.features =3D UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL
> +};
> +
>   struct uniwill_device_descriptor void_descriptor __initdata =3D {};

I just noticed that all device descriptors are not marked as static. Pleas=
e fix this.

Other than that, the patch looks very promising.

Thanks,
Armin Wolf

>  =20
>   static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D =
{
> @@ -1594,7 +1701,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> @@ -1602,7 +1709,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxARX1_PHxAQF1"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen7 Intel/Commodore Omnia-Bo=
ok Pro Gen 7",
> @@ -1610,7 +1717,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia=
-Book Pro Gen 8",
> @@ -1626,7 +1733,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> @@ -1634,7 +1741,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> @@ -1802,7 +1909,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 Intel",
> @@ -1810,7 +1917,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> @@ -1818,7 +1925,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> @@ -1826,7 +1933,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> @@ -1834,7 +1941,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 15 Gen4 Intel",
> @@ -1842,7 +1949,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen5 AMD",
> @@ -1850,7 +1957,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen5 AMD",
> @@ -1858,7 +1965,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5"=
,
> @@ -1866,7 +1973,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 AMD",
> @@ -1874,7 +1981,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim=
 15 Gen6",
> @@ -1882,7 +1989,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1890,7 +1997,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -1898,7 +2005,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
> @@ -1906,7 +2013,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 AMD",
> @@ -1914,7 +2021,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1922,7 +2029,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -1930,7 +2037,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>   		},
> -		.driver_data =3D &void_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 14 Gen1 AMD",
