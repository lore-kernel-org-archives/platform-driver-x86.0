Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E111623C9;
	Sat, 18 Jan 2025 23:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737243260; cv=none; b=F3tIr0A2iP+UG3+FAZYXpBY/wISs6G0u2v/9nYWWwlFQisbhlWXdkWbwSJ/KwH0Z5HQN0F4kru1ZCzsKh/0NF3rYEbTBTUM/ekeLAzjW+IM9QUx1P0jRy5ecmwTYZhX5RNZj42hJyUegKxmjpyh9RZ2m9DKb0e+HF02zNibRu70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737243260; c=relaxed/simple;
	bh=EsZOcTXiIltjudyyWTTclH/AVhUO7jZkkYwK164i7Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hvt1l6E9qN2qLsd5ig3yG7tuWqvjXKVhY7xpELX829STHxOsSP7KcpT5XfHZK/s6wJ+xk3pG4cpWjkA7BQGBJN3d1aHp/pjx6RUu52+PlEM1It9KoasFpWgmoV/ZxbvuMD8RGXiF/P7vJMqM6LEpj4dywsl7KGKlIPG/wSS0bkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=YqiH88oW; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="YqiH88oW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737243244; x=1737848044; i=w_armin@gmx.de;
	bh=vJevKQU1/C2kSgo9d0Gh92SMzf4DXHbroAORmmyvueM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YqiH88oW+KZJBp/CIWFXiylZx5p2ZlbnviSjhBezX97gts4ZBRRicRnpqttI/cL7
	 eZz7wJuj3xRLqWqqQObcQ+8g9arnBxJbuhWMmsAgXaQJ+VkpTblbzgpauWH4EE3MK
	 WUzsIoLwAGIGxIyEq2lC69YKAQijle1C7Ol6XR2AmD4iAUmW/B1POgUxrKnIaZCJB
	 BUvo2aOQ9MJmn25nscoe35gr0ks5wpNMbSRQShQ9hvE2LCFfdvMMCX/pf4Q3DujQT
	 wKDIpkUt/5jzGgUK5WBJgeiD5B982scZHVO50lAQ57HrjGiaxI/ZprOoKL4GrsSEx
	 hBw0m1MUitl23PfFQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.251.118]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MvK0X-1tIB7F233B-00sASS; Sun, 19
 Jan 2025 00:34:04 +0100
Message-ID: <e9efe9ea-10d2-4bdc-99b7-c9379aaeb8ec@gmx.de>
Date: Sun, 19 Jan 2025 00:34:02 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/14] platform/x86: alienware-wmi: Add a state
 container for LED control feature
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250117081347.8573-1-kuurtb@gmail.com>
 <20250117081347.8573-2-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250117081347.8573-2-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HXZnyhKnjbglXOVTeffougAZLBEbE3cyfpQcF3o692zl3rTC3py
 7uSR2cVaQgIudRdlkCkw5FeGz+Whfif2sjlm5BYXYgji3OfahPdmoHacY9SvSM8zp+mcRq3
 sua010dLssdc9vEmNtwFCrF/zk1BKdVl+ZwruZMcywn1rlqjwYitQARs3IsZDyjrcxly+cP
 w1iPJ14+hVkVbo4Gwldhw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+bhQDYlQtLM=;oys0c6ss3434GrkEPVK/Wd0i5Za
 0Z7vCkGBTCDcBRvdEGaKyPCEWsul+pZc5CgK99EYz4zLTyOGi4e52qoLKlIRU+vPaJjym4tg5
 zpYAI15rlmvRjxsC5W2K9dl4AydypULLP1an6sj7foNawiKw2qm0RSEP5II5jUNvxIRpMgA3O
 r2gpmtjQ+l+ktfZ3uMejJr2E6vGc5zySCLV4txv8oUjQYTRhjyN7j2/VM3ztPjSpPjzYGfroP
 vWEOY6g8gCc9qYfijHXvjT8f72/kHm9TJDHhqcfhdIOhL8Ygo0DVXnzZPeV3NnJwhzAPuKS2f
 qCiBKBaRza5ywA/G0JzvbrO64dfAkLVv1EnhhchDeJSNOhPj4dROIyk89IXJv2ks2jtHNr2D2
 DJ7I98GZS2aFeq1ekx64W/lq/AKziumQfZhzYm4n+sMGrVrC7Q4sC9Oev1lTZUQwKq80joGhz
 W3feTCzNCmKnBlqzsKXjhmU02bPpsdW5njNoULWeNf1KAs6RerGb0y5SN4A+0zHFk6nzt9xXA
 VvVO8+bVfEFilCVASuMpMy7K0tb69U1dmkclXI2fOkDLlPLLfVo+coOH0LBLIZ8LwDXK6YEn0
 OYy711Fi+edzzDHHpXhW8TXJwUt46xZGVJmmbeq8kxTj6tG97Y9lc8fmezoBWN6BHsJnoRlHh
 +SqcFRFQK0LcXNM7XCAOsM+oyLHMrJPH0ved8Ffxx1ewY1bDikelWHiBldTNWrg9bQCRNy3wW
 t/Axx+3ZwRdlJL0fwgbCOVnIcdpVItNOfd9TI35CScHvqCd2Hf8iqDBt4MzVn8Ra28iZ97REt
 3F09co1efI+R2QZ6WxvuLH5GNiimY0Tr+qf5c4ezSG9NZkrhKSn9WPgQIOUwGzWgPCmaiFWKO
 49HrV3o/k9aQVWwFRR76IKo4FkQdVsIj+F0/m57HW1QT5Xkib7kI+JgsekM7pkDWvZqJdDR8Z
 59jAYSxjTF7e3kvfwXr//CK0qpzfkyG3yG8fXytPZ9idP6zxRZnkGl65G8kF/qOvoVsKf3ELi
 IIssta3cryCwE3/dW5eM2WFJj8uo5soS99zDniyoW31lmzT9S0qiahvKhedtv3qVN1eQZRCO5
 76wFqV0AuNqTyLGlsuHvWladcm92+AkR2tdlpO1/LlcnO9iv8LRTkh7NYIuFjbxa+dfOjPa4m
 cFjzLyGABA/JXUnDZ1WdTKDFPiFQfW7xI2pOUYmHJqw==

Am 17.01.25 um 09:13 schrieb Kurt Borja:

> Add a state container for the "alienware-wmi" platform device and
> initialize it on the new alienfx_probe(). Migrate all LED control functi=
ons
> to use this state container, as well as hdmi, amplifier, deepslp group
> visibility methods, to support upcoming file split.

Where does this patch touch the visibility methods of the attribute groups=
?

>
> Additionally move the led_classdev registration to the platform driver
> probe and make it device managed.
>
> Drop alienware_zone_init() and alienware_zone_exit() because they are no
> longer needed.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 117 ++++++++++++----------
>   1 file changed, 65 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index 63cf016bc912..5779b025761b 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -404,13 +404,18 @@ struct wmax_u32_args {
>   	u8 arg3;
>   };
>
> +struct alienfx_priv {
> +	struct platform_device *pdev;
> +	struct led_classdev global_led;
> +	struct color_platform colors[4];
> +	u8 global_brightness;
> +	u8 lighting_control_state;
> +};
> +
>   static struct platform_device *platform_device;
> -static struct color_platform colors[4];
>   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROF=
ILE_LAST];
>
>   static u8 interface;
> -static u8 lighting_control_state;
> -static u8 global_brightness;
>
>   /*
>    * Helpers used for zone control
> @@ -442,7 +447,7 @@ static int parse_rgb(const char *buf, struct color_p=
latform *colors)
>   /*
>    * Individual RGB zone control
>    */
> -static int alienware_update_led(u8 location)
> +static int alienware_update_led(struct alienfx_priv *priv, u8 location)
>   {
>   	int method_id;
>   	acpi_status status;
> @@ -452,21 +457,21 @@ static int alienware_update_led(u8 location)
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
> @@ -485,22 +490,26 @@ static int alienware_update_led(u8 location)
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
> @@ -568,9 +577,11 @@ static ssize_t lighting_control_state_show(struct d=
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
> @@ -580,6 +591,7 @@ static ssize_t lighting_control_state_store(struct d=
evice *dev,
>   					    struct device_attribute *attr,
>   					    const char *buf, size_t count)
>   {
> +	struct alienfx_priv *priv =3D dev_get_drvdata(dev);
>   	u8 val;
>
>   	if (strcmp(buf, "booting\n") =3D=3D 0)
> @@ -591,9 +603,9 @@ static ssize_t lighting_control_state_store(struct d=
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
> @@ -653,43 +665,26 @@ static int wmax_brightness(int brightness)
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
> -
> -static int alienware_zone_init(struct platform_device *dev)
> -{
> -	if (interface =3D=3D WMAX) {
> -		lighting_control_state =3D WMAX_RUNNING;
> -	} else if (interface =3D=3D LEGACY) {
> -		lighting_control_state =3D LEGACY_RUNNING;
> -	}
> -	global_led.max_brightness =3D 0x0F;
> -	global_brightness =3D global_led.max_brightness;
> +	struct alienfx_priv *priv =3D container_of(led_cdev, struct alienfx_pr=
iv,
> +						 global_led);
>
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
> @@ -1145,6 +1140,30 @@ static int create_thermal_profile(struct platform=
_device *platform_device)
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
> +	if (interface =3D=3D WMAX)
> +		priv->lighting_control_state =3D WMAX_RUNNING;
> +	else
> +		priv->lighting_control_state =3D LEGACY_RUNNING;
> +
> +	priv->pdev =3D pdev;
> +	priv->global_led.name =3D "alienware::global_brightness";
> +	priv->global_led.brightness_set =3D global_led_set;
> +	priv->global_led.brightness_get =3D global_led_get;
> +	priv->global_led.max_brightness =3D 0x0F;
> +	priv->global_brightness =3D priv->global_led.max_brightness;
> +	platform_set_drvdata(pdev, priv);
> +
> +	return devm_led_classdev_register(&pdev->dev, &priv->global_led);
> +}
> +
>   static const struct attribute_group *alienfx_groups[] =3D {
>   	&zone_attribute_group,
>   	&hdmi_attribute_group,
> @@ -1158,6 +1177,7 @@ static struct platform_driver platform_driver =3D =
{
>   		.name =3D "alienware-wmi",
>   		.dev_groups =3D alienfx_groups,
>   	},
> +	.probe =3D alienfx_probe,
>   };
>
>   static int __init alienware_wmi_init(void)
> @@ -1205,14 +1225,8 @@ static int __init alienware_wmi_init(void)
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
>   fail_prep_thermal_profile:
>   	platform_device_del(platform_device);
>   fail_platform_device2:
> @@ -1227,7 +1241,6 @@ module_init(alienware_wmi_init);
>
>   static void __exit alienware_wmi_exit(void)
>   {
> -	alienware_zone_exit(platform_device);
>   	platform_device_unregister(platform_device);
>   	platform_driver_unregister(&platform_driver);
>   }
