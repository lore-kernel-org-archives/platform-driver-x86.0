Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E193184;
	Sun, 19 Jan 2025 16:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737305411; cv=none; b=KlXC/w/phKNt+cblw+oWXXf/x4q49Thswju8wWS3HCoVyR7POc6Z79mJmRVzXJpwCAdR/2Pio0hI9LOO8WgeVtlY0nI9N7HHgfIdQQY1vT/Yyas4IKY88JX90eWjePoDPdZfR49y/rSruyk8ucOGZAqTFQqR2oF7tuP4wz3esi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737305411; c=relaxed/simple;
	bh=uSAfXMIR33RiEZb4ylILwhkCZ3Mu0T62AbRIy4sRAZY=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=rN7NuEKze/2tep3bJ1Dwqopj5d+sfA8ESaG23xUDeK6OJPN0zPHWqwqP2lIGB3e0L8s3iFJBhSvWW7UsVRQQrtxrgVStukocNLeg4nYhTU+mqFASrUQW5F3gW9qHSbMEOxP/qiTO1g0bRnZvBAa87b5YIkPsxoH0E5/EznvQefU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NHhtAD5G; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NHhtAD5G"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-860f0e91121so2573833241.0;
        Sun, 19 Jan 2025 08:50:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737305408; x=1737910208; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flN3GX8KaJ/93ROtjzonBz2tANeDKcu6nnHzGexb92I=;
        b=NHhtAD5GTgqmBvG5DpRbvxBSGW+z6+jFpmLVrlNQhAv3It/hsYqoJWIbwO5FTLFBHM
         OSYliPVJIjGfxaIznzYkk24yjx+bG3DUwatOVfXnbKYJwXA/TTEBqJvDhrYorvlnoEnW
         Dkdx5VUmivuiShBdHsP20T/IrkfKsRcyYlEz/pSRnxCVRirGRy0iYr+n/gxyctuPOTu5
         BD/zNWLYiFy98L+k9shpLd/dP+SkD+/WBoLgjDfB0fzWqqjO+0oEaYzyVIW0RqqUx0uv
         O8YNL12zZnGWS35/HeA7dYMBKawY6rKc/rJKD04CLnSSgphxpZ0I3Di4kYovntcnKOrs
         ACzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737305408; x=1737910208;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=flN3GX8KaJ/93ROtjzonBz2tANeDKcu6nnHzGexb92I=;
        b=RbCXG5lBM5ScL8NcWA1Bl4W2JMIaBiS+feQaYX6/K9kv7zuF6rnKEg+UgVngjubTwM
         prUtEg5dfRjQgIbGpxCQUoDJa6AHFHMUwk4RqXsGZfqxCYRCqQXweeYuB2zAbVhhfPTT
         g7MXP8AN91r4w2Xpdg0FcYaljG09724eITCDFUwl3wP1eXgFDNN56+8BkOxhnIwpkHw+
         pEVhbu+hJxirxGEnlUvbJAdwlWs4n7AAj6jlg+Wx0lmJPH4NaQGVTYkcgyM4or8t7TSG
         RXJFWQrQsRjvroSpwakAXfKlmSelmJcndJNxDWH01Rh4qY0q1LG1pt4Hf6r0mI3t0Cci
         cb0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVm33zEY3cM0jaM5WVdG2nkoB1Ok50MBNj9Fq91vl/B9YhXJl1W8PQYlI0NFdZFajFWGH4dY4pdAQCbhmo=@vger.kernel.org, AJvYcCXQUExsGEPOzFFe0UKBVf7Q6Kyr23XWKGx9QzTfUeFGrM5vZ9CYJQMQhvn+vQhZOOovL4Gl3cEsbcx2jiqPSh3Pia0SsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgkE56QjyyyZgupvX/Us7GhYZbap227ppqkHn+016PoEGZj4Xk
	8S5+cTrAAH4qHyheEh+rWsh9SAHEq7fkLrAq0f+ECFd8Qb8uP6ch
X-Gm-Gg: ASbGncsgSzRX21by9sBGziBgZDyaMj8XA4vfBzn7HAOgRpuAqL6BznPBfWOWxiqA/5I
	nu82H+W+IeOv/O7dqcy4e1K5sP8HlFaoRjK6m02pUQqWgzFHzJOYZKYWMRMyZQerwVvhDYSNwGm
	/0ZhCjItUTuhGbBj3pSpH6lX0hrW5/b7VP1OXDQ3+9j9/qDHrQLb83vFTXfl6Crck+QgHD2ugaU
	q2MlmT7jqIB9NBDPYacgCnT7ZwujsnNkSzLtgSp41Xc3MPeqlgOS+SlrDz2gw==
X-Google-Smtp-Source: AGHT+IHMQKS8hvjClQBcaSsGY1Y8Ao8vD3mawgiF8jMPwq2c/28n2KI8TgYYc4GS802hmXlrSzZhAw==
X-Received: by 2002:a05:6122:2405:b0:516:1ab3:700e with SMTP id 71dfb90a1353d-51d7cc8c047mr6993702e0c.3.1737305408096;
        Sun, 19 Jan 2025 08:50:08 -0800 (PST)
Received: from localhost ([2800:bf0:82:1159:c837:3446:190b:188d])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51cf56f0c96sm1072844e0c.43.2025.01.19.08.50.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Jan 2025 08:50:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 19 Jan 2025 11:50:05 -0500
Message-Id: <D767D99TCHGY.1JLASDNB34INV@gmail.com>
To: "Armin Wolf" <W_Armin@gmx.de>, <platform-driver-x86@vger.kernel.org>
Cc: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Hans de Goede"
 <hdegoede@redhat.com>, <Dell.Client.Kernel@dell.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 04/14] platform/x86: alienware-wmi: Refactor LED
 control methods
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250117081347.8573-1-kuurtb@gmail.com>
 <20250117081347.8573-5-kuurtb@gmail.com>
 <f4fb94e7-fe31-4814-8396-a6846d7f18ff@gmx.de>
In-Reply-To: <f4fb94e7-fe31-4814-8396-a6846d7f18ff@gmx.de>

On Sat Jan 18, 2025 at 6:58 PM -05, Armin Wolf wrote:
> Am 17.01.25 um 09:13 schrieb Kurt Borja:
>
> > Both WMI devices handled by this module specify a distinct interface fo=
r
> > LED control. Previously this module handled this by dynamically adaptin=
g
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
> >   drivers/platform/x86/dell/alienware-wmi.c | 164 ++++++++++++++-------=
-
> >   1 file changed, 102 insertions(+), 62 deletions(-)
> >
> > diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfo=
rm/x86/dell/alienware-wmi.c
> > index 7356260f7f09..c9d9cf36b87b 100644
> > --- a/drivers/platform/x86/dell/alienware-wmi.c
> > +++ b/drivers/platform/x86/dell/alienware-wmi.c
> > @@ -417,12 +417,42 @@ struct alienfx_priv {
> >   	u8 lighting_control_state;
> >   };
> >
> > +struct alienfx_ops {
> > +	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
> > +		       u8 location);
> > +	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *w=
dev,
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
> > +static int alienware_wmi_command(struct wmi_device *wdev, u32 method_i=
d,
> > +				 void *in_args, size_t in_size, u32 *out_data)
> > +{
> > +	struct acpi_buffer out =3D {ACPI_ALLOCATE_BUFFER, NULL};
> > +	struct acpi_buffer in =3D {in_size, in_args};
> > +	union acpi_object *obj;
> > +	acpi_status ret;
> > +
> > +	ret =3D wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &o=
ut : NULL);
> > +	if (ACPI_FAILURE(ret))
> > +		return -EIO;
> > +
> > +	obj =3D out.pointer;
> > +
> > +	if (out_data && obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
> > +		*out_data =3D (u32)obj->integer.value;
>
> Please return an error here if out_data is true but obj is NULL or not of=
 ACPI_TYPE_INTEGER.

Sure.

>
> With this being fixed:
>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>

Thanks!=20

>
> > +
> > +	kfree(obj);
> > +
> > +	return 0;
> > +}
> > +
> >   /*
> >    * Helpers used for zone control
> >    */
> > @@ -453,46 +483,6 @@ static int parse_rgb(const char *buf, struct color=
_platform *colors)
> >   /*
> >    * Individual RGB zone control
> >    */
> > -static int alienware_update_led(struct alienfx_priv *priv, u8 location=
)
> > -{
> > -	int method_id;
> > -	acpi_status status;
> > -	char *guid;
> > -	struct acpi_buffer input;
> > -	struct legacy_led_args legacy_args;
> > -	struct wmax_led_args wmax_basic_args;
> > -	if (interface =3D=3D WMAX) {
> > -		wmax_basic_args.led_mask =3D 1 << location;
> > -		wmax_basic_args.colors =3D priv->colors[location];
> > -		wmax_basic_args.state =3D priv->lighting_control_state;
> > -		guid =3D WMAX_CONTROL_GUID;
> > -		method_id =3D WMAX_METHOD_ZONE_CONTROL;
> > -
> > -		input.length =3D sizeof(wmax_basic_args);
> > -		input.pointer =3D &wmax_basic_args;
> > -	} else {
> > -		legacy_args.colors =3D priv->colors[location];
> > -		legacy_args.brightness =3D priv->global_brightness;
> > -		legacy_args.state =3D 0;
> > -		if (priv->lighting_control_state =3D=3D LEGACY_BOOTING ||
> > -		    priv->lighting_control_state =3D=3D LEGACY_SUSPEND) {
> > -			guid =3D LEGACY_POWER_CONTROL_GUID;
> > -			legacy_args.state =3D priv->lighting_control_state;
> > -		} else
> > -			guid =3D LEGACY_CONTROL_GUID;
> > -		method_id =3D location + 1;
> > -
> > -		input.length =3D sizeof(legacy_args);
> > -		input.pointer =3D &legacy_args;
> > -	}
> > -	pr_debug("alienware-wmi: guid %s method %d\n", guid, method_id);
> > -
> > -	status =3D wmi_evaluate_method(guid, 0, method_id, &input, NULL);
> > -	if (ACPI_FAILURE(status))
> > -		pr_err("alienware-wmi: zone set failure: %u\n", status);
> > -	return ACPI_FAILURE(status);
> > -}
> > -
> >   static ssize_t zone_show(struct device *dev, struct device_attribute =
*attr,
> >   			 char *buf, u8 location)
> >   {
> > @@ -509,13 +499,14 @@ static ssize_t zone_store(struct device *dev, str=
uct device_attribute *attr,
> >   {
> >   	struct alienfx_priv *priv =3D dev_get_drvdata(dev);
> >   	struct color_platform *colors =3D &priv->colors[location];
> > +	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
> >   	int ret;
> >
> >   	ret =3D parse_rgb(buf, colors);
> >   	if (ret)
> >   		return ret;
> >
> > -	ret =3D alienware_update_led(priv, location);
> > +	ret =3D pdata->ops.upd_led(priv, pdata->wdev, location);
> >
> >   	return ret ? ret : count;
> >   }
> > @@ -651,36 +642,17 @@ static struct attribute_group zone_attribute_grou=
p =3D {
> >   /*
> >    * LED Brightness (Global)
> >    */
> > -static int wmax_brightness(int brightness)
> > -{
> > -	acpi_status status;
> > -	struct acpi_buffer input;
> > -	struct wmax_brightness_args args =3D {
> > -		.led_mask =3D 0xFF,
> > -		.percentage =3D brightness,
> > -	};
> > -	input.length =3D sizeof(args);
> > -	input.pointer =3D &args;
> > -	status =3D wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
> > -				     WMAX_METHOD_BRIGHTNESS, &input, NULL);
> > -	if (ACPI_FAILURE(status))
> > -		pr_err("alienware-wmi: brightness set failure: %u\n", status);
> > -	return ACPI_FAILURE(status);
> > -}
> > -
> >   static void global_led_set(struct led_classdev *led_cdev,
> >   			   enum led_brightness brightness)
> >   {
> >   	struct alienfx_priv *priv =3D container_of(led_cdev, struct alienfx_=
priv,
> >   						 global_led);
> > +	struct alienfx_platdata *pdata =3D dev_get_platdata(&priv->pdev->dev)=
;
> >   	int ret;
> >
> >   	priv->global_brightness =3D brightness;
> >
> > -	if (interface =3D=3D WMAX)
> > -		ret =3D wmax_brightness(brightness);
> > -	else
> > -		ret =3D alienware_update_led(priv, 0);
> > +	ret =3D pdata->ops.upd_brightness(priv, pdata->wdev, brightness);
> >   	if (ret)
> >   		pr_err("LED brightness update failed\n");
> >   }
> > @@ -1234,10 +1206,49 @@ static void alienware_alienfx_exit(struct wmi_d=
evice *wdev)
> >   /*
> >    * Legacy WMI driver
> >    */
> > +static int legacy_wmi_update_led(struct alienfx_priv *priv,
> > +				 struct wmi_device *wdev, u8 location)
> > +{
> > +	struct legacy_led_args legacy_args =3D {
> > +		.colors =3D priv->colors[location],
> > +		.brightness =3D priv->global_brightness,
> > +		.state =3D 0,
> > +	};
> > +	struct acpi_buffer input;
> > +	acpi_status status;
> > +
> > +	if (legacy_args.state !=3D LEGACY_RUNNING) {
> > +		legacy_args.state =3D priv->lighting_control_state;
> > +
> > +		input.length =3D sizeof(legacy_args);
> > +		input.pointer =3D &legacy_args;
> > +
> > +		status =3D wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
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
> >   static int legacy_wmi_probe(struct wmi_device *wdev, const void *cont=
ext)
> >   {
> >   	struct alienfx_platdata pdata =3D {
> >   		.wdev =3D wdev,
> > +		.ops =3D {
> > +			.upd_led =3D legacy_wmi_update_led,
> > +			.upd_brightness =3D legacy_wmi_update_brightness,
> > +		},
> >   	};
> >
> >   	return alienware_alienfx_setup(&pdata);
> > @@ -1277,10 +1288,39 @@ static void __exit alienware_legacy_wmi_exit(vo=
id)
> >   /*
> >    * WMAX WMI driver
> >    */
> > +static int wmax_wmi_update_led(struct alienfx_priv *priv,
> > +			       struct wmi_device *wdev, u8 location)
> > +{
> > +	struct wmax_led_args in_args =3D {
> > +		.led_mask =3D 1 << location,
> > +		.colors =3D priv->colors[location],
> > +		.state =3D priv->lighting_control_state,
> > +	};
> > +
> > +	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args=
,
> > +				     sizeof(in_args), NULL);
> > +}
> > +
> > +static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
> > +				      struct wmi_device *wdev, u8 brightness)
> > +{
> > +	struct wmax_brightness_args in_args =3D {
> > +		.led_mask =3D 0xFF,
> > +		.percentage =3D brightness,
> > +	};
> > +
> > +	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
> > +				     sizeof(in_args), NULL);
> > +}
> > +
> >   static int wmax_wmi_probe(struct wmi_device *wdev, const void *contex=
t)
> >   {
> >   	struct alienfx_platdata pdata =3D {
> >   		.wdev =3D wdev,
> > +		.ops =3D {
> > +			.upd_led =3D wmax_wmi_update_led,
> > +			.upd_brightness =3D wmax_wmi_update_brightness,
> > +		},
> >   	};
> >   	struct platform_device *pdev;
> >   	int ret;

