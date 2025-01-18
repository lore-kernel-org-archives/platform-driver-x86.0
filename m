Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EED0136327;
	Sat, 18 Jan 2025 23:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737244087; cv=none; b=iTqwtCwQ9xYothtvyP06yO98ROZvLn8rI5b7aneA1H1diBpx3kNaSGUDvxAhh++x0FRmyDAe9IVcyn6hp4kfnekbGYU4BCIAX3irJQ1l0qWHEXJJKUbMs9UkTGPFQoSNnW1uBJkMRcsKh3ioxFQTOHyzB78WWCCqVs+/bfrfv30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737244087; c=relaxed/simple;
	bh=einaGHl/QKda/aA4iXyS8K9+2ZHCwJW1qfEyeqbF7l4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WMNcS1RIqW5TAPYyv7JdwgqTrUJ/MXM5PTe5tkuD3f9Oosx1IMvJBpdycDcXu8FoeUmskAmc6PpTVNaAllM3cbRHDfVbsgNPuDc+Iezw4Vipg1Uhwvbpr5XefMCdpiZO3gycWr3bcRdYl+HzLt5uDaSannxRLWh2ihQ8t/2tMm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ZgyLbHSo; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ZgyLbHSo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737244082; x=1737848882; i=w_armin@gmx.de;
	bh=I17QI+B7nvCUJWcpJXr2yemOkMczO1YWii6BnV65h4k=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZgyLbHSoMg9KwJ5hQky2hIxE+fF4cuA4QiREPJ5jkYwu9Ukrb+BdGNzsjR6bTYNJ
	 Vk5dofw3vJs/OmoAeNPG2fp3vkrRJWOIC2RUNNBdlK/gm44OxXM1ZBnVfBe7IvPX+
	 M2sLT7GuSqwAzHP04LzjRIdGiK5yIQvK+1kP1xTy1g+sXb3/aBsPnH9j9molSUbGY
	 F+m0eT3qsj1xhO7HNWYw2C8ozKwyg13TbInXUsoiGo14H33d5++M4MEAZH91ofbTb
	 qlbwRe8DlgziZ11rFDS4Ie1WPBeM2WjHhBMRGuc+rMoBncpe0UUihtI7isPfDmOJY
	 o8p5sxV78h6rw9SvfA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.251.118]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9o21-1tcqmN1R2r-00AQtl; Sun, 19
 Jan 2025 00:48:02 +0100
Message-ID: <7b54e564-b7ac-4945-959e-02ebf4867443@gmx.de>
Date: Sun, 19 Jan 2025 00:48:00 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/14] platform/x86: alienware-wmi: Add WMI Drivers
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250117081347.8573-1-kuurtb@gmail.com>
 <20250117081347.8573-3-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250117081347.8573-3-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XYh8o1OSmJZb0cHeuUkHjM3ey/JtkB/dFIds2l6ZsXbIqv668Xz
 +Lz+ZuhZ7wc9EWwvfFLdkdEQw3jLCy9WltPtMowyh0jg45h3yeeoATIjFGlG8ZD/xA4Fwli
 SoJuw+olWSnEsS5Icfx/0hbAqjwCSg+heM/g/63JPRZatzcEw+hG3vaUs2PjKHSLQPKmrpN
 Z+GFoKitvaaxZ92i6m60A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:MZxN2graAdQ=;EaXollw6Jq4i4mtH7GbeBxbr6Ow
 8ifgyN4Bd+ALSeOAXHEvTBQ1T3ZivsyWCS56E6aOmZUCQYHTEKywbI2uJCe+s7ov9thTiH7RO
 b8JfGO05mZ/SM7Cz3i24+dJanaPCZIg4u+Kh2tbZOi8weZ/jBSd+zV6sFNGOQ3/kUpKqnL+8P
 UpWfuBCESmvBs8J/Z3nj/j5h8F8t6XnFDX71Ju308CtxX020qA8QXzEJDoidA0XXQwP1TscZE
 SxAt4t3LFb0gWdSK6i+FJuPzKGBPczlBHWgXpE+KAvpQhFD6CRR/C3lZNvtFxRgpfs0jz4zZf
 xpLsiVxNDaOwVUIqTZG0tIFmrrp4/FcBHGEwDD+as3N1o2qdLCGwFNTtQfTetHpD07VCuf8eQ
 wlRYIggjaX3ll47xXCpN23q6zE/XNzVjOTYRi3ELsg0X/i0qgnNB+RE4wvikMDjpSYd+baxTc
 uJezSbQm2TTUkKGOIuWGSAwiugAgNwU3yaDgW7IsPyNxM3MOhpwx5tMm1grlhfSCe/sUJt3ea
 KltrJYl/JXOcTJqdc+Sc/g6Uu/lZrSczOzy4nAfmVG2ygNnm63QMUBD5QJMR7nZH/0jeatdy7
 L7ll4ftQFx8kat/sbXJ3nMZVPe12HJjzVi+fOY9tVNWNOIdpTIUwzrchXNy7VbcGdc3PyvdWy
 X4T475ESZ2xKvBBKtNIIl2kn+lMwrzlf/jpmTyTxvfmHdNZKx1QaGZZtm7wkpOGPMBzY/BJUr
 gWaIYBaIMbIkik9TLapys8SrVCAv9PXdwVyYH1geJU9APN0dNPXMpLenD89Gi6QDx//95zTOK
 4f4oTXuHP9ELVopFqG7TmTSMVz0tMceASbBbm1r6UwbXmyX/2sDr6D2qs6joA8nMPoncclbcG
 3pZFHC75hr6/P+9zJAbGnvty8VJx174XmoYnI7lSBpLnUAiMoxdcnoRkuf4FK/tHtgwpQZjoo
 fuKS49WLLNlyfiol2I2vS0cCtxv0CUtXXzBvSd2zSouJ/hU5v9U9N7LwC98jnB4T6WU3ZR/ur
 kcKu1w8cRShWnyfOoqU529KcUfKe1nUXkKFt/lbT+k0uVFcFHForc/QSDfYbGui69I50xRAci
 zZeWJ5lD894wO0gZaX5wX0vomuVsL1PO/r5E1HC00pLFWDEzT4HGn42A+x0+z12LlVvJsRkUC
 ezYA6Ra8p/RZtj7e2iUAAIXiJg5bWqrJFHoGKr8RLDQ==

Am 17.01.25 um 09:13 schrieb Kurt Borja:

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
>   drivers/platform/x86/dell/alienware-wmi.c | 200 +++++++++++++++++-----
>   1 file changed, 160 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index 5779b025761b..e1a5a867f144 100644
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
> @@ -412,7 +411,10 @@ struct alienfx_priv {
>   	u8 lighting_control_state;
>   };
>
> -static struct platform_device *platform_device;
> +struct alienfx_platdata {
> +	struct wmi_device *wdev;
> +};
> +
>   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROF=
ILE_LAST];
>
>   static u8 interface;
> @@ -1127,11 +1129,11 @@ static const struct platform_profile_ops awcc_pl=
atform_profile_ops =3D {
>   	.profile_set =3D thermal_profile_set,
>   };
>
> -static int create_thermal_profile(struct platform_device *platform_devi=
ce)
> +static int create_thermal_profile(struct wmi_device *wdev)
>   {
>   	struct device *ppdev;
>
> -	ppdev =3D devm_platform_profile_register(&platform_device->dev, "alien=
ware-wmi",
> +	ppdev =3D devm_platform_profile_register(&wdev->dev, "alienware-wmi",
>   					       NULL, &awcc_platform_profile_ops);
>
>   	return PTR_ERR_OR_ZERO(ppdev);
> @@ -1166,6 +1168,10 @@ static int alienfx_probe(struct platform_device *=
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
> @@ -1180,19 +1186,150 @@ static struct platform_driver platform_driver =
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

Can you register this platform driver during module initialization? Otherw=
ise we might encounter
a kernel crash should a WMI driver probe multiple devices and thus calling=
 this method more than once.

Please note however that platform_device_register_data() can be called mul=
tiple times (it simply returns
an error should the "alienware-wmi" device already exist).

> +
> +	pdev =3D platform_device_register_data(NULL, "alienware-wmi",
> +					     PLATFORM_DEVID_NONE, pdata,
> +					     sizeof(*pdata));
> +
> +	if (IS_ERR(pdev)) {
> +		platform_driver_unregister(&platform_driver);
> +		return PTR_ERR(pdev);
>   	}
>
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

Please make this device id table const.

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
> +		return create_thermal_profile(wdev);
> +	} else {
> +		ret =3D alienware_alienfx_setup(&pdata);
> +		if (ret < 0)
> +			return ret;
> +
> +		pdev =3D dev_get_drvdata(&wdev->dev);
> +
> +		ret =3D device_add_groups(&pdev->dev, wmax_alienfx_groups);
> +		if (ret < 0)
> +			alienware_alienfx_exit(wdev);
> +
> +		return ret;
> +	}
> +}
> +
> +static void wmax_wmi_remove(struct wmi_device *wdev)
> +{
> +	struct platform_device *pdev;
> +
> +	if (!quirks->thermal) {
> +		pdev =3D dev_get_drvdata(&wdev->dev);
> +
> +		device_remove_groups(&pdev->dev, wmax_alienfx_groups);
> +		alienware_alienfx_exit(wdev);
> +	}
> +}
> +
> +static struct wmi_device_id alienware_wmax_device_id_table[] =3D {

Please make this device id table const.

Other than that the code looks promising.

Thanks,
Armin Wolf

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
> @@ -1207,33 +1344,14 @@ static int __init alienware_wmi_init(void)
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
> -	}
> -	ret =3D platform_device_add(platform_device);
> -	if (ret)
> -		goto fail_platform_device2;
> -
> -	if (quirks->thermal) {
> -		ret =3D create_thermal_profile(platform_device);
> -		if (ret)
> -			goto fail_prep_thermal_profile;
> +	if (wmi_has_guid(WMAX_CONTROL_GUID)) {
> +		interface =3D WMAX;
> +		ret =3D alienware_wmax_wmi_init();
> +	} else {
> +		interface =3D LEGACY;
> +		ret =3D alienware_legacy_wmi_init();
>   	}
>
> -	return 0;
> -
> -fail_prep_thermal_profile:
> -	platform_device_del(platform_device);
> -fail_platform_device2:
> -	platform_device_put(platform_device);
> -fail_platform_device1:
> -	platform_driver_unregister(&platform_driver);
> -fail_platform_driver:
>   	return ret;
>   }
>
> @@ -1241,8 +1359,10 @@ module_init(alienware_wmi_init);
>
>   static void __exit alienware_wmi_exit(void)
>   {
> -	platform_device_unregister(platform_device);
> -	platform_driver_unregister(&platform_driver);
> +	if (interface =3D=3D WMAX)
> +		alienware_wmax_wmi_exit();
> +	else
> +		alienware_legacy_wmi_exit();
>   }
>
>   module_exit(alienware_wmi_exit);
