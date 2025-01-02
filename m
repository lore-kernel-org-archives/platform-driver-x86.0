Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049C58BE5;
	Thu,  2 Jan 2025 15:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735832676; cv=none; b=dYgyIsfsT66r9LFPt1Lo67W1zyDAoRn0Iqh0CHyh6AEVhP1J0IjbzUijSYUKOJRm8IGh6K/5GFOIJXsm7X/VwTuFFiG1XAZojbY405bepuXvJauw+jDMpKpXBnIvG4tFSHGyQ3P2CiQVTadhMCajzKNW8+j5u3u5itIeE4B0EVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735832676; c=relaxed/simple;
	bh=+bOvjF1hzZwcgjwS5Acj4d0JMq0qLpPCxhER1uA2A8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mmhmIzpCA3fppEVo8vBHk0dTzE1uF1ATAkep9tRGsZ8cX2K8V3e2ciB9hx/TDJEgQsRzggY7/VbuX0+oiJzzVvc6yr6NItxBGPV+a8zLAy1tInp+swgRrrtMaffzzqcb1TOWcPiAcBeVqA6//Cs+lzPU/cg8Hm0KiSGgSMi9u5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=MJvfhhM0; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="MJvfhhM0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735832658; x=1736437458; i=w_armin@gmx.de;
	bh=Tr4eA/524qu++Svq/AXkTBber/BWbtXMnz/P0kS+cVY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MJvfhhM0FfoTcouJnXvx3+KMJh/8ANTyYe5YPyOqN1uHaQ0v9RFtDLYGBmKpknua
	 oiwl8bl/VJCgE0/NP7IL5GndbQQ9meBzyZTs4Y+OiO/xsKtBH/5uf8Dcix9vFq/XL
	 puxpynGijC4BGiTBPThDZODr95ntgO+m/1yRpanNYs7jZFjK+acYVexf3fu3LpN00
	 0qQkxZt1A4OhVz7zWDzcA9sq7+Lsxc0Da7KBlrZHGF/fY3tZaq4DFCxjvBzji8m4e
	 xiopz2ODF8zJUk+6KKvqLE9sNUQHvOhjU+Wy1wnrCPzIIPK6hCJifTtWjfnSz5/IS
	 QjG9L/E4auOJZ6SGLw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mirna-1twupB4BQy-00jfDj; Thu, 02
 Jan 2025 16:44:18 +0100
Message-ID: <abfad87b-4397-4421-a23d-318419bd0ccd@gmx.de>
Date: Thu, 2 Jan 2025 16:44:16 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/20] alienware-wmi: Improve rgb-zones group creation
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-7-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241229194506.8268-7-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Aq4PTLku/J00Adow7SASbpEKdNBcRsE4uVC0qUsVJE0aUaox5yi
 WCge3px597/BY29A5QC6HKjvRAaJMK+HxRkkYk+ObXagK76HKGeaMUnZCJn3UxXF/9b9+dN
 YGZcgaQwTqooC60TAb9xmmDjZc5DpiYfAMdamrKu3rE9exI53Zjcqusge7CJnR49tI+tZ/Y
 5juyh92mLTghIilGko1tw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hpUMbeaQnLU=;F5yPd6FShNSUIwOBXVal8MohJf2
 LrmMXHC6ZAHBvP19u0Zr1HRa1qGy2hh0WH7UUwnz0wTbeDLd65FAPDQqt4xs7DXArE2xnfR/v
 GxkUo48suDLoPem+Ttpy4yDBu0XCEFhJKsSPeJ8t0Mt7SiLkBWlg4HuO9JDNcJjwe6CTSI3u2
 BpcTCLydzamJ+neIk2VkhtZWlW650EUXg+jGft2mG/tU8ued/eg0/2DIcr1RwiUS3poJp5dYA
 SlrbVY0KvvabBvyWazYuX8JlHValKu5S2Tu36lUiiw3wpS7oIk0cLqw/kcWOQUSIUvqoU06Ji
 yiIhytEPfg+YhoqwZBRUPqLuqvNE5VvWmP/lnTa+iX1bwD2eBx4BdPW1eDZH8bTtXqO5rbNQ5
 +AMQV8Utdi4kQImUWfD9lMjCZgtfgygL4fnNAlJX3q1+BtDSptGeXlPLe692qoVnGoPtbLb0O
 DMDOHJ/nZOmwx/OxFiIxq6EIf30wjVuqDEEYtZ/nVmU7J/9JdV+v5GF06GhOMtL+Go163Ei89
 oHMU8eOkTVilBLK/kFZVlO2S0slmkxl7WftH8bEYO6UMK/htA5hAnukdNVllZufzkld1MFnjx
 C7L1HngttsIqtxYvLwIl3cus3Akx6VFenu8iQjMhyQ7d5zWYtKpjjvPAkYzHAYUfVwHMEIW56
 VIiXJhK5wplrqdXCvZXvs9su+iz7A54BIChYlTX0MrnKX/hc5tDCBcMMu59OX5axCV7x7tkId
 nhebcZ6VQYMXfVgTr16lfc4oTcwWnq7FAJC82uO6CjipZ9gmrJRteLjCC2lRJOIm+koczi7cO
 KNyf9+G0LNtpFZqpFfd10GoUqBrv7B6v4U1niMovEltrDo06duX77njtf76aa0PmN27yTGCYV
 RKaMot1xzFR8HywGIbFHSikTnnfpK2l6XypoBp0Vvd5Bb24I0hHiqXvk/QYTwFRWWt4klMQzb
 vwL8ByNn4L8u4iv72RypSk2ox1svmTnyo/Q1fM5D2QeHvC6L+cWl6RW7+ricwh7qQjnkmv2sX
 2VPZx51fkcVLyZv3daHLGKYNFxVdCjAO9166jjeqdxWOuu8qFN7YjoRhuNl1CE3/Bu+x7d1jD
 PGvyqs0eFSiBo38guMOPv5y9iSs34n

Am 29.12.24 um 20:44 schrieb Kurt Borja:

> Define zone_attrs statically and initialize zone_attribute_group with
> platform driver's .dev_groups.
>
> Drop match_zone() and instead pass a `location` argument to previous
> show/store methods to access the correct `zone` LED state. On top of
> that rename zone_set() -> zone_store() to be more consistent with sysfs
> conventions.
>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>   drivers/platform/x86/dell/alienware-wmi.c | 209 +++++++++++-----------
>   1 file changed, 102 insertions(+), 107 deletions(-)
>
> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platfor=
m/x86/dell/alienware-wmi.c
> index e010c94555e8..d97e5e15a8f2 100644
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
> @@ -510,35 +484,84 @@ static int alienware_update_led(struct platform_zo=
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
> +static ssize_t zone00_show(struct device *dev, struct device_attribute =
*attr,
> +			   char *buf)
> +{
> +	return zone_show(dev, attr, buf, 0);
> +}
> +
> +static ssize_t zone00_store(struct device *dev, struct device_attribute=
 *attr,
> +			    const char *buf, size_t count)
> +{
> +	return zone_store(dev, attr, buf, count, 0);
> +}
> +
> +DEVICE_ATTR_RW(zone00);
> +
> +static ssize_t zone01_show(struct device *dev, struct device_attribute =
*attr,
> +			   char *buf)
> +{
> +	return zone_show(dev, attr, buf, 1);
> +}
> +
> +static ssize_t zone01_store(struct device *dev, struct device_attribute=
 *attr,
> +			    const char *buf, size_t count)
> +{
> +	return zone_store(dev, attr, buf, count, 1);
> +}
> +
> +DEVICE_ATTR_RW(zone01);
> +
> +static ssize_t zone02_show(struct device *dev, struct device_attribute =
*attr,
> +			   char *buf)
> +{
> +	return zone_show(dev, attr, buf, 2);
> +}
> +
> +static ssize_t zone02_store(struct device *dev, struct device_attribute=
 *attr,
> +			    const char *buf, size_t count)
> +{
> +	return zone_store(dev, attr, buf, count, 2);
> +}
> +
> +DEVICE_ATTR_RW(zone02);
> +
> +static ssize_t zone03_show(struct device *dev, struct device_attribute =
*attr,
> +			   char *buf)
> +{
> +	return zone_show(dev, attr, buf, 3);
> +}
> +
> +static ssize_t zone03_store(struct device *dev, struct device_attribute=
 *attr,
> +			    const char *buf, size_t count)
> +{
> +	return zone_store(dev, attr, buf, count, 3);
> +}
> +
> +DEVICE_ATTR_RW(zone03);
> +
>   /*
>    * Lighting control state device attribute (Global)
>    */
> @@ -578,6 +601,33 @@ static ssize_t lighting_control_state_store(struct =
device *dev,
>
>   static DEVICE_ATTR_RW(lighting_control_state);
>
> +static umode_t zone_attr_visible(struct kobject *kobj,
> +				 struct attribute *attr, int n)
> +{
> +	return n < quirks->num_zones + 1 ? 0644 : 0;

Please return attr->mode here instead of 0644. I would also prefer if you =
use a traditional if statement here.

With this small issue being addressed:

Reviewed-by: Armin Wolf <W_Armin@gmx.de>

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
> @@ -606,7 +656,7 @@ static void global_led_set(struct led_classdev *led_=
cdev,
>   	if (interface =3D=3D WMAX)
>   		ret =3D wmax_brightness(brightness);
>   	else
> -		ret =3D alienware_update_led(&zone_data[0]);
> +		ret =3D alienware_update_led(0);
>   	if (ret)
>   		pr_err("LED brightness update failed\n");
>   }
> @@ -624,9 +674,6 @@ static struct led_classdev global_led =3D {
>
>   static int alienware_zone_init(struct platform_device *dev)
>   {
> -	u8 zone;
> -	char *name;
> -
>   	if (interface =3D=3D WMAX) {
>   		lighting_control_state =3D WMAX_RUNNING;
>   	} else if (interface =3D=3D LEGACY) {
> @@ -635,65 +682,12 @@ static int alienware_zone_init(struct platform_dev=
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
> @@ -1143,6 +1137,7 @@ static void remove_thermal_profile(void)
>    * Platform Driver
>    */
>   static const struct attribute_group *alienfx_groups[] =3D {
> +	&zone_attribute_group,
>   	&hdmi_attribute_group,
>   	&amplifier_attribute_group,
>   	&deepsleep_attribute_group,
