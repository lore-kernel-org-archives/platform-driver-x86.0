Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6815D2572;
	Fri, 27 Dec 2024 01:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735261512; cv=none; b=lFtWHApfDHJ2ZXFLJF88CygofThZ0gAkkREHpLAZVvhjbNPsk31a+6F0PJ3EUEcNJP+Qafg9EDovVKNYiOr/YCvq2A8C0lwhF09nuHG9qKWMhydr/J6gYpR9SF0ruOv7O5fxSGvGOQ+E7rgAHSrjSdcWx/PQI1Igm1B2jhGBRCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735261512; c=relaxed/simple;
	bh=kPfcXWCKj79v/B4Cr35mClwADX1oKyu5LcQZFREJStY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O1QJ1LsqAYNqHjeS5OZ9UcZA6v24/mIwv8kYr7mzif1spOR4fI51MRpvspIveEoJ5H6HewoHcy3snCLNcXxlK75ekWvYbXOYBVmR/p9cbLNbx452w+eYKx12r8YvDQwmxn/RH2FeR4X2R+4dOC+UlVMX4q52bUgbPghVkuWQ5x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=nB/sir96; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="nB/sir96"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735261493; x=1735866293; i=w_armin@gmx.de;
	bh=1vk4AbaIeYymCpNdOIFgLTYvd6qbUwYRxMrl9oXIe+Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nB/sir96ohMTHNEoUfT2x3AV5Y0mxvbIAldd6IgV911ajP9pDbpNVAnazXFlf2PV
	 rDNOPKm4BFNuuUnXCKKNVQ+bPSpAaR7WT9MUeL1gJqSwxdP4bZhLoE7GBXK82iiaY
	 gMN2dk/b9aPygd4BPNE43PEw7uS2CQZ7bGWrKCXRysqEU4wvlgtyVJZGnKDskourz
	 Ilh64am8TrJ6JPIk0EYe4SKgEYqyfv3lUKgjqosG+x5eSy5XERVQIbiDdNe+k5Lt3
	 1YUrT9mdEYnDkvPS7fae3rhSAFGQX/UTzt/On1GV5q/uAswT60Saw85/lP43jlfKX
	 XfqRWxcgHmAIFCUuiA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mo6qp-1tteko1THn-00qOjP; Fri, 27
 Dec 2024 02:04:53 +0100
Message-ID: <53d5792d-bdfb-4f6e-a75d-6d5e437e1a93@gmx.de>
Date: Fri, 27 Dec 2024 02:04:51 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] alienware-wmi: Improve rgb-zones group creation
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com, mario.limonciello@amd.com,
 hdegoede@redhat.com, linux-kernel@vger.kernel.org,
 Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-6-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241221055917.10555-6-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:u4g5ojmFR+oHxY7X7k26gzojbhp2lqlCOScgjKqDthCkU/FPkFM
 69xd2URs963tyqq3v3sA/hJBMdyJws0NUuC4kdfjCdnODc6e+8u2ToVYbdcs6No6wNNuK2z
 Xwu76yWizRiiV4KCRY2Z3g1ptdc1dLRWNHZJkIg781trdUIahx4YNAtbHt2UB8+DJYeitTT
 3stzwNsCPoXGw/zVw+hUg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:iqX+2wP/jio=;+pokflkxLXYyQniS8N6kHF95bTG
 fyn/4peZ9NlUPaQ4G5pyXaEm98CGW7pKdUTG6QV7uFM/KUtnPtU64KCt7Z/M3/nfUkUyCcyPl
 Lhes/oc1QJNGd9THx5FpP9P8OdkDXRvJRznCrcWIEHhRzHT8+SU5xwmOHZyz2YkXOXdO7O4lr
 dtUxjlHI0dEFaXyuYLatJ/2hguBqtpaaSfRMlkm+aagA8gqFwDPOxHa7JUgi+Wr+vnu9wu9Nl
 QDuoaGFhi+BzYblO+q908I9nPbbuDAVx9h/mLrkHtmImE+vQjCDhTXdxwaVBwmxC6TCxsmX6t
 7wmaTMqEJS3P0cPnGSfkHarhi43E7j6SWs2RMXNvbAC55v8SFZhWgCzPu++2M5zQFsVaEmrnZ
 oHUA9oYtIKeIjWrFtMN7tZyhZHDCJ17Zh5keI0bi3+BN+1osru9nbdZ17rMbPaw2wVIMDAPmp
 JG++srtCrw+DOQU0NdqrWQ1ZcYYc1ZcHp6S4TMbuAC8R5YGFTuUieQPf/IeltVgKV1H5hqGqc
 /c5n0/A8jT3fsBv/N4/yh7yZXBBjLwXKozHgOxYxYOxChLuh1nvMXv+1qeVMEp3ZnPbXR5e+5
 qMrZpRbTxukA0cOkXZml2hKLl26J5cDtf+eVnyIgWTwj6oUOsgp4uNuuAJbpyXwL+kWw5M6uf
 UZC9rnqdZONZ8FMOTFhRQrxK3H9eLoyfyR9Bpx0LxNVzf59dcjLiZs2V/O2EmoMfkw3TU6z4d
 KTl/xZpwTFZ5eM940XX2RDx9tVSbsw3fUw7j4SonvZNoI161snTOmA2ooBECrY6z2ei3Cwgl9
 txWROew2+55+Q2VBDNMygUE3Y/RI6CiuLS6R4LQTWuTq29DQHULdd9zl+Io4XLqlkM/jDv5Mh
 ECU4exvkTAtHqTfvQlw0OhZlBpwF4MvC9MxdRX+/FfloumCv0131KJf5ByhfozJjHgT1QIo00
 6lUKV74+9CT4g7C2ZrpNmsWSSsBca7Ug08GlciN6z9NS92sAgziHOTUo4uWSGyazAtJzmFC6Q
 34vYPAqzeGWQ4kwpLBZFiU3KfhzQZ9gBDgTeQtp3R/lVZiSsZr+1/A9EYrfHNwP9LtVBBUZgp
 i2qBRheTFKBzPwCWObcwE1V9P9t4gd

Am 21.12.24 um 06:59 schrieb Kurt Borja:

> Define zone_attrs statically with the use of helper macros and
> initialize the zone_attribute_group with driver's .dev_groups.
>
> Drop match_zone() and instead pass a `location` argument to previous
> show/store methods to access the correct `zone` LED state. On top of
> that rename zone_set() -> zone_store() to be more consistent with sysfs
> conventions.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 179 +++++++++-------------
>   1 file changed, 72 insertions(+), 107 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index e010c94555e8..a431b1fec9fb 100644
> --- a/drivers/platform/x86/dell/alienware-wmi.c
> +++ b/drivers/platform/x86/dell/alienware-wmi.c
> @@ -376,12 +376,6 @@ struct color_platform {
>   	u8 red;
>   } __packed;
>
> -struct platform_zone {
> -	u8 location;
> -	struct device_attribute *attr;
> -	struct color_platform colors;
> -};
> -
>   struct wmax_brightness_args {
>   	u32 led_mask;
>   	u32 percentage;
> @@ -411,16 +405,10 @@ struct wmax_u32_args {
>   };
>
>   static struct platform_device *platform_device;
> -static struct device_attribute *zone_dev_attrs;
> -static struct attribute **zone_attrs;
> -static struct platform_zone *zone_data;
> +static struct color_platform colors[4];
>   static struct platform_profile_handler pp_handler;
>   static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROF=
ILE_LAST];
>
> -static struct attribute_group zone_attribute_group =3D {
> -	.name =3D "rgb_zones",
> -};
> -
>   static u8 interface;
>   static u8 lighting_control_state;
>   static u8 global_brightness;
> @@ -452,24 +440,10 @@ static int parse_rgb(const char *buf, struct color=
_platform *colors)
>   	return 0;
>   }
>
> -static struct platform_zone *match_zone(struct device_attribute *attr)
> -{
> -	u8 zone;
> -
> -	for (zone =3D 0; zone < quirks->num_zones; zone++) {
> -		if ((struct device_attribute *)zone_data[zone].attr =3D=3D attr) {
> -			pr_debug("alienware-wmi: matched zone location: %d\n",
> -				 zone_data[zone].location);
> -			return &zone_data[zone];
> -		}
> -	}
> -	return NULL;
> -}
> -
>   /*
>    * Individual RGB zone control
>    */
> -static int alienware_update_led(struct platform_zone *zone)
> +static int alienware_update_led(u8 location)
>   {
>   	int method_id;
>   	acpi_status status;
> @@ -478,8 +452,8 @@ static int alienware_update_led(struct platform_zone=
 *zone)
>   	struct legacy_led_args legacy_args;
>   	struct wmax_led_args wmax_basic_args;
>   	if (interface =3D=3D WMAX) {
> -		wmax_basic_args.led_mask =3D 1 << zone->location;
> -		wmax_basic_args.colors =3D zone->colors;
> +		wmax_basic_args.led_mask =3D 1 << location;
> +		wmax_basic_args.colors =3D colors[location];
>   		wmax_basic_args.state =3D lighting_control_state;
>   		guid =3D WMAX_CONTROL_GUID;
>   		method_id =3D WMAX_METHOD_ZONE_CONTROL;
> @@ -487,7 +461,7 @@ static int alienware_update_led(struct platform_zone=
 *zone)
>   		input.length =3D sizeof(wmax_basic_args);
>   		input.pointer =3D &wmax_basic_args;
>   	} else {
> -		legacy_args.colors =3D zone->colors;
> +		legacy_args.colors =3D colors[location];
>   		legacy_args.brightness =3D global_brightness;
>   		legacy_args.state =3D 0;
>   		if (lighting_control_state =3D=3D LEGACY_BOOTING ||
> @@ -496,7 +470,7 @@ static int alienware_update_led(struct platform_zone=
 *zone)
>   			legacy_args.state =3D lighting_control_state;
>   		} else
>   			guid =3D LEGACY_CONTROL_GUID;
> -		method_id =3D zone->location + 1;
> +		method_id =3D location + 1;
>
>   		input.length =3D sizeof(legacy_args);
>   		input.pointer =3D &legacy_args;
> @@ -510,35 +484,54 @@ static int alienware_update_led(struct platform_zo=
ne *zone)
>   }
>
>   static ssize_t zone_show(struct device *dev, struct device_attribute *=
attr,
> -			 char *buf)
> +			 char *buf, u8 location)
>   {
> -	struct platform_zone *target_zone;
> -	target_zone =3D match_zone(attr);
> -	if (target_zone =3D=3D NULL)
> -		return sprintf(buf, "red: -1, green: -1, blue: -1\n");
>   	return sprintf(buf, "red: %d, green: %d, blue: %d\n",
> -		       target_zone->colors.red,
> -		       target_zone->colors.green, target_zone->colors.blue);
> +		       colors[location].red, colors[location].green,
> +		       colors[location].blue);
>
>   }
>
> -static ssize_t zone_set(struct device *dev, struct device_attribute *at=
tr,
> -			const char *buf, size_t count)
> +static ssize_t zone_store(struct device *dev, struct device_attribute *=
attr,
> +			  const char *buf, size_t count, u8 location)
>   {
> -	struct platform_zone *target_zone;
>   	int ret;
> -	target_zone =3D match_zone(attr);
> -	if (target_zone =3D=3D NULL) {
> -		pr_err("alienware-wmi: invalid target zone\n");
> -		return 1;
> -	}
> -	ret =3D parse_rgb(buf, &target_zone->colors);
> +
> +	ret =3D parse_rgb(buf, &colors[location]);
>   	if (ret)
>   		return ret;
> -	ret =3D alienware_update_led(target_zone);
> +
> +	ret =3D alienware_update_led(location);
> +
>   	return ret ? ret : count;
>   }
>
> +#define ALIENWARE_ZONE_SHOW_FUNC(_num)					\
> +	static ssize_t zone0##_num##_show(struct device *dev,		\
> +					struct device_attribute *attr,	\
> +					char *buf)			\
> +	{								\
> +		return zone_show(dev, attr, buf, _num);			\
> +	}
> +
> +#define ALIENWARE_ZONE_STORE_FUNC(_num)					\
> +	static ssize_t zone0##_num##_store(struct device *dev,		\
> +					struct device_attribute *attr,	\
> +					const char *buf, size_t count)	\
> +	{								\
> +		return zone_store(dev, attr, buf, count, _num);		\
> +	}
> +
> +#define ALIENWARE_ZONE_ATTR(_num)					\
> +	ALIENWARE_ZONE_SHOW_FUNC(_num)					\
> +	ALIENWARE_ZONE_STORE_FUNC(_num)					\
> +	static DEVICE_ATTR_RW(zone0##_num)
> +
> +ALIENWARE_ZONE_ATTR(0);
> +ALIENWARE_ZONE_ATTR(1);
> +ALIENWARE_ZONE_ATTR(2);
> +ALIENWARE_ZONE_ATTR(3);

I know that this will result in a bit of boilerplate code, but please do n=
ot use such macros.
They have a habit of confusing static code analysis tools.

> +
>   /*
>    * Lighting control state device attribute (Global)
>    */
> @@ -578,6 +571,33 @@ static ssize_t lighting_control_state_store(struct =
device *dev,
>
>   static DEVICE_ATTR_RW(lighting_control_state);
>
> +static umode_t zone_attr_visible(struct kobject *kobj,
> +				 struct attribute *attr, int n)
> +{
> +	return n < quirks->num_zones + 1 ? 0644 : 0;

Where is this function used?

Thanks,
Armin Wolf

> +}
> +
> +static bool zone_group_visible(struct kobject *kobj)
> +{
> +	return quirks->num_zones > 0;
> +}
> +DEFINE_SYSFS_GROUP_VISIBLE(zone);
> +
> +static struct attribute *zone_attrs[] =3D {
> +	&dev_attr_lighting_control_state.attr,
> +	&dev_attr_zone00.attr,
> +	&dev_attr_zone01.attr,
> +	&dev_attr_zone02.attr,
> +	&dev_attr_zone03.attr,
> +	NULL
> +};
> +
> +static struct attribute_group zone_attribute_group =3D {
> +	.name =3D "rgb_zones",
> +	.is_visible =3D SYSFS_GROUP_VISIBLE(zone),
> +	.attrs =3D zone_attrs,
> +};
> +
>   /*
>    * LED Brightness (Global)
>    */
> @@ -606,7 +626,7 @@ static void global_led_set(struct led_classdev *led_=
cdev,
>   	if (interface =3D=3D WMAX)
>   		ret =3D wmax_brightness(brightness);
>   	else
> -		ret =3D alienware_update_led(&zone_data[0]);
> +		ret =3D alienware_update_led(0);
>   	if (ret)
>   		pr_err("LED brightness update failed\n");
>   }
> @@ -624,9 +644,6 @@ static struct led_classdev global_led =3D {
>
>   static int alienware_zone_init(struct platform_device *dev)
>   {
> -	u8 zone;
> -	char *name;
> -
>   	if (interface =3D=3D WMAX) {
>   		lighting_control_state =3D WMAX_RUNNING;
>   	} else if (interface =3D=3D LEGACY) {
> @@ -635,65 +652,12 @@ static int alienware_zone_init(struct platform_dev=
ice *dev)
>   	global_led.max_brightness =3D 0x0F;
>   	global_brightness =3D global_led.max_brightness;
>
> -	/*
> -	 *      - zone_dev_attrs num_zones + 1 is for individual zones and the=
n
> -	 *        null terminated
> -	 *      - zone_attrs num_zones + 2 is for all attrs in zone_dev_attrs =
+
> -	 *        the lighting control + null terminated
> -	 *      - zone_data num_zones is for the distinct zones
> -	 */
> -	zone_dev_attrs =3D
> -	    kcalloc(quirks->num_zones + 1, sizeof(struct device_attribute),
> -		    GFP_KERNEL);
> -	if (!zone_dev_attrs)
> -		return -ENOMEM;
> -
> -	zone_attrs =3D
> -	    kcalloc(quirks->num_zones + 2, sizeof(struct attribute *),
> -		    GFP_KERNEL);
> -	if (!zone_attrs)
> -		return -ENOMEM;
> -
> -	zone_data =3D
> -	    kcalloc(quirks->num_zones, sizeof(struct platform_zone),
> -		    GFP_KERNEL);
> -	if (!zone_data)
> -		return -ENOMEM;
> -
> -	for (zone =3D 0; zone < quirks->num_zones; zone++) {
> -		name =3D kasprintf(GFP_KERNEL, "zone%02hhX", zone);
> -		if (name =3D=3D NULL)
> -			return 1;
> -		sysfs_attr_init(&zone_dev_attrs[zone].attr);
> -		zone_dev_attrs[zone].attr.name =3D name;
> -		zone_dev_attrs[zone].attr.mode =3D 0644;
> -		zone_dev_attrs[zone].show =3D zone_show;
> -		zone_dev_attrs[zone].store =3D zone_set;
> -		zone_data[zone].location =3D zone;
> -		zone_attrs[zone] =3D &zone_dev_attrs[zone].attr;
> -		zone_data[zone].attr =3D &zone_dev_attrs[zone];
> -	}
> -	zone_attrs[quirks->num_zones] =3D &dev_attr_lighting_control_state.att=
r;
> -	zone_attribute_group.attrs =3D zone_attrs;
> -
> -	led_classdev_register(&dev->dev, &global_led);
> -
> -	return sysfs_create_group(&dev->dev.kobj, &zone_attribute_group);
> +	return led_classdev_register(&dev->dev, &global_led);
>   }
>
>   static void alienware_zone_exit(struct platform_device *dev)
>   {
> -	u8 zone;
> -
> -	sysfs_remove_group(&dev->dev.kobj, &zone_attribute_group);
>   	led_classdev_unregister(&global_led);
> -	if (zone_dev_attrs) {
> -		for (zone =3D 0; zone < quirks->num_zones; zone++)
> -			kfree(zone_dev_attrs[zone].attr.name);
> -	}
> -	kfree(zone_dev_attrs);
> -	kfree(zone_data);
> -	kfree(zone_attrs);
>   }
>
>   static acpi_status alienware_wmax_command(void *in_args, size_t in_siz=
e,
> @@ -1143,6 +1107,7 @@ static void remove_thermal_profile(void)
>    * Platform Driver
>    */
>   static const struct attribute_group *alienfx_groups[] =3D {
> +	&zone_attribute_group,
>   	&hdmi_attribute_group,
>   	&amplifier_attribute_group,
>   	&deepsleep_attribute_group,
