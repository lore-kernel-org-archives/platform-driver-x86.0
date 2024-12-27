Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7789B442F;
	Fri, 27 Dec 2024 04:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735274347; cv=none; b=uynjUdWlPd7fXV1HNRaFTM0NE/bnQE70eF+vO55HTON4JKHd97QmvgJWl5sxWCbeKiIWd06sbukP3qiOWDJRbR+oV3ztSC3jnHuxKk+fqYP7mOE9mW6BaaKDgPU0IkVlue4fbSooqggsaGwOQmoqSk/fOUrC0X9RDkJrb7kpDiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735274347; c=relaxed/simple;
	bh=DvmN315C7qBxB6kYgPm1r1ubi9jIKH7WxvrN4vPnl1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omhlbP0LAQ3sTcr3ivPaaSddpWobjLYbkF2jNPS2YST2tNE2R//6jU4erlWCyRQrSEzxEvBE0AOLpKJewZFnO4d0m16yQ3GJpHYHUEhbmCs+s5ckpBkXOuMv9njMw8VTvHLKt3o8zuMxNTWVK9sQecbLa2nGw/kIwSPmwdXJXjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6xajG6z; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6xajG6z"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e461015fbd4so2562383276.2;
        Thu, 26 Dec 2024 20:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735274344; x=1735879144; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5qQVYTT3IgkdffsPTg0hAgvpCvuW5hM2TSsVM56CE28=;
        b=M6xajG6z3mHv2HL7EWspj6ECJ9r7Yfn1f1ZkIK/KDGYq7BV/2ePZcadr8g55w5dN84
         a1WljAj84VlAGU0ATPx2GTmInBzecN7K1Qkvo+ewzyWpiJYWqFBLHcYGqG/Vj+QPZ3Nc
         ET7oFAHC/0tRWPqTUICIKM1J1XDsyqbdpdhk0XWoyTmNND/lIfbtfsOjFiI0FF03DdJT
         ctLWwSpVxlvtic5BXXpDzQoUoek+uu3NnTBWK2NSFz+eweanh9mFhouK9js/UTm1Ei5s
         g535rX5qneAXY28uA2I5VoZvYw5O6cj9+/e+IYJr5huRxjNkoK1txoB3VywAkbEv9CEP
         gQ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735274344; x=1735879144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5qQVYTT3IgkdffsPTg0hAgvpCvuW5hM2TSsVM56CE28=;
        b=Wun4CccKlAdQyDixYYHjMbCq0pmYmCZEbF//6huuQBf2ou672NazrAEbjif3RY1MXe
         cS7kbiCXXysM7h0ygPAF/iLDkRk3J/4Ncm2dotqz8tRQ6v2+7kiAN+Ul9CtdQxCyvRAw
         4HNtxd085/ZTxDuB2wutwPoc96PK6RQTcji7u653D6TP2PggFtG1fCqYgQdJqqOjgur8
         BLh7nEZEAzAvrdjR5ybFXqPQS/fgiQHuUusukyQ/elRgdI0J4IZmwSss2Wj/glaLC/Dm
         Pj31QzfYgXT6HUMLSOHZXWnIk6Mx/YFjca5GBfNclxYs7mM4xZ4kA1kappQ6A1a8kUqz
         nOzg==
X-Forwarded-Encrypted: i=1; AJvYcCXSHcFSQqyIOM3YtAtM59UaApFPw48Hao9BKOX3rNZ1fNn4/3omKfFUc7b5Ixl9b/WCERCCgUN1Zrlv8FQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYL5fChPS46xBUk1FZLtr8uWJPBPerhufGu2ZOji4SqykdmJoR
	UbhdCrWU09PZ7FbH82aL1QyIbFcyJDL8mM0Rt5RUR8VxSV0RsPgm
X-Gm-Gg: ASbGncs5qorlOJPFUlAWltaI5v5jFPj13E4akJhQy5eE60kKCWS+LN90pA6zNOQbSKe
	h7f0DVAFBBnRRV6aCTzFCKT3qNOXay2ESGrHHM5MTvkK074XOlHFmLggNFG9gPzlVmxfBkmFBIg
	Z0/Xwyhh4+eNSCIKYQ4J0G/hgMWvMvO3nqxMVp+Rx0LPmFjf9MUgcql08nnAT0fhjpqIYG5IUdS
	try1iJcRDpf60sVYGeVU2o4LICnXkiefkkTVBHGT0fFEY+WbQOi/w==
X-Google-Smtp-Source: AGHT+IEtCv2Pw8hf/5g/8V/U5VM/M75iiaxmlv0tn1zEUsEuTqjy39CoLBQFhuYH2Uaan28dONPIOw==
X-Received: by 2002:a05:690c:640b:b0:6ef:a227:c0b5 with SMTP id 00721157ae682-6f3f8136a43mr164297337b3.25.1735274344350;
        Thu, 26 Dec 2024 20:39:04 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e77eee35sm40451507b3.80.2024.12.26.20.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 20:39:03 -0800 (PST)
Date: Thu, 26 Dec 2024 23:39:00 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 07/20] alienware-wmi: Add a state container for LED
 control feature
Message-ID: <aytfl3d4ejmqngfdqbmgtmnilnd6cbwk3p7oz7trm2muxmbhm2@lq727lmycli2>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-8-kuurtb@gmail.com>
 <4fd5cc02-ccec-435b-96ec-68dc27364250@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fd5cc02-ccec-435b-96ec-68dc27364250@gmx.de>

On Fri, Dec 27, 2024 at 02:32:24AM +0100, Armin Wolf wrote:
> Am 21.12.24 um 06:59 schrieb Kurt Borja:
> 
> > Add a state container for the "alienware-wmi" platform device and
> > initialize it on the new alienfx_probe(). Migrate all LED control functions
> > to use this state container.
> > 
> > Additionally move the led_classdev registration to the platform driver
> > probe and make it device managed.
> > 
> > Drop alienware_zone_init() and alienware_zone_exit() because they are no
> > longer needed.
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 128 +++++++++++++---------
> >   1 file changed, 76 insertions(+), 52 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index 67cf376df0f5..4b68d64bd742 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -404,14 +404,19 @@ struct wmax_u32_args {
> >   	u8 arg3;
> >   };
> > 
> > +struct alienfx_priv {
> > +	struct platform_device *pdev;
> > +	struct led_classdev global_led;
> > +	struct color_platform colors[4];
> > +	u8 global_brightness;
> > +	u8 lighting_control_state;
> > +};
> > +
> >   static struct platform_device *platform_device;
> > -static struct color_platform colors[4];
> >   static struct platform_profile_handler pp_handler;
> >   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
> > 
> >   static u8 interface;
> > -static u8 lighting_control_state;
> > -static u8 global_brightness;
> > 
> >   /*
> >    * Helpers used for zone control
> > @@ -443,7 +448,7 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
> >   /*
> >    * Individual RGB zone control
> >    */
> > -static int alienware_update_led(u8 location)
> > +static int alienware_update_led(struct alienfx_priv *priv, u8 location)
> >   {
> >   	int method_id;
> >   	acpi_status status;
> > @@ -453,21 +458,21 @@ static int alienware_update_led(u8 location)
> >   	struct wmax_led_args wmax_basic_args;
> >   	if (interface == WMAX) {
> >   		wmax_basic_args.led_mask = 1 << location;
> > -		wmax_basic_args.colors = colors[location];
> > -		wmax_basic_args.state = lighting_control_state;
> > +		wmax_basic_args.colors = priv->colors[location];
> > +		wmax_basic_args.state = priv->lighting_control_state;
> >   		guid = WMAX_CONTROL_GUID;
> >   		method_id = WMAX_METHOD_ZONE_CONTROL;
> > 
> >   		input.length = sizeof(wmax_basic_args);
> >   		input.pointer = &wmax_basic_args;
> >   	} else {
> > -		legacy_args.colors = colors[location];
> > -		legacy_args.brightness = global_brightness;
> > +		legacy_args.colors = priv->colors[location];
> > +		legacy_args.brightness = priv->global_brightness;
> >   		legacy_args.state = 0;
> > -		if (lighting_control_state == LEGACY_BOOTING ||
> > -		    lighting_control_state == LEGACY_SUSPEND) {
> > +		if (priv->lighting_control_state == LEGACY_BOOTING ||
> > +		    priv->lighting_control_state == LEGACY_SUSPEND) {
> >   			guid = LEGACY_POWER_CONTROL_GUID;
> > -			legacy_args.state = lighting_control_state;
> > +			legacy_args.state = priv->lighting_control_state;
> >   		} else
> >   			guid = LEGACY_CONTROL_GUID;
> >   		method_id = location + 1;
> > @@ -486,22 +491,32 @@ static int alienware_update_led(u8 location)
> >   static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
> >   			 char *buf, u8 location)
> >   {
> > +	struct color_platform *colors;
> > +	struct alienfx_priv *priv;
> > +
> > +	priv = dev_get_drvdata(dev);
> 
> Please use "struct color_platform *colors = dev_get_drvdata(dev);" in such cases.
> 
> > +	colors = &priv->colors[location];
> > +
> >   	return sprintf(buf, "red: %d, green: %d, blue: %d\n",
> > -		       colors[location].red, colors[location].green,
> > -		       colors[location].blue);
> > +		       colors->red, colors->green, colors->blue);
> > 
> >   }
> > 
> >   static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
> >   			  const char *buf, size_t count, u8 location)
> >   {
> > +	struct color_platform *colors;
> > +	struct alienfx_priv *priv;
> >   	int ret;
> > 
> > -	ret = parse_rgb(buf, &colors[location]);
> > +	priv = dev_get_drvdata(dev);
> 
> Same as above.
> 
> > +	colors = &priv->colors[location];
> > +
> > +	ret = parse_rgb(buf, colors);
> >   	if (ret)
> >   		return ret;
> > 
> > -	ret = alienware_update_led(location);
> > +	ret = alienware_update_led(priv, location);
> > 
> >   	return ret ? ret : count;
> >   }
> > @@ -539,9 +554,13 @@ static ssize_t lighting_control_state_show(struct device *dev,
> >   					   struct device_attribute *attr,
> >   					   char *buf)
> >   {
> > -	if (lighting_control_state == LEGACY_BOOTING)
> > +	struct alienfx_priv *priv;
> > +
> > +	priv = dev_get_drvdata(dev);
> 
> Same as above.
> 
> > +
> > +	if (priv->lighting_control_state == LEGACY_BOOTING)
> >   		return sysfs_emit(buf, "[booting] running suspend\n");
> > -	else if (lighting_control_state == LEGACY_SUSPEND)
> > +	else if (priv->lighting_control_state == LEGACY_SUSPEND)
> >   		return sysfs_emit(buf, "booting running [suspend]\n");
> > 
> >   	return sysfs_emit(buf, "booting [running] suspend\n");
> > @@ -551,8 +570,11 @@ static ssize_t lighting_control_state_store(struct device *dev,
> >   					    struct device_attribute *attr,
> >   					    const char *buf, size_t count)
> >   {
> > +	struct alienfx_priv *priv;
> >   	u8 val;
> > 
> > +	priv = dev_get_drvdata(dev);
> 
> Same as above.
> 
> > +
> >   	if (strcmp(buf, "booting\n") == 0)
> >   		val = LEGACY_BOOTING;
> >   	else if (strcmp(buf, "suspend\n") == 0)
> > @@ -562,9 +584,9 @@ static ssize_t lighting_control_state_store(struct device *dev,
> >   	else
> >   		val = WMAX_RUNNING;
> > 
> > -	lighting_control_state = val;
> > +	priv->lighting_control_state = val;
> >   	pr_debug("alienware-wmi: updated control state to %d\n",
> > -		 lighting_control_state);
> > +		 priv->lighting_control_state);
> > 
> >   	return count;
> >   }
> > @@ -621,43 +643,26 @@ static int wmax_brightness(int brightness)
> >   static void global_led_set(struct led_classdev *led_cdev,
> >   			   enum led_brightness brightness)
> >   {
> > +	struct alienfx_priv *priv;
> >   	int ret;
> > -	global_brightness = brightness;
> > +
> > +	priv = container_of(led_cdev, struct alienfx_priv, global_led);
> 
> Same as above, but with container_of().
> 
> > +	priv->global_brightness = brightness;
> >   	if (interface == WMAX)
> >   		ret = wmax_brightness(brightness);
> >   	else
> > -		ret = alienware_update_led(0);
> > +		ret = alienware_update_led(priv, 0);
> >   	if (ret)
> >   		pr_err("LED brightness update failed\n");
> >   }
> > 
> >   static enum led_brightness global_led_get(struct led_classdev *led_cdev)
> >   {
> > -	return global_brightness;
> > -}
> > -
> > -static struct led_classdev global_led = {
> > -	.brightness_set = global_led_set,
> > -	.brightness_get = global_led_get,
> > -	.name = "alienware::global_brightness",
> > -};
> > -
> > -static int alienware_zone_init(struct platform_device *dev)
> > -{
> > -	if (interface == WMAX) {
> > -		lighting_control_state = WMAX_RUNNING;
> > -	} else if (interface == LEGACY) {
> > -		lighting_control_state = LEGACY_RUNNING;
> > -	}
> > -	global_led.max_brightness = 0x0F;
> > -	global_brightness = global_led.max_brightness;
> > +	struct alienfx_priv *priv;
> > 
> > -	return led_classdev_register(&dev->dev, &global_led);
> > -}
> > +	priv = container_of(led_cdev, struct alienfx_priv, global_led);
> 
> Same as above.

Ack all of these.

> 
> > 
> > -static void alienware_zone_exit(struct platform_device *dev)
> > -{
> > -	led_classdev_unregister(&global_led);
> > +	return priv->global_brightness;
> >   }
> > 
> >   static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
> > @@ -1106,6 +1111,32 @@ static void remove_thermal_profile(void)
> >   /*
> >    * Platform Driver
> >    */
> > +static int alienfx_probe(struct platform_device *pdev)
> > +{
> > +	struct alienfx_priv *priv;
> > +	struct led_classdev *leds;
> > +
> > +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> 
> Missing error handling.

Thanks!

> 
> > +	platform_set_drvdata(pdev, priv);
> > +
> > +	priv->pdev = pdev;
> > +
> > +	if (interface == WMAX)
> > +		priv->lighting_control_state = WMAX_RUNNING;
> > +	else if (interface == LEGACY)
> > +		priv->lighting_control_state = LEGACY_RUNNING;
> > +
> > +	leds = &priv->global_led;
> 
> I do not think that "leds" has any real benefit here, please use "priv->global_led" directly.

Removed.

> 
> Thanks,
> Armin Wolf
> 
> > +	leds->name = "alienware::global_brightness";
> > +	leds->brightness_set = global_led_set;
> > +	leds->brightness_get = global_led_get;
> > +	leds->max_brightness = 0x0F;
> > +
> > +	priv->global_brightness = priv->global_led.max_brightness;
> > +
> > +	return devm_led_classdev_register(&pdev->dev, &priv->global_led);
> > +}
> > +
> >   static const struct attribute_group *alienfx_groups[] = {
> >   	&zone_attribute_group,
> >   	&hdmi_attribute_group,
> > @@ -1119,6 +1150,7 @@ static struct platform_driver platform_driver = {
> >   		.name = "alienware-wmi",
> >   		.dev_groups = alienfx_groups,
> >   	},
> > +	.probe = alienfx_probe,
> >   };
> > 
> >   static int __init alienware_wmi_init(void)
> > @@ -1166,15 +1198,8 @@ static int __init alienware_wmi_init(void)
> >   			goto fail_prep_thermal_profile;
> >   	}
> > 
> > -	ret = alienware_zone_init(platform_device);
> > -	if (ret)
> > -		goto fail_prep_zones;
> > -
> >   	return 0;
> > 
> > -fail_prep_zones:
> > -	alienware_zone_exit(platform_device);
> > -	remove_thermal_profile();
> >   fail_prep_thermal_profile:
> >   	platform_device_del(platform_device);
> >   fail_platform_device2:
> > @@ -1189,7 +1214,6 @@ module_init(alienware_wmi_init);
> > 
> >   static void __exit alienware_wmi_exit(void)
> >   {
> > -	alienware_zone_exit(platform_device);
> >   	remove_thermal_profile();
> >   	platform_device_unregister(platform_device);
> >   	platform_driver_unregister(&platform_driver);
