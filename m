Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A8F360;
	Fri, 27 Dec 2024 04:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735274909; cv=none; b=BSGx/N5KmuHYukir3hfE3U413Co7KZWQeEspuWIP6IxFoIVMTGDU3hHzdPk+w0r/M7qMlgD2G5jRcTRIFcvUGlev2xN/hBt3DQQhBsGkwSo0MGBPNoMb6Xfdf+DMvyG45K8DY1J2ODGtuiKpScwfpiHqyuvYqRr3MAQ0Vk2QHWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735274909; c=relaxed/simple;
	bh=EvAHJOOtw3GXCazXFOyZPKdOvwgvfasxDGG/Te6lCSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5UFrIexiZGSSlXcgJC4JKLdbbaEYkz7bFdIZSahvmwOu9YZD/cgeqqs2NnkDnSZyEsszV/CMwAUtJBh/ZI53+YjNAK3LAErtC70GTMDudoF88Kg3+C1lG3oee3NMabEYhJu2dTGU6kTwbK8dgacpBVmZ8i0REaZAgUKP5lCTko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqCmY35U; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqCmY35U"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4afde39e360so1835579137.0;
        Thu, 26 Dec 2024 20:48:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735274905; x=1735879705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XSMk2H16AzBa+UsnMugT+Q38N9+oC3Qkhxucuyy864w=;
        b=gqCmY35UtEQnaTE42lp8jUstHzkCPDPrcmteTYza98O8O1Y8oWiIoPnjCzXtehx2vZ
         GSaRml5f3qNqIRViZdviRiMg2AqOKoQzBCB6igMOnmVUeEVaTeWUeuRhohs6GwN2eN9u
         h5jqbk5TBESJpXU6CxWMbyDRmZaCjSNLcLbVgU+kaqq3j5+FvMx+SVszZ1PkDfpQh+QS
         TRIHskAGVVlZmCLLAhKyQr3liJDh/dX1bueHK+mrQ8a1NvOUVUt9y5pRtonc9DQhTBYq
         FLgf6maqOkMo94zrW6PDSLa7qLGqGINZHM5shZv5BC+D9DpMrfjkHYerxwXz8lFHLjAi
         UoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735274905; x=1735879705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSMk2H16AzBa+UsnMugT+Q38N9+oC3Qkhxucuyy864w=;
        b=m4pH4QflJ4/FYKEqasy6jO/9V/xOLlKVpmQjgBkUYtKdF1mzByyR0ntT4y7zEmAcy3
         CRwxNOycu64EiqbUEsh1vZMqD/QQZCI7Rmkotzpxp/4CgRHcWm73c+L2dhxCrKRMhzSS
         JZcHU5QskQ8BjWdBjjBIZopo4KgDww3eZsZccsqcABtY0Qblck9+lT8wP82YkICXHn4u
         IlfAmu4IXXp236UQz1AnaAGHKKrpji0Dc95bHPk39HZcYxuOIRywlaGnyd1cIGk1zurk
         WzEoPeaILV+akWI7qXfLbdbvCQUvgbsqqxJnaSeDLo+NXyqsVPhv0MgDeJfKX39Bdmgu
         5uKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4kfcevFERUv8eYdS+9ggtqCb6B6qOLewPizym5D4U4cemn8idEE3AaQdEObcYIwI36YPb4oHOFH/EF3E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnZBfS06/oJZzQseusCt0mkWdIr7C9MEp5slwpK4TnBCtjVsdY
	PIWty+hfNNgYBfsngY2QU7o+s2rs3Wq35fAFfxs7vN8jqM/KwuGd
X-Gm-Gg: ASbGncukGzbEK2EsWbAj9Nj/S7wdp6Qq48XFzMysp/XlBU97C7ehDYn/bsADYIKEVqD
	V4Kz3/Iq61xkVTMHo1KWGraFtA9ixvy5r8fKX0TO+AbZ4YzLQ4wl1KfENbvkWYrKtJxart1nO4N
	IaVx7XnbkxEVxekF7hMVRLHINByDfORe8F2oqRvPcaMF2czwvC6W3oPhJPL5VbIymGl8dNuJOY7
	YSrnkCyJrCOt7xSuKzfPJN7ItwTpRgAyqu1WXdiFRqhVHFQokgIEA==
X-Google-Smtp-Source: AGHT+IHnJPrwsT2hU3MuzszCau50aWxv7EkSgxtLBPFGk6+I2gRPE/JyqKq2Q+OYDnrquQtvpkagtw==
X-Received: by 2002:a05:6102:c93:b0:4af:ef82:ce8b with SMTP id ada2fe7eead31-4b2cc4952d2mr22511635137.26.1735274904935;
        Thu, 26 Dec 2024 20:48:24 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8610ad3e6f2sm2970154241.27.2024.12.26.20.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 20:48:24 -0800 (PST)
Date: Thu, 26 Dec 2024 23:48:21 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 08/20] alienware-wmi: Add WMI Drivers
Message-ID: <hc7l4cs7odvzjvty7mthbdwpt5ddd3ztghtomi5xhjuvpeulsp@q6kehnenpbda>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-9-kuurtb@gmail.com>
 <367b6e24-d7d3-426e-96ed-e7ab6a36ad5b@gmx.de>
 <zl6ukxdcscxqkpqodjkocfljolnoz2pep74zbu2iy5e7itm3lr@zavcqwt5iyaw>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zl6ukxdcscxqkpqodjkocfljolnoz2pep74zbu2iy5e7itm3lr@zavcqwt5iyaw>

On Thu, Dec 26, 2024 at 11:44:52PM -0500, Kurt Borja wrote:
> On Fri, Dec 27, 2024 at 04:21:14AM +0100, Armin Wolf wrote:
> > Am 21.12.24 um 06:59 schrieb Kurt Borja:
> > 
> > > Add WMI drivers for LEGACY and WMAX devices.
> > > 
> > > This involves moving platform driver and device registration to a helper
> > > function, which is now called from the driver's preferred WMI device
> > > driver probe. However this is only done if !quirks->thermal because
> > > newer WMAX interface doesn't support any of the features exposed by this
> > > device.
> > > 
> > > Only one driver is registered on module initialization to prevent
> > > registering duplicate platform driver and device.
> > > 
> > > Aditionally, create_thermal_profile() now takes wmi_device * instead of
> > > platform_device *.
> > 
> > Since the HDMI, Amplifier and deepslp groups depend on the WMAX interface i would
> > register them inside wmax_wmi_probe() using device_add_groups() (you might need to
> > rework alienware_alienfx_setup() for that).
> > 
> > In the end the only code shared between both drivers should be related to the LED handling.
> > Everything else AFAIK depends on the WMAX interface and should therefore be inside the
> > WMAX driver.
> 
> Unfortunately this breaks old user-space interface, as the path to this
> attributes would change :(. This is why I can't even set a parent dev
> for the platform_device.
> 
> I only know of one project which interefaces with this driver [1], and
> it does use the /sys/devices/platform/alienware-wmi path. Maybe I could
> send a pull req, but it would still break old unknown projects and
> scripts.
> 
> [1] https://crates.io/crates/alienware

Nevermind this, I thought you said .dev_groups xd. I will do this on v2.

> 
> > 
> > Thanks,
> > Armin Wolf
> > 
> > > 
> > > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > > ---
> > >   drivers/platform/x86/dell/alienware-wmi.c | 186 +++++++++++++++++-----
> > >   1 file changed, 146 insertions(+), 40 deletions(-)
> > > 
> > > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > > index 4b68d64bd742..f2f6842e27e6 100644
> > > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > > @@ -15,6 +15,7 @@
> > >   #include <linux/platform_profile.h>
> > >   #include <linux/dmi.h>
> > >   #include <linux/leds.h>
> > > +#include <linux/wmi.h>
> > > 
> > >   #define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
> > >   #define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
> > > @@ -39,8 +40,6 @@
> > >   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
> > >   MODULE_DESCRIPTION("Alienware special feature control");
> > >   MODULE_LICENSE("GPL");
> > > -MODULE_ALIAS("wmi:" LEGACY_CONTROL_GUID);
> > > -MODULE_ALIAS("wmi:" WMAX_CONTROL_GUID);
> > > 
> > >   static bool force_platform_profile;
> > >   module_param_unsafe(force_platform_profile, bool, 0);
> > > @@ -412,7 +411,10 @@ struct alienfx_priv {
> > >   	u8 lighting_control_state;
> > >   };
> > > 
> > > -static struct platform_device *platform_device;
> > > +struct alienfx_platdata {
> > > +	struct wmi_device *wdev;
> > > +};
> > > +
> > >   static struct platform_profile_handler pp_handler;
> > >   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
> > > 
> > > @@ -1048,7 +1050,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
> > >   	return wmax_thermal_control(supported_thermal_profiles[profile]);
> > >   }
> > > 
> > > -static int create_thermal_profile(struct platform_device *platform_device)
> > > +static int create_thermal_profile(struct wmi_device *wdev)
> > >   {
> > >   	enum platform_profile_option profile;
> > >   	enum wmax_thermal_mode mode;
> > > @@ -1097,7 +1099,7 @@ static int create_thermal_profile(struct platform_device *platform_device)
> > >   	pp_handler.profile_get = thermal_profile_get;
> > >   	pp_handler.profile_set = thermal_profile_set;
> > >   	pp_handler.name = "alienware-wmi";
> > > -	pp_handler.dev = &platform_device->dev;
> > > +	pp_handler.dev = &wdev->dev;
> > > 
> > >   	return platform_profile_register(&pp_handler);
> > >   }
> > > @@ -1153,19 +1155,138 @@ static struct platform_driver platform_driver = {
> > >   	.probe = alienfx_probe,
> > >   };
> > > 
> > > -static int __init alienware_wmi_init(void)
> > > +static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
> > >   {
> > > +	struct platform_device *pdev;
> > >   	int ret;
> > > 
> > > -	if (wmi_has_guid(LEGACY_CONTROL_GUID))
> > > -		interface = LEGACY;
> > > -	else if (wmi_has_guid(WMAX_CONTROL_GUID))
> > > -		interface = WMAX;
> > > -	else {
> > > -		pr_warn("alienware-wmi: No known WMI GUID found\n");
> > > -		return -ENODEV;
> > > +	ret = platform_driver_register(&platform_driver);
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	pdev = platform_device_register_data(NULL, "alienware-wmi",
> > > +					     PLATFORM_DEVID_NONE, pdata,
> > > +					     sizeof(*pdata));
> > > +
> > > +	if (IS_ERR(pdev)) {
> > > +		platform_driver_unregister(&platform_driver);
> > > +		return PTR_ERR(pdev);
> > >   	}
> > > 
> > > +	dev_set_drvdata(&pdata->wdev->dev, pdev);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void alienware_alienfx_exit(struct wmi_device *wdev)
> > > +{
> > > +	struct platform_device *pdev;
> > > +
> > > +	pdev = dev_get_drvdata(&wdev->dev);
> > > +
> > > +	platform_device_unregister(pdev);
> > > +	platform_driver_unregister(&platform_driver);
> > > +}
> > > +
> > > +/*
> > > + * Legacy WMI driver
> > > + */
> > > +static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
> > > +{
> > > +	struct alienfx_platdata pdata = {
> > > +		.wdev = wdev,
> > > +	};
> > > +
> > > +	return alienware_alienfx_setup(&pdata);
> > > +}
> > > +
> > > +static void legacy_wmi_remove(struct wmi_device *wdev)
> > > +{
> > > +	alienware_alienfx_exit(wdev);
> > > +}
> > > +
> > > +static struct wmi_device_id alienware_legacy_device_id_table[] = {
> > > +	{ LEGACY_CONTROL_GUID, NULL },
> > > +	{ },
> > > +};
> > > +MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
> > > +
> > > +static struct wmi_driver alienware_legacy_wmi_driver = {
> > > +	.driver = {
> > > +		.name = "alienware-wmi-alienfx",
> > > +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> > > +	},
> > > +	.id_table = alienware_legacy_device_id_table,
> > > +	.probe = legacy_wmi_probe,
> > > +	.remove = legacy_wmi_remove,
> > > +};
> > > +
> > > +static int __init alienware_legacy_wmi_init(void)
> > > +{
> > > +	return wmi_driver_register(&alienware_legacy_wmi_driver);
> > > +}
> > > +
> > > +static void __exit alienware_legacy_wmi_exit(void)
> > > +{
> > > +	wmi_driver_unregister(&alienware_legacy_wmi_driver);
> > > +}
> > > +
> > > +/*
> > > + * WMAX WMI driver
> > > + */
> > > +static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> > > +{
> > > +	struct alienfx_platdata pdata = {
> > > +		.wdev = wdev,
> > > +	};
> > > +	int ret = 0;
> > > +
> > > +	if (quirks->thermal)
> > > +		ret = create_thermal_profile(wdev);
> > > +	else
> > > +		ret = alienware_alienfx_setup(&pdata);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static void wmax_wmi_remove(struct wmi_device *wdev)
> > > +{
> > > +	if (quirks->thermal)
> > > +		remove_thermal_profile();
> > > +	else
> > > +		alienware_alienfx_exit(wdev);
> > > +}
> > > +
> > > +static struct wmi_device_id alienware_wmax_device_id_table[] = {
> > > +	{ WMAX_CONTROL_GUID, NULL },
> > > +	{ },
> > > +};
> > > +MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
> > > +
> > > +static struct wmi_driver alienware_wmax_wmi_driver = {
> > > +	.driver = {
> > > +		.name = "alienware-wmi-wmax",
> > > +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> > > +	},
> > > +	.id_table = alienware_wmax_device_id_table,
> > > +	.probe = wmax_wmi_probe,
> > > +	.remove = wmax_wmi_remove,
> > > +};
> > > +
> > > +static int __init alienware_wmax_wmi_init(void)
> > > +{
> > > +	return wmi_driver_register(&alienware_wmax_wmi_driver);
> > > +}
> > > +
> > > +static void __exit alienware_wmax_wmi_exit(void)
> > > +{
> > > +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> > > +}
> > > +
> > > +static int __init alienware_wmi_init(void)
> > > +{
> > > +	int ret;
> > > +
> > >   	dmi_check_system(alienware_quirks);
> > >   	if (quirks == NULL)
> > >   		quirks = &quirk_unknown;
> > > @@ -1180,43 +1301,28 @@ static int __init alienware_wmi_init(void)
> > >   			pr_warn("force_gmode requires platform profile support\n");
> > >   	}
> > > 
> > > -	ret = platform_driver_register(&platform_driver);
> > > -	if (ret)
> > > -		goto fail_platform_driver;
> > > -	platform_device = platform_device_alloc("alienware-wmi", PLATFORM_DEVID_NONE);
> > > -	if (!platform_device) {
> > > -		ret = -ENOMEM;
> > > -		goto fail_platform_device1;
> > > +	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
> > > +		interface = WMAX;
> > > +		ret = alienware_wmax_wmi_init();
> > > +	} else {
> > > +		interface = LEGACY;
> > > +		ret = alienware_legacy_wmi_init();
> > >   	}
> > > -	ret = platform_device_add(platform_device);
> > > -	if (ret)
> > > -		goto fail_platform_device2;
> > > 
> > > -	if (quirks->thermal) {
> > > -		ret = create_thermal_profile(platform_device);
> > > -		if (ret)
> > > -			goto fail_prep_thermal_profile;
> > > -	}
> > > +	if (ret < 0)
> > > +		return ret;
> > > 
> > >   	return 0;
> > > -
> > > -fail_prep_thermal_profile:
> > > -	platform_device_del(platform_device);
> > > -fail_platform_device2:
> > > -	platform_device_put(platform_device);
> > > -fail_platform_device1:
> > > -	platform_driver_unregister(&platform_driver);
> > > -fail_platform_driver:
> > > -	return ret;
> > >   }
> > > 
> > >   module_init(alienware_wmi_init);
> > > 
> > >   static void __exit alienware_wmi_exit(void)
> > >   {
> > > -	remove_thermal_profile();
> > > -	platform_device_unregister(platform_device);
> > > -	platform_driver_unregister(&platform_driver);
> > > +	if (interface == WMAX)
> > > +		alienware_wmax_wmi_exit();
> > > +	else
> > > +		alienware_legacy_wmi_exit();
> > >   }
> > > 
> > >   module_exit(alienware_wmi_exit);
