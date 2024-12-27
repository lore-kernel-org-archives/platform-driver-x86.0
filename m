Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396FB7F477;
	Fri, 27 Dec 2024 04:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735275389; cv=none; b=D78bWf6BNlZXZelvI/TAmkGXq3mY9oKOU5ma/YymiiyFbKsmQHcYd/j3z8/yzswBVMYWFEUL1WqSVqBD+E9QMH03ObliiafDo12HRP1gMhvTOLoggmS8g8zdgr9vkEzOMARrX3lXvGd0bOzUv97/Y8NrNC2V6oUKP+Xax6SJ2TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735275389; c=relaxed/simple;
	bh=Cka+FQcAPbvBOPdrtwUvyHWC5VB82OjxBAsS6730piM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvczkYirYYOSqlD4IpsUVruSJAJ+7H69Cv2gV1xRwB0HJB8KF0zhm8y60tbgYiLtSydc0Cz5sW6VzV/sdyTxmd5ta2E1U3J9mHWFoPhvyxkLkiEuvQVTmI/uU59TD3+LoKCIenvZwFgjgpMxpAcC1agQpl3mQBtzX8s9ImZ1rNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgJLDb2J; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgJLDb2J"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5174f9c0e63so2107197e0c.1;
        Thu, 26 Dec 2024 20:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735275386; x=1735880186; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/uy8m4SJyBC2HZiypqavtuW5CgTpzszc1VU39m8Wxag=;
        b=dgJLDb2JsVv4HTdONCRAdYaGcViJG2reFwjkfu0v0Ua3t8dIEjVM1H2Odra6L+0Ju6
         lstDzhYeyqyZntnx8dHiaoF1aqH+CfwtJ8WpiYP44Do9SjkK2xfLjuYA1jBSE3D11Ev6
         jVZkS+MOsiNz3hZTxrQRDM46/Bm/8oLcfeazoU2LJ6HX2bFo9lRjmUoLMkvYxub06p6l
         aqOC03p4hFk5gf5CNAdInBn9u+GStlJqy/U6JyZtR7qavmCpvgZawDJNgvc4Up0LVZ41
         M9VnS2M+X7NzQjood1YV2ZgYNbB4wsVXGXevloqko0LcgDSkqezZFLj5bVgra2U6C8bq
         5Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735275386; x=1735880186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/uy8m4SJyBC2HZiypqavtuW5CgTpzszc1VU39m8Wxag=;
        b=dMxHEA+fzuCxk0sUMLPJzw1v54/XWuX41xYPDMd33EbodmbSmGWLp5P9e76057M3RI
         /+kzSl/OLowlVo3I9ph/gWUOAU8Qambl4bUnl7+oMEJIpklyuQ2Q2O3EVxODzUW/TPgS
         lrNPjm1NqZKSBXDg0gRuRlFevFoe8oQCPWsiydJtxuKepyXBAuqf6GCrp5pIC9WaozyV
         b6xAHY9TqSS/ytAlYCVKkTjPH4jtMnI/9G1qAdsW/Uxu5Z6BR7B+wdck5EOi9nho5JP9
         G36Zeq/Y6e9FY3KUp7qUINI287eBIRIyaPY8oXXcVHIbX6qxqwp0E7QsgNxik5nKzwmH
         +FpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhssVfyqHpEE3kIp6/FNCEsjY3aYJQIiIc6k4sXgQ0FzG/ERUPK/detXUwoioeEcyH3Ii6HU/qApo2q+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ3kV2ieLOD9ZvoGyKqADo1moz8OSfrIEWToCguhdzrvaQ7BUo
	UzTO95dWm9Et+H5yDtG9/AeEZW6sYSlRFRS/jM5xEoemC4qjqJSOrphI0w==
X-Gm-Gg: ASbGncsoqfBINSpiWiCFy05O8sv53ewWAgWIj3/gEKKJRxd4y+pezlla43Pz451zH6l
	pQBD4BBQ9YQDDcfVRtX6PvoDDu54QJIvj9918LA77yvtlGy3dwS0hyeWri8Nd+c0iW+yrGxPH/z
	wtChYUlgcSjofJH3ibYbvAvYCffE3w+Z9CMt5BxT63j4Rll9CSdvmUOjxZ6J1UhYhhHFJd4tB2s
	r7OUc24KfXS/CbCgjJddcRAxqzLerTAyZrICvNmRIiABTbsbo8H7Q==
X-Google-Smtp-Source: AGHT+IHTbkwS22fB8wF9dfUGnAR8MAFryHyJkCMN7PHTp7VpHIBO/tpQd0DqGUfgkzzwWMfQmQgzzw==
X-Received: by 2002:a05:6102:945:b0:4b1:1abe:6131 with SMTP id ada2fe7eead31-4b2cc494dd1mr18111180137.25.1735275385834;
        Thu, 26 Dec 2024 20:56:25 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfad517dsm2875610137.31.2024.12.26.20.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 20:56:25 -0800 (PST)
Date: Thu, 26 Dec 2024 23:56:22 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 16/20] platform/x86: Add alienware-wmi.h
Message-ID: <kj4n7ecmykx6hjnlye5k5rji4nogoaje3krzhe5nrbadggy2cx@rebuh625ltrp>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-17-kuurtb@gmail.com>
 <50f0debc-2b73-49dc-8c52-c38203c3700d@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50f0debc-2b73-49dc-8c52-c38203c3700d@gmx.de>

On Fri, Dec 27, 2024 at 05:02:32AM +0100, Armin Wolf wrote:
> Am 21.12.24 um 06:59 schrieb Kurt Borja:
> 
> > Add a header file for alienware-wmi with shared resources to support the
> > upcoming file split.
> 
> I am OK with this, but only common definitions should be moved inside this header file.
> Definitions only used by a single driver should remain inside the driver file.

Ack.

> 
> Thanks,
> Armin Wolf
> 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   .../platform/x86/dell/alienware-wmi-base.c    |  93 ++--------------
> >   drivers/platform/x86/dell/alienware-wmi.h     | 103 ++++++++++++++++++
> >   2 files changed, 112 insertions(+), 84 deletions(-)
> >   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi-base.c b/drivers/platform/x86/dell/alienware-wmi-base.c
> > index 8ea08f5f8810..e8d470bbb608 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi-base.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi-base.c
> > @@ -16,26 +16,7 @@
> >   #include <linux/dmi.h>
> >   #include <linux/leds.h>
> >   #include <linux/wmi.h>
> > -
> > -#define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
> > -#define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
> > -#define WMAX_CONTROL_GUID		"A70591CE-A997-11DA-B012-B622A1EF5492"
> > -
> > -#define WMAX_METHOD_HDMI_SOURCE		0x1
> > -#define WMAX_METHOD_HDMI_STATUS		0x2
> > -#define WMAX_METHOD_BRIGHTNESS		0x3
> > -#define WMAX_METHOD_ZONE_CONTROL	0x4
> > -#define WMAX_METHOD_HDMI_CABLE		0x5
> > -#define WMAX_METHOD_AMPLIFIER_CABLE	0x6
> > -#define WMAX_METHOD_DEEP_SLEEP_CONTROL	0x0B
> > -#define WMAX_METHOD_DEEP_SLEEP_STATUS	0x0C
> > -#define WMAX_METHOD_THERMAL_INFORMATION	0x14
> > -#define WMAX_METHOD_THERMAL_CONTROL	0x15
> > -#define WMAX_METHOD_GAME_SHIFT_STATUS	0x25
> > -
> > -#define WMAX_THERMAL_MODE_GMODE		0xAB
> > -
> > -#define WMAX_FAILURE_CODE		0xFFFFFFFF
> > +#include "alienware-wmi.h"
> > 
> >   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
> >   MODULE_DESCRIPTION("Alienware special feature control");
> > @@ -54,18 +35,6 @@ enum INTERFACE_FLAGS {
> >   	WMAX,
> >   };
> > 
> > -enum LEGACY_CONTROL_STATES {
> > -	LEGACY_RUNNING = 1,
> > -	LEGACY_BOOTING = 0,
> > -	LEGACY_SUSPEND = 3,
> > -};
> > -
> > -enum WMAX_CONTROL_STATES {
> > -	WMAX_RUNNING = 0xFF,
> > -	WMAX_BOOTING = 0,
> > -	WMAX_SUSPEND = 3,
> > -};
> > -
> >   enum WMAX_THERMAL_INFORMATION_OPERATIONS {
> >   	WMAX_OPERATION_SYS_DESCRIPTION		= 0x02,
> >   	WMAX_OPERATION_LIST_IDS			= 0x03,
> > @@ -122,7 +91,6 @@ struct quirk_entry {
> > 
> >   static struct quirk_entry *quirks;
> > 
> > -
> >   static struct quirk_entry quirk_inspiron5675 = {
> >   	.num_zones = 2,
> >   	.hdmi_mux = 0,
> > @@ -342,33 +310,10 @@ static const struct dmi_system_id awcc_dmi_table[] __initconst = {
> > 
> >   struct awcc_features *awcc;
> > 
> > -struct color_platform {
> > -	u8 blue;
> > -	u8 green;
> > -	u8 red;
> > -} __packed;
> > -
> > -struct wmax_brightness_args {
> > -	u32 led_mask;
> > -	u32 percentage;
> > -};
> > -
> >   struct wmax_basic_args {
> >   	u8 arg;
> >   };
> > 
> > -struct legacy_led_args {
> > -	struct color_platform colors;
> > -	u8 brightness;
> > -	u8 state;
> > -} __packed;
> > -
> > -struct wmax_led_args {
> > -	u32 led_mask;
> > -	struct color_platform colors;
> > -	u8 state;
> > -} __packed;
> > -
> >   struct wmax_u32_args {
> >   	u8 operation;
> >   	u8 arg1;
> > @@ -382,30 +327,10 @@ struct awcc_priv {
> >   	enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
> >   };
> > 
> > -struct alienfx_priv {
> > -	struct platform_device *pdev;
> > -	struct led_classdev global_led;
> > -	struct color_platform colors[4];
> > -	u8 global_brightness;
> > -	u8 lighting_control_state;
> > -};
> > -
> > -struct alienfx_ops {
> > -	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
> > -		       u8 location);
> > -	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *wdev,
> > -			      u8 brightness);
> > -};
> > -
> > -struct alienfx_platdata {
> > -	struct wmi_device *wdev;
> > -	struct alienfx_ops ops;
> > -};
> > -
> >   static u8 interface;
> > 
> > -static acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
> > -					 void *in_args, size_t in_size, u32 *out_data)
> > +acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
> > +				  void *in_args, size_t in_size, u32 *out_data)
> >   {
> >   	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
> >   	struct acpi_buffer in = {in_size, in_args};
> > @@ -1139,7 +1064,7 @@ static struct platform_driver platform_driver = {
> >   	.probe = alienfx_probe,
> >   };
> > 
> > -static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
> > +int alienware_alienfx_setup(struct alienfx_platdata *pdata)
> >   {
> >   	struct platform_device *pdev;
> >   	int ret;
> > @@ -1162,7 +1087,7 @@ static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
> >   	return 0;
> >   }
> > 
> > -static void alienware_alienfx_exit(struct wmi_device *wdev)
> > +void alienware_alienfx_exit(struct wmi_device *wdev)
> >   {
> >   	struct platform_device *pdev;
> > 
> > @@ -1242,12 +1167,12 @@ static struct wmi_driver alienware_legacy_wmi_driver = {
> >   	.remove = legacy_wmi_remove,
> >   };
> > 
> > -static int __init alienware_legacy_wmi_init(void)
> > +int __init alienware_legacy_wmi_init(void)
> >   {
> >   	return wmi_driver_register(&alienware_legacy_wmi_driver);
> >   }
> > 
> > -static void __exit alienware_legacy_wmi_exit(void)
> > +void __exit alienware_legacy_wmi_exit(void)
> >   {
> >   	wmi_driver_unregister(&alienware_legacy_wmi_driver);
> >   }
> > @@ -1333,7 +1258,7 @@ static struct wmi_driver alienware_wmax_wmi_driver = {
> >   	.remove = wmax_wmi_remove,
> >   };
> > 
> > -static int __init alienware_wmax_wmi_init(void)
> > +int __init alienware_wmax_wmi_init(void)
> >   {
> >   	const struct dmi_system_id *id;
> > 
> > @@ -1350,7 +1275,7 @@ static int __init alienware_wmax_wmi_init(void)
> >   	return wmi_driver_register(&alienware_wmax_wmi_driver);
> >   }
> > 
> > -static void __exit alienware_wmax_wmi_exit(void)
> > +void __exit alienware_wmax_wmi_exit(void)
> >   {
> >   	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> >   }
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.h b/drivers/platform/x86/dell/alienware-wmi.h
> > new file mode 100644
> > index 000000000000..78ac10122155
> > --- /dev/null
> > +++ b/drivers/platform/x86/dell/alienware-wmi.h
> > @@ -0,0 +1,103 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Alienware WMI special features driver
> > + *
> > + * Copyright (C) 2014 Dell Inc <Dell.Client.Kernel@dell.com>
> > + * Copyright (C) 2024 Kurt Borja <kuurtb@gmail.com>
> > + */
> > +
> > +#ifndef _ALIENWARE_WMI_H_
> > +#define _ALIENWARE_WMI_H_
> > +
> > +#include <linux/leds.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/wmi.h>
> > +
> > +#define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
> > +#define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
> > +#define WMAX_CONTROL_GUID		"A70591CE-A997-11DA-B012-B622A1EF5492"
> > +
> > +#define WMAX_METHOD_HDMI_SOURCE			0x1
> > +#define WMAX_METHOD_HDMI_STATUS			0x2
> > +#define WMAX_METHOD_BRIGHTNESS			0x3
> > +#define WMAX_METHOD_ZONE_CONTROL		0x4
> > +#define WMAX_METHOD_HDMI_CABLE			0x5
> > +#define WMAX_METHOD_AMPLIFIER_CABLE		0x6
> > +#define WMAX_METHOD_DEEP_SLEEP_CONTROL		0x0B
> > +#define WMAX_METHOD_DEEP_SLEEP_STATUS		0x0C
> > +#define WMAX_METHOD_THERMAL_INFORMATION		0x14
> > +#define WMAX_METHOD_THERMAL_CONTROL		0x15
> > +#define WMAX_METHOD_GAME_SHIFT_STATUS		0x25
> > +
> > +#define WMAX_THERMAL_MODE_GMODE			0xAB
> > +
> > +#define WMAX_FAILURE_CODE			0xFFFFFFFF
> > +
> > +enum LEGACY_CONTROL_STATES {
> > +	LEGACY_RUNNING = 1,
> > +	LEGACY_BOOTING = 0,
> > +	LEGACY_SUSPEND = 3,
> > +};
> > +
> > +enum WMAX_CONTROL_STATES {
> > +	WMAX_RUNNING = 0xFF,
> > +	WMAX_BOOTING = 0,
> > +	WMAX_SUSPEND = 3,
> > +};
> > +
> > +struct color_platform {
> > +	u8 blue;
> > +	u8 green;
> > +	u8 red;
> > +} __packed;
> > +
> > +struct wmax_brightness_args {
> > +	u32 led_mask;
> > +	u32 percentage;
> > +};
> > +
> > +struct legacy_led_args {
> > +	struct color_platform colors;
> > +	u8 brightness;
> > +	u8 state;
> > +} __packed;
> > +
> > +struct wmax_led_args {
> > +	u32 led_mask;
> > +	struct color_platform colors;
> > +	u8 state;
> > +} __packed;
> > +
> > +struct alienfx_priv {
> > +	struct platform_device *pdev;
> > +	struct led_classdev global_led;
> > +	struct color_platform colors[4];
> > +	u8 global_brightness;
> > +	u8 lighting_control_state;
> > +};
> > +
> > +struct alienfx_ops {
> > +	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
> > +		       u8 location);
> > +	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *wdev,
> > +			      u8 brightness);
> > +};
> > +
> > +struct alienfx_platdata {
> > +	struct wmi_device *wdev;
> > +	struct alienfx_ops ops;
> > +};
> > +
> > +acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
> > +				  void *in_args, size_t in_size, u32 *out_data);
> > +
> > +int alienware_alienfx_setup(struct alienfx_platdata *pdata);
> > +void alienware_alienfx_exit(struct wmi_device *wdev);
> > +
> > +int __init alienware_legacy_wmi_init(void);
> > +void __exit alienware_legacy_wmi_exit(void);
> > +
> > +int __init alienware_wmax_wmi_init(void);
> > +void __exit alienware_wmax_wmi_exit(void);
> > +
> > +#endif
