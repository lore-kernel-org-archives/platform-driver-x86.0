Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFAA2F28;
	Fri, 27 Dec 2024 01:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735263166; cv=none; b=pgKR6eKCF0r6kcIMDjphp944sNTOvkJr/E6nepTd7PbAnWUD/wnmTnzvgfO9ghcxTMps/1sv67kUtqhkcRz4f2lUBVsgrhpZOPeFpCzp108BkXVu4qV3Z6afBaBe5g6lbzvkMtWHejuBHiWxdv55yK1G5fE4ICMoRskXzeUhkUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735263166; c=relaxed/simple;
	bh=KKT+1TuGh3o5nc3uYQDJ7ZuXfWZs+nGrD8U9eNhugRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F1FKK7SIRhf9OQ12zgg7ywA1lSbMHQsNok5Br/kbGNVUFtZSlXu5HQwAoNV77jCaATkWzJELAAV0Gfh/sZYibc/aasvWdtTNIF/ewCvWfsU2vxNMNjjIxUPLpY5NURi23w/Ep5jGrU4t8zDT4JUay9NzW287uFnR1kWQZn7zfDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=dg2vCroO; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="dg2vCroO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735263147; x=1735867947; i=w_armin@gmx.de;
	bh=A9e1f9S8Xuje3etMkhGdYurmuTFzdWo70LorGQSFSCU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dg2vCroO0bX32xFiLeg2B36KPMGn7OAuCFTnnO9lIrDfXdgV5kzuZ6du2IQhGrp0
	 x/qG6HRk2R/gGOeZ2Na6pDAGGiv3nUkMKlNCNrgEWcI+FzrI2AgNNn80tOa8wR5f4
	 u4ljZ7pUhH6dfGsNz4p8NI8nWJZwNJR6iz+YlIl+9FKXZh0TpYhKhIhRqiu821bA1
	 Xb+GpszK/pIWOVtBh7TqjkPy34SXC99HlA6TOCMu14xvdjaGNZpMVIWImPCfRu2Gb
	 LHHNXa/st5XUmvuB6Haefxr6+kNIiOEaYxvyTS35IRJjMf188VKDCxn9ka7Q9NIw8
	 LVO2OCY71ZIlkMlQxw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mgeo8-1u1S1n1kKK-00edK3; Fri, 27
 Dec 2024 02:32:27 +0100
Message-ID: <4fd5cc02-ccec-435b-96ec-68dc27364250@gmx.de>
Date: Fri, 27 Dec 2024 02:32:24 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/20] alienware-wmi: Add a state container for LED
 control feature
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-8-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-8-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Yb1jdnjmjXANAu4msccORYMajRYDRwYbPFKXKR0aXLceG4LBBH8
 Fkig9ifHt2/4gxFG4RVrG+CL0JA/nAL1jv/FzXNsmTdiOohz2tpPaQBVq3SGqrE1DXphZu2
 ourBteAw/IwFd8Am/geD8p97iR2MEUjC9JGQlHbBDfi/BQpzoZOElpZuapJRd63YEU/6SAs
 0PP+g1lpoC8RQrM+pj2mw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:FDRc+t+5MgE=;BO2c6MccWlmGPLlYTAyAIbgzdzl
 z+1oDQgE8ZNuTYWVQw9jN3OqbRNRq60nQHZZy6/tYJ2eqLQhDS/xp2wrrbMAEdr1sDLTk1t6B
 I+7tNO6mISchKBYCcgwxnFIh+XuWX9IPR5HPklMNOg2rVVvTk+BV+fRcHQU6tDGeqsbzBq23O
 Dbu2PuYjImHb8GSXA4kRpnATTez/hGpj34QH1EJwRgwU/I0Cl11LLqCCR8Eviv5PhuVwNSpvi
 KhxgkOWiLTjlsqWRY7ZE6Z4ugbZbcC9l3UJ3fFhaeNak+vgJ2InkhxvSbHc1Bo/psgefVtc0b
 P4c+EPE82Rgt52GSgKIUih5S5NGLmtFMe3fLp9KgK5EZRH5kw5VbpG8NREHLISJXF4Gnf3imM
 Acr9qSLzDUNKiXfqY4h88Bf5Y2x/PD39FieTzIphCdenp1x/v7Pue1JT7wSxe47tbjNvv7nni
 +IeQOoliJ1H2QCdEhBd02wqz47Dchp/qLcWQnFwNCtTP4XiBQZxZRV28F7Oxn7ljZNe13X7WA
 HICbqLNPr4p8Ew+Kmv8THPFUkfoUXRmKaIu8BOQqbW8A4+7XMHET9aewCjnHYkw3+ayHnPqI+
 gA3tTJohVnZwFsblxosgGv46nPqfaffBNcM4+XVk5Fk5+nPgQyOiQk4d3rwRYJIT4zKqigc8R
 ZvUWK5mp9gnaDmy0d1hg0t1Prg9e3dnu5x0uy4F0wcgh24IOkZRep39pFQh+MeCMMKds47vzs
 GYF4PQbMGw6BM2D20qlcCbzK1KQrQgjqS6e7xh9ae2qetQc5d8AewufTyhd5IS3xl73wM4eAv
 nQG8zwQjbnUEDD/IjZ+PYemXAbCFuutjlLBjgTBeSkfwpfqkTWncKDbMoMbBtVmpcSkcyvm81
 Hf15FI3hrQT3CMQ1Kdx0/7T3p8L9QNSAIXRExlXBlsdov6R44nDmZ5RejtBEjX2P/l4Z+XSvN
 xqGQ58HDxT7HhkUnQLWHpLkx9SQchHQwHDrVDK04wItAtaK0bb8tAPLyYPKHNtEAYhdm9zIVF
 qz4iQhTa4H8e2ldO0su3tSFi5BO6cNfLZCgr3Kj/IwGcBew1bnEymEAmVW5yDw6h2raKCYOZb
 /iCGvliNXUUsjYW5BGY2EWJqAdFYLk

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Add a state container for the "alienware-wmi" platform device and
> initialize it on the new alienfx_probe(). Migrate all LED control functi=
ons
> to use this state container.
>
> Additionally move the led_classdev registration to the platform driver
> probe and make it device managed.
>
> Drop alienware_zone_init() and alienware_zone_exit() because they are no
> longer needed.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 128 +++++++++++++---------
>   1 file changed, 76 insertions(+), 52 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index 67cf376df0f5..4b68d64bd742 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -404,14 +404,19 @@ struct wmax_u32_args {
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
> @@ -443,7 +448,7 @@ static int parse_rgb(const char *buf, struct color_p=
latform *colors)
>   /*
>    * Individual RGB zone control
>    */
> -static int alienware_update_led(u8 location)
> +static int alienware_update_led(struct alienfx_priv *priv, u8 location)
>   {
>   	int method_id;
>   	acpi_status status;
> @@ -453,21 +458,21 @@ static int alienware_update_led(u8 location)
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
> @@ -486,22 +491,32 @@ static int alienware_update_led(u8 location)
>   static ssize_t zone_show(struct device *dev, struct device_attribute *=
attr,
>   			 char *buf, u8 location)
>   {
> +	struct color_platform *colors;
> +	struct alienfx_priv *priv;
> +
> +	priv =3D dev_get_drvdata(dev);

Please use "struct color_platform *colors =3D dev_get_drvdata(dev);" in su=
ch cases.

> +	colors =3D &priv->colors[location];
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
> +	struct color_platform *colors;
> +	struct alienfx_priv *priv;
>   	int ret;
>
> -	ret =3D parse_rgb(buf, &colors[location]);
> +	priv =3D dev_get_drvdata(dev);

Same as above.

> +	colors =3D &priv->colors[location];
> +
> +	ret =3D parse_rgb(buf, colors);
>   	if (ret)
>   		return ret;
>
> -	ret =3D alienware_update_led(location);
> +	ret =3D alienware_update_led(priv, location);
>
>   	return ret ? ret : count;
>   }
> @@ -539,9 +554,13 @@ static ssize_t lighting_control_state_show(struct d=
evice *dev,
>   					   struct device_attribute *attr,
>   					   char *buf)
>   {
> -	if (lighting_control_state =3D=3D LEGACY_BOOTING)
> +	struct alienfx_priv *priv;
> +
> +	priv =3D dev_get_drvdata(dev);

Same as above.

> +
> +	if (priv->lighting_control_state =3D=3D LEGACY_BOOTING)
>   		return sysfs_emit(buf, "[booting] running suspend\n");
> -	else if (lighting_control_state =3D=3D LEGACY_SUSPEND)
> +	else if (priv->lighting_control_state =3D=3D LEGACY_SUSPEND)
>   		return sysfs_emit(buf, "booting running [suspend]\n");
>
>   	return sysfs_emit(buf, "booting [running] suspend\n");
> @@ -551,8 +570,11 @@ static ssize_t lighting_control_state_store(struct =
device *dev,
>   					    struct device_attribute *attr,
>   					    const char *buf, size_t count)
>   {
> +	struct alienfx_priv *priv;
>   	u8 val;
>
> +	priv =3D dev_get_drvdata(dev);

Same as above.

> +
>   	if (strcmp(buf, "booting\n") =3D=3D 0)
>   		val =3D LEGACY_BOOTING;
>   	else if (strcmp(buf, "suspend\n") =3D=3D 0)
> @@ -562,9 +584,9 @@ static ssize_t lighting_control_state_store(struct d=
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
> @@ -621,43 +643,26 @@ static int wmax_brightness(int brightness)
>   static void global_led_set(struct led_classdev *led_cdev,
>   			   enum led_brightness brightness)
>   {
> +	struct alienfx_priv *priv;
>   	int ret;
> -	global_brightness =3D brightness;
> +
> +	priv =3D container_of(led_cdev, struct alienfx_priv, global_led);

Same as above, but with container_of().

> +	priv->global_brightness =3D brightness;
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
> +	struct alienfx_priv *priv;
>
> -	return led_classdev_register(&dev->dev, &global_led);
> -}
> +	priv =3D container_of(led_cdev, struct alienfx_priv, global_led);

Same as above.

>
> -static void alienware_zone_exit(struct platform_device *dev)
> -{
> -	led_classdev_unregister(&global_led);
> +	return priv->global_brightness;
>   }
>
>   static acpi_status alienware_wmax_command(void *in_args, size_t in_siz=
e,
> @@ -1106,6 +1111,32 @@ static void remove_thermal_profile(void)
>   /*
>    * Platform Driver
>    */
> +static int alienfx_probe(struct platform_device *pdev)
> +{
> +	struct alienfx_priv *priv;
> +	struct led_classdev *leds;
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);

Missing error handling.

> +	platform_set_drvdata(pdev, priv);
> +
> +	priv->pdev =3D pdev;
> +
> +	if (interface =3D=3D WMAX)
> +		priv->lighting_control_state =3D WMAX_RUNNING;
> +	else if (interface =3D=3D LEGACY)
> +		priv->lighting_control_state =3D LEGACY_RUNNING;
> +
> +	leds =3D &priv->global_led;

I do not think that "leds" has any real benefit here, please use "priv->gl=
obal_led" directly.

Thanks,
Armin Wolf

> +	leds->name =3D "alienware::global_brightness";
> +	leds->brightness_set =3D global_led_set;
> +	leds->brightness_get =3D global_led_get;
> +	leds->max_brightness =3D 0x0F;
> +
> +	priv->global_brightness =3D priv->global_led.max_brightness;
> +
> +	return devm_led_classdev_register(&pdev->dev, &priv->global_led);
> +}
> +
>   static const struct attribute_group *alienfx_groups[] =3D {
>   	&zone_attribute_group,
>   	&hdmi_attribute_group,
> @@ -1119,6 +1150,7 @@ static struct platform_driver platform_driver =3D =
{
>   		.name =3D "alienware-wmi",
>   		.dev_groups =3D alienfx_groups,
>   	},
> +	.probe =3D alienfx_probe,
>   };
>
>   static int __init alienware_wmi_init(void)
> @@ -1166,15 +1198,8 @@ static int __init alienware_wmi_init(void)
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
> @@ -1189,7 +1214,6 @@ module_init(alienware_wmi_init);
>
>   static void __exit alienware_wmi_exit(void)
>   {
> -	alienware_zone_exit(platform_device);
>   	remove_thermal_profile();
>   	platform_device_unregister(platform_device);
>   	platform_driver_unregister(&platform_driver);
