Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9E4B16EBE8;
	Thu,  2 Jan 2025 19:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735845672; cv=none; b=rmMOrRAkaWzgvQW4BqGhhwtonZ0i/wIpa2W4039Bma9RN7qTyYxv+ZPvAK+Wi6+rj0tROzfevN9vSlgm+x/TYz1QIqz913eqrwgZRBc/5dQghhAoGdtshP+ijrDFR0lt38tq+nGuSUbGERn6IBqCmEr7g/IhcVC6irKN/vVBDPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735845672; c=relaxed/simple;
	bh=T2hAwTPYyZS28GotqL/YagDh+0Ck0Z0AFz+/blMHuIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SHQq9cZ80Xh9P6EYsqskgPr7H+hqYLZkaLTG4rZ2cksRv3L0nJk9CvPjDcNAer3oQHdqR+pTLWpEeoIVTblkLvGSo1rlkOnmXEQH01UlyK+SdcziG+wX7fieTdqU1p/zujUpRKr7y9zhnGESSyzwHNU1mY4Em2dPWGlO0vbszKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=DtEdIsGw; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="DtEdIsGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735845652; x=1736450452; i=w_armin@gmx.de;
	bh=9mIPXYe0jlhVubRkUeGRnXTofA9eN/QI0YBNF+aK9GI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=DtEdIsGwrHlrlLvvfe5jD1DuainWdGzFBY1Xv/EOz4RvZ7rHN37DRrw61D1k+HFV
	 vJpDFavV8fNZfPJ69xoaCKxt9h8aRiIq8I6Q86ibwaTzO8pzq5M1mmGDldjNi0/X3
	 eoc9+nQkxllxAsV5I8I0DpMLcaANDMRxldkrU3wLwSDDjg0sxHIzStNS4a1OKLcM2
	 Pt0K5XfJAPNhWMtz7hhxQC2Q1MEzQdM4YLVxJ8cNIZ2rxaqSXYuofl6DoJ4WpUKiH
	 3i8KMtPrT2YhPAaFj7WmkcPBkLe3K1AnoCze/BArrbi5zxqsfHxIfxsPgtuuMtRLQ
	 8900+aCvq9OEyE8zLg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MJE2D-1tDh3H0lR5-00XKTv; Thu, 02
 Jan 2025 20:20:52 +0100
Message-ID: <d6385e2c-9f2a-4d0a-b645-b05eb33bc0fd@gmx.de>
Date: Thu, 2 Jan 2025 20:20:48 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/20] alienware-wmi: Add a state container for LED
 control feature
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com,
 hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
 linux-kernel@vger.kernel.org, mario.limonciello@amd.com
References: <20241229194506.8268-2-kuurtb@gmail.com>
 <20241229194506.8268-9-kuurtb@gmail.com>
 <50b0b025-87ad-4093-b525-f95a22b8f124@gmx.de>
 <fz3qdng6vvlfmncxosqmlswhxu36yplg7h6igeaipdqfao2tgl@bymtliqzw5sw>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <fz3qdng6vvlfmncxosqmlswhxu36yplg7h6igeaipdqfao2tgl@bymtliqzw5sw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:1+H38JHsRJU5RpKP0FuKgcsrzxov/reyTI8d+eVTYHe8d/Jx23n
 oY32HHbdHYgzXNt/s5h/yjc6/S6ZE1uC06Or3KnqDrycwLPGF1omrFp/AWIbU38b8Cc3UTC
 ycnJBCRmAbUvhyhmxsHD9toaxEczufOaadhQyXs1xLxMb9ByZq+k6SlC33bZVGSyT0Ujlre
 7fWMI20xlfGU2qysxsn6g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wJ7vFuBs3vo=;fNPc4hD8eczG1Wjax0q4tauGHob
 wU03t9wYS50zJf9ZH41NzEeiD95ZfBTqVu3MD/ghw4Eheih3bakvhhLa3igiTyq5toUBFBDRp
 FMyySCtn1XSFXsY+70Z+fG4ygDZ5Xe9dr/GooDWhqW63hs2sfMj3+ZuLy9PLeOYGDClKBwL60
 FH5IJzEBxEPQECa/IGfbzbJ7unHK5ZG0TGDXYxItxTCYB0QR9TuRH76eClEpCQI7QvCxcDo8I
 Y5shQQ6cVJbSJfpA2ma0ohAQS1HqLvLa238Aw4z/S9e59OM3de3V7GPm9H7NvrBYv9Adev1Mw
 AeE+IVoXWuLGEJyFw8lvVDOROCWXnlvhuUoBoA/F97C+Z4zocWaQ35cdVe5tcj2wHsIJSMEJm
 Wt95EktZq692jFTSXLdMeC7DhDD8jr19IawEcmwdQR0Sj+YJUcuuKpGdu9BAxEGxk9SyuBQSJ
 zp8qEE9MNYCk6wq8VGg8Apms9rLBM/p6+LS+I0ZrmEsOClH4KkAiKIXpcYMDXIxJ1Vqz72wqg
 Pmvg92zgEauSKAdPENcOSVXeXZQuEX4xFzQ9kFN6A9dWmuNZv0g+m2Pt7JGLpKqvfX7mx139C
 EGaIdvJ4zor0r16Zo1gnN5wC7uM0By/KbSwodYRD+0PzJVfk0XFb08BEjyPwW/pm521Xr5CEj
 1wUPolcYxgRwziLywQFd2tnj5mGBSZKoHCnUKxWvaSfcLkMZ+4ds11LO6kaBe1E8oIugwdFUk
 1dkLPK1rQSbbkCfGSe4wLNrb5vlH188Ak+dr7SSUuIJaUyr3LT3tKNnSdYk+lx+hoHCdqQU9B
 PzW/HHXQQQZhN89zKzmdow6sJKq4YoXzSm6bojjqCKk2S8+jNDqmcGNEvGSRp10wOVYnpX7QK
 XrjT/348PUCqnQlyWFVx1QngvnH9HJPFJwT8szs+gF2XMwiBcuuW9bv+LgiQmO1SxVDv0CaM7
 sGi+mCBbDrTpjK7BAHLNjEm33XSZHvo/zpUb+gKFF5dyOK6zMFx6lYLF5/gbBlhxRVYX4VNtJ
 D7ulB/WGOFommIjmSx7Yrwmzm6yUvEBWXCdH0UnPWupXEIOvSVPNmUEAUxdiOULxsqjGsUI31
 e090wVXnaSndx7DkImtboFc1VMoYed

Am 02.01.25 um 19:45 schrieb Kurt Borja:

> On Thu, Jan 02, 2025 at 05:07:16PM +0100, Armin Wolf wrote:
>> Am 29.12.24 um 20:44 schrieb Kurt Borja:
>>
>>> Add a state container for the "alienware-wmi" platform device and
>>> initialize it on the new alienfx_probe(). Migrate all LED control functions
>>> to use this state container, as well as hdmi, amplifier, deepslp group
>>> visibility methods, to support upcoming file split.
>>>
>>> Additionally move the led_classdev registration to the platform driver
>>> probe and make it device managed.
>>>
>>> Drop alienware_zone_init() and alienware_zone_exit() because they are no
>>> longer needed.
>>>
>>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>>> ---
>>>    drivers/platform/x86/dell/alienware-wmi.c | 135 +++++++++++++---------
>>>    1 file changed, 79 insertions(+), 56 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/dell/alienware-wmi.c b/drivers/platform/x86/dell/alienware-wmi.c
>>> index 2c17160473a6..88d4046ed45f 100644
>>> --- a/drivers/platform/x86/dell/alienware-wmi.c
>>> +++ b/drivers/platform/x86/dell/alienware-wmi.c
>>> @@ -404,14 +404,20 @@ struct wmax_u32_args {
>>>    	u8 arg3;
>>>    };
>>>
>>> +struct alienfx_priv {
>>> +	struct platform_device *pdev;
>>> +	struct quirk_entry *quirks;
>>> +	struct led_classdev global_led;
>>> +	struct color_platform colors[4];
>>> +	u8 global_brightness;
>>> +	u8 lighting_control_state;
>>> +};
>>> +
>>>    static struct platform_device *platform_device;
>>> -static struct color_platform colors[4];
>>>    static struct platform_profile_handler pp_handler;
>>>    static enum wmax_thermal_mode supported_thermal_profiles[PLATFORM_PROFILE_LAST];
>>>
>>>    static u8 interface;
>>> -static u8 lighting_control_state;
>>> -static u8 global_brightness;
>>>
>>>    /*
>>>     * Helpers used for zone control
>>> @@ -443,7 +449,7 @@ static int parse_rgb(const char *buf, struct color_platform *colors)
>>>    /*
>>>     * Individual RGB zone control
>>>     */
>>> -static int alienware_update_led(u8 location)
>>> +static int alienware_update_led(struct alienfx_priv *priv, u8 location)
>>>    {
>>>    	int method_id;
>>>    	acpi_status status;
>>> @@ -453,21 +459,21 @@ static int alienware_update_led(u8 location)
>>>    	struct wmax_led_args wmax_basic_args;
>>>    	if (interface == WMAX) {
>>>    		wmax_basic_args.led_mask = 1 << location;
>>> -		wmax_basic_args.colors = colors[location];
>>> -		wmax_basic_args.state = lighting_control_state;
>>> +		wmax_basic_args.colors = priv->colors[location];
>>> +		wmax_basic_args.state = priv->lighting_control_state;
>>>    		guid = WMAX_CONTROL_GUID;
>>>    		method_id = WMAX_METHOD_ZONE_CONTROL;
>>>
>>>    		input.length = sizeof(wmax_basic_args);
>>>    		input.pointer = &wmax_basic_args;
>>>    	} else {
>>> -		legacy_args.colors = colors[location];
>>> -		legacy_args.brightness = global_brightness;
>>> +		legacy_args.colors = priv->colors[location];
>>> +		legacy_args.brightness = priv->global_brightness;
>>>    		legacy_args.state = 0;
>>> -		if (lighting_control_state == LEGACY_BOOTING ||
>>> -		    lighting_control_state == LEGACY_SUSPEND) {
>>> +		if (priv->lighting_control_state == LEGACY_BOOTING ||
>>> +		    priv->lighting_control_state == LEGACY_SUSPEND) {
>>>    			guid = LEGACY_POWER_CONTROL_GUID;
>>> -			legacy_args.state = lighting_control_state;
>>> +			legacy_args.state = priv->lighting_control_state;
>>>    		} else
>>>    			guid = LEGACY_CONTROL_GUID;
>>>    		method_id = location + 1;
>>> @@ -486,22 +492,26 @@ static int alienware_update_led(u8 location)
>>>    static ssize_t zone_show(struct device *dev, struct device_attribute *attr,
>>>    			 char *buf, u8 location)
>>>    {
>>> +	struct alienfx_priv *priv = dev_get_drvdata(dev);
>>> +	struct color_platform *colors = &priv->colors[location];
>>> +
>>>    	return sprintf(buf, "red: %d, green: %d, blue: %d\n",
>>> -		       colors[location].red, colors[location].green,
>>> -		       colors[location].blue);
>>> +		       colors->red, colors->green, colors->blue);
>>>
>>>    }
>>>
>>>    static ssize_t zone_store(struct device *dev, struct device_attribute *attr,
>>>    			  const char *buf, size_t count, u8 location)
>>>    {
>>> +	struct alienfx_priv *priv = dev_get_drvdata(dev);
>>> +	struct color_platform *colors = &priv->colors[location];
>>>    	int ret;
>>>
>>> -	ret = parse_rgb(buf, &colors[location]);
>>> +	ret = parse_rgb(buf, colors);
>>>    	if (ret)
>>>    		return ret;
>>>
>>> -	ret = alienware_update_led(location);
>>> +	ret = alienware_update_led(priv, location);
>>>
>>>    	return ret ? ret : count;
>>>    }
>>> @@ -569,9 +579,11 @@ static ssize_t lighting_control_state_show(struct device *dev,
>>>    					   struct device_attribute *attr,
>>>    					   char *buf)
>>>    {
>>> -	if (lighting_control_state == LEGACY_BOOTING)
>>> +	struct alienfx_priv *priv = dev_get_drvdata(dev);
>>> +
>>> +	if (priv->lighting_control_state == LEGACY_BOOTING)
>>>    		return sysfs_emit(buf, "[booting] running suspend\n");
>>> -	else if (lighting_control_state == LEGACY_SUSPEND)
>>> +	else if (priv->lighting_control_state == LEGACY_SUSPEND)
>>>    		return sysfs_emit(buf, "booting running [suspend]\n");
>>>
>>>    	return sysfs_emit(buf, "booting [running] suspend\n");
>>> @@ -581,6 +593,7 @@ static ssize_t lighting_control_state_store(struct device *dev,
>>>    					    struct device_attribute *attr,
>>>    					    const char *buf, size_t count)
>>>    {
>>> +	struct alienfx_priv *priv = dev_get_drvdata(dev);
>>>    	u8 val;
>>>
>>>    	if (strcmp(buf, "booting\n") == 0)
>>> @@ -592,9 +605,9 @@ static ssize_t lighting_control_state_store(struct device *dev,
>>>    	else
>>>    		val = WMAX_RUNNING;
>>>
>>> -	lighting_control_state = val;
>>> +	priv->lighting_control_state = val;
>>>    	pr_debug("alienware-wmi: updated control state to %d\n",
>>> -		 lighting_control_state);
>>> +		 priv->lighting_control_state);
>>>
>>>    	return count;
>>>    }
>>> @@ -651,43 +664,26 @@ static int wmax_brightness(int brightness)
>>>    static void global_led_set(struct led_classdev *led_cdev,
>>>    			   enum led_brightness brightness)
>>>    {
>>> +	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
>>> +						 global_led);
>>>    	int ret;
>>> -	global_brightness = brightness;
>>> +
>>> +	priv->global_brightness = brightness;
>>> +
>>>    	if (interface == WMAX)
>>>    		ret = wmax_brightness(brightness);
>>>    	else
>>> -		ret = alienware_update_led(0);
>>> +		ret = alienware_update_led(priv, 0);
>>>    	if (ret)
>>>    		pr_err("LED brightness update failed\n");
>>>    }
>>>
>>>    static enum led_brightness global_led_get(struct led_classdev *led_cdev)
>>>    {
>>> -	return global_brightness;
>>> -}
>>> -
>>> -static struct led_classdev global_led = {
>>> -	.brightness_set = global_led_set,
>>> -	.brightness_get = global_led_get,
>>> -	.name = "alienware::global_brightness",
>>> -};
>>> +	struct alienfx_priv *priv = container_of(led_cdev, struct alienfx_priv,
>>> +						 global_led);
>>>
>>> -static int alienware_zone_init(struct platform_device *dev)
>>> -{
>>> -	if (interface == WMAX) {
>>> -		lighting_control_state = WMAX_RUNNING;
>>> -	} else if (interface == LEGACY) {
>>> -		lighting_control_state = LEGACY_RUNNING;
>>> -	}
>>> -	global_led.max_brightness = 0x0F;
>>> -	global_brightness = global_led.max_brightness;
>>> -
>>> -	return led_classdev_register(&dev->dev, &global_led);
>>> -}
>>> -
>>> -static void alienware_zone_exit(struct platform_device *dev)
>>> -{
>>> -	led_classdev_unregister(&global_led);
>>> +	return priv->global_brightness;
>>>    }
>>>
>>>    static acpi_status alienware_wmax_command(void *in_args, size_t in_size,
>>> @@ -792,7 +788,9 @@ static DEVICE_ATTR_RW(source);
>>>
>>>    static bool hdmi_group_visible(struct kobject *kobj)
>>>    {
>>> -	return quirks->hdmi_mux;
>>> +	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
>>> +
>>> +	return priv->quirks->hdmi_mux;
>>>    }
>>>    DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(hdmi);
>>>
>>> @@ -838,7 +836,9 @@ static DEVICE_ATTR_RO(status);
>>>
>>>    static bool amplifier_group_visible(struct kobject *kobj)
>>>    {
>>> -	return quirks->amplifier;
>>> +	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
>>> +
>>> +	return priv->quirks->amplifier;
>>>    }
>>>    DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(amplifier);
>>>
>>> @@ -906,7 +906,9 @@ static DEVICE_ATTR_RW(deepsleep);
>>>
>>>    static bool deepsleep_group_visible(struct kobject *kobj)
>>>    {
>>> -	return quirks->deepslp;
>>> +	struct alienfx_priv *priv = dev_get_drvdata(kobj_to_dev(kobj));
>>> +
>>> +	return priv->quirks->deepslp;
>>>    }
>>>    DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE(deepsleep);
>>>
>>> @@ -1133,6 +1135,33 @@ static void remove_thermal_profile(void)
>>>    /*
>>>     * Platform Driver
>>>     */
>>> +static int alienfx_probe(struct platform_device *pdev)
>>> +{
>>> +	struct alienfx_priv *priv;
>>> +
>>> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>>> +	if (!priv)
>>> +		return -ENOMEM;
>>> +
>>> +	platform_set_drvdata(pdev, priv);
>>> +	priv->pdev = pdev;
>>> +	priv->quirks = quirks;
>>> +
>>> +	if (interface == WMAX)
>>> +		priv->lighting_control_state = WMAX_RUNNING;
>>> +	else if (interface == LEGACY)
>>> +		priv->lighting_control_state = LEGACY_RUNNING;
>>> +
>>> +	priv->global_led.name = "alienware::global_brightness";
>>> +	priv->global_led.brightness_set = global_led_set;
>>> +	priv->global_led.brightness_get = global_led_get;
>>> +	priv->global_led.max_brightness = 0x0F;
>>> +
>>> +	priv->global_brightness = priv->global_led.max_brightness;
>>> +
>>> +	return devm_led_classdev_register(&pdev->dev, &priv->global_led);
>>> +}
>>> +
>>>    static const struct attribute_group *alienfx_groups[] = {
>>>    	&zone_attribute_group,
>>>    	&hdmi_attribute_group,
>>> @@ -1145,7 +1174,9 @@ static struct platform_driver platform_driver = {
>>>    	.driver = {
>>>    		.name = "alienware-wmi",
>>>    		.dev_groups = alienfx_groups,
>>> +		.probe_type = PROBE_FORCE_SYNCHRONOUS,
>> Can you please explain to me why this is exactly necessary?
> Because I want to add wmax_alienfx_groups after the platform_device has
> finished probing. I think it's not exactly "necessary" because those
> methods only access `platdata` which is set before probing, but to me it
> doesn't feel right to race with alienfx_probe().
>
> I wanted to somehow mimic platform_create_bundle(), which I can't use
> because that function needs to be called from an __init section.
>
> If this is unnecessary I will drop it, otherwise I think it makes more
> sense to move this to [8/20].
>
I just saw that the *_is_visible() callbacks use alienfx_priv which is only available
after the driver has finished probing.

I would prefer if you make the quirk values available outside of alienware-wmi-base so
that those callbacks can access them without having to use alienfx_priv. This would allow
us to omit PROBE_FORCE_SYNCHRONOUS.

Thanks,
Armin Wolf

>> Thanks,
>> Armin Wolf
>>
>>>    	},
>>> +	.probe = alienfx_probe,
>>>    };
>>>
>>>    static int __init alienware_wmi_init(void)
>>> @@ -1193,15 +1224,8 @@ static int __init alienware_wmi_init(void)
>>>    			goto fail_prep_thermal_profile;
>>>    	}
>>>
>>> -	ret = alienware_zone_init(platform_device);
>>> -	if (ret)
>>> -		goto fail_prep_zones;
>>> -
>>>    	return 0;
>>>
>>> -fail_prep_zones:
>>> -	alienware_zone_exit(platform_device);
>>> -	remove_thermal_profile();
>>>    fail_prep_thermal_profile:
>>>    	platform_device_del(platform_device);
>>>    fail_platform_device2:
>>> @@ -1216,7 +1240,6 @@ module_init(alienware_wmi_init);
>>>
>>>    static void __exit alienware_wmi_exit(void)
>>>    {
>>> -	alienware_zone_exit(platform_device);
>>>    	remove_thermal_profile();
>>>    	platform_device_unregister(platform_device);
>>>    	platform_driver_unregister(&platform_driver);
