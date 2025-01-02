Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8585B1494D9;
	Thu,  2 Jan 2025 16:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735836237; cv=none; b=pQs0k0pPhyIUToVuTbSupI8BaqTtvwbAqDtiBOQom9Dd5IUZsfYqmnjZt+7JqEGUrtCO33UPh5irCzJhcWljdAoEO/u+WNtXa/ePxEH+5F5tp9eSx3DfjMazFTXX0arGRZ2EwoNehDL/sNZuZPTuRMK7P/2PGbO7mCnvbORwPoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735836237; c=relaxed/simple;
	bh=beONM8LtUgRFK6dxsCSZIkSNwcaIq4iCQJix85YJ8XY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fzhb7qGK78TM6waPVDC3uECSM6Fczwg9jqN6ijjN1/bU9phsvX6GVLhXiy3kxMh1ZXwV5WND/N5Ypnrm3/5075lIjldzW9XP1OY9HQwpbk3nOBG75PeOdUzcG5I2RwuWtLb8z+LzFmGnzQy9DNBt6jHGH2JISdl4NBpVsb+9Pt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=CcjANNTm; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="CcjANNTm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735836220; x=1736441020; i=w_armin@gmx.de;
	bh=j7PwmnoHgxXOcCBL14LK7rCcFPD5A+QncZjfSIwaWdY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=CcjANNTmwE+vWEzOuUfidatZCXJKRMSxo7NBgGyNe+KMUrbmc7aHPeWFiMzaNcNJ
	 /V6umfAcu9a6DDkfclCBtGNLK6VNzgXAE9yu9l/jqoCa6QQRlojINSjl0HEmtvt5z
	 5lwBJT94t0euu/kdA+2DP76VEzBr5qdYw3cx4U0l7EtZI2wPq3mrsN06yqmekAMCY
	 G9M6NzDaMu0Z3xpbsin+ozaLGiALkLYPAp4PowabnsG4ngDUOLcyFYRUZ6lAiTZ6c
	 2olMUWhxIm5i1fJOAIcGVWMeP2buDgDhYZMKfCiHLkfY0VMc8kx2+pQin2GclrfX0
	 8afTJZ24VsMxYxmuxA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKKUv-1tCYnT2J8Z-00YQQu; Thu, 02
 Jan 2025 17:43:40 +0100
Message-ID: <ecab6260-9db5-4137-b542-c44817d2fbc6@gmx.de>
Date: Thu, 2 Jan 2025 17:43:38 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/20] platform/x86: Add alienware-wmi.h
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-18-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241229194506.8268-18-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7rh+CM0Ks4+SCItPINIH5g0AO2WZ8F3pf6tQ6IE2LeTeI9RzvXz
 fVcxBWYY17Bc9VH69xvh64fOXiZMVO8+MsBlxLovGc8x3JDCWse1E1VkBnjnP8/6urbkqAu
 /aqhwyCZLbBMaDSctFUAkL4K+k5GH+CVEyqqi4AFZ9d5l/oAaneQfeHejx6J6ScCCx5Dzm6
 Jn0jugA1LzgwGKKcQXkjA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Na9H8q29A34=;q+GVjovAmR7iRTs2JLH+6cZqA0Y
 6R6weYIElVQQ3rPHybqXYytulWSh/CSaDxx/oODgltGrIohGmf2RCSmPb9mpX/XOY9aHLWzvJ
 FitxQfoNJzh7sJ+SeeqSEkUA7QxyYOcX2rcr/P328i8dpzKLa5T15F2MvLHJtgNLjGNOjLCLo
 D3gvXOMZ1mMngpfQ9U/XtPuTA4bhjhPDqUF3at1vvK68akY0JHo8M6+ZKHY6uzikBEIZMvxzD
 WAXHrWcHrllVvvVqW5/mMeIC5+sCZ+MYQYGlj0I7033oTY0nrj7OhgI653vEGhMpBMNzp9V4t
 AxTxkbsEwHw2+iWy+CAYSFM3N1ww1K5BxR/nFqVVmdpoGEYyCcnRnOsdw+PgpdVxcNerN17HB
 a6lYit5Oil3IeI261ko93idfPIFgNhjYOkCr6uO4xGnxfIvNrrPBaOcRSfWVh00l+hQaVAsP5
 +GW4riFi8KmUImOEl2bSC6N/J9PV5x4jsQgeMdKCl/sHJsxnmiBQ/JIvEViQurA3tvMbOjPF1
 YVUAtC8EwOPzrL1SPp/2RfEwZh1wS6SPfOHM4PfdviorhS/fIxO8sSXnbEped3poXCfX0g8ig
 JyQKghwYma0emn9I/2z7EzIilfMI4Oz77NF0HRJS0Z3484Y4MRb+qazVVaiOWL0uxybh3nUk3
 iKIsd+jcO+gHYgEcwnooCNsDY64HBKAgxkZMIafgKTOFeQ7DPfDazNuuB0MYGDlgZ98xi2geo
 x+GmXGYxaF4YbE3eDWG83bdYjVigNAc+R2vRxcMze9zKHdlYohMrc4Yb5woNyN4bU1PnaOqH0
 zmbr/9xbvgYq5g59SOF2suhMiKR0wyt+g5L4Q5sgyY3iZrpPTDmue2DDfTIdWF6jtsUpMRX2p
 94I2jn7d+iipUKzwWUAVxsugDlpPVeEBkjIbB0jVkt0u2K2QntHBuLkZIfjPhC8KEqpFfs4PV
 FCcvZ4pxC5YvYDRKCpyeuScT/tkDwkTFFxxB+/whONjFhm0kM0l6qfPzAhIFIao8ES8ZwZkR+
 JgsnoN36a+zLORG5YAa57kaswJW46ThFjfe5dAFPiK2Og9JT2tBaF9nvGu7X116uOCJ7aPE2U
 q06mkMdZD2xYKog+oQl/S8mrs3WkS2

Am 29.12.24 um 20:45 schrieb Kurt Borja:

> Add a header file for alienware-wmi with shared resources to support the
> upcoming file split.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   .../platform/x86/dell/alienware-wmi-base.c    | 68 +++-------------
>   drivers/platform/x86/dell/alienware-wmi.h     | 78 +++++++++++++++++++
>   2 files changed, 87 insertions(+), 59 deletions(-)
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/pl=
atform/x86/dell/alienware-wmi-base.c
> index b9daf22efdbe..a268193ad2a1 100644
> --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> @@ -16,10 +16,7 @@
>   #include <linux/dmi.h>
>   #include <linux/leds.h>
>   #include <linux/wmi.h>
> -
> -#define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
> -#define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492=
"
> -#define WMAX_CONTROL_GUID		"A70591CE-A997-11DA-B012-B622A1EF5492"
> +#include "alienware-wmi.h"
>
>   #define WMAX_METHOD_HDMI_SOURCE		0x1
>   #define WMAX_METHOD_HDMI_STATUS		0x2
> @@ -54,18 +51,6 @@ enum INTERFACE_FLAGS {
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
> @@ -113,16 +98,8 @@ static const enum platform_profile_option wmax_mode_=
to_platform_profile[THERMAL_
>   	[THERMAL_MODE_BASIC_PERFORMANCE]		=3D PLATFORM_PROFILE_PERFORMANCE,
>   };
>
> -struct alienfx_quirks {
> -	u8 num_zones;
> -	bool hdmi_mux;
> -	bool amplifier;
> -	bool deepslp;
> -};
> -
>   static struct alienfx_quirks *quirks;
>
> -
>   static struct alienfx_quirks quirk_inspiron5675 =3D {
>   	.num_zones =3D 2,
>   	.hdmi_mux =3D false,
> @@ -245,12 +222,6 @@ static const struct dmi_system_id alienware_quirks[=
] __initconst =3D {
>   	{}
>   };
>
> -struct color_platform {
> -	u8 blue;
> -	u8 green;
> -	u8 red;
> -} __packed;
> -
>   struct wmax_brightness_args {
>   	u32 led_mask;
>   	u32 percentage;
> @@ -285,27 +256,6 @@ struct awcc_priv {
>   	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LA=
ST];
>   };
>
> -struct alienfx_priv {
> -	struct platform_device *pdev;
> -	struct alienfx_quirks *quirks;
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
>   struct awcc_quirks {
> @@ -405,8 +355,8 @@ static const struct dmi_system_id awcc_dmi_table[] _=
_initconst =3D {
>
>   struct awcc_quirks *awcc;
>
> -static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id=
,
> -				 void *in_args, size_t in_size, u32 *out_data)
> +int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
> +			  void *in_args, size_t in_size, u32 *out_data)
>   {
>   	struct acpi_buffer out =3D {ACPI_ALLOCATE_BUFFER, NULL};
>   	struct acpi_buffer in =3D {in_size, in_args};
> @@ -1139,7 +1089,7 @@ static struct platform_driver platform_driver =3D =
{
>   	.probe =3D alienfx_probe,
>   };
>
> -static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
> +int alienware_alienfx_setup(struct alienfx_platdata *pdata)
>   {
>   	struct platform_device *pdev;
>   	int ret;
> @@ -1162,7 +1112,7 @@ static int alienware_alienfx_setup(struct alienfx_=
platdata *pdata)
>   	return 0;
>   }
>
> -static void alienware_alienfx_exit(struct wmi_device *wdev)
> +void alienware_alienfx_exit(struct wmi_device *wdev)
>   {
>   	struct platform_device *pdev =3D dev_get_drvdata(&wdev->dev);
>
> @@ -1242,12 +1192,12 @@ static struct wmi_driver alienware_legacy_wmi_dr=
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
> @@ -1330,7 +1280,7 @@ static struct wmi_driver alienware_wmax_wmi_driver=
 =3D {
>   	.remove =3D wmax_wmi_remove,
>   };
>
> -static int __init alienware_wmax_wmi_init(void)
> +int __init alienware_wmax_wmi_init(void)
>   {
>   	const struct dmi_system_id *id;
>
> @@ -1347,7 +1297,7 @@ static int __init alienware_wmax_wmi_init(void)
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
> index 000000000000..dccbf4f95da0
> --- /dev/null
> +++ b/drivers/platform/x86/dell/alienware-wmi.h
> @@ -0,0 +1,78 @@
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
> +struct alienfx_quirks {
> +	u8 num_zones;
> +	bool hdmi_mux;
> +	bool amplifier;
> +	bool deepslp;
> +};
> +
> +struct color_platform {
> +	u8 blue;
> +	u8 green;
> +	u8 red;
> +} __packed;
> +
> +struct alienfx_priv {
> +	struct platform_device *pdev;
> +	struct alienfx_quirks *quirks;
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
> +int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
> +			  void *in_args, size_t in_size, u32 *out_data);
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
