Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3149C1B4F3D;
	Thu,  2 Jan 2025 18:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735843526; cv=none; b=j9CswLQsv3Nh/6U0n06F69GbxGh6Ao4HC4m/pGlQllnNimw6b9YZ5xwo5Pa2S2LLsHKsDApkKl7PTW+zGaLJzWakrICT+l2yTLqB05BIjuSiFm2w7zHQ9sW/8W69pzxASgpgkaqTFx89lfI+16v8W9OlNN48VEOOPMWLDlLQubE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735843526; c=relaxed/simple;
	bh=tDl53ZNoPI819vpyztrv1Q6UmeymFI/Taf8u6xYZMa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=phNBqGPMUTQFFoDcgNQILL+KczbJMnC5r3wDTwZv+dWDBqQxTarDs0/iS7T/W6XLscub5JESZ8W29mECwwCsdiM3jndxzCGtqZW9YvFNFuyB/vVI6Y6xUJ8C2yJA3SfKSMT45Jl9zp2Kned8jCoeO2Z40BwCAsj4iW5NTIJqQ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8migTRm; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8migTRm"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-85bb264993cso1895091241.1;
        Thu, 02 Jan 2025 10:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735843521; x=1736448321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6EitSKvZjHV84UD7mmu9xWWo8RKXYcnUOmny2nweWtc=;
        b=R8migTRmEaoCDEp7/xnb6x5zafCZej7gMrb3qTYGSVrwxdLMFxOLOo5vTf9h8fc+hR
         xwzd/lhIshOqpcZs5iNRjyteBVnBd1eWQ6udF+yGdw3dXMWirF1BVSiwojQhHSRPuF34
         VGnNOEtTJ0QaqWCEBwL0ITqLzImVzGU7o4sjopdwt0KkpNbFljroZmXzQj15D2bawBNX
         QUrBIJobmaf72M71wbOFzgBEGQRpowQLy7YeKa3mDIWKmtkCLQfWfmfUtf2FVH1ip0M2
         49M+7swhaLaASliQb2gruO6D5iPGNv+HsrAd/fxQbtE01r01RWPW+wyPDqYjl/AGJaXJ
         N3+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735843521; x=1736448321;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EitSKvZjHV84UD7mmu9xWWo8RKXYcnUOmny2nweWtc=;
        b=OJqJfEmbhCxO2Bv4pQ5HEOH+lBskCv7nqkNkkablK2FvxxhubLdOLEtzXRAO2OF7ea
         chAXtQAR0xmjT74D/T1N6rDXnC5UShKzA5kF+EaFp7IqFpNuvzUaL8csSdjV06luuYWR
         xu6JnthcT0AtensCeK8nZJAQ8xbm3U4tubwxtxvsaefItipC2b/w0ypKmADDALUYf3A6
         CZCopcYtjtpZmcNjGBVGWI7otC+Z4jjBd2EZYkss34NJhi/FNKyoVf0u74ALqhs6Qw5Z
         e4tnV6WUp9MTmjRAVYJ11DDQvcbDqH/t9SIZ5X1Gqm2O8q08dOovjkfdGDYDZ8qkdSEW
         nKJg==
X-Forwarded-Encrypted: i=1; AJvYcCWCDO72hMUh0tegXxSKD2uKqoqwMyIW56FTm6eukZeZ28B/0IvQgRF0PUGlEB8qL8fkewSyDa4UGAr6+RU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJptGNiuvsMeKWokyEbk0PP0TQJSp8Opn4gBOBQLIdCne3xHmd
	683NJ9FTLMfcE4Z5YCM1frtgvOEUa3H+2q/FSNKDjubRo/Uk/9SE
X-Gm-Gg: ASbGncvXp7fR2F9/deaQwqOu9zY1ywCAVQpLU246QODo/x9xsgcO6dnUA7XHeTcxTA8
	3d1S3rU7Z+OXLMc6EGAoCnaAQ/koTDNC9Ro+LVkbY1FrsQTgB7GkZSq1ASFdJd4VJVohsNQd9Z4
	FpY5jGL6gzUSyzEjEMJ5TQHTzcxK+2eg0eItbr/cMHxXC986IQI+hFcy7020tjP1BOG6/tYouyw
	j1snIppZAK3cB0S2FV2tw+LWM7tymOHs3hpPfwl2Y4vR5DWS7ibHA==
X-Google-Smtp-Source: AGHT+IEmINXH0RNIIUnMaPKtWOcWikgKiq9lvJmiWRr44ruTsop5Q7iOhV+LT/e8POohWGT8rv1XXg==
X-Received: by 2002:a05:6102:50a0:b0:4af:f740:c1b8 with SMTP id ada2fe7eead31-4b2cc49c115mr36144954137.24.1735843520892;
        Thu, 02 Jan 2025 10:45:20 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bfa8d401sm5088876137.23.2025.01.02.10.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:45:20 -0800 (PST)
Date: Thu, 2 Jan 2025 13:45:16 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	mario.limonciello@amd.com
Subject: Re: [PATCH v2 07/20] alienware-wmi: Add a state container for LED
 control feature
Message-ID: <fz3qdng6vvlfmncxosqmlswhxu36yplg7h6igeaipdqfao2tgl@bymtliqzw5sw>
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-9-kuurtb@gmail.com>
 <50b0b025-87ad-4093-b525-f95a22b8f124@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50b0b025-87ad-4093-b525-f95a22b8f124@gmx.de>

On Thu, Jan 02, 2025 at 05:07:16PM +0100, Armin Wolf wrote:
> Am 29.12.24 um 20:44 schrieb Kurt Borja:
> 
> > Add a state container for the "alienware-wmi" platform device and
> > initialize it on the new alienfx_probe(). Migrate all LED control functions
> > to use this state container, as well as hdmi, amplifier, deepslp group
> > visibility methods, to support upcoming file split.
> > 
> > Additionally move the led_classdev registration to the platform driver
> > probe and make it device managed.
> > 
> > Drop alienware_zone_init() and alienware_zone_exit() because they are no
> > longer needed.
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 135 +++++++++++++---------
> >   1 file changed, 79 insertions(+), 56 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index 2c17160473a6..88d4046ed45f 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -404,14 +404,20 @@ struct wmax_u32_args {
> >   	u8 arg3;
> >   };
> > 
> > +struct alienfx_priv {
> > +	struct platform_device *pdev;
> > +	struct quirk_entry *quirks;
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
> > @@ -443,7 +449,7 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
> >   /*
> >    * Individual RGB zone control
> >    */
> > -static int alienware_update_led(u8 location)
> > +static int alienware_update_led(struct alienfx_priv *priv, u8 location)
> >   {
> >   	int method_id;
> >   	acpi_status status;
> > @@ -453,21 +459,21 @@ static int alienware_update_led(u8 location)
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
> > @@ -486,22 +492,26 @@ static int alienware_update_led(u8 location)
> >   static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
> >   			 char *buf, u8 location)
> >   {
> > +	struct alienfx_priv *priv = dev_get_drvdata(dev);
> > +	struct color_platform *colors = &priv->colors[location];
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
> > +	struct alienfx_priv *priv = dev_get_drvdata(dev);
> > +	struct color_platform *colors = &priv->colors[location];
> >   	int ret;
> > 
> > -	ret = parse_rgb(buf, &colors[location]);
> > +	ret = parse_rgb(buf, colors);
> >   	if (ret)
> >   		return ret;
> > 
> > -	ret = alienware_update_led(location);
> > +	ret = alienware_update_led(priv, location);
> > 
> >   	return ret ? ret : count;
> >   }
> > @@ -569,9 +579,11 @@ static ssize_t lighting_control_state_show(struct device *dev,
> >   					   struct device_attribute *attr,
> >   					   char *buf)
> >   {
> > -	if (lighting_control_state == LEGACY_BOOTING)
> > +	struct alienfx_priv *priv = dev_get_drvdata(dev);
> > +
> > +	if (priv->lighting_control_state == LEGACY_BOOTING)
> >   		return sysfs_emit(buf, "[booting] running suspend\n");
> > -	else if (lighting_control_state == LEGACY_SUSPEND)
> > +	else if (priv->lighting_control_state == LEGACY_SUSPEND)
> >   		return sysfs_emit(buf, "booting running [suspend]\n");
> > 
> >   	return sysfs_emit(buf, "booting [running] suspend\n");
> > @@ -581,6 +593,7 @@ static ssize_t lighting_control_state_store(struct device *dev,
> >   					    struct device_attribute *attr,
> >   					    const char *buf, size_t count)
> >   {
> > +	struct alienfx_priv *priv = dev_get_drvdata(dev);
> >   	u8 val;
> > 
> >   	if (strcmp(buf, "booting\n") == 0)
> > @@ -592,9 +605,9 @@ static ssize_t lighting_control_state_store(struct device *dev,
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
> > @@ -651,43 +664,26 @@ static int wmax_brightness(int brightness)
> >   static void global_led_set(struct led_classdev *led_cdev,
> >   			   enum led_brightness brightness)
> >   {
> > +	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
> > +						 global_led);
> >   	int ret;
> > -	global_brightness = brightness;
> > +
> > +	priv->global_brightness = brightness;
> > +
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
> > +	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
> > +						 global_led);
> > 
> > -static int alienware_zone_init(struct platform_device *dev)
> > -{
> > -	if (interface == WMAX) {
> > -		lighting_control_state = WMAX_RUNNING;
> > -	} else if (interface == LEGACY) {
> > -		lighting_control_state = LEGACY_RUNNING;
> > -	}
> > -	global_led.max_brightness = 0x0F;
> > -	global_brightness = global_led.max_brightness;
> > -
> > -	return led_classdev_register(&dev->dev, &global_led);
> > -}
> > -
> > -static void alienware_zone_exit(struct platform_device *dev)
> > -{
> > -	led_classdev_unregister(&global_led);
> > +	return priv->global_brightness;
> >   }
> > 
> >   static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
> > @@ -792,7 +788,9 @@ static DEVICE_ATTR_RW(source);
> > 
> >   static bool hdmi_group_visible(struct kobject *kobj)
> >   {
> > -	return quirks->hdmi_mux;
> > +	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
> > +
> > +	return priv->quirks->hdmi_mux;
> >   }
> >   DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
> > 
> > @@ -838,7 +836,9 @@ static DEVICE_ATTR_RO(status);
> > 
> >   static bool amplifier_group_visible(struct kobject *kobj)
> >   {
> > -	return quirks->amplifier;
> > +	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
> > +
> > +	return priv->quirks->amplifier;
> >   }
> >   DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
> > 
> > @@ -906,7 +906,9 @@ static DEVICE_ATTR_RW(deepsleep);
> > 
> >   static bool deepsleep_group_visible(struct kobject *kobj)
> >   {
> > -	return quirks->deepslp;
> > +	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
> > +
> > +	return priv->quirks->deepslp;
> >   }
> >   DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
> > 
> > @@ -1133,6 +1135,33 @@ static void remove_thermal_profile(void)
> >   /*
> >    * Platform Driver
> >    */
> > +static int alienfx_probe(struct platform_device *pdev)
> > +{
> > +	struct alienfx_priv *priv;
> > +
> > +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, priv);
> > +	priv->pdev = pdev;
> > +	priv->quirks = quirks;
> > +
> > +	if (interface == WMAX)
> > +		priv->lighting_control_state = WMAX_RUNNING;
> > +	else if (interface == LEGACY)
> > +		priv->lighting_control_state = LEGACY_RUNNING;
> > +
> > +	priv->global_led.name = "alienware::global_brightness";
> > +	priv->global_led.brightness_set = global_led_set;
> > +	priv->global_led.brightness_get = global_led_get;
> > +	priv->global_led.max_brightness = 0x0F;
> > +
> > +	priv->global_brightness = priv->global_led.max_brightness;
> > +
> > +	return devm_led_classdev_register(&pdev->dev, &priv->global_led);
> > +}
> > +
> >   static const struct attribute_group *alienfx_groups[] = {
> >   	&zone_attribute_group,
> >   	&hdmi_attribute_group,
> > @@ -1145,7 +1174,9 @@ static struct platform_driver platform_driver = {
> >   	.driver = {
> >   		.name = "alienware-wmi",
> >   		.dev_groups = alienfx_groups,
> > +		.probe_type = PROBE_FORCE_SYNCHRONOUS,
> 
> Can you please explain to me why this is exactly necessary?

Because I want to add wmax_alienfx_groups after the platform_device has
finished probing. I think it's not exactly "necessary" because those
methods only access `platdata` which is set before probing, but to me it
doesn't feel right to race with alienfx_probe().

I wanted to somehow mimic platform_create_bundle(), which I can't use
because that function needs to be called from an __init section.

If this is unnecessary I will drop it, otherwise I think it makes more
sense to move this to [8/20].

> 
> Thanks,
> Armin Wolf
> 
> >   	},
> > +	.probe = alienfx_probe,
> >   };
> > 
> >   static int __init alienware_wmi_init(void)
> > @@ -1193,15 +1224,8 @@ static int __init alienware_wmi_init(void)
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
> > @@ -1216,7 +1240,6 @@ module_init(alienware_wmi_init);
> > 
> >   static void __exit alienware_wmi_exit(void)
> >   {
> > -	alienware_zone_exit(platform_device);
> >   	remove_thermal_profile();
> >   	platform_device_unregister(platform_device);
> >   	platform_driver_unregister(&platform_driver);
