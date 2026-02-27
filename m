Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE0B3624D2;
	Fri, 27 Feb 2026 09:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772184926; cv=none; b=aH+qshv66z+mbfsWLJwqMvHkOkKZ9BKg9KFqlVI881FgGJMbTWDQDokM78NNWao3I12m6hvzVb4IL5Wp+I73d7mBgj9B0WYrtucy7jvjs/Mc2CwGOt04BIYjmfTwv3nPYsikwGAamzGijqIHb7lSHyNtAKWY1VeXO/in0YLsKm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772184926; c=relaxed/simple;
	bh=WX9IuSUszxszLuO9GXgNfyeU5aTi00FLfSUeZzXRWQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NFUO3uInKjkbbndIetnec/ljqclA9iXdPjrVZ21/6Yq44qjbHDQXwp02kd8GHDo2SogQrhzNcwJPwJ13TL03Ek87NXwJ/OY2mPlXGFVtXrBkvWJV5Q30LGJoLx2iPEUA+rhT0f51xryjYTfzXDQ6RQs3AJ3KKVICRqIMnxVwZ7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=i+kQo9Tu; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="i+kQo9Tu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772184913; x=1772789713; i=w_armin@gmx.de;
	bh=pwu+KoJr2QH8MFzjCjbvdbhqUy5iFSHvdAp57fELZcw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=i+kQo9TuoaOTmBtSROnpRFReelpHtxqJHNF7lcOvo3gyc10sGlM63IZBXyXojacz
	 78AFWKftFl/+erfNnmEf9MOhLwLwC0yIZm5AychR6y6Czcgh+QrZieOHX2XQKGFOm
	 AXa/8Fxb5pn65ein+AnGgiQoT4BrgtzgZPIcuH421yhlGEDIXCDvuI6P+7GnOxifJ
	 WeWf85OgfZ1kp5aAeqNbA04SeoQQm1euO4Iz/Q3BVnKRn+E3tgBkupHslE0Cm0mUb
	 7uvoDsGNi5aVeXzaXSzApuC8BEAfH2GKrm2bwMcgv3YGk4LQQ62+032t++IYkAnF2
	 Z9dS32RoZ9sp2/rKuQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1vgJD632K1-011ldR; Fri, 27
 Feb 2026 10:35:13 +0100
Message-ID: <054f4b9e-7868-490f-852c-039f6451c0c0@gmx.de>
Date: Fri, 27 Feb 2026 10:35:12 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] platform/x86/uniwill: Apply features across all
 TUXEDO devices
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226205302.123782-1-wse@tuxedocomputers.com>
 <20260226205302.123782-4-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260226205302.123782-4-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:s+eFs8Y6neSfjc+nHk608h8XxUgd/geftJ0hssHw5dU3CQsHoNF
 LzYQ0MKwtr1iFSmlMWS5DvAjvKi88TapfAt01foyrKwnyO7tLXtXyr8Q3CGeSDpj+2H79Ho
 A0gIKx2bdxRiTHJuqXl926EuXZZ14rRG2s1Xjhm9NiczjvIEXH9vqN2bN2rMYbh2XmxXH6b
 1ZE0KLG7MtLpllQaxiFqA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wcZ1bGFzOkU=;ZW5V0ZdVXvsB/rvhX6vnnBfGDIt
 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
 VMscWb7ueJd

Am 26.02.26 um 21:50 schrieb Werner Sembach:

> Uses the more fine granular and/or new feature defines to enable more
> features across the TUXEDO device lineup.
>
> Also adds features defines that where already present, but not tested un=
til
> now.
>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   drivers/platform/x86/uniwill/uniwill-acpi.c | 214 ++++++++++++++------
>   1 file changed, 156 insertions(+), 58 deletions(-)
>
> diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platf=
orm/x86/uniwill/uniwill-acpi.c
> index a34b1eed74eb2..f54b27ae832d2 100644
> --- a/drivers/platform/x86/uniwill/uniwill-acpi.c
> +++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
> @@ -110,6 +110,8 @@
>   #define EC_ADDR_BAT_CYCLE_COUNT_2	0x04A7
>  =20
>   #define EC_ADDR_PROJECT_ID		0x0740
> +#define PROJECT_ID_PH4TRX1		0x12
> +#define PROJECT_ID_PH6TRX1		0x15
>  =20
>   #define EC_ADDR_AP_OEM			0x0741
>   #define	ENABLE_MANUAL_CTRL		BIT(0)
> @@ -1821,6 +1823,15 @@ static struct platform_driver uniwill_driver =3D =
{
>   	.shutdown =3D uniwill_shutdown,
>   };
>  =20
> +static struct uniwill_device_descriptor lapqc71a_lapqc71b_descriptor __=
initdata =3D {
> +	.features =3D UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_BATTERY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN,
> +};
> +
>   static struct uniwill_device_descriptor lapac71h_descriptor __initdata=
 =3D {
>   	.features =3D UNIWILL_FEATURE_FN_LOCK |
>   		    UNIWILL_FEATURE_SUPER_KEY |
> @@ -1844,6 +1855,85 @@ static struct uniwill_device_descriptor lapkc71f_=
descriptor __initdata =3D {
>   		    UNIWILL_FEATURE_SECONDARY_FAN,
>   };
>  =20
> +/*
> + * The featuresets below reflect somewhat chronological changes:
> + * 1 -> 2: UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL is added to the EC firmw=
are.
> + * 2 -> 3: UNIWILL_FEATURE_USB_C_POWER_PRIORITY is removed from the EC =
firmware.
> + * Some devices might divert from this timeline.
> + */
> +
> +static struct uniwill_device_descriptor tux_featureset_1_descriptor __i=
nitdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> +};
> +
> +static struct uniwill_device_descriptor tux_featureset_1_nvidia_descrip=
tor __initdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> +};
> +
> +static struct uniwill_device_descriptor tux_featureset_2_nvidia_descrip=
tor __initdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> +};
> +
> +static struct uniwill_device_descriptor tux_featureset_3_descriptor __i=
nitdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN,
> +};
> +
> +static struct uniwill_device_descriptor tux_featureset_3_nvidia_descrip=
tor __initdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_GPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
> +};
> +
> +static int phxtxx1_probe(struct uniwill_data *data)
> +{
> +	unsigned int value;
> +	int ret;
> +
> +	ret =3D regmap_read(data->regmap, EC_ADDR_PROJECT_ID, &value);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (value =3D=3D PROJECT_ID_PH4TRX1 || value =3D=3D PROJECT_ID_PH6TRX1=
)
> +		data->features |=3D UNIWILL_FEATURE_SECONDARY_FAN;
> +
> +	return 0;
> +};
> +
> +static struct uniwill_device_descriptor phxtxx1_descriptor __initdata =
=3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
> +	.probe =3D phxtxx1_probe,
> +};
> +
>   static int phxarx1_phxaqf1_probe(struct uniwill_data *data)
>   {
>   	unsigned int value;
> @@ -1854,37 +1944,45 @@ static int phxarx1_phxaqf1_probe(struct uniwill_=
data *data)
>   		return ret;
>  =20
>   	if (value & HAS_GPU)
> -		data->features |=3D UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
> +		data->features |=3D UNIWILL_FEATURE_GPU_TEMP |
> +				  UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
>  =20
>   	return 0;
>   };
>  =20
>   static struct uniwill_device_descriptor phxarx1_phxaqf1_descriptor __i=
nitdata =3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN |
> +		    UNIWILL_FEATURE_SECONDARY_FAN |
> +		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
>   	.probe =3D phxarx1_phxaqf1_probe,
>   };
>  =20
> -static struct uniwill_device_descriptor tux_featureset_1_descriptor __i=
nitdata =3D {
> -	.features =3D UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
> +static struct uniwill_device_descriptor pf5pu1g_descriptor __initdata =
=3D {
> +	.features =3D UNIWILL_FEATURE_FN_LOCK |
> +		    UNIWILL_FEATURE_SUPER_KEY |
> +		    UNIWILL_FEATURE_CPU_TEMP |
> +		    UNIWILL_FEATURE_PRIMARY_FAN,
>   };
>  =20
> -static struct uniwill_device_descriptor empty_descriptor __initdata =3D=
 {};
> -
>   static const struct dmi_system_id uniwill_dmi_table[] __initconst =3D =
{
>   	{
> -		.ident =3D "XMG FUSION 15",
> +		.ident =3D "XMG FUSION 15 (L19)",
>   		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71A"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &lapqc71a_lapqc71b_descriptor,
>   	},
>   	{
> -		.ident =3D "XMG FUSION 15",
> +		.ident =3D "XMG FUSION 15 (L19)",
>   		.matches =3D {
> -			DMI_MATCH(DMI_SYS_VENDOR, "SchenkerTechnologiesGmbH"),
> +			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "LAPQC71B"),

I am missing a changelog for the series, and i am a bit confused. Was this=
 change a mistake or not?

Thanks,
Armin Wolf

>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &lapqc71a_lapqc71b_descriptor,
>   	},
>   	{
>   		.ident =3D "Intel NUC x15",
> @@ -1908,7 +2006,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &phxtxx1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14 Gen6 Intel",
> @@ -1916,7 +2014,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> @@ -1932,7 +2030,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6AG01_PH6AQ71_PH6AQI1"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen8 Intel/Commodore Omnia=
-Book Pro Gen 8",
> @@ -1940,7 +2038,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PRX1_PH6PRX1"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14 Gen8 Intel/Commodore Omnia-Bo=
ok Pro Gen 8",
> @@ -1948,7 +2046,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> @@ -1956,7 +2054,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> @@ -1964,7 +2062,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxHRXx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia=
-Book 15 Gen9",
> @@ -1972,7 +2070,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -1980,7 +2078,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -1988,7 +2086,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 15 Gen10 Intel",
> @@ -1996,7 +2094,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 15 Gen10 AMD",
> @@ -2004,7 +2102,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -2012,7 +2110,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -2020,7 +2118,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 15 Gen10 Intel",
> @@ -2028,7 +2126,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 Intel",
> @@ -2036,7 +2134,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> @@ -2044,7 +2142,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> @@ -2052,7 +2150,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> @@ -2060,7 +2158,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> @@ -2068,7 +2166,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> @@ -2076,7 +2174,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> @@ -2084,7 +2182,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> @@ -2092,7 +2190,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> @@ -2100,7 +2198,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Trinity 15 Intel Gen1",
> @@ -2108,7 +2206,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Trinity 17 Intel Gen1",
> @@ -2116,7 +2214,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 AMD",
> @@ -2124,7 +2222,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 Intel",
> @@ -2132,7 +2230,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> @@ -2140,7 +2238,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> @@ -2148,7 +2246,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> @@ -2156,7 +2254,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 15 Gen4 Intel",
> @@ -2164,7 +2262,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen5 AMD",
> @@ -2172,7 +2270,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen5 AMD",
> @@ -2180,7 +2278,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6XGxX"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16/17 Gen5 Intel/Commodore ORION Gen 5"=
,
> @@ -2188,7 +2286,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 AMD",
> @@ -2196,7 +2294,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxHGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 Intel/Commodore ORION Slim=
 15 Gen6",
> @@ -2204,7 +2302,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -2212,7 +2310,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -2220,7 +2318,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
> @@ -2228,7 +2326,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 AMD",
> @@ -2236,7 +2334,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -2244,7 +2342,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -2252,7 +2350,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Book BA15 Gen10 AMD",
> @@ -2260,7 +2358,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &pf5pu1g_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 14 Gen1 AMD",
> @@ -2268,7 +2366,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 15 Gen1 AMD",
> @@ -2276,7 +2374,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 15 Gen2 AMD",
> @@ -2284,7 +2382,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{ }
>   };
