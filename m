Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970451E531;
	Sat, 18 Jan 2025 23:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737244688; cv=none; b=gAQNW6RlYKdh/1ISuvr5fqrQvDP3J3y5qTxQn7S2mOkpI5IqJJDvP9Olql+ByBVW0PRvg/3BH88uSbWqeZHHBR8h9bTjQXFCly2l/jdZXAnL+KBV8Q+/tBfwfCCAlkHKMBghgu5GBXZt7UHl7I49rhW3FQKY+7oib6qGrwv6WjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737244688; c=relaxed/simple;
	bh=fovKhNceW/tRhvleqk865X7VL+a+ln/LZxNUt2vZiOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rQKOgrmVG1OyR4VhMGkV3tIHAfT1aNdcdHv3KrLijvXf3QvH70aapXLHa4srjD35ihFFuvdUP1ZIqCbbEfydIfftNU7nZfHYFRXGB30biBSLB5Y9fbg3Fx5j2ADpvTmo7dJ7DniWNBGaJlzxvGLBK+POBdao6HOXTAE1UETeZYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=tPct9w+a; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="tPct9w+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1737244683; x=1737849483; i=w_armin@gmx.de;
	bh=tZDF/EtPQ1hZAhVpfXf10/prQ90gWS69fMCUkjA9FT8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tPct9w+aZ3l+hzcn+MpuJaJGyVOxD5SKTuuMt95bLR+pbc8gnhETA0jtWGh6HYxb
	 mzm60OHvX6/ipdujl+MUs9mfaEiWOOnAS2hz8+RfRJSF9dVJxh7D5tS5rAFm7iwh1
	 siomqb5wanJv5hkkuBy+bKWbLTectER6UQEWh0Rd7kxnWLSjHX84VzIzUOSeZpqdC
	 Jp+OSteTUZePhKq44Jm+ZPJTJIajFZf10QtahX4bcTf8JMdKpQsXZzGocu6RrEx4E
	 iCvNMsC4vhgOb6Q8LmWPbaSdG8qsW15EGGnAOlKJIfNScSzaBgq8xyU3UdiQLz22b
	 Dp0cstsAuVTsr/nv9A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([93.202.251.118]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbivG-1sxVRN04Z4-00cRQK; Sun, 19
 Jan 2025 00:58:03 +0100
Message-ID: <f4fb94e7-fe31-4814-8396-a6846d7f18ff@gmx.de>
Date: Sun, 19 Jan 2025 00:58:01 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/14] platform/x86: alienware-wmi: Refactor LED
 control methods
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com,
 linux-kernel@vger.kernel.org
References: <20250117081347.8573-1-kuurtb@gmail.com>
 <20250117081347.8573-5-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20250117081347.8573-5-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vmY8RETBhofxGS0UvWsOLNBVqQhce/ZusZXXFjsJYDRrjA3Y2xK
 JeLjtS5jtvFXscz9wAOoyMTqxdx0h3L8hoqu+sw2ykaNAWzsVQWpw+xD4gaTV6NPNBKRcpG
 bqo7MQkslI5BG3Cem+d3fHQjLFTjvFoFXLcgN4aX94RLQduuV5I2tW4NdtH7497EDzJH04s
 sadiUpusYIbB1O9E4zXOQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vQvQvE0hhwI=;KzGYkVX7M/rpil+sZAjE2oUQrLD
 glLQi0Bqt/0wHDO/8HuRRchopeCibjpbRuMJRVJQifO3BMoOxOZt6cr8Gbrmhun3OOIojanYA
 Qg0rUqSUz3sifvQSSM2jUDSRLGUIxjfd6XbaPuJw7QxFUL2vhqk6217Ksf2ebeh+mcundKiFc
 ASPDKfj0S+sVaDD8quS3VJht+7it9bZacIA0r8cDsDGfW+8ELHQHL/1KZ4tkrgsMEl5bKrYQu
 gHVsN3ko288ihdi3MocvdhYAik4kiR7Vi6kT9rDDUcy/yU64yNZAnyb0J3bQUH3Wcf2IYEr05
 OjH7f5kXuMWvHEIxI+B91tbdEEwZRCJp7D6Q/0KKmR2HHfoHh4/V24JpHnz5WvgTz+YqratbE
 h0qipUUIapVLQ+6RNd7DOWk5ktkpYLrAEct2/muJfoaZxcEl0/qHjPJrE6ey60vh+7hN4gkBG
 XPqdyrwneqgjuZRQl1LTOuSAy5eZVhtUPkrZXZ2BmcUul7C1FhHD/FMN9RICOpitbPz3cQtKE
 rjZrVId4sBrh3qEF+xL9fibsbH7w6lzCkEPcI9Hi1ICuTyBdIExDi9/VItkcazV+UIhMgyGi7
 rz9SNZKktgygGnildq+YIjaDCwrHfqMjHLuY7pLYmbYGSZ8sn77WSR9o42Gm865sovbPGdX+I
 yXS9I5QopewGderWa/iv4HnWdcq2ys/4ffbNn08MhXvwsm2I22ymL5nUN5L0r4edElsfUr8Y5
 QRdx43GYPuhw00V8eCzC3M/Y6cxnc/+kRi4vkpEuJx10el9TN3WLwH8fix/h/B3nMcNCyc/6/
 rBW0Zl48s5pCWv2wOlOn856euQj9HFKZFgjyTd2whFjGhFf35esTs8EV5DFIHEYtNgovrQbmo
 0cVUJlQcfgNfmH875aApyVqt0mtA5R+bMeE8oXBC9IX3jrpOZSMZQlXGvnuv45Pj/peciUSPm
 JI6IOWDnn5c59Akc9rd6FDJR7c7wqHGrnXWLzhgA3EPQ9JCBRzF8DueidXAGmtpnRIO16ZOV2
 l44GRNW2JTkv97U7wOr8xgtt8+8IIQf3RG4qh6oWI1QxT00sUeDWkRhqjejM1iKnGnxKV/c2d
 5xSXvnmm52mtYtwyuwIAtWVC/ry+vxXXLl2HjfEMl5F8SWlyyzCBVRjPLAY6IG4+m4UMikZ2X
 iVTJqKvn+fUIkzrm5BfmxNFlhwhkMGuabiB5Rj1/qJw==

Am 17.01.25 um 09:13 schrieb Kurt Borja:

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
> index 7356260f7f09..c9d9cf36b87b 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -417,12 +417,42 @@ struct alienfx_priv {
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
> +	if (out_data && obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
> +		*out_data =3D (u32)obj->integer.value;

Please return an error here if out_data is true but obj is NULL or not of =
ACPI_TYPE_INTEGER.

With this being fixed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

> +
> +	kfree(obj);
> +
> +	return 0;
> +}
> +
>   /*
>    * Helpers used for zone control
>    */
> @@ -453,46 +483,6 @@ static int parse_rgb(const char *buf, struct color_=
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
> @@ -509,13 +499,14 @@ static ssize_t zone_store(struct device *dev, stru=
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
> @@ -651,36 +642,17 @@ static struct attribute_group zone_attribute_group=
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
> @@ -1234,10 +1206,49 @@ static void alienware_alienfx_exit(struct wmi_de=
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
> @@ -1277,10 +1288,39 @@ static void __exit alienware_legacy_wmi_exit(voi=
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
