Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB1C442F;
	Fri, 27 Dec 2024 04:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735274263; cv=none; b=M6Mk3dC4tsTF2vCDFIX83q3E7ZEL8dJg7uO1x0lQliDU2onei0kg2hz0lUmug4fi3y4Jf9HEYlyXoJObdhpGBFcZD5R82D1aVOs6LpleEYrWPJIArXQFD1tVGNG8//4CmFVSlgSkIkOqmFe7WPYiUQzxF/rVIHFtmwSq74JuckE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735274263; c=relaxed/simple;
	bh=Bnk1m2K4zCVRw0NljzvzfdSTG8Yqi6vKfohSOwsxaqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KbhadjgMgM0IB6+fCnUxj+OExCvbfC1elsBB0yGValtakygbfhSfE5lBPjA/evmRaUGB7XzMYGVenXuu86XeVkyRXcdkuVaMPmd+f5IkmhqT+jJG+G4/VeDUquhChAmdUc7IxVgw1htCQlZ2S7Y2Mgfjhu6xMfjgkRrQRlGENSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AVzikXjn; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AVzikXjn"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3fd6cd9ef7so8041763276.1;
        Thu, 26 Dec 2024 20:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735274260; x=1735879060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/DaeQuJkF5rg2Abvo4mJO+TzMAbm/gLTL3DyosIMoXM=;
        b=AVzikXjn4Keo4M6NHuYohv4F48JjLIGkahO8a1HhLkZwDv/WLx4VumFJHIpBRIKwhw
         aKLIXtr6SdRqVHiH4HhyOCdyoMzJ1EVKDXXiHEAqtRCOZVvN0WXGSgNlOT46SrE1j5En
         AxTkLH7UjJvQfVimgYkrYTmkzp7s/fply15mEzrNGw5syW5z3MAg7hcFdybmYpG61unA
         JAeNOYInWn18apiAIFHqcWXlwmRVSyfdjGIFHi8AfeZs7RcmGq0M8Z7iuti5m2LbOON2
         BB0O8mtdqxu5gtBwvGUwF79RRtJwq6aSDYMKk+jTt8kDZlawPPDX3oZi1TRp7n0UUk24
         yDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735274260; x=1735879060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/DaeQuJkF5rg2Abvo4mJO+TzMAbm/gLTL3DyosIMoXM=;
        b=HY435jCtOAtDFVA0u3uw2C4LIAoWt+Lgxxr6DpmWQhBmbMKsAE41dN91MT4XJhLAca
         B7bApHPBJktvbkMHQGmAj+AYEi3MB/vjMjmbhwzIsm5q4lPSG+IuCsa5iPh37tX3mynk
         vJ6IvmeztpjPrHO3e96YnHqy+xEKvkwmmRkTwYZcSyCPAq8GZvxPmoEjlkEpLxL4lcPJ
         AZob55w51x0ekA/pXLJjeea8/tCkPLFTIKN4nQLu5kRCYPlsFp33jrAo/VIG4Blw55L4
         6r/Tpa4rfcDiY3PX2tXvFgzOtgreHNXNt27q5+lnI0Dhr4IxVDznH2kf4plwanJfZr5F
         K3nQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVI4vYSsatb/RvpxCh6Q9hCLy84+VICGvCvG+njSPJf2J5L608qFHjDrZNF1u6jJOrn7mqPAI7qjacPHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKdUQWCGdbLKiLlxWvfQJka3jmimktFHwBHUpg/C9y/cReKeUK
	UkNvUFEod/UXLEg4XdVTdu3kJRqSVvaTbhDQljk5c5VmJ9E9SqWs
X-Gm-Gg: ASbGnctT4i9RCmfY42IK60jNysCLfK/bn4JcrJG/tmd6OxBYENFhJ7WnaRPuAbpiNcL
	HLhrfyJ/FNUZviy3//u3YnVZedV9oTnw6V9RFKJ98ULBELCA/itwqsgEzAXkUqkYTviVOJbLRoq
	8q33r9sTkgnfOZtKbkJ9jGX53lGpdSdC06IO4InFmFauPrzbu8P9W8E8M3/gP19YLAQ7rS6E0F4
	aP7BxEuiaM8Ih0yeRnhqRO8asWBEcVn/Nm6YxhhwZxFRODWwbyOmA==
X-Google-Smtp-Source: AGHT+IFmJR47o28/lJX4J3e4lxwud0WfNrOBop85RuVscRRdsVEDEdqO2CPxA33tmWTzwkNaCkIipQ==
X-Received: by 2002:a05:690c:6408:b0:6dd:f81a:80fb with SMTP id 00721157ae682-6f3f7e02a3fmr184628887b3.1.1735274259851;
        Thu, 26 Dec 2024 20:37:39 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e77ed520sm41102837b3.97.2024.12.26.20.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 20:37:39 -0800 (PST)
Date: Thu, 26 Dec 2024 23:37:36 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 05/20] alienware-wmi: Improve rgb-zones group creation
Message-ID: <ycjzmsa7gihizv2dwms7ojpp3oiopqthzqykgdjitytpykj7eg@vohjl2kij7sp>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-6-kuurtb@gmail.com>
 <53d5792d-bdfb-4f6e-a75d-6d5e437e1a93@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53d5792d-bdfb-4f6e-a75d-6d5e437e1a93@gmx.de>

On Fri, Dec 27, 2024 at 02:04:51AM +0100, Armin Wolf wrote:
> Am 21.12.24 um 06:59 schrieb Kurt Borja:
> 
> > Define zone_attrs statically with the use of helper macros and
> > initialize the zone_attribute_group with driver's .dev_groups.
> > 
> > Drop match_zone() and instead pass a `location` argument to previous
> > show/store methods to access the correct `zone` LED state. On top of
> > that rename zone_set() -> zone_store() to be more consistent with sysfs
> > conventions.
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 179 +++++++++-------------
> >   1 file changed, 72 insertions(+), 107 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index e010c94555e8..a431b1fec9fb 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -376,12 +376,6 @@ struct color_platform {
> >   	u8 red;
> >   } __packed;
> > 
> > -struct platform_zone {
> > -	u8 location;
> > -	struct device_attribute *attr;
> > -	struct color_platform colors;
> > -};
> > -
> >   struct wmax_brightness_args {
> >   	u32 led_mask;
> >   	u32 percentage;
> > @@ -411,16 +405,10 @@ struct wmax_u32_args {
> >   };
> > 
> >   static struct platform_device *platform_device;
> > -static struct device_attribute *zone_dev_attrs;
> > -static struct attribute **zone_attrs;
> > -static struct platform_zone *zone_data;
> > +static struct color_platform colors[4];
> >   static struct platform_profile_handler pp_handler;
> >   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
> > 
> > -static struct attribute_group zone_attribute_group = {
> > -	.name = "rgb_zones",
> > -};
> > -
> >   static u8 interface;
> >   static u8 lighting_control_state;
> >   static u8 global_brightness;
> > @@ -452,24 +440,10 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
> >   	return 0;
> >   }
> > 
> > -static struct platform_zone *match_zone(struct device_attribute *attr)
> > -{
> > -	u8 zone;
> > -
> > -	for (zone = 0; zone < quirks->num_zones; zone++) {
> > -		if ((struct device_attribute *)zone_data[zone].attr == attr) {
> > -			pr_debug("alienware-wmi: matched zone location: %d\n",
> > -				 zone_data[zone].location);
> > -			return &zone_data[zone];
> > -		}
> > -	}
> > -	return NULL;
> > -}
> > -
> >   /*
> >    * Individual RGB zone control
> >    */
> > -static int alienware_update_led(struct platform_zone *zone)
> > +static int alienware_update_led(u8 location)
> >   {
> >   	int method_id;
> >   	acpi_status status;
> > @@ -478,8 +452,8 @@ static int alienware_update_led(struct platform_zone *zone)
> >   	struct legacy_led_args legacy_args;
> >   	struct wmax_led_args wmax_basic_args;
> >   	if (interface == WMAX) {
> > -		wmax_basic_args.led_mask = 1 << zone->location;
> > -		wmax_basic_args.colors = zone->colors;
> > +		wmax_basic_args.led_mask = 1 << location;
> > +		wmax_basic_args.colors = colors[location];
> >   		wmax_basic_args.state = lighting_control_state;
> >   		guid = WMAX_CONTROL_GUID;
> >   		method_id = WMAX_METHOD_ZONE_CONTROL;
> > @@ -487,7 +461,7 @@ static int alienware_update_led(struct platform_zone *zone)
> >   		input.length = sizeof(wmax_basic_args);
> >   		input.pointer = &wmax_basic_args;
> >   	} else {
> > -		legacy_args.colors = zone->colors;
> > +		legacy_args.colors = colors[location];
> >   		legacy_args.brightness = global_brightness;
> >   		legacy_args.state = 0;
> >   		if (lighting_control_state == LEGACY_BOOTING ||
> > @@ -496,7 +470,7 @@ static int alienware_update_led(struct platform_zone *zone)
> >   			legacy_args.state = lighting_control_state;
> >   		} else
> >   			guid = LEGACY_CONTROL_GUID;
> > -		method_id = zone->location + 1;
> > +		method_id = location + 1;
> > 
> >   		input.length = sizeof(legacy_args);
> >   		input.pointer = &legacy_args;
> > @@ -510,35 +484,54 @@ static int alienware_update_led(struct platform_zone *zone)
> >   }
> > 
> >   static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
> > -			 char *buf)
> > +			 char *buf, u8 location)
> >   {
> > -	struct platform_zone *target_zone;
> > -	target_zone = match_zone(attr);
> > -	if (target_zone == NULL)
> > -		return sprintf(buf, "red: -1, green: -1, blue: -1\n");
> >   	return sprintf(buf, "red: %d, green: %d, blue: %d\n",
> > -		       target_zone->colors.red,
> > -		       target_zone->colors.green, target_zone->colors.blue);
> > +		       colors[location].red, colors[location].green,
> > +		       colors[location].blue);
> > 
> >   }
> > 
> > -static ssize_t zone_set(struct device *dev, struct device_attribute *attr,
> > -			const char *buf, size_t count)
> > +static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
> > +			  const char *buf, size_t count, u8 location)
> >   {
> > -	struct platform_zone *target_zone;
> >   	int ret;
> > -	target_zone = match_zone(attr);
> > -	if (target_zone == NULL) {
> > -		pr_err("alienware-wmi: invalid target zone\n");
> > -		return 1;
> > -	}
> > -	ret = parse_rgb(buf, &target_zone->colors);
> > +
> > +	ret = parse_rgb(buf, &colors[location]);
> >   	if (ret)
> >   		return ret;
> > -	ret = alienware_update_led(target_zone);
> > +
> > +	ret = alienware_update_led(location);
> > +
> >   	return ret ? ret : count;
> >   }
> > 
> > +#define ALIENWARE_ZONE_SHOW_FUNC(_num)					\
> > +	static ssize_t zone0##_num##_show(struct device *dev,		\
> > +					struct device_attribute *attr,	\
> > +					char *buf)			\
> > +	{								\
> > +		return zone_show(dev, attr, buf, _num);			\
> > +	}
> > +
> > +#define ALIENWARE_ZONE_STORE_FUNC(_num)					\
> > +	static ssize_t zone0##_num##_store(struct device *dev,		\
> > +					struct device_attribute *attr,	\
> > +					const char *buf, size_t count)	\
> > +	{								\
> > +		return zone_store(dev, attr, buf, count, _num);		\
> > +	}
> > +
> > +#define ALIENWARE_ZONE_ATTR(_num)					\
> > +	ALIENWARE_ZONE_SHOW_FUNC(_num)					\
> > +	ALIENWARE_ZONE_STORE_FUNC(_num)					\
> > +	static DEVICE_ATTR_RW(zone0##_num)
> > +
> > +ALIENWARE_ZONE_ATTR(0);
> > +ALIENWARE_ZONE_ATTR(1);
> > +ALIENWARE_ZONE_ATTR(2);
> > +ALIENWARE_ZONE_ATTR(3);
> 
> I know that this will result in a bit of boilerplate code, but please do not use such macros.
> They have a habit of confusing static code analysis tools.

Ack.

I'll drop this macros, checkpatch also hates the last one.

> 
> > +
> >   /*
> >    * Lighting control state device attribute (Global)
> >    */
> > @@ -578,6 +571,33 @@ static ssize_t lighting_control_state_store(struct device *dev,
> > 
> >   static DEVICE_ATTR_RW(lighting_control_state);
> > 
> > +static umode_t zone_attr_visible(struct kobject *kobj,
> > +				 struct attribute *attr, int n)
> > +{
> > +	return n < quirks->num_zones + 1 ? 0644 : 0;
> 
> Where is this function used?

It gets picked up by DEFINE_SYSFS_GROUP_VISIBLE to manage individual
attributes permissions.

> 
> Thanks,
> Armin Wolf
> 
> > +}
> > +
> > +static bool zone_group_visible(struct kobject *kobj)
> > +{
> > +	return quirks->num_zones > 0;
> > +}
> > +DEFINE_SYSFS_GROUP_VISIBLE(zone);
> > +
> > +static struct attribute *zone_attrs[] = {
> > +	&dev_attr_lighting_control_state.attr,
> > +	&dev_attr_zone00.attr,
> > +	&dev_attr_zone01.attr,
> > +	&dev_attr_zone02.attr,
> > +	&dev_attr_zone03.attr,
> > +	NULL
> > +};
> > +
> > +static struct attribute_group zone_attribute_group = {
> > +	.name = "rgb_zones",
> > +	.is_visible = SYSFS_GROUP_VISIBLE(zone),
> > +	.attrs = zone_attrs,
> > +};
> > +
> >   /*
> >    * LED Brightness (Global)
> >    */
> > @@ -606,7 +626,7 @@ static void global_led_set(struct led_classdev *led_cdev,
> >   	if (interface == WMAX)
> >   		ret = wmax_brightness(brightness);
> >   	else
> > -		ret = alienware_update_led(&zone_data[0]);
> > +		ret = alienware_update_led(0);
> >   	if (ret)
> >   		pr_err("LED brightness update failed\n");
> >   }
> > @@ -624,9 +644,6 @@ static struct led_classdev global_led = {
> > 
> >   static int alienware_zone_init(struct platform_device *dev)
> >   {
> > -	u8 zone;
> > -	char *name;
> > -
> >   	if (interface == WMAX) {
> >   		lighting_control_state = WMAX_RUNNING;
> >   	} else if (interface == LEGACY) {
> > @@ -635,65 +652,12 @@ static int alienware_zone_init(struct platform_device *dev)
> >   	global_led.max_brightness = 0x0F;
> >   	global_brightness = global_led.max_brightness;
> > 
> > -	/*
> > -	 *      - zone_dev_attrs num_zones + 1 is for individual zones and then
> > -	 *        null terminated
> > -	 *      - zone_attrs num_zones + 2 is for all attrs in zone_dev_attrs +
> > -	 *        the lighting control + null terminated
> > -	 *      - zone_data num_zones is for the distinct zones
> > -	 */
> > -	zone_dev_attrs =
> > -	    kcalloc(quirks->num_zones + 1, sizeof(struct device_attribute),
> > -		    GFP_KERNEL);
> > -	if (!zone_dev_attrs)
> > -		return -ENOMEM;
> > -
> > -	zone_attrs =
> > -	    kcalloc(quirks->num_zones + 2, sizeof(struct attribute *),
> > -		    GFP_KERNEL);
> > -	if (!zone_attrs)
> > -		return -ENOMEM;
> > -
> > -	zone_data =
> > -	    kcalloc(quirks->num_zones, sizeof(struct platform_zone),
> > -		    GFP_KERNEL);
> > -	if (!zone_data)
> > -		return -ENOMEM;
> > -
> > -	for (zone = 0; zone < quirks->num_zones; zone++) {
> > -		name = kasprintf(GFP_KERNEL, "zone%02hhX", zone);
> > -		if (name == NULL)
> > -			return 1;
> > -		sysfs_attr_init(&zone_dev_attrs[zone].attr);
> > -		zone_dev_attrs[zone].attr.name = name;
> > -		zone_dev_attrs[zone].attr.mode = 0644;
> > -		zone_dev_attrs[zone].show = zone_show;
> > -		zone_dev_attrs[zone].store = zone_set;
> > -		zone_data[zone].location = zone;
> > -		zone_attrs[zone] = &zone_dev_attrs[zone].attr;
> > -		zone_data[zone].attr = &zone_dev_attrs[zone];
> > -	}
> > -	zone_attrs[quirks->num_zones] = &dev_attr_lighting_control_state.attr;
> > -	zone_attribute_group.attrs = zone_attrs;
> > -
> > -	led_classdev_register(&dev->dev, &global_led);
> > -
> > -	return sysfs_create_group(&dev->dev.kobj, &zone_attribute_group);
> > +	return led_classdev_register(&dev->dev, &global_led);
> >   }
> > 
> >   static void alienware_zone_exit(struct platform_device *dev)
> >   {
> > -	u8 zone;
> > -
> > -	sysfs_remove_group(&dev->dev.kobj, &zone_attribute_group);
> >   	led_classdev_unregister(&global_led);
> > -	if (zone_dev_attrs) {
> > -		for (zone = 0; zone < quirks->num_zones; zone++)
> > -			kfree(zone_dev_attrs[zone].attr.name);
> > -	}
> > -	kfree(zone_dev_attrs);
> > -	kfree(zone_data);
> > -	kfree(zone_attrs);
> >   }
> > 
> >   static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
> > @@ -1143,6 +1107,7 @@ static void remove_thermal_profile(void)
> >    * Platform Driver
> >    */
> >   static const struct attribute_group *alienfx_groups[] = {
> > +	&zone_attribute_group,
> >   	&hdmi_attribute_group,
> >   	&amplifier_attribute_group,
> >   	&deepsleep_attribute_group,
