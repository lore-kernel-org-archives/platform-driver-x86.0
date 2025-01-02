Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B963C2114;
	Thu,  2 Jan 2025 19:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735846616; cv=none; b=Kr919HXl1VkYqme572mRNETuOBUneFJ2OsiPz1qG8CnrcbJZMigqlUaBQY0HZ/Pq3IuWYZiT8Q2ejtipfsDOc9kpqK7ZHMPbvPw6qdjdnBZeKtFo80sbU/mmaUuDJiXXjEJqJ1fb1aTH2vzU79V/izL5Zn7bN9Hjd70ZubgPLy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735846616; c=relaxed/simple;
	bh=ZpHhm/OQLELX9BKa1hoHNjUqhU5DG43ZfLOVxqI4u1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QzV7qs5k+hEh59jXBev2vooQy8xOtffPze+1JYZ6xXjvibX/K/6MxuOpUWBlpjQz2fe2Tynv7/Zch5p8zTNuo1EmFZbyVeneVqnvvpqvkbB9/XgFg15t26c4G5JHZI26+wcl9OwjMoEjdz/vEgujmxDsEKC4xI0rqwi/hxUGgmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+GxHM1r; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+GxHM1r"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b85d5cc39eso1280120885a.3;
        Thu, 02 Jan 2025 11:36:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735846613; x=1736451413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Et57b1flzVo9BJua5IeNU1n7B4Ul86UhB5zcowYl6Os=;
        b=j+GxHM1rMrf4IQifT78PftPzjqep4PWpymGognZKbCl5tlX24FT2Eg8pldvrAJbwKu
         v2Q29yULBSZr6GPFxUhdrA+Pu594BOF8OrRV4nfbZzpFzYy31Bm9D/Ti7ntTMUG2+bRy
         54sIxvvvs31w1D1xc6YknGcKgm74svkSmEH1LyVSAEMMu3Q2RXj3q0XX1C9SYYXlzLHo
         gnoLqvw6OCeyx4klU9aXuMgPuqjnjT1G5u+Q7e63V5SZodsS+6QoSZj3C8Fi7klOjeEb
         HSsh4VyiQGYjjRry8B9dniR2CzYd8Ni4sIajtkNMFcRGTINP2xuSTSTGjY6ug5+n6YDx
         ejYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735846613; x=1736451413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Et57b1flzVo9BJua5IeNU1n7B4Ul86UhB5zcowYl6Os=;
        b=Smic67d5B31gs731xO82qOw2eo1ZM0nlu9sl2rb42MONJXbYY0rk6xxlkUpkt4AiUl
         qi92uN0zLBB2VPAiEJ0LIGKkyBiusVA2ekPSyhAt8YBLvReAk9WXO6rPYIGqaAsC8X2L
         8QdAXd/tzPicWG3okewnJ6wEzythPpih7C5oKg6HAGM8EYXQf7u6Q296uvVBoEzxZkb8
         yOeb87ANrv7zFtmtL9wg9uxF/ZWlj9B6q4yzSkXeSFXbOkIaYTHt5JPbuZFM1IOSOHUp
         erSHl0iVHpQHER6RkNc4/3ALTCKE/w23B21Zwvkpb6mzIH0wWzKe611NihIP0mjMSmIX
         9ANA==
X-Forwarded-Encrypted: i=1; AJvYcCUC1sAHcUcGFMBdqZVx58IiJO5AH8F3sj86x67HEZ1TXwepgC+u+pMrX9moh9HX0luRSe8o5FenSVE4L+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/acbs+h0RHiwKEXEu80KXZmbOJPNvJ/Ze2hMGrGA+5738kaju
	+jlN2BVgFgEYDcPVDpCTj6ITk4TP/4GK88Lpiby+ArwHUEE7wKht
X-Gm-Gg: ASbGncvGT11LcPXCvhDoaviFehHXXTNUSpwII8Z+BfRIVtPZIE3FWF8lfGJHaZEWhpV
	u6rmOeXUr1kNY1ImzV7o0UnZi7c+Wuw9Ub0LQKe+a/xoAm/C+fcHdoYbDbGI0JM1NnQNQYQ50C7
	o+CWV1RcovmeZJgv+A5oix49EZXp9hvNN+YuWqtWcuCW/pmwN26wIRlH8/Dw9L5Rzw9Yp+Q40jP
	xOVO6ilpqAKcSU/1nBh9jo4xF8c4RFk+Fs3PcRFceljkYPXPy7vveOy
X-Google-Smtp-Source: AGHT+IG0MuvgUky0sIH9+4fPVCBGzjWWspD4tb43NE+Zdf40K5gpcMkRajkNEJkvJH/rK797pBU/Aw==
X-Received: by 2002:a05:620a:26a4:b0:7b7:106a:19b2 with SMTP id af79cd13be357-7b9ba760557mr6893935785a.23.1735846613564;
        Thu, 02 Jan 2025 11:36:53 -0800 (PST)
Received: from alphacentauri ([2800:bf0:179:113e:f067:4e25:4298:6451])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46a3e6a6d1dsm138151671cf.45.2025.01.02.11.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 11:36:53 -0800 (PST)
Date: Thu, 2 Jan 2025 14:36:49 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
	hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org, 
	mario.limonciello@amd.com
Subject: Re: [PATCH v2 10/20] alienware-wmi: Refactor LED control methods
Message-ID: <wqpg2s73tasnrqepdpho3bhjok6ayxi7m4l2fwlpoz2sleajqq@2au7w7nhghra>
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-12-kuurtb@gmail.com>
 <70926253-9224-413d-ab54-27e24905278a@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70926253-9224-413d-ab54-27e24905278a@gmx.de>

On Thu, Jan 02, 2025 at 05:29:42PM +0100, Armin Wolf wrote:
> Am 29.12.24 um 20:44 schrieb Kurt Borja:
> 
> > Both WMI devices handled by this module specify a distinct interface for
> > LED control. Previously this module handled this by dynamically adapting
> > arguments passed to wmi_evaluate_method() based on the `interface`
> > global variable.
> > 
> > To avoid the use of global variables, and enable the migration to
> > non-deprecated WMI methods, let the WMI drivers define upd_led and
> > upd_brightness operations, which completely replace
> > alienware_update_led() and wmax_brightness().
> > 
> > Also define alienware_wmi_command(), which serves as a wrapper for
> > wmidev_evaluate_method(). This new method is very similar to
> > alienware_wmax_command() but is WMI device agnostic.
> > 
> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> > ---
> >   drivers/platform/x86/dell/alienware-wmi.c | 164 ++++++++++++++--------
> >   1 file changed, 102 insertions(+), 62 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index 512384635c4c..494a3772065c 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -418,12 +418,42 @@ struct alienfx_priv {
> >   	u8 lighting_control_state;
> >   };
> > 
> > +struct alienfx_ops {
> > +	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
> > +		       u8 location);
> > +	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *wdev,
> > +			      u8 brightness);
> > +};
> > +
> >   struct alienfx_platdata {
> >   	struct wmi_device *wdev;
> > +	struct alienfx_ops ops;
> >   };
> > 
> >   static u8 interface;
> > 
> > +static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
> > +				 void *in_args, size_t in_size, u32 *out_data)
> > +{
> > +	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
> > +	struct acpi_buffer in = {in_size, in_args};
> > +	union acpi_object *obj;
> > +	acpi_status ret;
> > +
> > +	ret = wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &out : NULL);
> > +	if (ACPI_FAILURE(ret))
> > +		return -EIO;
> > +
> > +	obj = out.pointer;
> > +
> > +	if (obj && obj->type == ACPI_TYPE_INTEGER) {
> > +		*out_data = (u32)obj->integer.value;
> > +		kfree(out.pointer);
> 
> If obj->type is not ACPI_TYPE_INTEGER then we have a memory leak here, so please always free obj.
> Also you will dereference a NULL pointer if out_data is NULL, please check this.

I was a bit careless when refactoring this method, I'll fix it.

> 
> Thanks,
> Armin Wolf
> 
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   /*
> >    * Helpers used for zone control
> >    */
> > @@ -454,46 +484,6 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
> >   /*
> >    * Individual RGB zone control
> >    */
> > -static int alienware_update_led(struct alienfx_priv *priv, u8 location)
> > -{
> > -	int method_id;
> > -	acpi_status status;
> > -	char *guid;
> > -	struct acpi_buffer input;
> > -	struct legacy_led_args legacy_args;
> > -	struct wmax_led_args wmax_basic_args;
> > -	if (interface == WMAX) {
> > -		wmax_basic_args.led_mask = 1 << location;
> > -		wmax_basic_args.colors = priv->colors[location];
> > -		wmax_basic_args.state = priv->lighting_control_state;
> > -		guid = WMAX_CONTROL_GUID;
> > -		method_id = WMAX_METHOD_ZONE_CONTROL;
> > -
> > -		input.length = sizeof(wmax_basic_args);
> > -		input.pointer = &wmax_basic_args;
> > -	} else {
> > -		legacy_args.colors = priv->colors[location];
> > -		legacy_args.brightness = priv->global_brightness;
> > -		legacy_args.state = 0;
> > -		if (priv->lighting_control_state == LEGACY_BOOTING ||
> > -		    priv->lighting_control_state == LEGACY_SUSPEND) {
> > -			guid = LEGACY_POWER_CONTROL_GUID;
> > -			legacy_args.state = priv->lighting_control_state;
> > -		} else
> > -			guid = LEGACY_CONTROL_GUID;
> > -		method_id = location + 1;
> > -
> > -		input.length = sizeof(legacy_args);
> > -		input.pointer = &legacy_args;
> > -	}
> > -	pr_debug("alienware-wmi: guid %s method %d\n", guid, method_id);
> > -
> > -	status = wmi_evaluate_method(guid, 0, method_id, &input, NULL);
> > -	if (ACPI_FAILURE(status))
> > -		pr_err("alienware-wmi: zone set failure: %u\n", status);
> > -	return ACPI_FAILURE(status);
> > -}
> > -
> >   static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
> >   			 char *buf, u8 location)
> >   {
> > @@ -510,13 +500,14 @@ static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
> >   {
> >   	struct alienfx_priv *priv = dev_get_drvdata(dev);
> >   	struct color_platform *colors = &priv->colors[location];
> > +	struct alienfx_platdata *pdata = dev_get_platdata(dev);
> >   	int ret;
> > 
> >   	ret = parse_rgb(buf, colors);
> >   	if (ret)
> >   		return ret;
> > 
> > -	ret = alienware_update_led(priv, location);
> > +	ret = pdata->ops.upd_led(priv, pdata->wdev, location);
> > 
> >   	return ret ? ret : count;
> >   }
> > @@ -649,36 +640,17 @@ static struct attribute_group zone_attribute_group = {
> >   /*
> >    * LED Brightness (Global)
> >    */
> > -static int wmax_brightness(int brightness)
> > -{
> > -	acpi_status status;
> > -	struct acpi_buffer input;
> > -	struct wmax_brightness_args args = {
> > -		.led_mask = 0xFF,
> > -		.percentage = brightness,
> > -	};
> > -	input.length = sizeof(args);
> > -	input.pointer = &args;
> > -	status = wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
> > -				     WMAX_METHOD_BRIGHTNESS, &input, NULL);
> > -	if (ACPI_FAILURE(status))
> > -		pr_err("alienware-wmi: brightness set failure: %u\n", status);
> > -	return ACPI_FAILURE(status);
> > -}
> > -
> >   static void global_led_set(struct led_classdev *led_cdev,
> >   			   enum led_brightness brightness)
> >   {
> >   	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
> >   						 global_led);
> > +	struct alienfx_platdata *pdata = dev_get_platdata(&priv->pdev->dev);
> >   	int ret;
> > 
> >   	priv->global_brightness = brightness;
> > 
> > -	if (interface == WMAX)
> > -		ret = wmax_brightness(brightness);
> > -	else
> > -		ret = alienware_update_led(priv, 0);
> > +	ret = pdata->ops.upd_brightness(priv, pdata->wdev, brightness);
> >   	if (ret)
> >   		pr_err("LED brightness update failed\n");
> >   }
> > @@ -1247,10 +1219,49 @@ static void alienware_alienfx_exit(struct wmi_device *wdev)
> >   /*
> >    * Legacy WMI driver
> >    */
> > +static int legacy_wmi_update_led(struct alienfx_priv *priv,
> > +				 struct wmi_device *wdev, u8 location)
> > +{
> > +	struct legacy_led_args legacy_args = {
> > +		.colors = priv->colors[location],
> > +		.brightness = priv->global_brightness,
> > +		.state = 0,
> > +	};
> > +	struct acpi_buffer input;
> > +	acpi_status status;
> > +
> > +	if (legacy_args.state != LEGACY_RUNNING) {
> > +		legacy_args.state = priv->lighting_control_state;
> > +
> > +		input.length = sizeof(legacy_args);
> > +		input.pointer = &legacy_args;
> > +
> > +		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
> > +					     location + 1, &input, NULL);
> > +		if (ACPI_FAILURE(status))
> > +			return -EIO;
> > +
> > +		return 0;
> > +	}
> > +
> > +	return alienware_wmi_command(wdev, location + 1, &legacy_args,
> > +				     sizeof(legacy_args), NULL);
> > +}
> > +
> > +static int legacy_wmi_update_brightness(struct alienfx_priv *priv,
> > +					struct wmi_device *wdev, u8 brightness)
> > +{
> > +	return legacy_wmi_update_led(priv, wdev, 0);
> > +}
> > +
> >   static int legacy_wmi_probe(struct wmi_device *wdev, const void *context)
> >   {
> >   	struct alienfx_platdata pdata = {
> >   		.wdev = wdev,
> > +		.ops = {
> > +			.upd_led = legacy_wmi_update_led,
> > +			.upd_brightness = legacy_wmi_update_brightness,
> > +		},
> >   	};
> > 
> >   	return alienware_alienfx_setup(&pdata);
> > @@ -1290,10 +1301,39 @@ static void __exit alienware_legacy_wmi_exit(void)
> >   /*
> >    * WMAX WMI driver
> >    */
> > +static int wmax_wmi_update_led(struct alienfx_priv *priv,
> > +			       struct wmi_device *wdev, u8 location)
> > +{
> > +	struct wmax_led_args in_args = {
> > +		.led_mask = 1 << location,
> > +		.colors = priv->colors[location],
> > +		.state = priv->lighting_control_state,
> > +	};
> > +
> > +	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args,
> > +				     sizeof(in_args), NULL);
> > +}
> > +
> > +static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
> > +				      struct wmi_device *wdev, u8 brightness)
> > +{
> > +	struct wmax_brightness_args in_args = {
> > +		.led_mask = 0xFF,
> > +		.percentage = brightness,
> > +	};
> > +
> > +	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
> > +				     sizeof(in_args), NULL);
> > +}
> > +
> >   static int wmax_wmi_probe(struct wmi_device *wdev, const void *context)
> >   {
> >   	struct alienfx_platdata pdata = {
> >   		.wdev = wdev,
> > +		.ops = {
> > +			.upd_led = wmax_wmi_update_led,
> > +			.upd_brightness = wmax_wmi_update_brightness,
> > +		},
> >   	};
> >   	struct platform_device *pdev;
> >   	int ret;
