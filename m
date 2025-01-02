Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9384431;
	Thu,  2 Jan 2025 18:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735843757; cv=none; b=kmNzlDIyUJqk1scxlAO2spUvi2CqS4woI5ezdYP/zYDIOnXe7u2E2qcgy8bkbuP18qwaTsHZymx6TI9MVM/yXegSQcj8iFpu55EJLWK2twyKHoB4KfhbduAe8qqHnwVrQMU8DfcoFeIy5Z9RNBjEThYSImVdrSZiKKD7U6gOYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735843757; c=relaxed/simple;
	bh=MwEnGqALXA0cP1S474AfWKIB2yjwto5BdCaNCEyD/Lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=baKH6XHSwNhTe6YFpzftvUktkH+sXLIaB7EfLjS8ONqR/Dqg3T5FZMRu1Bai0+Y+n+M8lxlsZ9VQ9YOkwySRz+ZSDa/q8WLvNPFw0u1wXy/Tz6e2ahhq8NRyVR73o6BnguznBwhSPevni1a3d/XC0RdhDwfPNGgMTwgzb/wZr/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d2Tk4JcD; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d2Tk4JcD"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-46792996074so114037941cf.0;
        Thu, 02 Jan 2025 10:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735843755; x=1736448555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pQoohkhiu3NkeEcc6yYwMmPuijxTxnrsZevJIAPcams=;
        b=d2Tk4JcDppcR3V8vuItcPtGnQ1D+9FHjxD/2ZUDFYE4HsQJhxsYsD8t7K29Ht0R+7+
         wk5BeXXFLCCwPMA0Aqzvlr9FKkXOHF6DTbMD2vB9m0iy4EnGM7qwnciZGQZb0Q93Nfz5
         ZRg+KXvmnU8gRFomit+VV3ky2l5bYlSbi1VAYRs63ygPii+KgpGTbb6bFm+W3/VKf9EX
         FCEg9OHTaQKrsEivyjn3v/+t/eKXrmxKZ3c1JbTYMKeYoF19Z2MrYGaCG/H6QS+P1kV3
         Aa3V8zCntv3m0xUK/i0oLYSNdYwD5emXDZqc9ZrVVqhjztAktR/tJ0CWZ9MW5Dl8PT2q
         aR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843755; x=1736448555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQoohkhiu3NkeEcc6yYwMmPuijxTxnrsZevJIAPcams=;
        b=r053LyxEC1/yEG7PpuL7eAuHVgsiTMSmp2QIRi/7YaYIhAZDnLtIy1xmEgFjfD9IH8
         iOuejmVD5RSgQxlAsgvkVRQ6hd6nB3zwPYnjvpX1gVHmXlQNgi5WJ7qfVoHXJvcjsMK5
         Cm7dYee3QR8pUUuYygkbpfDm+JlZ7w+WNonEIIGgYYIdPn+4E2GhxviKqeXIRCRndA81
         4NHCWI47amIPkQ991ccFUFHwSfjJ/Dw4r6roEM/BYUh37zMTwWOw4iHsLBGl80myJ5A4
         hjtO+RPXSayKU106G4vxZq38jpogCIcJ5DKrQP/4KbxMD19utD/2CanyrYj/bwOdlqZD
         vPTA==
X-Forwarded-Encrypted: i=1; AJvYcCVG5Rm/gSy6bhRWQCsSarHcpmQziFwXeY2C0QyKexrTPxnhFSf04pF5p7DK1aDSvZOSv+JsjrjyxyZc328=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWImHskdU6E4JFc1NptjwXayH6xoT1qNaxxpA4y1GUMDFYHaZQ
	jwz5KvQGYjTBWsB0qcHGIM5vuS1T73yj2iNYBSi4EFknzopgAV/Ch+iWIg==
X-Gm-Gg: ASbGncsxpdZaUYh0Z8aSkv5i7HclVqtbsrAzAk+fDyxU+Sj55F/uXFBhMs/DDU3jAvR
	IuUy/kbkO/mKldkKoLw7+6lxeQY8eM88k0JknixHdYwUqyjIkdHZdLTimLyMMdI0Gaay1o9Mx4k
	noPvl5ke+QmSZJfSk6VNUhu6YCmBYYrbgDcSZJXbrFEDge6ltZYcO17K6t9o84XLMvWS4gwrbeB
	QfELmawo4nVnvR2ADMlxtWhm206+RXmb1PklZNI7tmU6Xf9ObCmow==
X-Google-Smtp-Source: AGHT+IE8GVSCU6X2ciGz/CE1E+UpuS0tH9kthVhGKZCZ+xqP9SxagQaWTaQFDb8Y5GmO5ALps/wmnw==
X-Received: by 2002:ad4:5c4b:0:b0:6d8:a70d:5e48 with SMTP id 6a1803df08f44-6dd2339fdeamr680096496d6.30.1735843754758;
        Thu, 02 Jan 2025 10:49:14 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd35b0c471sm110233506d6.29.2025.01.02.10.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:49:14 -0800 (PST)
Date: Thu, 2 Jan 2025 13:49:11 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	mario.limonciello@amd.com
Subject: Re: [PATCH v2 08/20] alienware-wmi: Add WMI Drivers
Message-ID: <lc4kr2rqzlahycjxg37ptsbxsp2ip5xa373bwe5sxvfozen5a2@zmiiwwiyakxf>
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-10-kuurtb@gmail.com>
 <0cd23fcd-132d-437e-a893-eecc2f8c643c@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cd23fcd-132d-437e-a893-eecc2f8c643c@gmx.de>

On Thu, Jan 02, 2025 at 05:16:21PM +0100, Armin Wolf wrote:
> Am 29.12.24 um 20:44 schrieb Kurt Borja:
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
> > Additionally, create_thermal_profile() now takes wmi_device * instead of
> > platform_device *.
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 195 +++++++++++++++++-----
> >   1 file changed, 155 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index 88d4046ed45f..87a7997579c9 100644
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
> > @@ -413,7 +412,10 @@ struct alienfx_priv {
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
> > @@ -1072,7 +1074,7 @@ static int thermal_profile_set(struct platform_profile_handler *pprof,
> >   	return wmax_thermal_control(supported_thermal_profiles[profile]);
> >   }
> > 
> > -static int create_thermal_profile(struct platform_device *platform_device)
> > +static int create_thermal_profile(struct wmi_device *wdev)
> >   {
> >   	enum platform_profile_option profile;
> >   	enum wmax_thermal_mode mode;
> > @@ -1121,7 +1123,7 @@ static int create_thermal_profile(struct platform_device *platform_device)
> >   	pp_handler.profile_get = thermal_profile_get;
> >   	pp_handler.profile_set = thermal_profile_set;
> >   	pp_handler.name = "alienware-wmi";
> > -	pp_handler.dev = &platform_device->dev;
> > +	pp_handler.dev = &wdev->dev;
> > 
> >   	return platform_profile_register(&pp_handler);
> >   }
> > @@ -1164,6 +1166,10 @@ static int alienfx_probe(struct platform_device *pdev)
> > 
> >   static const struct attribute_group *alienfx_groups[] = {
> >   	&zone_attribute_group,
> > +	NULL
> > +};
> > +
> > +static const struct attribute_group *wmax_alienfx_groups[] = {
> >   	&hdmi_attribute_group,
> >   	&amplifier_attribute_group,
> >   	&deepsleep_attribute_group,
> > @@ -1179,19 +1185,143 @@ static struct platform_driver platform_driver = {
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
> > +	}
> > +
> > +	dev_set_drvdata(&pdata->wdev->dev, pdev);
> > +
> > +	return 0;
> > +}
> > +
> > +static void alienware_alienfx_exit(struct wmi_device *wdev)
> > +{
> > +	struct platform_device *pdev = dev_get_drvdata(&wdev->dev);
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
> > +	struct platform_device *pdev;
> > +	int ret;
> > +
> > +	if (quirks->thermal) {
> > +		ret = create_thermal_profile(wdev);
> > +	} else {
> > +		ret = alienware_alienfx_setup(&pdata);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		pdev = dev_get_drvdata(&wdev->dev);
> > +		ret = device_add_groups(&pdev->dev, wmax_alienfx_groups);
> 
> If device_add_groups() fails you need to call alienware_alienfx_exit().
> 
> >   	}
> > 
> > +	return ret;
> > +}
> > +
> > +static void wmax_wmi_remove(struct wmi_device *wdev)
> > +{
> > +	if (quirks->thermal)
> > +		remove_thermal_profile();
> > +	else
> > +		alienware_alienfx_exit(wdev);
> 
> Missing call to device_remove_groups().

Thanks, I missed both of these comments!

> 
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
> > @@ -1206,43 +1336,28 @@ static int __init alienware_wmi_init(void)
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
> 
> Please just return ret here.
> 
> Thanks,
> Armin Wolf
> 
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
