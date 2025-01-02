Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D4941C69;
	Thu,  2 Jan 2025 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735834591; cv=none; b=eKqluLo1TVyru4OiLVS4sOqDri07TtrF2gHaXU99+xaMu+EZgECWiRUyRZB6INcb6Y3p/5rrrl53SN3pWpkuIsXiQY+dLl4J+QSQrZwUX+J8oox39271Xyvia4dq7Xsjz13btVXgBnrInDbyu1XI/alfKVaC5R31ek/ZVCqiFOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735834591; c=relaxed/simple;
	bh=MYjVpgRPiaECt0isrSPs0fGEApQPfG2bRlROKXEX9+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s6sDjOtMn/9egvMm1BrNexiT2mUBgcIyDk27Tw7Xvd1TEB/tWFJajLS+d6r6i4Pc3sN8haeZ4pGDCfht6HDuLGiWDwxsq/xb+JGNAnq0Qlx/tJsX8W5fQMz9NaxjEtI7+vXnD0Di3UqDcRLreogMobtBBKAQcv3b+w0SNMw0jPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=a4MZjoZZ; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="a4MZjoZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735834584; x=1736439384; i=w_armin@gmx.de;
	bh=aIfsWFdq7SlUTaHVCF1V7nwal9SWBHD4hjLFh08xcHA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=a4MZjoZZnBOKK+niPyPi5YkeVwK066iFIEHbyjjQoG0+7/rEmlrqXvUJk88UexVI
	 YTY72tai0Tbd3IRuKJnbbpfIHO8jthbVHM9s131+Q5zvkmQNdu7SYo0itwaN03Rw8
	 MWvntI3dmMs8rTO54UmywatSF3PIwwdTSEYYMcwZqGaN1gFI/qxlE+m/LumL5PIgl
	 Y8nCBiC0f/9EpOHKIJx+y7U/lSDSysHUe1RMkwz/RFqZEBTMRhWBz3wTBOFsTi19R
	 aTLjJY+1nurseJzH66ytMKkPJ9qqfQMFIpiRy8fSgCBavGECBvpm4a/PtIt861NAi
	 FBku1YCS9qjCfK7F3Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0oFz-1tfft43ecP-00x76D; Thu, 02
 Jan 2025 17:16:23 +0100
Message-ID: <0cd23fcd-132d-437e-a893-eecc2f8c643c@gmx.de>
Date: Thu, 2 Jan 2025 17:16:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/20] alienware-wmi: Add WMI Drivers
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-10-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241229194506.8268-10-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4PKizK+sw7mDp3r03QUQVcmUgEqMZtCMvxZiwWgBMDRYP41aqAP
 tb+X6chlMNUMlpC/IaMW7on8i2PKZb0Muey6Zxk3VM+cVMtDRfgHNbeJ9dEB/BoG6dmWh7+
 9WKWzDIHJ6dO6mvrjkMEZ0zpxUFw+PWUHsnQgPO9TFDLLg+XjIwmfV4kwDR8WiSyP8rHRVN
 hNa6Udm+xCJbs0FNzUvHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vwL3TshHFG0=;Cusq2iopEe8+64RW/jZyeZH+/tS
 QgE31p4FxfJ3lFiKyc71zl2trHjLcsBaEtH7sF+AsWKgBc4DVqEdN2Q94jn1F6ScWLR1EXaWv
 nUDCczFX1ZNUu1bIXTKBVw3i4fFviU/S+gBdIoxVQ1YcyxEY7tILId4Pm3K2VO+hF3b6+Vt1g
 m6Ahs9xT2Z2uiZTU9IWM+Kc8sbbSCLD5hkyY2gtm2IwbzQ+Z9JsuvgT+8tmpIZTpycGM5yvaL
 R8bLX0sciTRPiMoU0b/ffswc4PYpUJpjhsUjLeIPE/xerYLwo/TsHwAIQcRIkqRUCbQd2t/mo
 qEwOT8GonUZHZw0Fu1RmLLRh3VKvk1t7GNKL81T85O1M8NFLML+sXXlHJeTDlseNKfndKXPuv
 Xvzt+ZszYN0/JCQkmxA1CGrfRM3slO8DRL3aSaOjfGdzCgLaWY1uvfMGhG8ndHLryAbSsOUhB
 2QcjRMlqhJa2Jt2prO3J3Ho09C1vWj7uiyBmvmlEtPSYs9DEICxKQec7ZnC215s7sPu0rqZ1f
 OI+v5imRUWSmg8JWUqd1mPpt64MXfhLteEM/SZyaH5noP/SXc4I7Ms6euFx5SClo90ZjeU7/r
 pXsZZSPbbM60k3dAsPyDiOoAJa8ExJLym2H4gj6Qi7o+R/+ux2f1aZlhYztIDrFCh5lNbpC7h
 IhHwOWtJx3O+kPpuKj0rTK8DVUpqz/dl5hINuGmISKp0r6g4CGCs3O+Smz/fWh2OUhxhr1EyC
 S+X/R4B4/Pk66+xMZfTLKr7nwSxWmz3LV5BGubQi6UIFIS5+ULIKiVgpzuJj3LtorhJrthCWM
 NnTo3zv7gvYN7H0GFW2Hz5v9un8qzxmO84e/QveYCOGvZ2Z4rnZ+1Q3gUhk/B3r9kl4GGoKKZ
 otaGYtIt3mnJZH0TTFqGWqoXwPXY8h9D4dseSYB8AY0FpULTUMAUwYjitO/4I87nACJaU2jcY
 /Kt+De1QLKR8/52lT8AayIaTOqyWnzwVmQNts/BmvHNHuJ3+jtGqHI1IcUYhWD4hgjV8XAJLv
 SSMik7lXuUU89++vBXKfGYznIQro4YXnWgjxTOXQHV+yaWQtLT+e7NZarCIbpxNEkQ18v7qVx
 OgXM+0KRJ6RbdB4urPHykVDZ/eQrKK

Am 29.12.24 um 20:44 schrieb Kurt Borja:

> Add WMI drivers for LEGACY and WMAX devices.
>
> This involves moving platform driver and device registration to a helper
> function, which is now called from the driver's preferred WMI device
> driver probe. However this is only done if !quirks->thermal because
> newer WMAX interface doesn't support any of the features exposed by this
> device.
>
> Only one driver is registered on module initialization to prevent
> registering duplicate platform driver and device.
>
> Additionally, create_thermal_profile() now takes wmi_device * instead of
> platform_device *.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 195 +++++++++++++++++-----
>   1 file changed, 155 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index 88d4046ed45f..87a7997579c9 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -15,6 +15,7 @@
>   #include <linux/platform_profile.h>
>   #include <linux/dmi.h>
>   #include <linux/leds.h>
> +#include <linux/wmi.h>
>
>   #define LEGACY_CONTROL_GUID		"A90597CE-A997-11DA-B012-B622A1EF5492"
>   #define LEGACY_POWER_CONTROL_GUID	"A80593CE-A997-11DA-B012-B622A1EF549=
2"
> @@ -39,8 +40,6 @@
>   MODULE_AUTHOR("Mario Limonciello <mario.limonciello@outlook.com>");
>   MODULE_DESCRIPTION("Alienware special feature control");
>   MODULE_LICENSE("GPL");
> -MODULE_ALIAS("wmi:" LEGACY_CONTROL_GUID);
> -MODULE_ALIAS("wmi:" WMAX_CONTROL_GUID);
>
>   static bool force_platform_profile;
>   module_param_unsafe(force_platform_profile, bool, 0);
> @@ -413,7 +412,10 @@ struct alienfx_priv {
>   	u8 lighting_control_state;
>   };
>
> -static struct platform_device *platform_device;
> +struct alienfx_platdata {
> +	struct wmi_device *wdev;
> +};
> +
>   static struct platform_profile_handler pp_handler;
>   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROF=
ILE_LAST];
>
> @@ -1072,7 +1074,7 @@ static int thermal_profile_set(struct platform_pro=
file_handler *pprof,
>   	return wmax_thermal_control(supported_thermal_profiles[profile]);
>   }
>
> -static int create_thermal_profile(struct platform_device *platform_devi=
ce)
> +static int create_thermal_profile(struct wmi_device *wdev)
>   {
>   	enum platform_profile_option profile;
>   	enum wmax_thermal_mode mode;
> @@ -1121,7 +1123,7 @@ static int create_thermal_profile(struct platform_=
device *platform_device)
>   	pp_handler.profile_get =3D thermal_profile_get;
>   	pp_handler.profile_set =3D thermal_profile_set;
>   	pp_handler.name =3D "alienware-wmi";
> -	pp_handler.dev =3D &platform_device->dev;
> +	pp_handler.dev =3D &wdev->dev;
>
>   	return platform_profile_register(&pp_handler);
>   }
> @@ -1164,6 +1166,10 @@ static int alienfx_probe(struct platform_device *=
pdev)
>
>   static const struct attribute_group *alienfx_groups[] =3D {
>   	&zone_attribute_group,
> +	NULL
> +};
> +
> +static const struct attribute_group *wmax_alienfx_groups[] =3D {
>   	&hdmi_attribute_group,
>   	&amplifier_attribute_group,
>   	&deepsleep_attribute_group,
> @@ -1179,19 +1185,143 @@ static struct platform_driver platform_driver =
=3D {
>   	.probe =3D alienfx_probe,
>   };
>
> -static int __init alienware_wmi_init(void)
> +static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
>   {
> +	struct platform_device *pdev;
>   	int ret;
>
> -	if (wmi_has_guid(LEGACY_CONTROL_GUID))
> -		interface =3D LEGACY;
> -	else if (wmi_has_guid(WMAX_CONTROL_GUID))
> -		interface =3D WMAX;
> -	else {
> -		pr_warn("alienware-wmi: No known WMI GUID found\n");
> -		return -ENODEV;
> +	ret =3D platform_driver_register(&platform_driver);
> +	if (ret < 0)
> +		return ret;
> +
> +	pdev =3D platform_device_register_data(NULL, "alienware-wmi",
> +					     PLATFORM_DEVID_NONE, pdata,
> +					     sizeof(*pdata));
> +
> +	if (IS_ERR(pdev)) {
> +		platform_driver_unregister(&platform_driver);
> +		return PTR_ERR(pdev);
> +	}
> +
> +	dev_set_drvdata(&pdata->wdev->dev, pdev);
> +
> +	return 0;
> +}
> +
> +static void alienware_alienfx_exit(struct wmi_device *wdev)
> +{
> +	struct platform_device *pdev =3D dev_get_drvdata(&wdev->dev);
> +
> +	platform_device_unregister(pdev);
> +	platform_driver_unregister(&platform_driver);
> +}
> +
> +/*
> + * Legacy WMI driver
> + */
> +static int legacy_wmi_probe(struct wmi_device *wdev, const void *contex=
t)
> +{
> +	struct alienfx_platdata pdata =3D {
> +		.wdev =3D wdev,
> +	};
> +
> +	return alienware_alienfx_setup(&pdata);
> +}
> +
> +static void legacy_wmi_remove(struct wmi_device *wdev)
> +{
> +	alienware_alienfx_exit(wdev);
> +}
> +
> +static struct wmi_device_id alienware_legacy_device_id_table[] =3D {
> +	{ LEGACY_CONTROL_GUID, NULL },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(wmi, alienware_legacy_device_id_table);
> +
> +static struct wmi_driver alienware_legacy_wmi_driver =3D {
> +	.driver =3D {
> +		.name =3D "alienware-wmi-alienfx",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D alienware_legacy_device_id_table,
> +	.probe =3D legacy_wmi_probe,
> +	.remove =3D legacy_wmi_remove,
> +};
> +
> +static int __init alienware_legacy_wmi_init(void)
> +{
> +	return wmi_driver_register(&alienware_legacy_wmi_driver);
> +}
> +
> +static void __exit alienware_legacy_wmi_exit(void)
> +{
> +	wmi_driver_unregister(&alienware_legacy_wmi_driver);
> +}
> +
> +/*
> + * WMAX WMI driver
> + */
> +static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> +{
> +	struct alienfx_platdata pdata =3D {
> +		.wdev =3D wdev,
> +	};
> +	struct platform_device *pdev;
> +	int ret;
> +
> +	if (quirks->thermal) {
> +		ret =3D create_thermal_profile(wdev);
> +	} else {
> +		ret =3D alienware_alienfx_setup(&pdata);
> +		if (ret < 0)
> +			return ret;
> +
> +		pdev =3D dev_get_drvdata(&wdev->dev);
> +		ret =3D device_add_groups(&pdev->dev, wmax_alienfx_groups);

If device_add_groups() fails you need to call alienware_alienfx_exit().

>   	}
>
> +	return ret;
> +}
> +
> +static void wmax_wmi_remove(struct wmi_device *wdev)
> +{
> +	if (quirks->thermal)
> +		remove_thermal_profile();
> +	else
> +		alienware_alienfx_exit(wdev);

Missing call to device_remove_groups().

> +}
> +
> +static struct wmi_device_id alienware_wmax_device_id_table[] =3D {
> +	{ WMAX_CONTROL_GUID, NULL },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(wmi, alienware_wmax_device_id_table);
> +
> +static struct wmi_driver alienware_wmax_wmi_driver =3D {
> +	.driver =3D {
> +		.name =3D "alienware-wmi-wmax",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.id_table =3D alienware_wmax_device_id_table,
> +	.probe =3D wmax_wmi_probe,
> +	.remove =3D wmax_wmi_remove,
> +};
> +
> +static int __init alienware_wmax_wmi_init(void)
> +{
> +	return wmi_driver_register(&alienware_wmax_wmi_driver);
> +}
> +
> +static void __exit alienware_wmax_wmi_exit(void)
> +{
> +	wmi_driver_unregister(&alienware_wmax_wmi_driver);
> +}
> +
> +static int __init alienware_wmi_init(void)
> +{
> +	int ret;
> +
>   	dmi_check_system(alienware_quirks);
>   	if (quirks =3D=3D NULL)
>   		quirks =3D &quirk_unknown;
> @@ -1206,43 +1336,28 @@ static int __init alienware_wmi_init(void)
>   			pr_warn("force_gmode requires platform profile support\n");
>   	}
>
> -	ret =3D platform_driver_register(&platform_driver);
> -	if (ret)
> -		goto fail_platform_driver;
> -	platform_device =3D platform_device_alloc("alienware-wmi", PLATFORM_DE=
VID_NONE);
> -	if (!platform_device) {
> -		ret =3D -ENOMEM;
> -		goto fail_platform_device1;
> +	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
> +		interface =3D WMAX;
> +		ret =3D alienware_wmax_wmi_init();
> +	} else {
> +		interface =3D LEGACY;
> +		ret =3D alienware_legacy_wmi_init();
>   	}
> -	ret =3D platform_device_add(platform_device);
> -	if (ret)
> -		goto fail_platform_device2;
>
> -	if (quirks->thermal) {
> -		ret =3D create_thermal_profile(platform_device);
> -		if (ret)
> -			goto fail_prep_thermal_profile;
> -	}
> +	if (ret < 0)
> +		return ret;
>
>   	return 0;

Please just return ret here.

Thanks,
Armin Wolf

> -
> -fail_prep_thermal_profile:
> -	platform_device_del(platform_device);
> -fail_platform_device2:
> -	platform_device_put(platform_device);
> -fail_platform_device1:
> -	platform_driver_unregister(&platform_driver);
> -fail_platform_driver:
> -	return ret;
>   }
>
>   module_init(alienware_wmi_init);
>
>   static void __exit alienware_wmi_exit(void)
>   {
> -	remove_thermal_profile();
> -	platform_device_unregister(platform_device);
> -	platform_driver_unregister(&platform_driver);
> +	if (interface =3D=3D WMAX)
> +		alienware_wmax_wmi_exit();
> +	else
> +		alienware_legacy_wmi_exit();
>   }
>
>   module_exit(alienware_wmi_exit);
