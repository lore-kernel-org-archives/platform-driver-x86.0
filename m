Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9536E1A9F93;
	Thu, 26 Feb 2026 01:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772068549; cv=none; b=YhNPU32ipu7XW6StHHd3HAAU1WlsV5kPs7fUztI5BtkmpHWO3DUqRCcZwfvScOIA5eILU7iegVerf6ofLwSBPibVez6CByLWZD2EWUZcz3zbRwUg/HuVlNDisCV0KLhyj2Q8iF3oGlQ9raxtjY41NWt0eoigHT4rLTXSIyVjLTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772068549; c=relaxed/simple;
	bh=7ebJdgfMxFKsosOncVGc5LQx9gE9nbskQNEVzZsCTQU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W3MRPslZwQckJh6Hx3/wHusarvJtAhpIVDbBBQPeUSwTJ8q4T4mio6uzWQ7zgzKAusSvS4ouxbR4R8MTf979USdmAAyTBXPIecSS3QSdgG4GWZsTAYKKqF0rrG8YCLpHHQ3HWqxoXQzMC9XlYVg9fEsUpCd8dhHiGAUcN3hVqRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Enny7Z9E; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Enny7Z9E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1772068538; x=1772673338; i=w_armin@gmx.de;
	bh=yp3A8GGwxl/5KRAATGCG6qhft7Kp6X8fdOdc3Getiyc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Enny7Z9ETA0GGEVNQRBF1Pzo4v8k4++Q4eDSNOCM+SrPP/8hyVakOjW12mDhQGf3
	 GXiIo3QOSmROmF52ig813YnxqYo1ohAVg56FL48JgCVDHliSfWoVh8WSg77tANoZI
	 9rs+W4TqruXcz7TaT1dzsoIoTu2GuVZUPueeWPSBSUHaRBK5obmQwJeSttl8Om/Rq
	 YHRFEsiMbxhYc2LWQrlyMqL4M+DzyEyo4bZoDdHSwswX6mf8V5dC9CO6mdHi7FIZO
	 5kRdKxdFDoE9WwDwCF9bCcQyRpfJIgoUjAFi6K5Y3UzpfduNTsN3o9J0mGAAjCIQ/
	 yAqrR4dQlyZBpIKDnA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKHm-1vW1KQ2gDU-014niZ; Thu, 26
 Feb 2026 02:15:38 +0100
Message-ID: <9830782e-e050-4a77-a35e-3a92fdb255a0@gmx.de>
Date: Thu, 26 Feb 2026 02:15:37 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] platform/x86/uniwill: Apply features across all
 TUXEDO devices
To: Werner Sembach <wse@tuxedocomputers.com>, Hans de Goede
 <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260226003408.1623547-1-wse@tuxedocomputers.com>
 <20260226003408.1623547-3-wse@tuxedocomputers.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260226003408.1623547-3-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BQJ0NUkfCDVSZCoPz2ChG8F1yZxAN2MLe8iCTlSmDvc1fEakLuP
 0MeYMHOFMfwfZC9LvgjtR5IfX1va5UluTzbM73QvxzmFAaNAwbfWWHqUL7+AJroUIabmL50
 a1/vnko50Y84JLEOKW9aOLGWFGd+K8udZOqChetkMuBbCmMGyq8vZKEgEkkxr8uaB+Yw8f7
 XzbiKFYYl2W2eyZvo4KLQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:b4SqTOnUnoQ=;nO8rW7hrAe+Mn5NI6IAOPDMHtzT
 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

Am 26.02.26 um 01:31 schrieb Werner Sembach:

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
> index 4d9657a3b8c10..88a323241c612 100644
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
> @@ -1819,6 +1821,15 @@ static struct platform_driver uniwill_driver =3D =
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
> @@ -1842,6 +1853,85 @@ static struct uniwill_device_descriptor lapkc71f_=
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
> @@ -1852,37 +1942,45 @@ static int phxarx1_phxaqf1_probe(struct uniwill_=
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
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &lapqc71a_lapqc71b_descriptor,
>   	},

Was choosing "TUXEDO" as the DMI_SYS_VENDOR a mistake made when adding sai=
d entries?
If yes then please fix them with a separate commit and add the appropriate=
 Fixes:
tag so this commit can be picked by the stable kernels.

Other than that:
Reviewed-by: Armin Wolf <W_Armin@gmx.de>

>   	{
>   		.ident =3D "Intel NUC x15",
> @@ -1906,7 +2004,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTxX1"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &phxtxx1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14 Gen6 Intel",
> @@ -1914,7 +2012,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PHxTQx1"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/16 Gen7 Intel",
> @@ -1930,7 +2028,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
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
> @@ -1938,7 +2036,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
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
> @@ -1946,7 +2044,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH4PG31"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 16 Gen8 Intel",
> @@ -1954,7 +2052,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PH6PG01_PH6PG71"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen9 AMD",
> @@ -1962,7 +2060,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
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
> @@ -1970,7 +2068,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GXxMRXx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -1978,7 +2076,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxHP4NAx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 14/15 Gen10 AMD",
> @@ -1986,7 +2084,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxKK4NAx_XxSP4NAx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Pro 15 Gen10 Intel",
> @@ -1994,7 +2092,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "XxAR4NAx"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 15 Gen10 AMD",
> @@ -2002,7 +2100,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5KK45xS_X5SP45xS"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -2010,7 +2108,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6HP45xU"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 AMD",
> @@ -2018,7 +2116,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6KK45xU_X6SP45xU"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 15 Gen10 Intel",
> @@ -2026,7 +2124,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X5AR45xS"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO InfinityBook Max 16 Gen10 Intel",
> @@ -2034,7 +2132,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR55xU"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> @@ -2042,7 +2140,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A1650TI"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 AMD",
> @@ -2050,7 +2148,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501A2060"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> @@ -2058,7 +2156,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A1650TI"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 AMD",
> @@ -2066,7 +2164,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701A2060"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> @@ -2074,7 +2172,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I1650TI"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15 Gen1 Intel",
> @@ -2082,7 +2180,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1501I2060"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> @@ -2090,7 +2188,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I1650TI"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 17 Gen1 Intel",
> @@ -2098,7 +2196,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "POLARIS1701I2060"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Trinity 15 Intel Gen1",
> @@ -2106,7 +2204,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1501I"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Trinity 17 Intel Gen1",
> @@ -2114,7 +2212,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "TRINITY1701I"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 AMD",
> @@ -2122,7 +2220,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxMGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen2 Intel",
> @@ -2130,7 +2228,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxNGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 AMD",
> @@ -2138,7 +2236,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxZGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen3 Intel",
> @@ -2146,7 +2244,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxTGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris/Polaris 15/17 Gen4 AMD",
> @@ -2154,7 +2252,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxRGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 15 Gen4 Intel",
> @@ -2162,7 +2260,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxAGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Polaris 15/17 Gen5 AMD",
> @@ -2170,7 +2268,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxXGxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_2_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen5 AMD",
> @@ -2178,7 +2276,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
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
> @@ -2186,7 +2284,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GMxPXxx"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris Slim 15 Gen6 AMD",
> @@ -2194,7 +2292,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
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
> @@ -2202,7 +2300,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM5IXxA"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -2210,7 +2308,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB1"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen6 Intel/Commodore ORION 16 Gen6",
> @@ -2218,7 +2316,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM6IXxB_MB2"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 17 Gen6 Intel/Commodore ORION 17 Gen6",
> @@ -2226,7 +2324,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GM7IXxN"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 AMD",
> @@ -2234,7 +2332,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6FR5xxY"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -2242,7 +2340,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Stellaris 16 Gen7 Intel",
> @@ -2250,7 +2348,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "X6AR5xxY_mLED"),
>   		},
> -		.driver_data =3D &tux_featureset_1_descriptor,
> +		.driver_data =3D &tux_featureset_3_nvidia_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Book BA15 Gen10 AMD",
> @@ -2258,7 +2356,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5PU1G"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &pf5pu1g_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 14 Gen1 AMD",
> @@ -2266,7 +2364,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1401"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 15 Gen1 AMD",
> @@ -2274,7 +2372,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PULSE1501"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{
>   		.ident =3D "TUXEDO Pulse 15 Gen2 AMD",
> @@ -2282,7 +2380,7 @@ static const struct dmi_system_id uniwill_dmi_tabl=
e[] __initconst =3D {
>   			DMI_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>   			DMI_EXACT_MATCH(DMI_BOARD_NAME, "PF5LUXG"),
>   		},
> -		.driver_data =3D &empty_descriptor,
> +		.driver_data =3D &tux_featureset_1_descriptor,
>   	},
>   	{ }
>   };
