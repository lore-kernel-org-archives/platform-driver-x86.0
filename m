Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B76712DD95;
	Thu,  2 Jan 2025 16:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735835406; cv=none; b=WEKuB4tUDTz3GH9AFN/mRC8fPmjk1LYTi4VLegE7eLsPNB1suIEY5rtAIn8F/4hNfRp86qSG/v5hsUXiEIvCwcRTjwDLGxaGiWD9OXgzjZU98JZLQ4jWPR65RcWsFiRS108pB8ilk/csYw5v7niR8qKqfQ71DNnwprN4i4dL3Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735835406; c=relaxed/simple;
	bh=1GZieCnJHp3fxQHwM0EOqAwnMJQQsJ2CRHAY8WvXjPo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hAptfEX6eNg0qTPyKkfPZuFpKNUb63j5ODvmVMH3oByHucXdzHuDfS1hP23Wy/10sKfqmXX8GVApuoqMu1OMKZutFwe5IUwBQ5Bxi9/el8fICcuJTZsGGqKlUpUG5pKNX83EckbRGmxhHSd0+RT2NOXXrxZVyrtevevTUzFkEJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=fj4YkNw7; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="fj4YkNw7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735835388; x=1736440188; i=w_armin@gmx.de;
	bh=tpq0IO2ymXL1cPpHrMqbnjPp8waJOYFThJ+i9n4xlGA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=fj4YkNw7oxsHNmUS8drtDd5QxHKTOqA5BagC9go/IWnYoG50ntzfF0BqQBwTxP/+
	 lqX+2nrVVMKBvVP0+SQddDDbEfWsEAQx9ZVH6q04PoLkQufi3wr/+fCmq3gZ+TQnc
	 SWifKn91q0k+/Rgpur7wGdXuhr0NeGSLG3RD4LYGc8TQvJgrnQan6Y22gZWxRGdbF
	 k/uPZyWRefWZQuG3CmK22q4e+7oD3DCBn9LaWmA6pMqBU30/y51VHoIwI+dDG8RZJ
	 7Zijb3iVnvBjEF4GIjX3A1ELaqla9sZPOr2RoZUEnw1NnEC+G65vaXyUHVQScRtq1
	 K411MbxGa9En/f/lQw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N9Mta-1tWYsS0uKy-00sZQO; Thu, 02
 Jan 2025 17:29:48 +0100
Message-ID: <70926253-9224-413d-ab54-27e24905278a@gmx.de>
Date: Thu, 2 Jan 2025 17:29:42 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/20] alienware-wmi: Refactor LED control methods
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-12-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241229194506.8268-12-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MQP1ec9wgscEcgyl+MhgyNY6dvSDWjDpwcWsICL6sES1INcqKIK
 neXm6yTwug3qYLVhwq54fxh3/XwqVxYM6nE3URfOVdQaND5K4zDdqK2585EWK6mi4w6BYnv
 KdaZIoSyBWQfGIGqhP/IjOPSq2eUyGemWBNgjHlAWuQUaZZBdjbspRvjQ43Mbviv2XWz+Y3
 3cSoHPPORgizK2jnHlvNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:EqQQbVbQFWQ=;d98FCTPpgA2S0GlyBFOyKo4Kf4N
 5yCWTo7vBgkmLOuoYtyFj6U9V33m73R937rJngOEqjNu+O2n6m11huU0d4atn7TIQDLuo3a53
 EYwUQpe9Qqpd99LGv1aRgSWqlovqvBESJyEJjXU3aOOM4jLgVqcQ7S7JittvlAs2MQJl08yPj
 79gUQTmTjukeqWS3W4oQ1MX5t92mdJhboPeS82F9zovba2Pa9bKfokrYqx0et+ekZe4gBbYcR
 d6OvbddbubWUeHweO/w86f5ytxzt7v1wSZp22SMYYbfGWM+QT33RdR8wigd365E78NQ3D/7IO
 XvmbMfYz4b4mgMvppj5xmoYxjC3dIFoFX/59TvJ4J3e8V1R+Ci+MW+IPJE0Y800voh78M1l/9
 YX55DM7s3KcKGViN3e8a3KwhF/aenGNvDRkRhfDML9iJZ2/1Xq6C/53vo/cTcGfc6uu0t0+EF
 kVGbKNNtsXn9y28YTakZZo8IUELhckZEVfp4nj9hW54IlFvv6qs/lffoVCAHq7QzDJWRE1z/b
 yrDvquXTuwhdyaV3oY98GP8H4TPEuYnjp7vndi2k8eYwLzGWdmlMvlQgfBRvX2WA1T06hspws
 MktAvW0n0KgTVyecI9b2lQQyIHHSXd+VqKIYlMWVuqLdUoOuD4YUDoXJVN2oeEfRu+R7BLiyo
 u7rFg1IQgEutlcjbkFQ/KShhehIv9l1pXlSI607RVrHrY2URbUFSDso9bJI+oVXuNFTkaZRFz
 Px1/SYq1UO8NkkkVTz20xKXN5ZG62TDU1iG6gNoSAisgWv8BTLvmnSMHDnsiOAeuLBhIduZEw
 YQhp/NonXfN6iZVZgVz1ZGV7pLxpopE/Ujz3H/WvGywHE8Kg0csgEjiODVajsEk+nuXzxaapT
 tGWeQgJs0MY7c+J1ruAsMw9PkMVUnMNbrFnSYF7UMGDh2P4aa2LSZhA5cEquIMxwI29p2+Nmh
 EE35iKuZk07miqbosaJpawKh94yqjBKRw/CWqYD1HTxgfiwASCvY2YEjMaSrqei5VfprdV0sZ
 hWTpTXrV2ySYdXKcrQsW2HMHOmlOK69ruBKFUKL7TDg12ri4dNZhwI+BNCIxxWhF3qX1ffgtf
 SJ9P2gWd9uh4c91HvhjVsSoRcaVP65

Am 29.12.24 um 20:44 schrieb Kurt Borja:

> Both WMI devices handled by this module specify a distinct interface for
> LED control. Previously this module handled this by dynamically adapting
> arguments passed to wmi_evaluate_method() based on the `interface`
> global variable.
>
> To avoid the use of global variables, and enable the migration to
> non-deprecated WMI methods, let the WMI drivers define upd_led and
> upd_brightness operations, which completely replace
> alienware_update_led() and wmax_brightness().
>
> Also define alienware_wmi_command(), which serves as a wrapper for
> wmidev_evaluate_method(). This new method is very similar to
> alienware_wmax_command() but is WMI device agnostic.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 164 ++++++++++++++--------
>   1 file changed, 102 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index 512384635c4c..494a3772065c 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -418,12 +418,42 @@ struct alienfx_priv {
>   	u8 lighting_control_state;
>   };
>
> +struct alienfx_ops {
> +	int (*upd_led)(struct alienfx_priv *priv, struct wmi_device *wdev,
> +		       u8 location);
> +	int (*upd_brightness)(struct alienfx_priv *priv, struct wmi_device *wd=
ev,
> +			      u8 brightness);
> +};
> +
>   struct alienfx_platdata {
>   	struct wmi_device *wdev;
> +	struct alienfx_ops ops;
>   };
>
>   static u8 interface;
>
> +static int alienware_wmi_command(struct wmi_device *wdev, u32 method_id=
,
> +				 void *in_args, size_t in_size, u32 *out_data)
> +{
> +	struct acpi_buffer out =3D {ACPI_ALLOCATE_BUFFER, NULL};
> +	struct acpi_buffer in =3D {in_size, in_args};
> +	union acpi_object *obj;
> +	acpi_status ret;
> +
> +	ret =3D wmidev_evaluate_method(wdev, 0, method_id, &in, out_data ? &ou=
t : NULL);
> +	if (ACPI_FAILURE(ret))
> +		return -EIO;
> +
> +	obj =3D out.pointer;
> +
> +	if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER) {
> +		*out_data =3D (u32)obj->integer.value;
> +		kfree(out.pointer);

If obj->type is not ACPI_TYPE_INTEGER then we have a memory leak here, so =
please always free obj.
Also you will dereference a NULL pointer if out_data is NULL, please check=
 this.

Thanks,
Armin Wolf

> +	}
> +
> +	return 0;
> +}
> +
>   /*
>    * Helpers used for zone control
>    */
> @@ -454,46 +484,6 @@ static int parse_rgb(const char *buf, struct color_=
platform *colors)
>   /*
>    * Individual RGB zone control
>    */
> -static int alienware_update_led(struct alienfx_priv *priv, u8 location)
> -{
> -	int method_id;
> -	acpi_status status;
> -	char *guid;
> -	struct acpi_buffer input;
> -	struct legacy_led_args legacy_args;
> -	struct wmax_led_args wmax_basic_args;
> -	if (interface =3D=3D WMAX) {
> -		wmax_basic_args.led_mask =3D 1 << location;
> -		wmax_basic_args.colors =3D priv->colors[location];
> -		wmax_basic_args.state =3D priv->lighting_control_state;
> -		guid =3D WMAX_CONTROL_GUID;
> -		method_id =3D WMAX_METHOD_ZONE_CONTROL;
> -
> -		input.length =3D sizeof(wmax_basic_args);
> -		input.pointer =3D &wmax_basic_args;
> -	} else {
> -		legacy_args.colors =3D priv->colors[location];
> -		legacy_args.brightness =3D priv->global_brightness;
> -		legacy_args.state =3D 0;
> -		if (priv->lighting_control_state =3D=3D LEGACY_BOOTING ||
> -		    priv->lighting_control_state =3D=3D LEGACY_SUSPEND) {
> -			guid =3D LEGACY_POWER_CONTROL_GUID;
> -			legacy_args.state =3D priv->lighting_control_state;
> -		} else
> -			guid =3D LEGACY_CONTROL_GUID;
> -		method_id =3D location + 1;
> -
> -		input.length =3D sizeof(legacy_args);
> -		input.pointer =3D &legacy_args;
> -	}
> -	pr_debug("alienware-wmi: guid %s method %d\n", guid, method_id);
> -
> -	status =3D wmi_evaluate_method(guid, 0, method_id, &input, NULL);
> -	if (ACPI_FAILURE(status))
> -		pr_err("alienware-wmi: zone set failure: %u\n", status);
> -	return ACPI_FAILURE(status);
> -}
> -
>   static ssize_t zone_show(struct device *dev, struct device_attribute *=
attr,
>   			 char *buf, u8 location)
>   {
> @@ -510,13 +500,14 @@ static ssize_t zone_store(struct device *dev, stru=
ct device_attribute *attr,
>   {
>   	struct alienfx_priv *priv =3D dev_get_drvdata(dev);
>   	struct color_platform *colors =3D &priv->colors[location];
> +	struct alienfx_platdata *pdata =3D dev_get_platdata(dev);
>   	int ret;
>
>   	ret =3D parse_rgb(buf, colors);
>   	if (ret)
>   		return ret;
>
> -	ret =3D alienware_update_led(priv, location);
> +	ret =3D pdata->ops.upd_led(priv, pdata->wdev, location);
>
>   	return ret ? ret : count;
>   }
> @@ -649,36 +640,17 @@ static struct attribute_group zone_attribute_group=
 =3D {
>   /*
>    * LED Brightness (Global)
>    */
> -static int wmax_brightness(int brightness)
> -{
> -	acpi_status status;
> -	struct acpi_buffer input;
> -	struct wmax_brightness_args args =3D {
> -		.led_mask =3D 0xFF,
> -		.percentage =3D brightness,
> -	};
> -	input.length =3D sizeof(args);
> -	input.pointer =3D &args;
> -	status =3D wmi_evaluate_method(WMAX_CONTROL_GUID, 0,
> -				     WMAX_METHOD_BRIGHTNESS, &input, NULL);
> -	if (ACPI_FAILURE(status))
> -		pr_err("alienware-wmi: brightness set failure: %u\n", status);
> -	return ACPI_FAILURE(status);
> -}
> -
>   static void global_led_set(struct led_classdev *led_cdev,
>   			   enum led_brightness brightness)
>   {
>   	struct alienfx_priv *priv =3D container_of(led_cdev, struct alienfx_p=
riv,
>   						 global_led);
> +	struct alienfx_platdata *pdata =3D dev_get_platdata(&priv->pdev->dev);
>   	int ret;
>
>   	priv->global_brightness =3D brightness;
>
> -	if (interface =3D=3D WMAX)
> -		ret =3D wmax_brightness(brightness);
> -	else
> -		ret =3D alienware_update_led(priv, 0);
> +	ret =3D pdata->ops.upd_brightness(priv, pdata->wdev, brightness);
>   	if (ret)
>   		pr_err("LED brightness update failed\n");
>   }
> @@ -1247,10 +1219,49 @@ static void alienware_alienfx_exit(struct wmi_de=
vice *wdev)
>   /*
>    * Legacy WMI driver
>    */
> +static int legacy_wmi_update_led(struct alienfx_priv *priv,
> +				 struct wmi_device *wdev, u8 location)
> +{
> +	struct legacy_led_args legacy_args =3D {
> +		.colors =3D priv->colors[location],
> +		.brightness =3D priv->global_brightness,
> +		.state =3D 0,
> +	};
> +	struct acpi_buffer input;
> +	acpi_status status;
> +
> +	if (legacy_args.state !=3D LEGACY_RUNNING) {
> +		legacy_args.state =3D priv->lighting_control_state;
> +
> +		input.length =3D sizeof(legacy_args);
> +		input.pointer =3D &legacy_args;
> +
> +		status =3D wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
> +					     location + 1, &input, NULL);
> +		if (ACPI_FAILURE(status))
> +			return -EIO;
> +
> +		return 0;
> +	}
> +
> +	return alienware_wmi_command(wdev, location + 1, &legacy_args,
> +				     sizeof(legacy_args), NULL);
> +}
> +
> +static int legacy_wmi_update_brightness(struct alienfx_priv *priv,
> +					struct wmi_device *wdev, u8 brightness)
> +{
> +	return legacy_wmi_update_led(priv, wdev, 0);
> +}
> +
>   static int legacy_wmi_probe(struct wmi_device *wdev, const void *conte=
xt)
>   {
>   	struct alienfx_platdata pdata =3D {
>   		.wdev =3D wdev,
> +		.ops =3D {
> +			.upd_led =3D legacy_wmi_update_led,
> +			.upd_brightness =3D legacy_wmi_update_brightness,
> +		},
>   	};
>
>   	return alienware_alienfx_setup(&pdata);
> @@ -1290,10 +1301,39 @@ static void __exit alienware_legacy_wmi_exit(voi=
d)
>   /*
>    * WMAX WMI driver
>    */
> +static int wmax_wmi_update_led(struct alienfx_priv *priv,
> +			       struct wmi_device *wdev, u8 location)
> +{
> +	struct wmax_led_args in_args =3D {
> +		.led_mask =3D 1 << location,
> +		.colors =3D priv->colors[location],
> +		.state =3D priv->lighting_control_state,
> +	};
> +
> +	return alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL, &in_args,
> +				     sizeof(in_args), NULL);
> +}
> +
> +static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
> +				      struct wmi_device *wdev, u8 brightness)
> +{
> +	struct wmax_brightness_args in_args =3D {
> +		.led_mask =3D 0xFF,
> +		.percentage =3D brightness,
> +	};
> +
> +	return alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_args,
> +				     sizeof(in_args), NULL);
> +}
> +
>   static int wmax_wmi_probe(struct wmi_device *wdev, const void *context=
)
>   {
>   	struct alienfx_platdata pdata =3D {
>   		.wdev =3D wdev,
> +		.ops =3D {
> +			.upd_led =3D wmax_wmi_update_led,
> +			.upd_brightness =3D wmax_wmi_update_brightness,
> +		},
>   	};
>   	struct platform_device *pdev;
>   	int ret;
