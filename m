Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D5E27447;
	Fri, 27 Dec 2024 03:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735270921; cv=none; b=nqbb2cFtpcN9jAkbDGKKazZ2YLg4sZtdgYkXvlqLrW2isPccURBeCuG5fvoPxaSReg0zSlGLfVXusGKgAslopqQSWjISWHdcQy7ku3/6MyjupKdLboaRD8c6lbZ35rPeRDeeINnp7yw59UsVV0RJYlCcp6/vbOn70BFctu9NHuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735270921; c=relaxed/simple;
	bh=gkkQ2A07a0NtxQuWRvYHGVXxQCeW2szOTVwwb/fT0aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AJYn7oSnfFos+V4xrrfZZvzkUcPpnZaK5onrVGXwqZm7qsmpWB5+qR99OKFGADNh13qtNLFU9IScHWcJW+7WEilS3uwi6WZM8Hd/91qWj0LsyVrAQi0aof7qb86N2o9sleyE/isriyss+FP7IdW34vlyuJoGbWGimIccauN3IsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=sW175FY9; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="sW175FY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735270898; x=1735875698; i=w_armin@gmx.de;
	bh=Qe7tjwGAiGoHZTPVgvrDK050VuqKngL57zZ0P2zG2mo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sW175FY9vYw8F41rgu1jC1dfQ8Vt8MRwfNxgrlcQmAnEuJiKGL8t8+l20wYXlRJL
	 StGnNx4BV/COu2ht8UFscCZhq5XHcLpTMnJjKhDMUSsAQ+xe8fvIQCklaGN88WP6g
	 /5+nWxvFz9oUEN+KqdnbfH6k1G5Oy2rLxbJf/Sdk8OELOuF4IS3FbWtJWtBtf/KLW
	 aqx/d1CICpl8cmFfdsvEBkWMzeyb8MCG23ZPBCnb+mStFxSNax6PFarF9gTOJmc9Q
	 HGQc/jSMppca9GCtLTmm54B8cn2RWv86cquYjW1qIfJPbZvmURVd/aV56sVWeTG9n
	 UknzzTWpUwbPhId5ag==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N5mKJ-1tbwOf2wjz-015Gnd; Fri, 27
 Dec 2024 04:41:38 +0100
Message-ID: <c42f1880-c5e5-4b5d-9e3d-d9136ab2d002@gmx.de>
Date: Fri, 27 Dec 2024 04:41:36 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/20] alienware-wmi: Refactor LED control methods
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-11-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-11-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ZnZTZniqhPein6WvrVa//ziY09X4418xFEdhB5rTi12QLyC4ORF
 tACNGURwr7qgalDIu0gnEY0gbypu7WYWfw+WWpWwVzWh/dHqRXnXUl+JDyw2FuCQfiTO1A0
 90DHO2SfNMbkvhm+XzdSIXv6Ou4EthtxnFVcFVpDuRJZg1K1c2QKNTWM3PCQOEN/RIDDyCZ
 8/yiZkWFTKIpn3dgS/KfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LxY83PcDaIk=;ow2ZZBc3vXWl1eAcljeWKFDRSD7
 EtLr/Lx3OwoMMmwZjx9isj8zGLjLMNjz6xVfX0ii1vk2GWT26r2uUcVcHCp1VgQpgaaePs0Yl
 J1SmlecUnK1t8k7CYHfg8FNCnbfzs9GnIUCNAny6WjBZwP3tsVZQ0uFWMd64pZe5l1d5V3JlZ
 U4TIhRz5fC2BuRrbVIUm9atf1uN+7mJMTmGnYjLDCx2ySbO9UyKUVP2eAOOJDghcG/d9FKUDS
 bRZvMiFpnU3qpGLMmoHry5BjbMrifKQt7El9r5+NpJbre5wBK4VsZCr0Jg7RnflWU7yZU/rMR
 wtpkJdtEQt0/wrDplgKmySnwAuNR7f65ge6OaltOkC3pQOkt8LpQzKdBAwxbGdYXL4tT1YhC2
 GdM8DKclmhL9B2uvt0p4wvl60mfN6xtX6TO4GxVF1RSrQIF/vlRPVTJnLB2XklspqHvtwouj4
 yr74r/bc7o/+giEEPP3DUcQmHYZ22L4sWBlPBzYpt2yuOMvkmFbkLky4KImusQgmEjLNWbt2y
 VaEZ8+TQwDelV/HtsTHiAcT7Tt1sYO0rkxFbPhhhUjCPK0imnW3Qh0DaUjoYtc5F3kbjPSmdW
 +lB/ChWB1UMxTs5l4MUlnr+UfVuS9Xk8lM/szVEFlR8TsxFONXc7cMrIo46kJStRVfpzw/+7i
 mAVAJ7SLHoNwvhiSJgbGQ5GMhOZblc4Xj54DVS5I2njuTNrl3DkVoF03V6ER7Fxc9fLMxHBpR
 oWvElDoSFK634gDgCNI5g/Bq9nCdJiJmoTK9ElosCFPkxVSnCwOYKbTKrRbGN75BjCZ2h1qcD
 HQrjeGgLQl7fxTmalJ81dH/tCWVVGvyHp/hn72wfww/NJEFEQgf92U0/mAoPoqusJAnKOxZ8B
 unOE6AVZXAX28WAJYj0A1g2zdjLwtXOu9wIzwxjsXguGaPZjdvXGwRfBw1mhMdMkFJLgvS1K7
 huE9HhRMnk5/K6nOIdQr56AGspWWR6hYKiWldyebfh7qocCkAAt3ekQPA9FxMaNCG8/f+0iC8
 ycet6muUzgEmGb5RrF5K7+BjE2AEmQh0/s1OhCj2gl7bw7Pv1sAcFXXKiNG42bw7OsXNaJeog
 tP272+93ZA6+j5n2myh9TOoF8sk/ze

Am 21.12.24 um 06:59 schrieb Kurt Borja:

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
>   drivers/platform/x86/dell/alienware-wmi.c | 180 ++++++++++++++--------
>   1 file changed, 118 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index c4ca141d628e..bcf3b2f80dfd 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -417,12 +417,46 @@ struct alienfx_priv {
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
> +static acpi_status alienware_wmi_command(struct wmi_device *wdev, u32 m=
ethod_id,
> +					 void *in_args, size_t in_size, u32 *out_data)

Please return a errno here instead of acpi_status.

> +{
> +	struct acpi_buffer out =3D {ACPI_ALLOCATE_BUFFER, NULL};
> +	struct acpi_buffer in =3D {in_size, in_args};
> +	union acpi_object *obj;
> +	acpi_status ret;
> +
> +	if (out_data) {
> +		ret =3D wmidev_evaluate_method(wdev, 0, method_id, &in, &out);
> +		if (ACPI_FAILURE(ret))
> +			goto out_free_ptr;

Just return -EIO here as out.pointer will contain no valid data in this ca=
se.

> +
> +		obj =3D (union acpi_object *)out.pointer;

Unnecessary cast.

> +
> +		if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
> +			*out_data =3D (u32)obj->integer.value;

Please move the code for freeing "obj" to this line.

> +	} else {
> +		ret =3D wmidev_evaluate_method(wdev, 0, method_id, &in, NULL);
> +	}
> +
> +out_free_ptr:
> +	kfree(out.pointer);
> +	return ret;
> +}
> +
>   /*
>    * Helpers used for zone control
>    */
> @@ -453,46 +487,6 @@ static int parse_rgb(const char *buf, struct color_=
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
> @@ -510,18 +504,20 @@ static ssize_t zone_show(struct device *dev, struc=
t device_attribute *attr,
>   static ssize_t zone_store(struct device *dev, struct device_attribute =
*attr,
>   			  const char *buf, size_t count, u8 location)
>   {
> +	struct alienfx_platdata *pdata;
>   	struct color_platform *colors;
>   	struct alienfx_priv *priv;
>   	int ret;
>
>   	priv =3D dev_get_drvdata(dev);
> +	pdata =3D dev_get_platdata(dev);
>   	colors =3D &priv->colors[location];
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
> @@ -628,35 +624,19 @@ static struct attribute_group zone_attribute_group=
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
> +	struct alienfx_platdata *pdata;
>   	struct alienfx_priv *priv;
>   	int ret;
>
>   	priv =3D container_of(led_cdev, struct alienfx_priv, global_led);
> +	pdata =3D dev_get_platdata(&priv->pdev->dev);
> +
>   	priv->global_brightness =3D brightness;
> -	if (interface =3D=3D WMAX)
> -		ret =3D wmax_brightness(brightness);
> -	else
> -		ret =3D alienware_update_led(priv, 0);
> +
> +	ret =3D pdata->ops.upd_brightness(priv, pdata->wdev, brightness);
>   	if (ret)
>   		pr_err("LED brightness update failed\n");
>   }
> @@ -1224,10 +1204,47 @@ static void alienware_alienfx_exit(struct wmi_de=
vice *wdev)
>   /*
>    * Legacy WMI driver
>    */
> +static int legacy_wmi_update_led(struct alienfx_priv *priv,
> +				 struct wmi_device *wdev, u8 location)
> +{
> +	struct legacy_led_args legacy_args;
> +	struct acpi_buffer input;
> +	acpi_status status;
> +
> +	legacy_args.colors =3D priv->colors[location];
> +	legacy_args.brightness =3D priv->global_brightness;
> +	legacy_args.state =3D priv->lighting_control_state;

The original code set "legacy_args.state" to "0" if "priv->lighting_contro=
l_state" was "LEGACY_RUNNING".
Please keep this behavior.

Thanks,
Armin Wolf

> +
> +	input.length =3D sizeof(legacy_args);
> +	input.pointer =3D &legacy_args;
> +
> +	if (legacy_args.state =3D=3D LEGACY_RUNNING)
> +		status =3D alienware_wmi_command(wdev, location + 1, &legacy_args,
> +					       sizeof(legacy_args), NULL);
> +	else
> +		status =3D wmi_evaluate_method(LEGACY_POWER_CONTROL_GUID, 0,
> +					     location + 1, &input, NULL);
> +
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
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
> @@ -1267,10 +1284,49 @@ static void __exit alienware_legacy_wmi_exit(voi=
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
> +	acpi_status status;
> +
> +	status =3D alienware_wmi_command(wdev, WMAX_METHOD_ZONE_CONTROL,
> +				       &in_args, sizeof(in_args), NULL);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +static int wmax_wmi_update_brightness(struct alienfx_priv *priv,
> +				      struct wmi_device *wdev, u8 brightness)
> +{
> +	struct wmax_brightness_args in_args =3D {
> +		.led_mask =3D 0xFF,
> +		.percentage =3D brightness,
> +	};
> +	acpi_status status;
> +
> +	status =3D alienware_wmi_command(wdev, WMAX_METHOD_BRIGHTNESS, &in_arg=
s,
> +				       sizeof(in_args), NULL);
> +	if (ACPI_FAILURE(status))
> +		return -EIO;
> +
> +	return 0;
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
>   	int ret =3D 0;
>
