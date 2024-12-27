Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B647BB1D;
	Fri, 27 Dec 2024 04:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735275178; cv=none; b=rjjD9GrAObr9eChj5Snie1cyGy1aFsG7/WGSGKxhxz4Xr+biDt4J7j61NKikKkHePXeev9R+o0IJD8URc22NUcH/n9TOu/HW65i+yVFi4RdNSPvKzHE6sd9lVLjkUiCQWkRj54cnk++YJX0z0TXnAiK/xNOMkYkIlZPj7IHuby4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735275178; c=relaxed/simple;
	bh=zlgYlKdi/D+opLDDAggAXQZZaL/t451Xiar1aqHvfio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D70tQwxI/WAZ9+ZQL2OuP9an04AdGNMxGR0GJZdmp+d37udITiCFejQiu/ym3JLS2aOsHBQH+/qOLl36d9KxYulyOy59tvzq173ZAzKMGoHK1OfqynnNRC+BpgRMEJF854VGZpoCLFMUBq9enwl+nKTCm9omK1DrQKnQuYKDYws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuJ6Y5M4; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuJ6Y5M4"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e53a5ff2233so5781075276.3;
        Thu, 26 Dec 2024 20:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735275175; x=1735879975; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yi/bIo5tCm3fJ3bEa7uCKaJIpyP7AsK4gH95WWQ5uQI=;
        b=GuJ6Y5M4C8y56HwEwzn35X4HpGLy36kcuZ/1QemIdYsdjfRpmlYFrVcbVxER8wpokm
         aMTMCmgB6bgr62E+9vaPJy1SUSo+jG/5aNOgFxGnZIcFYyYupIK0wtDLSv95HRYBnJC8
         XWdFbbIlgxWMtbeVwmMNW/4vhKL8GRyQtTb+p2Wy0LZZLUxNSqYZ/+Ad7piLzJ4GCCt4
         Sok7X6zszu6hohfxIs7Qiv7804uJAqPfrd9Gor4M4kg1RClrctvwSYnW6gZXhKyV6zVm
         14aWk9O+EnKD7+E+PVA5Xn40PWdZqb//hmgQ3vx5rRdF71tNkrHKsCVzFPetR/NUhq0Y
         qddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735275175; x=1735879975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yi/bIo5tCm3fJ3bEa7uCKaJIpyP7AsK4gH95WWQ5uQI=;
        b=b9E/zIQHnvHN2eEo8x84O0F9hpDlBWeCEWXpGiV5MLxRkR+RfYgM2vCCZJpnh5CLi8
         nPIZPtXlkmTix5NM0ys4ONCtjVqze00iqseXHbWVuUyhAq/Gt9+HGgfIpSuSNHjSwUds
         VG3udBzKSOtXhJyADyhI7JMMHLhBjSObzH7H22ZDEoEww2v+lDohiDXUuBlRSWt+SFg1
         75y9ZhggtqmdCFsknDoTJ8YJHQ+xJ7tBpjDcD2SetQxnE2s//olb08yI2tO+RdGDlxFG
         XZsDcdSUAMb9nJOi2xw7r2foPMn+jWzic23hodplXCpiKjGxGvH8NDeztqZTw49jWum+
         Aksg==
X-Forwarded-Encrypted: i=1; AJvYcCWx7+9dfkpmUoSMJWGqRgk3ccRULrQREqm7sdXvlj1jsXiF11Q26qXRFWV+Jmvw6OECjXXgiuOakMHNdK0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj1NYhAjK2PTUPoEvij6y+d2OvFCwep9ioJTFHxa7fpEeqondx
	9wTsu7oi91EBwb0YfpqA2SmSvqLhkdwPgDNuTxQ+GRoJA04uTzrZ
X-Gm-Gg: ASbGncteAIXytbW6oce07tcHAJvTgBmuAkxdY4F10NzVuqf8L217MylUV+eEiVtI9rV
	W1nuPo9gZib0PsQpkkLz0sxX0NksoLOPGtuoEPJHFbV8Ti4iFq+uZWgPT+H41qtI/lM+q4qxzjy
	C2BkNlM0mEScasKe5Wcof1dTmv5UFLAmHzj2C2VDvFOu4Hroe1wOmguGhIF/Ny9vBLGLAccAxUV
	CSehN9Ybpabg9TgWv+pRtEclgN2MnhQwLUGB4jkV7CYBjIubqUI9A==
X-Google-Smtp-Source: AGHT+IFeQ/A49zve3C/09hXf2WiBBsBenfqwRyjOpL3VP3LFK+Go0RG/J10Wg8n8oEjPOd9xTq8mtg==
X-Received: by 2002:a05:690c:6b02:b0:6ef:5ca3:d0f1 with SMTP id 00721157ae682-6f3f823f1d7mr175327107b3.40.1735275175378;
        Thu, 26 Dec 2024 20:52:55 -0800 (PST)
Received: from alphacentauri ([2800:bf0:82:1159:1ea9:11b1:7af9:1277])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f3e77ed515sm41023497b3.81.2024.12.26.20.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 20:52:54 -0800 (PST)
Date: Thu, 26 Dec 2024 23:52:51 -0500
From: Kurt Borja <kuurtb@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com, 
	mario.limonciello@amd.com, hdegoede@redhat.com, linux-kernel@vger.kernel.org, 
	Dell.Client.Kernel@dell.com
Subject: Re: [PATCH 10/20] alienware-wmi: Refactor LED control methods
Message-ID: <6la47bffw53b7gxgbtr4fozkdiikpslwn6ffj7j5pws6oadhfu@npvigz4ohxfc>
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-11-kuurtb@gmail.com>
 <c42f1880-c5e5-4b5d-9e3d-d9136ab2d002@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c42f1880-c5e5-4b5d-9e3d-d9136ab2d002@gmx.de>

On Fri, Dec 27, 2024 at 04:41:36AM +0100, Armin Wolf wrote:
> Am 21.12.24 um 06:59 schrieb Kurt Borja:
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
> >   drivers/platform/x86/dell/alienware-wmi.c | 180 ++++++++++++++--------
> >   1 file changed, 118 insertions(+), 62 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
> > index c4ca141d628e..bcf3b2f80dfd 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -417,12 +417,46 @@ struct alienfx_priv {
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
> > +static acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 method_id,
> > +					 void *in_args, size_t in_size, u32 *out_data)
> 
> Please return a errno here instead of acpi_status.

Ack!

> 
> > +{
> > +	struct acpi_buffer out = {ACPI_ALLOCATE_BUFFER, NULL};
> > +	struct acpi_buffer in = {in_size, in_args};
> > +	union acpi_object *obj;
> > +	acpi_status ret;
> > +
> > +	if (out_data) {
> > +		ret = wmidev_evaluate_method(wdev, 0, method_id, &in, &out);
> > +		if (ACPI_FAILURE(ret))
> > +			goto out_free_ptr;
> 
> Just return -EIO here as out.pointer will contain no valid data in this case.

I wasn't sure of this. Thanks.

> 
> > +
> > +		obj = (union acpi_object *)out.pointer;
> 
> Unnecessary cast.

Ack.

> 
> > +
> > +		if (obj && obj->type == ACPI_TYPE_INTEGER)
> > +			*out_data = (u32)obj->integer.value;
> 
> Please move the code for freeing "obj" to this line.

Ack.

> 
> > +	} else {
> > +		ret = wmidev_evaluate_method(wdev, 0, method_id, &in, NULL);
> > +	}
> > +
> > +out_free_ptr:
> > +	kfree(out.pointer);
> > +	return ret;
> > +}
> > +
> >   /*
> >    * Helpers used for zone control
> >    */
> > @@ -453,46 +487,6 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
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
> > @@ -510,18 +504,20 @@ static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
> >   static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
> >   			  const char *buf, size_t count, u8 location)
> >   {
> > +	struct alienfx_platdata *pdata;
> >   	struct color_platform *colors;
> >   	struct alienfx_priv *priv;
> >   	int ret;
> > 
> >   	priv = dev_get_drvdata(dev);
> > +	pdata = dev_get_platdata(dev);
> >   	colors = &priv->colors[location];
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
> > @@ -628,35 +624,19 @@ static struct attribute_group zone_attribute_group = {
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
> > +	struct alienfx_platdata *pdata;
> >   	struct alienfx_priv *priv;
> >   	int ret;
> > 
> >   	priv = container_of(led_cdev, struct alienfx_priv, global_led);
> > +	pdata = dev_get_platdata(&priv->pdev->dev);
> > +
> >   	priv->global_brightness = brightness;
> > -	if (interface == WMAX)
> > -		ret = wmax_brightness(brightness);
> > -	else
> > -		ret = alienware_update_led(priv, 0);
> > +
> > +	ret = pdata->ops.upd_brightness(priv, pdata->wdev, brightness);
> >   	if (ret)
> >   		pr_err("LED brightness update failed\n");
> >   }
> > @@ -1224,10 +1204,47 @@ static void alienware_alienfx_exit(struct wmi_device *wdev)
> >   /*
> >    * Legacy WMI driver
> >    */
> > +static int legacy_wmi_update_led(struct alienfx_priv *priv,
> > +				 struct wmi_device *wdev, u8 location)
> > +{
> > +	struct legacy_led_args legacy_args;
> > +	struct acpi_buffer input;
> > +	acpi_status status;
> > +
> > +	legacy_args.colors = priv->colors[location];
> > +	legacy_args.brightness = priv->global_brightness;
> > +	legacy_args.state = priv->lighting_control_state;
> 
> The original code set "legacy_args.state" to "0" if "priv->lighting_control_state" was "LEGACY_RUNNING".
> Please keep this behavior.

I missed this. Thanks.

> 
> Thanks,
> Armin Wolf
> 
> > +
> > +	input.length = sizeof(legacy_args);
> > +	input.pointer = &legacy_args;
> > +
> > +	if (legacy_args.state == LEGACY_RUNNING)
> > +		status = alienware_wmi_command(wdev, location + 1, &legacy_args,
> > +					       sizeof(legacy_args), NULL);
> > +	else
> > +		status = wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
> > +					     location + 1, &input, NULL);
> > +
> > +	if (ACPI_FAILURE(status))
> > +		return -EIO;
> > +
> > +	return 0;
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
> > @@ -1267,10 +1284,49 @@ static void __exit alienware_legacy_wmi_exit(void)
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
> > +	acpi_status status;
> > +
> > +	status = alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL,
> > +				       &in_args, sizeof(in_args), NULL);
> > +	if (ACPI_FAILURE(status))
> > +		return -EIO;
> > +
> > +	return 0;
> > +}
> > +
> > +static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
> > +				      struct wmi_device *wdev, u8 brightness)
> > +{
> > +	struct wmax_brightness_args in_args = {
> > +		.led_mask = 0xFF,
> > +		.percentage = brightness,
> > +	};
> > +	acpi_status status;
> > +
> > +	status = alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
> > +				       sizeof(in_args), NULL);
> > +	if (ACPI_FAILURE(status))
> > +		return -EIO;
> > +
> > +	return 0;
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
> >   	int ret = 0;
> > 
