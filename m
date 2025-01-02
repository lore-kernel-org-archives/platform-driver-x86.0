Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A355079E1;
	Thu,  2 Jan 2025 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735834060; cv=none; b=DHyxY/w10WnVLED+o3IOXwbdtTppYPVahiIPvNCipTVUVqNGaHph8Jrbe23FMZ+wfxUyLQny00HxdafLiRWS2OwBCGtK6xTHiCQqtcEqCok6G1JoNEULDikUl/k2yxQOJ5y/EOQwlKAmU095G46Mw3KrFZjJP3CNhpaB8Mrndo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735834060; c=relaxed/simple;
	bh=4uwxRzbxPBCRrdOkIie1gbsiKyQYUVmG/Q0Og17PyQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIWY2pdd25UD/kDMLNonmpfQC6JvJD1ajnJkTJtbAEhWGx2B5Q0AZhDGVKSzkiSPCg1p6J2N2K1ueOHZzeVQ4BFiIrUMXO4OWxbRVDfMjQqg/Dz8j20iVIFNwtAeAJosl5WRJR6+zUzShyamTNrMMNZTy2pJytLEcDRUihSXni4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=FQqO36jp; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="FQqO36jp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735834041; x=1736438841; i=w_armin@gmx.de;
	bh=7Wjze9MbDnag0U4DWvgz63gMQQJyLplO8+Tn5YcKDdg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=FQqO36jpzuP5sPpaAInXgYC/5a2ODZS/8FNnnObyx+7QLJ5Uwcb77qVUr02J1QNI
	 vaj27OeNjhDIVK+zCbIh2eID7C25or/bjxcco1/JE0k4DpHoEEHJa4ynQnj/8FcQJ
	 sv6H2pt+LMpJIUTzz7D7s9ydzNSS9UV3VCiHrbWXY20RcBxWp0omPPlstKC/FkWbq
	 6xu4ip7cQ/C0f2B9dFUIpbM/SOrKgtN4rcsBxR3YaN5jLqKgIyU8bqnx7QITM9I0J
	 FJl8LpNYTf21OWQpa+XmHPrT0xzqtNNhxyJAk6RGgTPULKAXKLZIUfdwcC8eIE2cr
	 6Xrr1K4TnJ2h809wTw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wPh-1tQskd3rDv-006fG0; Thu, 02
 Jan 2025 17:07:21 +0100
Message-ID: <50b0b025-87ad-4093-b525-f95a22b8f124@gmx.de>
Date: Thu, 2 Jan 2025 17:07:16 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/20] alienware-wmi: Add a state container for LED
 control feature
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-9-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241229194506.8268-9-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HIv0PBt977rQ4xkyaVcww9DOI7UJpInce4Zq9fIN3eLbGbxjhBg
 kJlpuNmCNBiIkgx5t8MlBvRVJ3ODQ2TswUJlPUUhLdRUhXTjkgHASaVzIw2UNinKB9YAwGc
 VzxGMu7Il5ByuoUzSaDvYOYPp8sUGEJ6u9vozyk/h2Zh10HQu8X5MoXsetfylo0nJ6OgBzu
 SXs9RR1h08ol+dU9C3mTA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jVWGFnvnNuU=;XuKTIDO8rvABvJwt55+bFfPs5Ad
 FRueFVeKhShomDhyswzFhEAEOdyd0JOQMu1oVM2Rb+QEENTCdOYyFlwz2mZUtQrs/vdEdehpD
 o+eS3sES8HawzAu7PbH+UQhTfc4Dnoq8ehCqQkj5fHCyjkixzmIfV/N4T/CgaelqyF0PZ3fPc
 AushoL2VGgiDaJyYV1CtfHJd9CTWUd9Re9InQFujEz68Oj4fJu1LRfhxPipqqWNw7msm/lq5f
 Q3MsGXREM/CEEBMGraha5qHNGESb4TBJ5Xe4hBVO/mEvmbQISoNO+MAsqoEycZEFLjdqfJE1w
 UE97uUMgo88Pw+nIxWpUPhe0IlGCneJnMT1uv74+lX3phWz+M1D+wjzD9IwW5OGVWb9lmrKXN
 zj8WgwjnJxWPP6LFAFJ0CzXIkQYg+dcsGau0vxehmkRo4TtglOBF+Zs0IyjzihPVA0YQvYdrz
 VOy85FAb0yG6XPV7IE4yP18EvADLmNbPccVPFKIkHbLlOl2yvyE3eSL5r3OmInTDYa6JRXdrp
 MuaLKoccJIcjteJemzfuyp+jKlE4co/1Vi2vZSsmcYe9wKKABOo6LCkuZxjpxzzU+1mAj/bFt
 P2nXKLtI5SDDQO7N/hOEiKMcO8Oy2MIYyRlgGb895gY3TKmZn+y5+SGkbOVD+rFrsfxHUulcc
 r632EeGFyySIVty03VjYTn6vchlDBQGx9cPYdp7/zz0n+xzlWq22A3G+U2ch2qR4VVsAGPHPE
 xNbDrZ1QYX+pzDHwlfYSmCCevJXcmwoG6UZPrOL5Duuyim10SnUw1smTDIqjsSPylyAY0xJP+
 cQ3OeLeqhTmu3+8YS/hEVstxnPH+A3lk10ngFm+YFvrnDcb1yDdzia9qvqCnzThjK9pgwPUh5
 3XLJprC+oEzxn1/dcqvZoIuEVlex5OZwmO/kqieGDuf5AJXVCrYiI56f0syZNSTc/JA/4znYf
 dCE5b9v1GTuNJv9CQOhkHhtorgrc8IH1zGQ6IDUEszMwLa6kJ8R1rUwOW3VNr+hngYk1pONfz
 c+O0HFbuurrcZY4iu9/t/etyjG8Q6Ddq2gpcGnYRmhwy2ITfzum+/ITHCqT1Eah1dribKe7uK
 Fr87kTKoVDG51l/bpmmuU9uk3l1QLL

Am 29.12.24 um 20:44 schrieb Kurt Borja:

> Add a state container for the "alienware-wmi" platform device and
> initialize it on the new alienfx_probe(). Migrate all LED control functi=
ons
> to use this state container, as well as hdmi, amplifier, deepslp group
> visibility methods, to support upcoming file split.
>
> Additionally move the led_classdev registration to the platform driver
> probe and make it device managed.
>
> Drop alienware_zone_init() and alienware_zone_exit() because they are no
> longer needed.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 135 +++++++++++++---------
>   1 file changed, 79 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index 2c17160473a6..88d4046ed45f 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -404,14 +404,20 @@ struct wmax_u32_args {
>   	u8 arg3;
>   };
>
> +struct alienfx_priv {
> +	struct platform_device *pdev;
> +	struct quirk_entry *quirks;
> +	struct led_classdev global_led;
> +	struct color_platform colors[4];
> +	u8 global_brightness;
> +	u8 lighting_control_state;
> +};
> +
>   static struct platform_device *platform_device;
> -static struct color_platform colors[4];
>   static struct platform_profile_handler pp_handler;
>   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROF=
ILE_LAST];
>
>   static u8 interface;
> -static u8 lighting_control_state;
> -static u8 global_brightness;
>
>   /*
>    * Helpers used for zone control
> @@ -443,7 +449,7 @@ static int parse_rgb(const char *buf, struct color_p=
latform *colors)
>   /*
>    * Individual RGB zone control
>    */
> -static int alienware_update_led(u8 location)
> +static int alienware_update_led(struct alienfx_priv *priv, u8 location)
>   {
>   	int method_id;
>   	acpi_status status;
> @@ -453,21 +459,21 @@ static int alienware_update_led(u8 location)
>   	struct wmax_led_args wmax_basic_args;
>   	if (interface =3D=3D WMAX) {
>   		wmax_basic_args.led_mask =3D 1 << location;
> -		wmax_basic_args.colors =3D colors[location];
> -		wmax_basic_args.state =3D lighting_control_state;
> +		wmax_basic_args.colors =3D priv->colors[location];
> +		wmax_basic_args.state =3D priv->lighting_control_state;
>   		guid =3D WMAX_CONTROL_GUID;
>   		method_id =3D WMAX_METHOD_ZONE_CONTROL;
>
>   		input.length =3D sizeof(wmax_basic_args);
>   		input.pointer =3D &wmax_basic_args;
>   	} else {
> -		legacy_args.colors =3D colors[location];
> -		legacy_args.brightness =3D global_brightness;
> +		legacy_args.colors =3D priv->colors[location];
> +		legacy_args.brightness =3D priv->global_brightness;
>   		legacy_args.state =3D 0;
> -		if (lighting_control_state =3D=3D LEGACY_BOOTING ||
> -		    lighting_control_state =3D=3D LEGACY_SUSPEND) {
> +		if (priv->lighting_control_state =3D=3D LEGACY_BOOTING ||
> +		    priv->lighting_control_state =3D=3D LEGACY_SUSPEND) {
>   			guid =3D LEGACY_POWER_CONTROL_GUID;
> -			legacy_args.state =3D lighting_control_state;
> +			legacy_args.state =3D priv->lighting_control_state;
>   		} else
>   			guid =3D LEGACY_CONTROL_GUID;
>   		method_id =3D location + 1;
> @@ -486,22 +492,26 @@ static int alienware_update_led(u8 location)
>   static ssize_t zone_show(struct device *dev, struct device_attribute *=
attr,
>   			 char *buf, u8 location)
>   {
> +	struct alienfx_priv *priv =3D dev_get_drvdata(dev);
> +	struct color_platform *colors =3D &priv->colors[location];
> +
>   	return sprintf(buf, "red: %d, green: %d, blue: %d\n",
> -		       colors[location].red, colors[location].green,
> -		       colors[location].blue);
> +		       colors->red, colors->green, colors->blue);
>
>   }
>
>   static ssize_t zone_store(struct device *dev, struct device_attribute =
*attr,
>   			  const char *buf, size_t count, u8 location)
>   {
> +	struct alienfx_priv *priv =3D dev_get_drvdata(dev);
> +	struct color_platform *colors =3D &priv->colors[location];
>   	int ret;
>
> -	ret =3D parse_rgb(buf, &colors[location]);
> +	ret =3D parse_rgb(buf, colors);
>   	if (ret)
>   		return ret;
>
> -	ret =3D alienware_update_led(location);
> +	ret =3D alienware_update_led(priv, location);
>
>   	return ret ? ret : count;
>   }
> @@ -569,9 +579,11 @@ static ssize_t lighting_control_state_show(struct d=
evice *dev,
>   					   struct device_attribute *attr,
>   					   char *buf)
>   {
> -	if (lighting_control_state =3D=3D LEGACY_BOOTING)
> +	struct alienfx_priv *priv =3D dev_get_drvdata(dev);
> +
> +	if (priv->lighting_control_state =3D=3D LEGACY_BOOTING)
>   		return sysfs_emit(buf, "[booting] running suspend\n");
> -	else if (lighting_control_state =3D=3D LEGACY_SUSPEND)
> +	else if (priv->lighting_control_state =3D=3D LEGACY_SUSPEND)
>   		return sysfs_emit(buf, "booting running [suspend]\n");
>
>   	return sysfs_emit(buf, "booting [running] suspend\n");
> @@ -581,6 +593,7 @@ static ssize_t lighting_control_state_store(struct d=
evice *dev,
>   					    struct device_attribute *attr,
>   					    const char *buf, size_t count)
>   {
> +	struct alienfx_priv *priv =3D dev_get_drvdata(dev);
>   	u8 val;
>
>   	if (strcmp(buf, "booting\n") =3D=3D 0)
> @@ -592,9 +605,9 @@ static ssize_t lighting_control_state_store(struct d=
evice *dev,
>   	else
>   		val =3D WMAX_RUNNING;
>
> -	lighting_control_state =3D val;
> +	priv->lighting_control_state =3D val;
>   	pr_debug("alienware-wmi: updated control state to %d\n",
> -		 lighting_control_state);
> +		 priv->lighting_control_state);
>
>   	return count;
>   }
> @@ -651,43 +664,26 @@ static int wmax_brightness(int brightness)
>   static void global_led_set(struct led_classdev *led_cdev,
>   			   enum led_brightness brightness)
>   {
> +	struct alienfx_priv *priv =3D container_of(led_cdev, struct alienfx_pr=
iv,
> +						 global_led);
>   	int ret;
> -	global_brightness =3D brightness;
> +
> +	priv->global_brightness =3D brightness;
> +
>   	if (interface =3D=3D WMAX)
>   		ret =3D wmax_brightness(brightness);
>   	else
> -		ret =3D alienware_update_led(0);
> +		ret =3D alienware_update_led(priv, 0);
>   	if (ret)
>   		pr_err("LED brightness update failed\n");
>   }
>
>   static enum led_brightness global_led_get(struct led_classdev *led_cde=
v)
>   {
> -	return global_brightness;
> -}
> -
> -static struct led_classdev global_led =3D {
> -	.brightness_set =3D global_led_set,
> -	.brightness_get =3D global_led_get,
> -	.name =3D "alienware::global_brightness",
> -};
> +	struct alienfx_priv *priv =3D container_of(led_cdev, struct alienfx_pr=
iv,
> +						 global_led);
>
> -static int alienware_zone_init(struct platform_device *dev)
> -{
> -	if (interface =3D=3D WMAX) {
> -		lighting_control_state =3D WMAX_RUNNING;
> -	} else if (interface =3D=3D LEGACY) {
> -		lighting_control_state =3D LEGACY_RUNNING;
> -	}
> -	global_led.max_brightness =3D 0x0F;
> -	global_brightness =3D global_led.max_brightness;
> -
> -	return led_classdev_register(&dev->dev, &global_led);
> -}
> -
> -static void alienware_zone_exit(struct platform_device *dev)
> -{
> -	led_classdev_unregister(&global_led);
> +	return priv->global_brightness;
>   }
>
>   static acpi_status alienware_wmax_command(void *in_args, size_t in_siz=
e,
> @@ -792,7 +788,9 @@ static DEVICE_ATTR_RW(source);
>
>   static bool hdmi_group_visible(struct kobject *kobj)
>   {
> -	return quirks->hdmi_mux;
> +	struct alienfx_priv *priv =3D dev_get_drvdata(kobj_to_dev(kobj));
> +
> +	return priv->quirks->hdmi_mux;
>   }
>   DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
>
> @@ -838,7 +836,9 @@ static DEVICE_ATTR_RO(status);
>
>   static bool amplifier_group_visible(struct kobject *kobj)
>   {
> -	return quirks->amplifier;
> +	struct alienfx_priv *priv =3D dev_get_drvdata(kobj_to_dev(kobj));
> +
> +	return priv->quirks->amplifier;
>   }
>   DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
>
> @@ -906,7 +906,9 @@ static DEVICE_ATTR_RW(deepsleep);
>
>   static bool deepsleep_group_visible(struct kobject *kobj)
>   {
> -	return quirks->deepslp;
> +	struct alienfx_priv *priv =3D dev_get_drvdata(kobj_to_dev(kobj));
> +
> +	return priv->quirks->deepslp;
>   }
>   DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
>
> @@ -1133,6 +1135,33 @@ static void remove_thermal_profile(void)
>   /*
>    * Platform Driver
>    */
> +static int alienfx_probe(struct platform_device *pdev)
> +{
> +	struct alienfx_priv *priv;
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->pdev =3D pdev;
> +	priv->quirks =3D quirks;
> +
> +	if (interface =3D=3D WMAX)
> +		priv->lighting_control_state =3D WMAX_RUNNING;
> +	else if (interface =3D=3D LEGACY)
> +		priv->lighting_control_state =3D LEGACY_RUNNING;
> +
> +	priv->global_led.name =3D "alienware::global_brightness";
> +	priv->global_led.brightness_set =3D global_led_set;
> +	priv->global_led.brightness_get =3D global_led_get;
> +	priv->global_led.max_brightness =3D 0x0F;
> +
> +	priv->global_brightness =3D priv->global_led.max_brightness;
> +
> +	return devm_led_classdev_register(&pdev->dev, &priv->global_led);
> +}
> +
>   static const struct attribute_group *alienfx_groups[] =3D {
>   	&zone_attribute_group,
>   	&hdmi_attribute_group,
> @@ -1145,7 +1174,9 @@ static struct platform_driver platform_driver =3D =
{
>   	.driver =3D {
>   		.name =3D "alienware-wmi",
>   		.dev_groups =3D alienfx_groups,
> +		.probe_type =3D PROBE_FORCE_SYNCHRONOUS,

Can you please explain to me why this is exactly necessary?

Thanks,
Armin Wolf

>   	},
> +	.probe =3D alienfx_probe,
>   };
>
>   static int __init alienware_wmi_init(void)
> @@ -1193,15 +1224,8 @@ static int __init alienware_wmi_init(void)
>   			goto fail_prep_thermal_profile;
>   	}
>
> -	ret =3D alienware_zone_init(platform_device);
> -	if (ret)
> -		goto fail_prep_zones;
> -
>   	return 0;
>
> -fail_prep_zones:
> -	alienware_zone_exit(platform_device);
> -	remove_thermal_profile();
>   fail_prep_thermal_profile:
>   	platform_device_del(platform_device);
>   fail_platform_device2:
> @@ -1216,7 +1240,6 @@ module_init(alienware_wmi_init);
>
>   static void __exit alienware_wmi_exit(void)
>   {
> -	alienware_zone_exit(platform_device);
>   	remove_thermal_profile();
>   	platform_device_unregister(platform_device);
>   	platform_driver_unregister(&platform_driver);
