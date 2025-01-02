Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436BA1B5EBC;
	Thu,  2 Jan 2025 18:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735842809; cv=none; b=J6rEVha0fPDSyxBRP7I6b3UAtw5w9+1N5QMYEejwOVzvFo3wkbWv/jNagHCyl9qeU6TwyWjtNlDELUpVwtFF5sTGHQybRZadZdZSUbbrFG3tTjqQwkiRic/ccX9oUl+tBJBAARjUpIFHRodEOz3lqsy7z1tmWwQUQENodpMFGvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735842809; c=relaxed/simple;
	bh=UCia7Yypql+v+8dJmWDiKwflt8wCxF7IccC6k4C705E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgQwuAA7SZMNnsVLf0bmefZb//+Lz3MD2/Lj9Ub/K1jPwJvVZqkxRR63m8ctZMsr3q7s1qGdwJqG/zgS4xrGAOBc6Tu1WveJTvN8yp9y72l+1bJJtp4fiaauR8WAgDXjLi0Ertm+BUpwC6O8utbEM7ly+807gsu1uzh+In/QrS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MSdsJxZg; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MSdsJxZg"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46741855f9bso104499991cf.2;
        Thu, 02 Jan 2025 10:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735842806; x=1736447606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fxi2hi3lkmG+/n//A1wcPL5BHeMRLDC2nybQQrGLvyM=;
        b=MSdsJxZgFUHMM5fLH6trze8KE+b3LTor1dsN3jnNx/mMRV9ok6TCC13wuEyLa6JpKn
         vt3ww9sGXkDvhAEYmKlWukQ6X/HznPBkT8DufMDKMj2yJExEFg42Owv1SsFxml+pGTqi
         KixPkLmVuMT3JMCpmWuUMP4H9zln/HDCye5KEIFY0UJavtqnKwVe3HWl4X0Lmo5G0Rre
         NaRLcHt8AjSNfnUVd9WZPcGEw/Ht7J+g+azOnttGuQ0KY0YGlm7aGx0ebVGUEhGbgt4A
         8z48VdMnizKFiBFvILbizvNqBkybe91IvpB7S0ObHGQJv3m6GpOn5TwbOx4vMTgH7Qvy
         xU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735842806; x=1736447606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fxi2hi3lkmG+/n//A1wcPL5BHeMRLDC2nybQQrGLvyM=;
        b=MVUH2FV2xKkwdvPlGwabj6oXc+E/ZugwLDI7qXoJ4qBSV2wtCFEkWjFcuuY2wXtFYH
         HOJfPQmZzBAl81nAY+yGSL9EYyw/bJ4o37aHHjWxV3a5y+82NVggowLCqVIzl2s2DPk4
         BNOrV/pjDbGdcwb885wZqXTPDtmlR7kEPuVYqO58zqJTgAi6MdMDuDfX/t2Hw1PeGYaR
         2qREYAELG0vvnwRG4xJnEyMoBMVUGmEnwOEYWkHWao9wcCSWQbFO/xIWDi8rQjG7ptzM
         6sadDcoFNl0Riwv9Jhh0JiFxqPDGBuE5aXB5ieLqvU3eVzmTcmE2Shfg1/qq/Zimf3CP
         a5Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUx5mvRO3hm2Tr8pUrpIu/M+/qXf7M67PyXTtWVOtUfE45j/HqwqI/YC3MBwy14C+hWkvM9Tx7VO5dwxO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2YSUwcBFFhKUWHHAQoT+uLR2S2LdxskRUk5JU94iiB1V/J9go
	q8QdmdxAI2PAoUtpxT+cEM12q+ATiQqj2HmvpTlHOuFaYhm1j7hf
X-Gm-Gg: ASbGncu6KqaC+mRZ371RArXrMGUE/A0PM3ZIvzBJF3TCwrfznxztJDcmJ/4y9qoNSrC
	ty8pnQyfyuBzkyXfOAYl/W8Rmm9kTqgNKRe6CFK2cUslnx42EaxlRNguaq8EsPQz7SnoI5jn48r
	6FuVjC0M3yL7bkblZhKXwmygZ1UDJjx/9DWHTPLPEmAGsIKAX29aVTw4tJboh4EKKKohVfKT5yh
	sbYea/MjDA2olHJ8lLN9Kl9Sr+lJP1kwLrl0Anir5CoHAEV/bw9Lg==
X-Google-Smtp-Source: AGHT+IHGX+dypyvhN2RNn/l0mXQwhgn9WphdG39JE9CJ0/QIuZrmDlJR106vTziaXaXL20KgIb4ufQ==
X-Received: by 2002:ac8:7d82:0:b0:467:622d:896c with SMTP id d75a77b69052e-46a4a99fb3emr792549741cf.46.1735842805854;
        Thu, 02 Jan 2025 10:33:25 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e677676sm138283421cf.20.2025.01.02.10.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:33:25 -0800 (PST)
Date: Thu, 2 Jan 2025 13:33:22 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	mario.limonciello@amd.com
Subject: Re: [PATCH v2 05/20] alienware-wmi: Improve rgb-zones group creation
Message-ID: <bkl2hhhquwmufuhx4mpt6age5idslkiw7lgh2mdcqpa43v5nxe@bu5wxi7h5s4t>
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-7-kuurtb@gmail.com>
 <abfad87b-4397-4421-a23d-318419bd0ccd@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abfad87b-4397-4421-a23d-318419bd0ccd@gmx.de>

On Thu, Jan 02, 2025 at 04:44:16PM +0100, Armin Wolf wrote:
> Am 29.12.24 um 20:44 schrieb Kurt Borja:
> 
> > Define zone_attrs statically and initialize zone_attribute_group with
> > platform driver's .dev_groups.
> > 
> > Drop match_zone() and instead pass a `location` argument to previous
> > show/store methods to access the correct `zone` LED state. On top of
> > that rename zone_set() -> zone_store() to be more consistent with sysfs
> > conventions.
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 209 +++++++++++-----------
> >   1 file changed, 102 insertions(+), 107 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index e010c94555e8..d97e5e15a8f2 100644
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
> > @@ -510,35 +484,84 @@ static int alienware_update_led(struct platform_zone *zone)
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
> > +static ssize_t zone00_show(struct device *dev, struct device_attribute *attr,
> > +			   char *buf)
> > +{
> > +	return zone_show(dev, attr, buf, 0);
> > +}
> > +
> > +static ssize_t zone00_store(struct device *dev, struct device_attribute *attr,
> > +			    const char *buf, size_t count)
> > +{
> > +	return zone_store(dev, attr, buf, count, 0);
> > +}
> > +
> > +DEVICE_ATTR_RW(zone00);
> > +
> > +static ssize_t zone01_show(struct device *dev, struct device_attribute *attr,
> > +			   char *buf)
> > +{
> > +	return zone_show(dev, attr, buf, 1);
> > +}
> > +
> > +static ssize_t zone01_store(struct device *dev, struct device_attribute *attr,
> > +			    const char *buf, size_t count)
> > +{
> > +	return zone_store(dev, attr, buf, count, 1);
> > +}
> > +
> > +DEVICE_ATTR_RW(zone01);
> > +
> > +static ssize_t zone02_show(struct device *dev, struct device_attribute *attr,
> > +			   char *buf)
> > +{
> > +	return zone_show(dev, attr, buf, 2);
> > +}
> > +
> > +static ssize_t zone02_store(struct device *dev, struct device_attribute *attr,
> > +			    const char *buf, size_t count)
> > +{
> > +	return zone_store(dev, attr, buf, count, 2);
> > +}
> > +
> > +DEVICE_ATTR_RW(zone02);
> > +
> > +static ssize_t zone03_show(struct device *dev, struct device_attribute *attr,
> > +			   char *buf)
> > +{
> > +	return zone_show(dev, attr, buf, 3);
> > +}
> > +
> > +static ssize_t zone03_store(struct device *dev, struct device_attribute *attr,
> > +			    const char *buf, size_t count)
> > +{
> > +	return zone_store(dev, attr, buf, count, 3);
> > +}
> > +
> > +DEVICE_ATTR_RW(zone03);
> > +
> >   /*
> >    * Lighting control state device attribute (Global)
> >    */
> > @@ -578,6 +601,33 @@ static ssize_t lighting_control_state_store(struct device *dev,
> > 
> >   static DEVICE_ATTR_RW(lighting_control_state);
> > 
> > +static umode_t zone_attr_visible(struct kobject *kobj,
> > +				 struct attribute *attr, int n)
> > +{
> > +	return n < quirks->num_zones + 1 ? 0644 : 0;
> 
> Please return attr->mode here instead of 0644. I would also prefer if you use a traditional if statement here.

Sure!

> 
> With this small issue being addressed:
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
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
> > @@ -606,7 +656,7 @@ static void global_led_set(struct led_classdev *led_cdev,
> >   	if (interface == WMAX)
> >   		ret = wmax_brightness(brightness);
> >   	else
> > -		ret = alienware_update_led(&zone_data[0]);
> > +		ret = alienware_update_led(0);
> >   	if (ret)
> >   		pr_err("LED brightness update failed\n");
> >   }
> > @@ -624,9 +674,6 @@ static struct led_classdev global_led = {
> > 
> >   static int alienware_zone_init(struct platform_device *dev)
> >   {
> > -	u8 zone;
> > -	char *name;
> > -
> >   	if (interface == WMAX) {
> >   		lighting_control_state = WMAX_RUNNING;
> >   	} else if (interface == LEGACY) {
> > @@ -635,65 +682,12 @@ static int alienware_zone_init(struct platform_device *dev)
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
> > @@ -1143,6 +1137,7 @@ static void remove_thermal_profile(void)
> >    * Platform Driver
> >    */
> >   static const struct attribute_group *alienfx_groups[] = {
> > +	&zone_attribute_group,
> >   	&hdmi_attribute_group,
> >   	&amplifier_attribute_group,
> >   	&deepsleep_attribute_group,
