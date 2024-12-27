Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359107BB1D;
	Fri, 27 Dec 2024 04:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735274700; cv=none; b=Th8pOgf7QlEV+n993RNIR20e7eCrja2WkXNQyQiZn66qweHrakRCTR1+BAwm3nJzYneIlYrPOUxQXlLxgVs+rOLmAc2IVox5vRZf0DgEvN+vlGNFjyQdT1pdJOLOSESpHee86wx0/VmkjcwmMq3qRSdYLcQ0gv3Qmug4znHUfKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735274700; c=relaxed/simple;
	bh=0IMaE/rrNOXV+dO7JD75ca1uqrWR0x5KBzTcCbIfz2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zdjb2vLILAATN5CAeDWcC0I0DzRsCSLzUr70fq38W7SHR9N2o2geNc2fOq6bzWtczjXy6vuKmzp4XX/HGt9owI15Dm8IXXTtOuxMl1fNCU70d453v2TGJZuhHG2KQ3KAciEHIebWTWQewpmzEOaKP3somWiAIvqYdysvQehpNOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFrSql8M; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFrSql8M"
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-518a52c8b5aso2112608e0c.2;
        Thu, 26 Dec 2024 20:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735274697; x=1735879497; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YHBbcqzhgZV77GQZ157osKUIu1uSKBhmgUKXV+aoq+0=;
        b=PFrSql8MmhkKbKGn4ZVJcdTMVCwBcO/PxAks4b9crvgWZu8i4bToSnSdxf06UH0vmt
         XHoqMHi9MRq09MTECQRRhQJYE9V8zo1wOkbyJftchZ1iP1O2oPLHLwLuIJ1S8WcoEVJN
         jrUZNtazrO8CqoDBVJM/Naq0Xw37urcFaWMRpdmeu6B0hBo85IWEIBgx8y4aICQR/saJ
         KU7fF83j0BmUZH0x2WD8lS4RYWh6dAEyHCNBZsu2vgQ8e9LyHx7tvK05RX33zjvHRkHn
         6Bs4smpOIhMwVpVVLzRDvvP53WGYx8NXNQFanDfWgwreijcx66xBK1rqLckJhLAWg4wn
         C+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735274697; x=1735879497;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YHBbcqzhgZV77GQZ157osKUIu1uSKBhmgUKXV+aoq+0=;
        b=QPA75QLu0qCQGuBzmOFfi8xuVIiYEwcjOz9flDJrgTfGu0yasJ3pxhEqHuSQ/ZANZp
         pft8wDWdwZ3dIIu1WuYWuX6fMJhfysrmgMp6R5Ro2CpzMUvcme7+woKIteXY8kltXNrK
         QQzYH5k6bjJ59N+DcNZDiK51CDdgEAPJOaXyhmAsmX+ySl6FwyNO3c/HtRGTaWwfUozA
         gmqDetHUjjaPL4jGaFt4Mnm5GD8wq04XUvVH7zl5klzICdvyHtNCpSmd3GwlpBn7/cuV
         CIS379+jObBgh1On3tJ12SRqprPxEPKsZztXyG/TAhdyFFFek5iAIU6S/Azd+B5x5izI
         dJTg==
X-Forwarded-Encrypted: i=1; AJvYcCWprpZLh9a7z6SCuEruhtR5dcrmNSJpUlK/6bW7z7GZxvacVRYNPTIwcKaV1AA9bWXAjRzRyOSNiZdwX2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb10pVK8DEcvhF8Pyz4hgPZB8zWN4uwesPt+jRieUt1WpnH7n4
	dpi9HzYQ0ml6H38GsIWHl/pv2ehd/Hbjdgn4vlnALS1vaBTMTYPH
X-Gm-Gg: ASbGnctbVXRY6tzXLS/v3Da5GeYqFXw61+8ZZWyusDq38wEdjQIZmmxNWRWJL+yvNmC
	1cssIQO/X59TVbJCyhdxVZu4Gih3xteRKeQ2NbHKqrjgi5zlPSMnXKKrSEXWJwotkyMr0HzAPdA
	iiwA8teUfikl8/Rk9412lVIhHWdHXqauAYSiviSNu4L8osipZJjxfHDNcGge1tQEpnEhM34MdFU
	iIIiiFihci3S8EsMBsgiS7XeO+1KHdayoZmrxEUIz8ypSqVIsEiWw==
X-Google-Smtp-Source: AGHT+IGmIcOYMmLvlHfIKH7APfbwd6PQ56Yxhb+UsdUokAypKTiPcIdphTUgBcY/33t82BIw73fCqQ==
X-Received: by 2002:a05:6122:3d4b:b0:50b:e9a5:cd7b with SMTP id 71dfb90a1353d-51b75d28edcmr20923614e0c.9.1735274696931;
        Thu, 26 Dec 2024 20:44:56 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51b68bb4751sm1739822e0c.18.2024.12.26.20.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 20:44:56 -0800 (PST)
Date: Thu, 26 Dec 2024 23:44:52 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 08/20] alienware-wmi: Add WMI Drivers
Message-ID: <zl6ukxdcscxqkpqodjkocfljolnoz2pep74zbu2iy5e7itm3lr@zavcqwt5iyaw>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-9-kuurtb@gmail.com>
 <367b6e24-d7d3-426e-96ed-e7ab6a36ad5b@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <367b6e24-d7d3-426e-96ed-e7ab6a36ad5b@gmx.de>

On Fri, Dec 27, 2024 at 04:21:14AM +0100, Armin Wolf wrote:
> Am 21.12.24 um 06:59 schrieb Kurt Borja:
> 
> > Add WMI drivers for LEGACY and WMAX devices.
> > 
> > This involves moving platform driver and device registration to a helper
> > function, which is now called from the driver's preferred WMI device
> > driver probe. However this is only done if !quirks->thermal because
> > newer WMAX interface doesn't support any of the features exposed by this
> > device.
> > 
> > Only one driver is registered on module initialization to prevent
> > registering duplicate platform driver and device.
> > 
> > Aditionally, create_thermal_profile() now takes wmi_device * instead of
> > platform_device *.
> 
> Since the HDMI, Amplifier and deepslp groups depend on the WMAX interface i would
> register them inside wmax_wmi_probe() using device_add_groups() (you might need to
> rework alienware_alienfx_setup() for that).
> 
> In the end the only code shared between both drivers should be related to the LED handling.
> Everything else AFAIK depends on the WMAX interface and should therefore be inside the
> WMAX driver.

Unfortunately this breaks old user-space interface, as the path to this
attributes would change :(. This is why I can't even set a parent dev
for the platform_device.

I only know of one project which interefaces with this driver [1], and
it does use the /sys/devices/platform/alienware-wmi path. Maybe I could
send a pull req, but it would still break old unknown projects and
scripts.

[1] https://crates.io/crates/alienware

> 
> Thanks,
> Armin Wolf
> 
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 186 +++++++++++++++++-----
> >   1 file changed, 146 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index 4b68d64bd742..f2f6842e27e6 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/platform_profile.h>
> >   #include <linux/dmi.h>
> >   #include <linux/leds.h>
> > +#include <linux/wmi.h>
> > 
> >   #define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
> >   #define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF5492"
> > @@ -39,8 +40,6 @@
> >   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
> >   MODULE_DESCRIPTION("Alienware special feature control");
> >   MODULE_LICENSE("GPL");
> > -MODULE_ALIAS("wmi:" LEGACY_CONTROL_GUID);
> > -MODULE_ALIAS("wmi:" WMAX_CONTROL_GUID);
> > 
> >   static bool force_platform_profile;
> >   module_param_unsafe(force_platform_profile, bool, 0);
> > @@ -412,7 +411,10 @@ struct alienfx_priv {
> >   	u8 lighting_control_state;
> >   };
> > 
> > -static struct platform_device *platform_device;
> > +struct alienfx_platdata {
> > +	struct wmi_device *wdev;
> > +};
> > +
> >   static struct platform_profile_handler pp_handler;
> >   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
> > 
> > @@ -1048,7 +1050,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
> >   	return wmax_thermal_control(supported_thermal_profiles[profile]);
> >   }
> > 
> > -static int create_thermal_profile(struct platform_device *platform_device)
> > +static int create_thermal_profile(struct wmi_device *wdev)
> >   {
> >   	enum platform_profile_option profile;
> >   	enum wmax_thermal_mode mode;
> > @@ -1097,7 +1099,7 @@ static int create_thermal_profile(struct platform_device *platform_device)
> >   	pp_handler.profile_get = thermal_profile_get;
> >   	pp_handler.profile_set = thermal_profile_set;
> >   	pp_handler.name = "alienware-wmi";
> > -	pp_handler.dev = &platform_device->dev;
> > +	pp_handler.dev = &wdev->dev;
> > 
> >   	return platform_profile_register(&pp_handler);
> >   }
> > @@ -1153,19 +1155,138 @@ static struct platform_driver platform_driver = {
> >   	.probe = alienfx_probe,
> >   };
> > 
> > -static int __init alienware_wmi_init(void)
> > +static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
> >   {
> > +	struct platform_device *pdev;
> >   	int ret;
> > 
> > -	if (wmi_has_guid(LEGACY_CONTROL_GUID))
> > -		interface = LEGACY;
> > -	else if (wmi_has_guid(WMAX_CONTROL_GUID))
> > -		interface = WMAX;
> > -	else {
> > -		pr_warn("alienware-wmi: No known WMI GUID found\n");
> > -		return -ENODEV;
> > +	ret = platform_driver_register(&platform_driver);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	pdev = platform_device_register_data(NULL, "alienware-wmi",
> > +					     PLATFORM_DEVID_NONE, pdata,
> > +					     sizeof(*pdata));
> > +
> > +	if (IS_ERR(pdev)) {
> > +		platform_driver_unregister(&platform_driver);
> > +		return PTR_ERR(pdev);
> >   	}
> > 
> > +	dev_set_drvdata(&pdata->wdev->dev, pdev);
> > +
> > +	return 0;
> > +}
> > +
> > +static void alienware_alienfx_exit(struct wmi_device *wdev)
> > +{
> > +	struct platform_device *pdev;
> > +
> > +	pdev = dev_get_drvdata(&wdev->dev);
> > +
> > +	platform_device_unregister(pdev);
> > +	platform_driver_unregister(&platform_driver);
> > +}
> > +
> > +/*
> > + * Legacy WMI driver
> > + */
> > +static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
> > +{
> > +	struct alienfx_platdata pdata = {
> > +		.wdev = wdev,
> > +	};
> > +
> > +	return alienware_alienfx_setup(&pdata);
> > +}
> > +
> > +static void legacy_wmi_remove(struct wmi_device *wdev)
> > +{
> > +	alienware_alienfx_exit(wdev);
> > +}
> > +
> > +static struct wmi_device_id alienware_legacy_device_id_table[] = {
> > +	{ LEGACY_CONTROL_GUID, NULL },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
> > +
> > +static struct wmi_driver alienware_legacy_wmi_driver = {
> > +	.driver = {
> > +		.name = "alienware-wmi-alienfx",
> > +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> > +	},
> > +	.id_table = alienware_legacy_device_id_table,
> > +	.probe = legacy_wmi_probe,
> > +	.remove = legacy_wmi_remove,
> > +};
> > +
> > +static int __init alienware_legacy_wmi_init(void)
> > +{
> > +	return wmi_driver_register(&alienware_legacy_wmi_driver);
> > +}
> > +
> > +static void __exit alienware_legacy_wmi_exit(void)
> > +{
> > +	wmi_driver_unregister(&alienware_legacy_wmi_driver);
> > +}
> > +
> > +/*
> > + * WMAX WMI driver
> > + */
> > +static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> > +{
> > +	struct alienfx_platdata pdata = {
> > +		.wdev = wdev,
> > +	};
> > +	int ret = 0;
> > +
> > +	if (quirks->thermal)
> > +		ret = create_thermal_profile(wdev);
> > +	else
> > +		ret = alienware_alienfx_setup(&pdata);
> > +
> > +	return ret;
> > +}
> > +
> > +static void wmax_wmi_remove(struct wmi_device *wdev)
> > +{
> > +	if (quirks->thermal)
> > +		remove_thermal_profile();
> > +	else
> > +		alienware_alienfx_exit(wdev);
> > +}
> > +
> > +static struct wmi_device_id alienware_wmax_device_id_table[] = {
> > +	{ WMAX_CONTROL_GUID, NULL },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
> > +
> > +static struct wmi_driver alienware_wmax_wmi_driver = {
> > +	.driver = {
> > +		.name = "alienware-wmi-wmax",
> > +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
> > +	},
> > +	.id_table = alienware_wmax_device_id_table,
> > +	.probe = wmax_wmi_probe,
> > +	.remove = wmax_wmi_remove,
> > +};
> > +
> > +static int __init alienware_wmax_wmi_init(void)
> > +{
> > +	return wmi_driver_register(&alienware_wmax_wmi_driver);
> > +}
> > +
> > +static void __exit alienware_wmax_wmi_exit(void)
> > +{
> > +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> > +}
> > +
> > +static int __init alienware_wmi_init(void)
> > +{
> > +	int ret;
> > +
> >   	dmi_check_system(alienware_quirks);
> >   	if (quirks == NULL)
> >   		quirks = &quirk_unknown;
> > @@ -1180,43 +1301,28 @@ static int __init alienware_wmi_init(void)
> >   			pr_warn("force_gmode requires platform profile support\n");
> >   	}
> > 
> > -	ret = platform_driver_register(&platform_driver);
> > -	if (ret)
> > -		goto fail_platform_driver;
> > -	platform_device = platform_device_alloc("alienware-wmi", PLATFORM_DEVID_NONE);
> > -	if (!platform_device) {
> > -		ret = -ENOMEM;
> > -		goto fail_platform_device1;
> > +	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
> > +		interface = WMAX;
> > +		ret = alienware_wmax_wmi_init();
> > +	} else {
> > +		interface = LEGACY;
> > +		ret = alienware_legacy_wmi_init();
> >   	}
> > -	ret = platform_device_add(platform_device);
> > -	if (ret)
> > -		goto fail_platform_device2;
> > 
> > -	if (quirks->thermal) {
> > -		ret = create_thermal_profile(platform_device);
> > -		if (ret)
> > -			goto fail_prep_thermal_profile;
> > -	}
> > +	if (ret < 0)
> > +		return ret;
> > 
> >   	return 0;
> > -
> > -fail_prep_thermal_profile:
> > -	platform_device_del(platform_device);
> > -fail_platform_device2:
> > -	platform_device_put(platform_device);
> > -fail_platform_device1:
> > -	platform_driver_unregister(&platform_driver);
> > -fail_platform_driver:
> > -	return ret;
> >   }
> > 
> >   module_init(alienware_wmi_init);
> > 
> >   static void __exit alienware_wmi_exit(void)
> >   {
> > -	remove_thermal_profile();
> > -	platform_device_unregister(platform_device);
> > -	platform_driver_unregister(&platform_driver);
> > +	if (interface == WMAX)
> > +		alienware_wmax_wmi_exit();
> > +	else
> > +		alienware_legacy_wmi_exit();
> >   }
> > 
> >   module_exit(alienware_wmi_exit);
