Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5A743AA4;
	Sun, 19 Jan 2025 16:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737305241; cv=none; b=gtF3i8xXP7vTFdyB7YT7UDRuNOrTzlaH9ZJV2pkjiTsqITYNzfLN5l8IVSO2QMkfF4hv1/yErVq9QQhZF/en0Be6z6nRD2JkWBqEJDxa8y9g1TOv8oAVRDF9HkWt2wWOi/K0mIW8aCrh1bMRN1zVwre/ut2GRcSIFUevKWSpbDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737305241; c=relaxed/simple;
	bh=53M98Mip5xry8TmD8xcCLe1lM9f3kPu/+YChD0x/nik=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lU0440ykCp1i9zxJFMGOU5Q/s7sEvtZUfFVA5tZD+K02wkRJaShcSSprI9lO0x6A8NUzc2Bv4gqz0YzkW+1wQPXw3iw79Mzzzp+CgXS8SfErYVTVozAXDN2VgAalwvioom7aoyDXt4NktouQFF1XQ3MBs5JXVxFdy4O0NJxSpZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoVMioiL; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoVMioiL"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso1004335e0c.2;
        Sun, 19 Jan 2025 08:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737305238; x=1737910038; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyGGrwspA4DMCUt6kYxbhr1HMY89HBdIJ6L4yYi1F5k=;
        b=ZoVMioiLI7lSZDCMx048Nn/fBvvBtChz3AxHCf9XVYEoqigCFI2CD5K9jGK74pTjHQ
         YzKW0q8XCE59jeZD7060uIGGrj3p0gpWg1wAmr+KgXO991QNwHgzLQPAMKmRCdPHjUnc
         BBu6c/PvfHWZcm1yynxUvB2/n/GKMOILhtGoB73Wa+1xvcpsJM4L7NvjMEdTVR6Wowbe
         swjrbHMpR88/Sm0WWqLQlzylKukc9Yi7Dpu0JKY+mV9txjiWEpojUfLmK+8ZwdA4WZlK
         NUP6OfT5PDlkQiSd1/gQBz4ZZPp2Uwi21tRPnGyRuCxCEhd7mY6hIPMYVavpOLXG718b
         du5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737305238; x=1737910038;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wyGGrwspA4DMCUt6kYxbhr1HMY89HBdIJ6L4yYi1F5k=;
        b=QWhQKlfUFlbzPf4yEc0rBccK/CFDhsZfZJ1gViCcvMpyHo3lJbBmOGEKiqWuoLDz5b
         bd8DHKnre6mYd1JvuUn6gAJ101tRW2BAhRCN3pjKpPMm3IBu/KNWAZ634Umumn2VHqOU
         TwAX9voGJvu9xR/FwgOGUyCP6kialwagf5eeFzrcDA75HwBhfAClstxfvcO16efMF0/C
         yqZoG8qKp3Ta7TV+DwbHvMcN2+CuniUwf98RbzuyNFFyvZXnVY0eaBZm5LOpQfrjgWDr
         fHbbzHAksPTaSyA8cLp7rSsNufVxOUMrmCmdi+cGyEJJ6t74UvFKBqS8cqGNo6YLQrMB
         Sxow==
X-Forwarded-Encrypted: i=1; AJvYcCW16XauPQfFa1agQcAu7wf9ZlZ0HmJCmsKD/8WG63TGryaAKdHsSBmsrCX1VVy83fhXlaIM5a1OLhRPX78=@vger.kernel.org, AJvYcCWC4UOqSik227NqYaFZ6x+A18YbUYwIQF/+BPugDQz0YfPrKK2YZpT7u63xRabSWowjsTorbsDwldbC/GXH7aK0lPbGGA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxin5mj8r+D/EOYSTLxXhws/0Ef34xZVCXlb0tNCtlGt4fSbVD4
	Rd7k0UNeLEsp073G+UbCWaPaL4FWbCsPFH5O16tEZaHJZnGuBGr4
X-Gm-Gg: ASbGnctMGWNOiyWx21RvnVw3LMWyRWwq6r8wU1L8j+RgYOfb2i0bikL+kPiTgjXjGrO
	zN/z3WcUrJY9U0mYNS93qAJVww0qT/nAxR+aOwiOZ/pwj0QJ8S7rwTzvlpeGgWpacj6LH0WtwF1
	uV8BiRhweZ0DJJ9e3EI5uxt9jN4q2dDPX+BPY5xkLaaYrZpO9JXmbqVgU7R8RHv6coGvVLvGXTz
	Ym8R/kNSPj3z5jsGbjPAZt/pit9Sbacf6Ai6qNtvjRTZnnoh6xuZ9PXfMCIUg==
X-Google-Smtp-Source: AGHT+IHoXFUTwOrbdK/4DA1qCm2/W8GfClvneN6n59i8Qf+A64IzNsXbaU9ZnP35PQnUA6EAck+SiA==
X-Received: by 2002:a05:6122:9008:b0:51b:8949:c996 with SMTP id 71dfb90a1353d-51d5b351af7mr8148678e0c.9.1737305237699;
        Sun, 19 Jan 2025 08:47:17 -0800 (PST)
Received: from localhost ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cf55c8f7esm1109711e0c.24.2025.01.19.08.47.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2025 08:47:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jan 2025 11:47:15 -0500
Message-Id: <D767B34URS22.3LJJ7SQJS7LGE@gmail.com>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 02/14] platform/x86: alienware-wmi: Add WMI Drivers
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, <platform-driver-x86@vger.kernel.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250117081347.8573-1-kuurtb@gmail.com>
 <20250117081347.8573-3-kuurtb@gmail.com>
 <7b54e564-b7ac-4945-959e-02ebf4867443@gmx.de>
In-Reply-To: <7b54e564-b7ac-4945-959e-02ebf4867443@gmx.de>

On Sat Jan 18, 2025 at 6:48 PM -05, Armin Wolf wrote:
> Am 17.01.25 um 09:13 schrieb Kurt Borja:
>
> > Add WMI drivers for LEGACY and WMAX devices.
> >
> > This involves moving platform driver and device registration to a helpe=
r
> > function, which is now called from the driver's preferred WMI device
> > driver probe. However this is only done if !quirks->thermal because
> > newer WMAX interface doesn't support any of the features exposed by thi=
s
> > device.
> >
> > Only one driver is registered on module initialization to prevent
> > registering duplicate platform driver and device.
> >
> > Additionally, create_thermal_profile() now takes wmi_device * instead o=
f
> > platform_device *.
> >
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 200 +++++++++++++++++----=
-
> >   1 file changed, 160 insertions(+), 40 deletions(-)
> >
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfo=
rm/x86/dell/alienware-wmi.c
> > index 5779b025761b..e1a5a867f144 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -15,6 +15,7 @@
> >   #include <linux/platform_profile.h>
> >   #include <linux/dmi.h>
> >   #include <linux/leds.h>
> > +#include <linux/wmi.h>
> >
> >   #define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
> >   #define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF54=
92"
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
> >   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PRO=
FILE_LAST];
> >
> >   static u8 interface;
> > @@ -1127,11 +1129,11 @@ static const struct platform_profile_ops awcc_p=
latform_profile_ops =3D {
> >   	.profile_set =3D thermal_profile_set,
> >   };
> >
> > -static int create_thermal_profile(struct platform_device *platform_dev=
ice)
> > +static int create_thermal_profile(struct wmi_device *wdev)
> >   {
> >   	struct device *ppdev;
> >
> > -	ppdev =3D devm_platform_profile_register(&platform_device->dev, "alie=
nware-wmi",
> > +	ppdev =3D devm_platform_profile_register(&wdev->dev, "alienware-wmi",
> >   					       NULL, &awcc_platform_profile_ops);
> >
> >   	return PTR_ERR_OR_ZERO(ppdev);
> > @@ -1166,6 +1168,10 @@ static int alienfx_probe(struct platform_device =
*pdev)
> >
> >   static const struct attribute_group *alienfx_groups[] =3D {
> >   	&zone_attribute_group,
> > +	NULL
> > +};
> > +
> > +static const struct attribute_group *wmax_alienfx_groups[] =3D {
> >   	&hdmi_attribute_group,
> >   	&amplifier_attribute_group,
> >   	&deepsleep_attribute_group,
> > @@ -1180,19 +1186,150 @@ static struct platform_driver platform_driver =
=3D {
> >   	.probe =3D alienfx_probe,
> >   };
> >
> > -static int __init alienware_wmi_init(void)
> > +static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
> >   {
> > +	struct platform_device *pdev;
> >   	int ret;
> >
> > -	if (wmi_has_guid(LEGACY_CONTROL_GUID))
> > -		interface =3D LEGACY;
> > -	else if (wmi_has_guid(WMAX_CONTROL_GUID))
> > -		interface =3D WMAX;
> > -	else {
> > -		pr_warn("alienware-wmi: No known WMI GUID found\n");
> > -		return -ENODEV;
> > +	ret =3D platform_driver_register(&platform_driver);
> > +	if (ret < 0)
> > +		return ret;
>
> Can you register this platform driver during module initialization? Other=
wise we might encounter
> a kernel crash should a WMI driver probe multiple devices and thus callin=
g this method more than once.

Makes sense, I will register it on module init.

>
> Please note however that platform_device_register_data() can be called mu=
ltiple times (it simply returns
> an error should the "alienware-wmi" device already exist).

That's good to know. Then it should be ok to set .no_singleton =3D true
after the above change.

~ Kurt

>
> > +
> > +	pdev =3D platform_device_register_data(NULL, "alienware-wmi",
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
> > +	struct platform_device *pdev =3D dev_get_drvdata(&wdev->dev);
> > +
> > +	platform_device_unregister(pdev);
> > +	platform_driver_unregister(&platform_driver);
> > +}
> > +
> > +/*
> > + * Legacy WMI driver
> > + */
> > +static int legacy_wmi_probe(struct wmi_device *wdev, const void *conte=
xt)
> > +{
> > +	struct alienfx_platdata pdata =3D {
> > +		.wdev =3D wdev,
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
> > +static struct wmi_device_id alienware_legacy_device_id_table[] =3D {
>
> Please make this device id table const.
>
> > +	{ LEGACY_CONTROL_GUID, NULL },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
> > +
> > +static struct wmi_driver alienware_legacy_wmi_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "alienware-wmi-alienfx",
> > +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +	},
> > +	.id_table =3D alienware_legacy_device_id_table,
> > +	.probe =3D legacy_wmi_probe,
> > +	.remove =3D legacy_wmi_remove,
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
> > +static int wmax_wmi_probe(struct wmi_device *wdev, const void *context=
)
> > +{
> > +	struct alienfx_platdata pdata =3D {
> > +		.wdev =3D wdev,
> > +	};
> > +	struct platform_device *pdev;
> > +	int ret;
> > +
> > +	if (quirks->thermal) {
> > +		return create_thermal_profile(wdev);
> > +	} else {
> > +		ret =3D alienware_alienfx_setup(&pdata);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		pdev =3D dev_get_drvdata(&wdev->dev);
> > +
> > +		ret =3D device_add_groups(&pdev->dev, wmax_alienfx_groups);
> > +		if (ret < 0)
> > +			alienware_alienfx_exit(wdev);
> > +
> > +		return ret;
> > +	}
> > +}
> > +
> > +static void wmax_wmi_remove(struct wmi_device *wdev)
> > +{
> > +	struct platform_device *pdev;
> > +
> > +	if (!quirks->thermal) {
> > +		pdev =3D dev_get_drvdata(&wdev->dev);
> > +
> > +		device_remove_groups(&pdev->dev, wmax_alienfx_groups);
> > +		alienware_alienfx_exit(wdev);
> > +	}
> > +}
> > +
> > +static struct wmi_device_id alienware_wmax_device_id_table[] =3D {
>
> Please make this device id table const.

Thanks! I missed these two.

~ Kurt

>
> Other than that the code looks promising.
>
> Thanks,
> Armin Wolf
>
> > +	{ WMAX_CONTROL_GUID, NULL },
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
> > +
> > +static struct wmi_driver alienware_wmax_wmi_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "alienware-wmi-wmax",
> > +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +	},
> > +	.id_table =3D alienware_wmax_device_id_table,
> > +	.probe =3D wmax_wmi_probe,
> > +	.remove =3D wmax_wmi_remove,
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
> >   	if (quirks =3D=3D NULL)
> >   		quirks =3D &quirk_unknown;
> > @@ -1207,33 +1344,14 @@ static int __init alienware_wmi_init(void)
> >   			pr_warn("force_gmode requires platform profile support\n");
> >   	}
> >
> > -	ret =3D platform_driver_register(&platform_driver);
> > -	if (ret)
> > -		goto fail_platform_driver;
> > -	platform_device =3D platform_device_alloc("alienware-wmi", PLATFORM_D=
EVID_NONE);
> > -	if (!platform_device) {
> > -		ret =3D -ENOMEM;
> > -		goto fail_platform_device1;
> > -	}
> > -	ret =3D platform_device_add(platform_device);
> > -	if (ret)
> > -		goto fail_platform_device2;
> > -
> > -	if (quirks->thermal) {
> > -		ret =3D create_thermal_profile(platform_device);
> > -		if (ret)
> > -			goto fail_prep_thermal_profile;
> > +	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
> > +		interface =3D WMAX;
> > +		ret =3D alienware_wmax_wmi_init();
> > +	} else {
> > +		interface =3D LEGACY;
> > +		ret =3D alienware_legacy_wmi_init();
> >   	}
> >
> > -	return 0;
> > -
> > -fail_prep_thermal_profile:
> > -	platform_device_del(platform_device);
> > -fail_platform_device2:
> > -	platform_device_put(platform_device);
> > -fail_platform_device1:
> > -	platform_driver_unregister(&platform_driver);
> > -fail_platform_driver:
> >   	return ret;
> >   }
> >
> > @@ -1241,8 +1359,10 @@ module_init(alienware_wmi_init);
> >
> >   static void __exit alienware_wmi_exit(void)
> >   {
> > -	platform_device_unregister(platform_device);
> > -	platform_driver_unregister(&platform_driver);
> > +	if (interface =3D=3D WMAX)
> > +		alienware_wmax_wmi_exit();
> > +	else
> > +		alienware_legacy_wmi_exit();
> >   }
> >
> >   module_exit(alienware_wmi_exit);

