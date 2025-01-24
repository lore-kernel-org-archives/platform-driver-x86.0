Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1140A1D54D8;
	Fri, 24 Jan 2025 21:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737753481; cv=none; b=LMeNOJTuXFDoNoUu9b1JskRHgqX+2hJIzjxu3ZD/b26ROzRHf0MWiWRQw9p81/Q34k0NVJuS3UQFOgVo6oIA/ifoKGQdAFh0ksJVCukA0NXMx72v6kG6K0O36kvz2daEu/QJ4uR0Ruiw1rCQfgR8rNJMMhVCFGTkh8SpfDMnwRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737753481; c=relaxed/simple;
	bh=Ze0p5frSQao19D67/gVXKYuW07ghACIeSt6lO4Ic3v0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjF4QxtnB4SGr2Vd00T1WcQnOuNGTMqMeoUfVlERDjNPi2gXl1zaOIWi5GfsgTA7Ept7OChXe5lTSnRqj5T4pV87QAZJ2uA5592S7wqdyXH3Hh0rcjjDS7V2ezcYDDPaIyPRo7AQxb8pf3oHYf3ZagpTOP+yM9CExL22Ecb5Z6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Bs5SlB5Y; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Bs5SlB5Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737753471; x=1738358271; i=w_armin@gmx.de;
	bh=JlMgk2jk5xZFMSS8+QhddreKHDZ0OCkwsxPDzWBIv8w=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Bs5SlB5Ydz5XWTozL8qzhImnuHv91iKPN0cR77EIrpcRBD2Wcv++cuQXceN8DVsO
	 mBvYgDcnaFohh95xmX4prbDmEzVi5b2O8JvjmZiB2Njm4sbISJeNuj3d/cSGfRTM4
	 q/nmlKPpjspzPC6RXZ2fZN9INY3hNq3wZl4DiyROnbb/9jRYZvkoRKC90Gjvk8+f4
	 u2ACJ74lfVp8zZrX+koGQYBTxc5nm91UFz36gV+agpQB4QvvEN00k0eiYVEKo9rWe
	 gZ3wysMhy0haSUosgnZljMMBnd4mDSjNjDd+uCyA3/UqyVKAHrE6clyNL27e2C8iZ
	 aejoqDAfn/pfrfK4/A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.246.83]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MtOKi-1tLhgn2D2k-017Msz; Fri, 24
 Jan 2025 22:17:51 +0100
Message-ID: <c48f0e80-3b38-4fdd-9ec4-d585c7c7c16e@gmx.de>
Date: Fri, 24 Jan 2025 22:17:49 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/14] platform/x86: alienware-wmi: Add WMI Drivers
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250119220542.3136-1-kuurtb@gmail.com>
 <20250119220542.3136-3-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250119220542.3136-3-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+0wDkxodQCRPQdBbFM6457oiSy/m2j0dB+KOIFQgvOXLG/JVGAX
 ZzdM0E8IwncbxN39e8U6bjC1EMtVmeRRFiRh/qvGHiQyG3CQk6oEDkEs/cyOzJ/WjyWYfVZ
 LAqOyW2QD+EAGG0egNkmJLde1E6dnUsgcFrQsmhTt8qIRkbHrf1wkgMi81v5qWQOngv3wcz
 wkQDfo/vnOBNraoK9TLpg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Tb2k6p3QzHA=;ZhCvF0KaigC4J8/qfIipdFat5pl
 a7sAORVd58j2CpfMLCfTQJSD5EirPmoPKjjQt0nv6RSvVGU9kLoCbO9243rgtgCosuCBi6Ex5
 neQ+z+4j1cMlhk+LOt5AyGH6KNosqatHW+YsD5Bqfobmh+cYVo3ZEKNDi09T2xVKTeXD9RdR4
 SrBu95NiaRNi2fOol+5pdmfcAME6n5kskZK/To5dqUiFmPpbTqZXF9Lg5YEQtCOdHE9hCnXep
 OpqyOFHAlXwpPbNqKv3+TLKyhGdlyKjIZjO2TRQE81qxbpGi2+I8RDxK3VA6ht0r4pCwZmaMs
 r8fPBILhNDLC/2eDdAOIyCYcc+T9HsMDO3DyvSwWnPtqY7vAs2geQoUmh4X6Xvr9vFC+QCmuu
 5ozly8bvVp/XYwnrQ7s3Rmq4c8n3bYD3CLAlCHj6Ipoet0QYLVy42qKXMXgCv0nZJTpGOwo6J
 geMZIWBnxLoGugQa1wxgUOHHUZGGtWivYu6zUkySZzv1iclu7YQg/CYXKceOrcBxcTUEW/MAJ
 hbdk2LxFgmRihC1vNCiK1FG5GJiulXGzMLUUVjmVBKYlwMHVIxjd8tcHDLqXQaVCz4PRSyTKD
 DenitwgYA4yqsRkD4a/VeAEymNoOW9wsd4sWye1pgzlvMpXgCIZE8tyIDryRj0hU7KcSh6ppN
 iJVqPrqycfT14pFMUTpDwFqFQ/mRNIw372HUout2FHfXD/3xzPmYXGV6AngS//1gw8P8qy7uj
 qAP6BzSTAqNQR1AB6ixOScm92JfmNmAPKT/Mor33fog4CRY/SpKYdiuZspPx2m0eUO6EWEUgM
 XQU17kjrRTCIKrTPPgTAGjiePoLZ/iUStLVMZ8lSOeSMup6oa9Jpv7+TLPSKNvbJx7bb5ABej
 2xxT8lp4e7FnNxwsA8wzEfCWpGYTMHkD/Zz8vPy9SyBLM1cqu9fssGq6mcVfL4U0S9hR4mERR
 p7x3Ypi0WOfn6r/+pbPRlJBW994qJbQguTJ+waJ24IKRtPCXX+qy1FzEmC5RaCWrS6DP+JWLY
 soNvbpNz9ydD8bzAbqv3m1xILMGAS+ZQ0L2FH345Ft7niJslV2jEP4KJKomB2QPw6wsxun688
 SnB4qKFCxsWMU1FYpkTqbOMJhgLQdL+i1D6UM8romTh8ZIYo2lP2lGGZqomDTaDfabhUPiQx0
 jY2huJHcvVfX2Wlw6qlNMVvvDqpQDc82tI4AloSDqSuq8sxqall69AUZ/DqfG0/L9SkimX1K3
 MyDfCY4HBlhTmpjpkJHh2E36g2EOOd7/LNmdxhVzrlzZV+iMwMnV9wXxSSww0/x6bHoMJ/MB1
 cKJwiPxPWa2W4V2yxVNSnbolHWzEfu86Tey6fQU4uG+pCQ=

Am 19.01.25 um 23:05 schrieb Kurt Borja:

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

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 192 ++++++++++++++++++----
>   1 file changed, 156 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index 5779b025761b..5935bf74b66d 100644
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
> @@ -1180,18 +1186,140 @@ static struct platform_driver platform_driver =
=3D {
>   	.probe =3D alienfx_probe,
>   };
>
> -static int __init alienware_wmi_init(void)
> +static int alienware_alienfx_setup(struct alienfx_platdata *pdata)
> +{
> +	struct platform_device *pdev;
> +
> +	pdev =3D platform_device_register_data(NULL, "alienware-wmi",
> +					     PLATFORM_DEVID_NONE, pdata,
> +					     sizeof(*pdata));
> +
> +	dev_set_drvdata(&pdata->wdev->dev, pdev);
> +
> +	return PTR_ERR_OR_ZERO(pdev);
> +}
> +
> +static void alienware_alienfx_exit(struct wmi_device *wdev)
> +{
> +	struct platform_device *pdev =3D dev_get_drvdata(&wdev->dev);
> +
> +	platform_device_unregister(pdev);
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
>   {
> +	alienware_alienfx_exit(wdev);
> +}
> +
> +static const struct wmi_device_id alienware_legacy_device_id_table[] =
=3D {
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
> +	.no_singleton =3D true,
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
>   	int ret;
>
> -	if (wmi_has_guid(LEGACY_CONTROL_GUID))
> -		interface =3D LEGACY;
> -	else if (wmi_has_guid(WMAX_CONTROL_GUID))
> -		interface =3D WMAX;
> -	else {
> -		pr_warn("alienware-wmi: No known WMI GUID found\n");
> -		return -ENODEV;
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
>   	}
> +}
> +
> +static const struct wmi_device_id alienware_wmax_device_id_table[] =3D =
{
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
> +	.no_singleton =3D true,
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
>
>   	dmi_check_system(alienware_quirks);
>   	if (quirks =3D=3D NULL)
> @@ -1208,32 +1336,20 @@ static int __init alienware_wmi_init(void)
>   	}
>
>   	ret =3D platform_driver_register(&platform_driver);
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
> +	if (ret < 0)
> +		return ret;
>
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
> +	if (ret < 0)
> +		platform_driver_unregister(&platform_driver);
>
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
> @@ -1241,7 +1357,11 @@ module_init(alienware_wmi_init);
>
>   static void __exit alienware_wmi_exit(void)
>   {
> -	platform_device_unregister(platform_device);
> +	if (interface =3D=3D WMAX)
> +		alienware_wmax_wmi_exit();
> +	else
> +		alienware_legacy_wmi_exit();
> +
>   	platform_driver_unregister(&platform_driver);
>   }
>
