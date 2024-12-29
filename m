Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADE1A50;
	Sun, 29 Dec 2024 00:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735431449; cv=none; b=HCpiw9pJr7/kWlxAZUGaFBPZSI2ES9pqvSBgwtquFa+p7+1xTjwNJwewqPJZKWo5mCHKa5JwE0snCttbVrCR/oNwk8gl7y18Kx6hgj/88IpXq2D5MpdMpkf2P+mA6Y5znDjj/dR5YzCMA9wcySy/7FYNSVtMfpJFDweoKAzIUck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735431449; c=relaxed/simple;
	bh=PB5nbM+SxgoxZ2n8Z+zD4c0EmGkDUcnKRspXw3wAQes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nane8lxfdSqQ4hanmwZ77VOrNh5tuijq9Mgg3Qva96HpJQo8eRxXiz3CNtYtW8XEM408Y3Xrw1jx1OEge+zcOGBxyDhcsPEAFyHqEiQwFs0FWoxRDGrVxerHzSDKOLDlny1VPS4wk00bBvBYC603E1iv/2gKDYKQ5lBGDyVnw0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RS7h7KMS; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RS7h7KMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735431431; x=1736036231; i=w_armin@gmx.de;
	bh=porf7DanR8seNkjlcjAaCg7lt5QFoEnDpl7ucghqiKk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RS7h7KMSt/xCEwUrCNZzvqLLSGUqlMWuKPUAgrqaM38Rmv1ZK9zE08wNCaFwvKn3
	 S93afYzSHfSVgc3f+RTMGcFYeWrIK83S1PkXNZbh1BvTasdvazFsDu7lxJpRNso1d
	 aqlUMMh6kWqEpoB7ovbfDpZgOvg1xh0tbio7R4zeCVJ8tXeE3f20pksbAr3IcRQm/
	 5R/eLKpIjlE8pmkbBrvuf5IUASDPW3HJKVZszWNSRSH9jk2OCk99gY0BN0NfeshHi
	 f+1DMhJiDoA1YGd1fyC5SkwAeuYVaKtss2W6CeO8/tGdhHZfVBlqoQehlfYw3O1N/
	 5kaK2qsAl7UekIVywg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MG9kC-1tHoZn1xUK-00FgDk; Sun, 29
 Dec 2024 01:17:11 +0100
Message-ID: <03277243-96d3-4f96-a078-a5776bb00bbc@gmx.de>
Date: Sun, 29 Dec 2024 01:17:10 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/20] alienware-wmi: Improve rgb-zones group creation
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
 mario.limonciello@amd.com, hdegoede@redhat.com,
 linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
References: <20241221055917.10555-1-kuurtb@gmail.com>
 <20241221055917.10555-6-kuurtb@gmail.com>
 <53d5792d-bdfb-4f6e-a75d-6d5e437e1a93@gmx.de>
 <ycjzmsa7gihizv2dwms7ojpp3oiopqthzqykgdjitytpykj7eg@vohjl2kij7sp>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <ycjzmsa7gihizv2dwms7ojpp3oiopqthzqykgdjitytpykj7eg@vohjl2kij7sp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:CYE2VaO6mDA6TLSilHfFD6kHccLc3KxiMite4xS3/OvS/q9vRcg
 gzSNMlXAH5rkZlLq/XyK7A+wi2yGftug2HxRZHTw2Wxkv3p9xkTsqlBatjX3lQE8zgOKjeD
 EfbHxgvFjkn5fsaSLIK9QisJ96XxbVA6qGors5fyfuk+qnxXxuCVwPICXrQSBVuhX7dHFdL
 jlyds2P2RYgUMk1580HGg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gj2BYEWpnyE=;ePbjMdg+WlcFATJfrmMTKvm9FLZ
 5qLtMR7XGZAg30w+HdmP8Yam1I//Mw4gxfl53BYUsTPQ8FEv9EXdNP9uT3STIrVa9aUZB0CMm
 VwGTlOm7LbBbyrOPtmQdJFC8LZRj9zDlZrBMNgGyC2mylFSt7AIpH22MhI1UQ9JDsP+h4Asug
 j98U3ySx7mVZnPSDXbnS86RPqVgTh3iCEKqIoJUBSO2vSB38mPbP/xTF0MpzSNczNBuywZ/MN
 1zh52E3wmfTBK10uZ/HpJuFEm+uszvIPy2ANf/HJRg+7bHYm4Zh7c8SADOuEFJDgszJN2KtQE
 sLMtYPCknGkaiLv9G2PciopPZjT2PQJhnnjWidmyaXnXko3LzF96Jflya3ynGAj28iU4lcxxr
 FFhbMMoVkU8e0JHOL3rnK4V4YCF4gHb5JFMx5eCB9j4w2AKLWnNasD5r/LJZypUCk39N6prJP
 8kFJ7uccsuwFOma3YB5pbgD4gGV31gW9S9cWapz0VYYUl3aBWyrhwbivPbZ7OmODNTY4WuVfE
 bTxQ1cE9MTAyqZyi+Q2MtshxC7cND8bbU/YYs+4qatpi3+sENCzT2/QDNrNg0TCP5XpRaZh2t
 PXRakUytZSdeHocu4BFL0rkLm9lWZWIounkV4Dd7HoC5Digy4kSAg0k9gp8+BqiJ3zHmbiTHu
 xe9qxMETMFRO/JgPuGERQLR5FS1Q3dbU9q2QpQnPsBhtPzjjaAk0VAW6QKc9PXl46rWSidkHX
 vSwD6NHRRBbePkFTPvmwOkWWgwOtdAhAJeHKQNW4aDJYySTCx4poH//LK3i3m2sANbGMXqeWX
 iryJLNtg/3/P3db2VcVRp6zExVAL8c2aemEFh11tD5SXrxH+YnkJzfsq8Km63VoL18h4lIH2X
 jM3yRh/xpKy1pki51mIQ2B/wyg6HdEt4JyLFjPM0CB6MDWMdm+j66Hiu1rn1/lE93AbMNWpLt
 TD2pzuwTaEdsHWNfKvBcE8BtFOGtklO6BFzxjCNaEZJ/TEizSJ5iX4m38yyFExmRBeN3bpPIo
 slnr29nbuBRJJaC7l6CCMbB8yhsgJSXCoWCrVFu37P/8iCFM+AsnBJR7nEf3Bk0t2ty44HfSp
 qzGq+JNzYo3TvZGaJB/gC1cya+QqRJ

Am 27.12.24 um 05:37 schrieb Kurt Borja:

> On Fri, Dec 27, 2024 at 02:04:51AM +0100, Armin Wolf wrote:
>> Am 21.12.24 um 06:59 schrieb Kurt Borja:
>>
>>> Define zone_attrs statically with the use of helper macros and
>>> initialize the zone_attribute_group with driver's .dev_groups.
>>>
>>> Drop match_zone() and instead pass a `location` argument to previous
>>> show/store methods to access the correct `zone` LED state. On top of
>>> that rename zone_set() -> zone_store() to be more consistent with sysfs
>>> conventions.
>>>
>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>> ---
>>>    drivers/platform/x86/dell/alienware-wmi.c | 179 +++++++++-------------
>>>    1 file changed, 72 insertions(+), 107 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
>>> index e010c94555e8..a431b1fec9fb 100644
>>> --- a/drivers/platform/x86/dell/alienware-wmi.c
>>> +++ b/drivers/platform/x86/dell/alienware-wmi.c
>>> @@ -376,12 +376,6 @@ struct color_platform {
>>>    	u8 red;
>>>    } __packed;
>>>
>>> -struct platform_zone {
>>> -	u8 location;
>>> -	struct device_attribute *attr;
>>> -	struct color_platform colors;
>>> -};
>>> -
>>>    struct wmax_brightness_args {
>>>    	u32 led_mask;
>>>    	u32 percentage;
>>> @@ -411,16 +405,10 @@ struct wmax_u32_args {
>>>    };
>>>
>>>    static struct platform_device *platform_device;
>>> -static struct device_attribute *zone_dev_attrs;
>>> -static struct attribute **zone_attrs;
>>> -static struct platform_zone *zone_data;
>>> +static struct color_platform colors[4];
>>>    static struct platform_profile_handler pp_handler;
>>>    static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
>>>
>>> -static struct attribute_group zone_attribute_group = {
>>> -	.name = "rgb_zones",
>>> -};
>>> -
>>>    static u8 interface;
>>>    static u8 lighting_control_state;
>>>    static u8 global_brightness;
>>> @@ -452,24 +440,10 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
>>>    	return 0;
>>>    }
>>>
>>> -static struct platform_zone *match_zone(struct device_attribute *attr)
>>> -{
>>> -	u8 zone;
>>> -
>>> -	for (zone = 0; zone < quirks->num_zones; zone++) {
>>> -		if ((struct device_attribute *)zone_data[zone].attr == attr) {
>>> -			pr_debug("alienware-wmi: matched zone location: %d\n",
>>> -				 zone_data[zone].location);
>>> -			return &zone_data[zone];
>>> -		}
>>> -	}
>>> -	return NULL;
>>> -}
>>> -
>>>    /*
>>>     * Individual RGB zone control
>>>     */
>>> -static int alienware_update_led(struct platform_zone *zone)
>>> +static int alienware_update_led(u8 location)
>>>    {
>>>    	int method_id;
>>>    	acpi_status status;
>>> @@ -478,8 +452,8 @@ static int alienware_update_led(struct platform_zone *zone)
>>>    	struct legacy_led_args legacy_args;
>>>    	struct wmax_led_args wmax_basic_args;
>>>    	if (interface == WMAX) {
>>> -		wmax_basic_args.led_mask = 1 << zone->location;
>>> -		wmax_basic_args.colors = zone->colors;
>>> +		wmax_basic_args.led_mask = 1 << location;
>>> +		wmax_basic_args.colors = colors[location];
>>>    		wmax_basic_args.state = lighting_control_state;
>>>    		guid = WMAX_CONTROL_GUID;
>>>    		method_id = WMAX_METHOD_ZONE_CONTROL;
>>> @@ -487,7 +461,7 @@ static int alienware_update_led(struct platform_zone *zone)
>>>    		input.length = sizeof(wmax_basic_args);
>>>    		input.pointer = &wmax_basic_args;
>>>    	} else {
>>> -		legacy_args.colors = zone->colors;
>>> +		legacy_args.colors = colors[location];
>>>    		legacy_args.brightness = global_brightness;
>>>    		legacy_args.state = 0;
>>>    		if (lighting_control_state == LEGACY_BOOTING ||
>>> @@ -496,7 +470,7 @@ static int alienware_update_led(struct platform_zone *zone)
>>>    			legacy_args.state = lighting_control_state;
>>>    		} else
>>>    			guid = LEGACY_CONTROL_GUID;
>>> -		method_id = zone->location + 1;
>>> +		method_id = location + 1;
>>>
>>>    		input.length = sizeof(legacy_args);
>>>    		input.pointer = &legacy_args;
>>> @@ -510,35 +484,54 @@ static int alienware_update_led(struct platform_zone *zone)
>>>    }
>>>
>>>    static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
>>> -			 char *buf)
>>> +			 char *buf, u8 location)
>>>    {
>>> -	struct platform_zone *target_zone;
>>> -	target_zone = match_zone(attr);
>>> -	if (target_zone == NULL)
>>> -		return sprintf(buf, "red: -1, green: -1, blue: -1\n");
>>>    	return sprintf(buf, "red: %d, green: %d, blue: %d\n",
>>> -		       target_zone->colors.red,
>>> -		       target_zone->colors.green, target_zone->colors.blue);
>>> +		       colors[location].red, colors[location].green,
>>> +		       colors[location].blue);
>>>
>>>    }
>>>
>>> -static ssize_t zone_set(struct device *dev, struct device_attribute *attr,
>>> -			const char *buf, size_t count)
>>> +static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
>>> +			  const char *buf, size_t count, u8 location)
>>>    {
>>> -	struct platform_zone *target_zone;
>>>    	int ret;
>>> -	target_zone = match_zone(attr);
>>> -	if (target_zone == NULL) {
>>> -		pr_err("alienware-wmi: invalid target zone\n");
>>> -		return 1;
>>> -	}
>>> -	ret = parse_rgb(buf, &target_zone->colors);
>>> +
>>> +	ret = parse_rgb(buf, &colors[location]);
>>>    	if (ret)
>>>    		return ret;
>>> -	ret = alienware_update_led(target_zone);
>>> +
>>> +	ret = alienware_update_led(location);
>>> +
>>>    	return ret ? ret : count;
>>>    }
>>>
>>> +#define ALIENWARE_ZONE_SHOW_FUNC(_num)					\
>>> +	static ssize_t zone0##_num##_show(struct device *dev,		\
>>> +					struct device_attribute *attr,	\
>>> +					char *buf)			\
>>> +	{								\
>>> +		return zone_show(dev, attr, buf, _num);			\
>>> +	}
>>> +
>>> +#define ALIENWARE_ZONE_STORE_FUNC(_num)					\
>>> +	static ssize_t zone0##_num##_store(struct device *dev,		\
>>> +					struct device_attribute *attr,	\
>>> +					const char *buf, size_t count)	\
>>> +	{								\
>>> +		return zone_store(dev, attr, buf, count, _num);		\
>>> +	}
>>> +
>>> +#define ALIENWARE_ZONE_ATTR(_num)					\
>>> +	ALIENWARE_ZONE_SHOW_FUNC(_num)					\
>>> +	ALIENWARE_ZONE_STORE_FUNC(_num)					\
>>> +	static DEVICE_ATTR_RW(zone0##_num)
>>> +
>>> +ALIENWARE_ZONE_ATTR(0);
>>> +ALIENWARE_ZONE_ATTR(1);
>>> +ALIENWARE_ZONE_ATTR(2);
>>> +ALIENWARE_ZONE_ATTR(3);
>> I know that this will result in a bit of boilerplate code, but please do not use such macros.
>> They have a habit of confusing static code analysis tools.
> Ack.
>
> I'll drop this macros, checkpatch also hates the last one.
>
>>> +
>>>    /*
>>>     * Lighting control state device attribute (Global)
>>>     */
>>> @@ -578,6 +571,33 @@ static ssize_t lighting_control_state_store(struct device *dev,
>>>
>>>    static DEVICE_ATTR_RW(lighting_control_state);
>>>
>>> +static umode_t zone_attr_visible(struct kobject *kobj,
>>> +				 struct attribute *attr, int n)
>>> +{
>>> +	return n < quirks->num_zones + 1 ? 0644 : 0;
>> Where is this function used?
> It gets picked up by DEFINE_SYSFS_GROUP_VISIBLE to manage individual
> attributes permissions.

I see, nice.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>> +}
>>> +
>>> +static bool zone_group_visible(struct kobject *kobj)
>>> +{
>>> +	return quirks->num_zones > 0;
>>> +}
>>> +DEFINE_SYSFS_GROUP_VISIBLE(zone);
>>> +
>>> +static struct attribute *zone_attrs[] = {
>>> +	&dev_attr_lighting_control_state.attr,
>>> +	&dev_attr_zone00.attr,
>>> +	&dev_attr_zone01.attr,
>>> +	&dev_attr_zone02.attr,
>>> +	&dev_attr_zone03.attr,
>>> +	NULL
>>> +};
>>> +
>>> +static struct attribute_group zone_attribute_group = {
>>> +	.name = "rgb_zones",
>>> +	.is_visible = SYSFS_GROUP_VISIBLE(zone),
>>> +	.attrs = zone_attrs,
>>> +};
>>> +
>>>    /*
>>>     * LED Brightness (Global)
>>>     */
>>> @@ -606,7 +626,7 @@ static void global_led_set(struct led_classdev *led_cdev,
>>>    	if (interface == WMAX)
>>>    		ret = wmax_brightness(brightness);
>>>    	else
>>> -		ret = alienware_update_led(&zone_data[0]);
>>> +		ret = alienware_update_led(0);
>>>    	if (ret)
>>>    		pr_err("LED brightness update failed\n");
>>>    }
>>> @@ -624,9 +644,6 @@ static struct led_classdev global_led = {
>>>
>>>    static int alienware_zone_init(struct platform_device *dev)
>>>    {
>>> -	u8 zone;
>>> -	char *name;
>>> -
>>>    	if (interface == WMAX) {
>>>    		lighting_control_state = WMAX_RUNNING;
>>>    	} else if (interface == LEGACY) {
>>> @@ -635,65 +652,12 @@ static int alienware_zone_init(struct platform_device *dev)
>>>    	global_led.max_brightness = 0x0F;
>>>    	global_brightness = global_led.max_brightness;
>>>
>>> -	/*
>>> -	 *      - zone_dev_attrs num_zones + 1 is for individual zones and then
>>> -	 *        null terminated
>>> -	 *      - zone_attrs num_zones + 2 is for all attrs in zone_dev_attrs +
>>> -	 *        the lighting control + null terminated
>>> -	 *      - zone_data num_zones is for the distinct zones
>>> -	 */
>>> -	zone_dev_attrs =
>>> -	    kcalloc(quirks->num_zones + 1, sizeof(struct device_attribute),
>>> -		    GFP_KERNEL);
>>> -	if (!zone_dev_attrs)
>>> -		return -ENOMEM;
>>> -
>>> -	zone_attrs =
>>> -	    kcalloc(quirks->num_zones + 2, sizeof(struct attribute *),
>>> -		    GFP_KERNEL);
>>> -	if (!zone_attrs)
>>> -		return -ENOMEM;
>>> -
>>> -	zone_data =
>>> -	    kcalloc(quirks->num_zones, sizeof(struct platform_zone),
>>> -		    GFP_KERNEL);
>>> -	if (!zone_data)
>>> -		return -ENOMEM;
>>> -
>>> -	for (zone = 0; zone < quirks->num_zones; zone++) {
>>> -		name = kasprintf(GFP_KERNEL, "zone%02hhX", zone);
>>> -		if (name == NULL)
>>> -			return 1;
>>> -		sysfs_attr_init(&zone_dev_attrs[zone].attr);
>>> -		zone_dev_attrs[zone].attr.name = name;
>>> -		zone_dev_attrs[zone].attr.mode = 0644;
>>> -		zone_dev_attrs[zone].show = zone_show;
>>> -		zone_dev_attrs[zone].store = zone_set;
>>> -		zone_data[zone].location = zone;
>>> -		zone_attrs[zone] = &zone_dev_attrs[zone].attr;
>>> -		zone_data[zone].attr = &zone_dev_attrs[zone];
>>> -	}
>>> -	zone_attrs[quirks->num_zones] = &dev_attr_lighting_control_state.attr;
>>> -	zone_attribute_group.attrs = zone_attrs;
>>> -
>>> -	led_classdev_register(&dev->dev, &global_led);
>>> -
>>> -	return sysfs_create_group(&dev->dev.kobj, &zone_attribute_group);
>>> +	return led_classdev_register(&dev->dev, &global_led);
>>>    }
>>>
>>>    static void alienware_zone_exit(struct platform_device *dev)
>>>    {
>>> -	u8 zone;
>>> -
>>> -	sysfs_remove_group(&dev->dev.kobj, &zone_attribute_group);
>>>    	led_classdev_unregister(&global_led);
>>> -	if (zone_dev_attrs) {
>>> -		for (zone = 0; zone < quirks->num_zones; zone++)
>>> -			kfree(zone_dev_attrs[zone].attr.name);
>>> -	}
>>> -	kfree(zone_dev_attrs);
>>> -	kfree(zone_data);
>>> -	kfree(zone_attrs);
>>>    }
>>>
>>>    static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
>>> @@ -1143,6 +1107,7 @@ static void remove_thermal_profile(void)
>>>     * Platform Driver
>>>     */
>>>    static const struct attribute_group *alienfx_groups[] = {
>>> +	&zone_attribute_group,
>>>    	&hdmi_attribute_group,
>>>    	&amplifier_attribute_group,
>>>    	&deepsleep_attribute_group,
