Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EE791C28E;
	Fri, 27 Dec 2024 04:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735272168; cv=none; b=CcmjBsjbYCUn8tZNDMFdUFdxNJXhq+zRwbXwSQ9xQcQcm3Ae3VPWyrxD8jOi1hpYI86Q7lQlVDyzqAtLQpkJy5FMmW2iRrbMs5ofi7HXhiDqhF62uWchx0Sqh4bVpBKzJ5wJ77fQ28coNBtiAU8nQFcoX7OPey3MWK+g23egRCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735272168; c=relaxed/simple;
	bh=2y2yHNrqIpZsUC1U58aAxgLVXSKH7jHXaxd8J4a8KfM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SCnV/s+OiW2Me0Exo7FVl8CiIKsf6GEMSfTXGY/80LELkLeyTysHNONNM5LGpEr9t45TGV2v4Hhf/oJLJLbIn22PfkbFzLiCEClz534SRNtyIlactotLWRf344o3z8wgbzOvsvev8Ciak4z5k8ymd6rkMwHRnJrS73fTmvbuog4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=giB/s7t6; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="giB/s7t6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735272154; x=1735876954; i=w_armin@gmx.de;
	bh=98T4UZv5xW3FwUshl92sFYYpKPLswN/zOsd65TxVieU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=giB/s7t6CFR7H/2w/jtDxGqyod32IOnHQGke0a9WqTEn+KO5Ul1H5JaAFNEiwwkw
	 Jc9hX+gO6T3B4x/GCi85VjIXYuUxBsfyGO+h3q0Scw7JOZy0hgQrEU3oRHhkMmlZh
	 DABbAfz1EKKShXKQ1txmu0erIqw6dMxGnWSINnoDf44V32jIkxpVcgTSbNAagES1c
	 xYL8EXqoThn1mKuwPWPURF12qvXbLHYDsxI5bIYo9I8fga/MFIUjATWFsySoH2jki
	 HdO2gRLEVtSXX1LxSK7OGDkhEAfmFMp8C0yQeiVdBjNtMPDP9rpfCKGJ9Axy9Wgag
	 oixLIvCeIVHpxeD2xg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mg6Zq-1u0vbD3rOI-00e5XX; Fri, 27
 Dec 2024 05:02:33 +0100
Message-ID: <50f0debc-2b73-49dc-8c52-c38203c3700d@gmx.de>
Date: Fri, 27 Dec 2024 05:02:32 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/20] platform/x86: Add alienware-wmi.h
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-17-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-17-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/URifN6cbobo7X1g++TKzdS6LQeTzyNVYap943TiNLzYLzyg+33
 wSsU8QJkYxH1MKNj11XDwLv6kg05v+rF1D3NQpBfqg03Q8r2UrpcaB9xENstE0WjQuahlHE
 ntQFFx4NMRYyLuG+3n0INxYghdasfdeDWExAGQhEM79v1+nQA0e79SHhOjepetQiZwlZLWD
 jy8/vVb1iyx0bShE2IcTg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TkpR0zNLtMs=;CS+DRP8sj/55Vg0fdWTcTo1hh8M
 LmKBrZmSKLh5j/Wkvzck17mWfi/7hczeRh0ibS0aQ2dZn8t1yiMxih/nczX43BHRaCICONGHU
 1cd6CFTFLqreNdLBLAh6Lv38Lt4kt684K6KZbqp+zYHa4A+JHVgB9AZhVILY153ntyo88watp
 rX4tOrha1zT2iw9aqctgCnMBP1Bra8sd8Us+3T/ubXZzGC5FZsRlLJVFwz/TtVMZnhYPXI02G
 C+BaHWFYyXyguCHSXdvS/l3IEawoXE0frNHw6L5A/G0YjfHgjDeMrU43CboesrwfJhVWxAQ2f
 MbEpaZAIlywuxAewH11/Qz4ArVDtAS0jPpyqAkdZEBUny+QyqNUl6zqDjZ+66n5xOKqFPg9m5
 tvbOlGYA7IxnmHCYptN8USPUv7YqLsjUMbKFcj2P7eErqhSAyTzqouYf1dyibpQCUsylDTlPn
 USsHPXbpjpgyXAY0AONkyGzNGC9NSHDqHPjLt2AUqPW7DOhpQYIvQ4/3kLShTYCOPlUgXhRQq
 2HVcBF79JtViwS4gGe2NfUqF0NrGzUkkXxMHW+2RGG2RqHHIqBfwQOuSIKgsjldyCE0vUU3Bj
 TNnmMugKLubQV4J5tMf0yiYnrTbBDiaq4wVIuooejJ6nfeeXGdor/ytW+fV5j5RI2sTgUgIFd
 v9Do+Sg8kwYr4W+23rLmBEOdaKZCixtBKeaXM0RSecaAmwutozq/Jzhzeh1X/fcwtoMaR6Ysq
 sdHYKbenQPd3+ye7fus8Zg6oPEGND6gsGWAlEwcfTdR1JnamqdsflqSIM4+A+5ExM6QKILC0A
 NFcB20GtQhpdjTh7xbN9qvgAfE1460Beh8MabRS9SJEkIVzJBV1jkYxVnRWioprZLNqXz+CZM
 17wGxLg3xOln5q4fSrVpR+STJ14ZMNhcBySwmlBMdm68eMcC1GDq6nPPjd0zRiYXrWvIPuP9K
 vtOX9RVBo5gY62l2aSOUavx1BEcdpVyWgC/eUGDDneXop35VE2R6gtN9hukuiL8Uggm82BHvN
 mlm8Tf9NOUkUGHm/m67i7IZ4gJqQtIqbBDbMwZR5TyEQ3bx7Bg9n1jCSc0uNS5rP/CGQPoZ9s
 pUtPzso1v3Ynid20LqlzwsUVDoU3DS

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Add a header file for alienware-wmi with shared resources to support the
> upcoming file split.

I am OK with this, but only common definitions should be moved inside this=
 header file.
Definitions only used by a single driver should remain inside the driver f=
ile.

Thanks,
Armin Wolf

> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   .../platform/x86/dell/alienware-wmi-base.c    |  93 ++--------------
>   drivers/platform/x86/dell/alienware-wmi.h     | 103 ++++++++++++++++++
>   2 files changed, 112 insertions(+), 84 deletions(-)
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/pl=
atform/x86/dell/alienware-wmi-base.c
> index 8ea08f5f8810..e8d470bbb608 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> @@ -16,26 +16,7 @@
>   #include <linux/dmi.h>
>   #include <linux/leds.h>
>   #include <linux/wmi.h>
> -
> -#define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
> -#define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492=
"
> -#define WMAX_CONTROL_GUID		"A70591CE-A997-11DA-B012-B622A1EF5492"
> -
> -#define WMAX_METHOD_HDMI_SOURCE		0x1
> -#define WMAX_METHOD_HDMI_STATUS		0x2
> -#define WMAX_METHOD_BRIGHTNESS		0x3
> -#define WMAX_METHOD_ZONE_CONTROL	0x4
> -#define WMAX_METHOD_HDMI_CABLE		0x5
> -#define WMAX_METHOD_AMPLIFIER_CABLE	0x6
> -#define WMAX_METHOD_DEEP_SLEEP_CONTROL	0x0B
> -#define WMAX_METHOD_DEEP_SLEEP_STATUS	0x0C
> -#define WMAX_METHOD_THERMAL_INFORMATION	0x14
> -#define WMAX_METHOD_THERMAL_CONTROL	0x15
> -#define WMAX_METHOD_GAME_SHIFT_STATUS	0x25
> -
> -#define WMAX_THERMAL_MODE_GMODE		0xAB
> -
> -#define WMAX_FAILURE_CODE		0xFFFFFFFF
> +#include "alienware-wmi.h"
>
>   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
>   MODULE_DESCRIPTION("Alienware special feature control");
> @@ -54,18 +35,6 @@ enum INTERFACE_FLAGS {
>   	WMAX,
>   };
>
> -enum LEGACY_CONTROL_STATES {
> -	LEGACY_RUNNING =3D 1,
> -	LEGACY_BOOTING =3D 0,
> -	LEGACY_SUSPEND =3D 3,
> -};
> -
> -enum WMAX_CONTROL_STATES {
> -	WMAX_RUNNING =3D 0xFF,
> -	WMAX_BOOTING =3D 0,
> -	WMAX_SUSPEND =3D 3,
> -};
> -
>   enum WMAX_THERMAL_INFORMATION_OPERATIONS {
>   	WMAX_OPERATION_SYS_DESCRIPTION		=3D 0x02,
>   	WMAX_OPERATION_LIST_IDS			=3D 0x03,
> @@ -122,7 +91,6 @@ struct quirk_entry {
>
>   static struct quirk_entry *quirks;
>
> -
>   static struct quirk_entry quirk_inspiron5675 =3D {
>   	.num_zones =3D 2,
>   	.hdmi_mux =3D 0,
> @@ -342,33 +310,10 @@ static const struct dmi_system_id awcc_dmi_table[]=
 __initconst =3D {
>
>   struct awcc_features *awcc;
>
> -struct color_platform {
> -	u8 blue;
> -	u8 green;
> -	u8 red;
> -} __packed;
> -
> -struct wmax_brightness_args {
> -	u32 led_mask;
> -	u32 percentage;
> -};
> -
>   struct wmax_basic_args {
>   	u8 arg;
>   };
>
> -struct legacy_led_args {
> -	struct color_platform colors;
> -	u8 brightness;
> -	u8 state;
> -} __packed;
> -
> -struct wmax_led_args {
> -	u32 led_mask;
> -	struct color_platform colors;
> -	u8 state;
> -} __packed;
> -
>   struct wmax_u32_args {
>   	u8 operation;
>   	u8 arg1;
> @@ -382,30 +327,10 @@ struct awcc_priv {
>   	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LA=
ST];
>   };
>
> -struct alienfx_priv {
> -	struct platform_device *pdev;
> -	struct led_classdev global_led;
> -	struct color_platform colors[4];
> -	u8 global_brightness;
> -	u8 lighting_control_state;
> -};
> -
> -struct alienfx_ops {
> -	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
> -		       u8 location);
> -	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *wd=
ev,
> -			      u8 brightness);
> -};
> -
> -struct alienfx_platdata {
> -	struct wmi_device *wdev;
> -	struct alienfx_ops ops;
> -};
> -
>   static u8 interface;
>
> -static acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 m=
ethod_id,
> -					 void *in_args, size_t in_size, u32 *out_data)
> +acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_i=
d,
> +				  void *in_args, size_t in_size, u32 *out_data)
>   {
>   	struct acpi_buffer out =3D {ACPI_ALLOCATE_BUFFER, NULL};
>   	struct acpi_buffer in =3D {in_size, in_args};
> @@ -1139,7 +1064,7 @@ static struct platform_driver platform_driver =3D =
{
>   	.probe =3D alienfx_probe,
>   };
>
> -static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
> +int alienware_alienfx_setup(struct alienfx_platdata *pdata)
>   {
>   	struct platform_device *pdev;
>   	int ret;
> @@ -1162,7 +1087,7 @@ static int alienware_alienfx_setup(struct alienfx_=
platdata *pdata)
>   	return 0;
>   }
>
> -static void alienware_alienfx_exit(struct wmi_device *wdev)
> +void alienware_alienfx_exit(struct wmi_device *wdev)
>   {
>   	struct platform_device *pdev;
>
> @@ -1242,12 +1167,12 @@ static struct wmi_driver alienware_legacy_wmi_dr=
iver =3D {
>   	.remove =3D legacy_wmi_remove,
>   };
>
> -static int __init alienware_legacy_wmi_init(void)
> +int __init alienware_legacy_wmi_init(void)
>   {
>   	return wmi_driver_register(&alienware_legacy_wmi_driver);
>   }
>
> -static void __exit alienware_legacy_wmi_exit(void)
> +void __exit alienware_legacy_wmi_exit(void)
>   {
>   	wmi_driver_unregister(&alienware_legacy_wmi_driver);
>   }
> @@ -1333,7 +1258,7 @@ static struct wmi_driver alienware_wmax_wmi_driver=
 =3D {
>   	.remove =3D wmax_wmi_remove,
>   };
>
> -static int __init alienware_wmax_wmi_init(void)
> +int __init alienware_wmax_wmi_init(void)
>   {
>   	const struct dmi_system_id *id;
>
> @@ -1350,7 +1275,7 @@ static int __init alienware_wmax_wmi_init(void)
>   	return wmi_driver_register(&alienware_wmax_wmi_driver);
>   }
>
> -static void __exit alienware_wmax_wmi_exit(void)
> +void __exit alienware_wmax_wmi_exit(void)
>   {
>   	wmi_driver_unregister(&alienware_wmax_wmi_driver);
>   }
> diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platfor=
m/x86/dell/alienware-wmi.h
> new file mode 100644
> index 000000000000..78ac10122155
> --- /dev/null
> +++ b/drivers/platform/x86/dell/alienware-wmi.h
> @@ -0,0 +1,103 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Alienware WMI special features driver
> + *
> + * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
> + * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
> + */
> +
> +#ifndef _ALIENWARE_WMI_H_
> +#define _ALIENWARE_WMI_H_
> +
> +#include <linux/leds.h>
> +#include <linux/platform_device.h>
> +#include <linux/wmi.h>
> +
> +#define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
> +#define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492=
"
> +#define WMAX_CONTROL_GUID		"A70591CE-A997-11DA-B012-B622A1EF5492"
> +
> +#define WMAX_METHOD_HDMI_SOURCE			0x1
> +#define WMAX_METHOD_HDMI_STATUS			0x2
> +#define WMAX_METHOD_BRIGHTNESS			0x3
> +#define WMAX_METHOD_ZONE_CONTROL		0x4
> +#define WMAX_METHOD_HDMI_CABLE			0x5
> +#define WMAX_METHOD_AMPLIFIER_CABLE		0x6
> +#define WMAX_METHOD_DEEP_SLEEP_CONTROL		0x0B
> +#define WMAX_METHOD_DEEP_SLEEP_STATUS		0x0C
> +#define WMAX_METHOD_THERMAL_INFORMATION		0x14
> +#define WMAX_METHOD_THERMAL_CONTROL		0x15
> +#define WMAX_METHOD_GAME_SHIFT_STATUS		0x25
> +
> +#define WMAX_THERMAL_MODE_GMODE			0xAB
> +
> +#define WMAX_FAILURE_CODE			0xFFFFFFFF
> +
> +enum LEGACY_CONTROL_STATES {
> +	LEGACY_RUNNING =3D 1,
> +	LEGACY_BOOTING =3D 0,
> +	LEGACY_SUSPEND =3D 3,
> +};
> +
> +enum WMAX_CONTROL_STATES {
> +	WMAX_RUNNING =3D 0xFF,
> +	WMAX_BOOTING =3D 0,
> +	WMAX_SUSPEND =3D 3,
> +};
> +
> +struct color_platform {
> +	u8 blue;
> +	u8 green;
> +	u8 red;
> +} __packed;
> +
> +struct wmax_brightness_args {
> +	u32 led_mask;
> +	u32 percentage;
> +};
> +
> +struct legacy_led_args {
> +	struct color_platform colors;
> +	u8 brightness;
> +	u8 state;
> +} __packed;
> +
> +struct wmax_led_args {
> +	u32 led_mask;
> +	struct color_platform colors;
> +	u8 state;
> +} __packed;
> +
> +struct alienfx_priv {
> +	struct platform_device *pdev;
> +	struct led_classdev global_led;
> +	struct color_platform colors[4];
> +	u8 global_brightness;
> +	u8 lighting_control_state;
> +};
> +
> +struct alienfx_ops {
> +	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
> +		       u8 location);
> +	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *wd=
ev,
> +			      u8 brightness);
> +};
> +
> +struct alienfx_platdata {
> +	struct wmi_device *wdev;
> +	struct alienfx_ops ops;
> +};
> +
> +acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_i=
d,
> +				  void *in_args, size_t in_size, u32 *out_data);
> +
> +int alienware_alienfx_setup(struct alienfx_platdata *pdata);
> +void alienware_alienfx_exit(struct wmi_device *wdev);
> +
> +int __init alienware_legacy_wmi_init(void);
> +void __exit alienware_legacy_wmi_exit(void);
> +
> +int __init alienware_wmax_wmi_init(void);
> +void __exit alienware_wmax_wmi_exit(void);
> +
> +#endif
