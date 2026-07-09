Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FB3279903;
	Thu,  9 Jul 2026 13:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603429; cv=none; b=ukg6N5BPfeSA8hlbvnp28Fguh3ofAQn88kfnJhQf7WqLzvx3xByuwfBGohzTkWyY9YrrpfgfZTe9uyBr20yCZKVXx5b6BsxyqYLK/NLyK2VtDWHd7wQis41MI0txc0b+2iYZgwqVSteSLfMI2nbYUniHlipxVox9YxM2kyfPGb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603429; c=relaxed/simple;
	bh=x6unTqVjPWiLzxIzKGkr+4c7CamBiZB40yVpr3ZjLEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kWTE+BV9fY3kbMmQkqLekI+ohCXppoIJd/vx+24ZLke2LA2ei/rLDpnSe0bJKO6W+NxioA7reqT0lyVRaJZWFRNRED8UMNFYqctyPtJwcam50CQ3uz1o35tglpYF1P8oPI6nSKuPak3IzFnr+0umU7WxCdgj04TwX0bWbUelPMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=AwcmcZr+; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="AwcmcZr+"
Received: from [10.10.12.8] (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 3F7A72FC005F;
	Thu,  9 Jul 2026 15:23:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1783603419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7yAhHTf2oQftncQU+NMF/MisHpgU27GT2AmN9MII05E=;
	b=AwcmcZr+FXBbwlA+AXsc6HPzJJ9vuLqcJ0Jk0tkmH8fuKn/hldtgTerGZ8YqQARsQflvgi
	MlAM77/K7UiU2pqC2o0uxll+D9D4jS/0AmnQ6McXvxelGwGDZQtu/N0p6yXlJc5v79WSHh
	NV67hZeOx0QYkyLLHbo5DqKHA/POPmw=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <dba6b863-3336-42b9-af02-98cb6f77c815@tuxedocomputers.com>
Date: Thu, 9 Jul 2026 15:23:38 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] platform/x86: uniwill-laptop: Add keyboard backlight
 support
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hansg@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260530170813.10166-1-W_Armin@gmx.de>
 <20260530170813.10166-2-W_Armin@gmx.de>
 <10e25d5c-7c50-45fd-a5a9-c06b087a89dd@tuxedocomputers.com>
 <aa39d060-5555-42bb-a4bb-d23e79f64d26@gmx.de>
 <1a91a9ff-8c81-4176-a6f2-fd2a6bc49820@tuxedocomputers.com>
 <a681b59d-1719-4a8e-9b75-e8317c899b27@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <a681b59d-1719-4a8e-9b75-e8317c899b27@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[...]
>>>>> +
>>>>> +static int uniwill_kbd_led_init(struct uniwill_data *data)
>>>>> +{
>>>>> +    unsigned int color_indices[KBD_LED_CHANNELS] = {
>>>>> +        LED_COLOR_ID_RED,
>>>>> +        LED_COLOR_ID_GREEN,
>>>>> +        LED_COLOR_ID_BLUE,
>>>>> +    };
>>>>> +    struct led_init_data init_data = {
>>>>> +        .devicename = DRIVER_NAME,
>>>>> +        .devname_mandatory = true,
>>>>> +    };
>>>>> +    bool intensity_all_zeros = true;
>>>>> +    bool needs_trigger = false;
>>>>> +    unsigned int regval;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (!uniwill_device_supports(data, UNIWILL_FEATURE_KEYBOARD_BACKLIGHT))
>>>>> +        return 0;
>>>>> +
>>>>> +    ret = regmap_read(data->regmap, EC_ADDR_SUPPORT_2, &regval);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    if (!(regval & CHINA_MODE)) {
>>>>> +        ret = regmap_set_bits(data->regmap, EC_ADDR_BIOS_OEM_2, 
>>>>> ENABLE_CHINA_MODE);
>>>>> +        if (ret < 0)
>>>>> +            return ret;
>>>>> +    }
>>>>> +
>>>>> +    ret = regmap_read(data->regmap, EC_ADDR_KBD_STATUS, &regval);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    regval |= KBD_APPLY;
>>>>> +    regval &= ~KBD_POWER_OFF;
>>>>> +    ret = regmap_write(data->regmap, EC_ADDR_KBD_STATUS, regval);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    switch (data->project_id) {
>>>>> +    case PROJECT_ID_PF:
>>>>> +    case PROJECT_ID_PF4MU_PF4MN_PF5MU:
>>>>> +    case PROJECT_ID_PH4TRX1:
>>>>> +    case PROJECT_ID_PH4TUX1:
>>>>> +    case PROJECT_ID_PH4TQX1:
>>>>> +    case PROJECT_ID_PH6TRX1:
>>>>> +    case PROJECT_ID_PH6TQXX:
>>>>> +    case PROJECT_ID_PHXAXXX:
>>>>> +    case PROJECT_ID_PHXPXXX:
>>>>> +        data->single_color_kbd = true;
>>>>> +        break;
>>>>> +    default:
>>>>> +        data->single_color_kbd = regval & KBD_WHITE_ONLY;
>>>>> +        break;
>>>>> +    }
>>>>> +
>>>>> +    if (data->single_color_kbd) {
>>>>> +        init_data.default_label = "white:" LED_FUNCTION_KBD_BACKLIGHT;
>>>>> +        data->kbd_led_cdev.max_brightness = data->kbd_led_max_brightness;
>>>>> +        data->kbd_led_cdev.color = LED_COLOR_ID_WHITE;
>>>>> +        data->kbd_led_cdev.flags = LED_BRIGHT_HW_CHANGED | 
>>>>> LED_REJECT_NAME_CONFLICT;
>>>>> +        data->kbd_led_cdev.brightness_set_blocking = 
>>>>> uniwill_kbd_led_brightness_set;
>>>>> +        data->kbd_led_cdev.brightness_get = uniwill_kbd_led_brightness_get;
>>>>> +
>>>>> +        return devm_led_classdev_register_ext(data->dev, 
>>>>> &data->kbd_led_cdev, &init_data);
>>>>> +    }
>>>>> +
>>>>> +    for (int i = 0; i < KBD_LED_CHANNELS; i++) {
>>>>> +        data->kbd_led_mc_subled_info[i].color_index = color_indices[i];
>>>>> +
>>>>> +        ret = regmap_read(data->regmap, 
>>>>> uniwill_kbd_led_channel_to_reg[i], &regval);
>>>>> +        if (ret < 0)
>>>>> +            return ret;
>>>>> +
>>>>> +        /*
>>>>> +         * Make sure that the initial intensity value is not greater than
>>>>> +         * the maximum intensity.
>>>>> +         */
>>>>> +        if (regval > KBD_LED_MAX_INTENSITY) {
>>>>> +            regval = KBD_LED_MAX_INTENSITY;
>>>>> +            ret = regmap_write(data->regmap, 
>>>>> uniwill_kbd_led_channel_to_reg[i], regval);
>>>>> +            if (ret < 0)
>>>>> +                return ret;
>>>>> +
>>>>> +            needs_trigger = true;
>>>>> +        }
>>>>> +
>>>>> +        if (regval)
>>>>> +            intensity_all_zeros = false;
>>>>> +
>>>>> +        data->kbd_led_mc_subled_info[i].intensity = regval;
>>>>> +        data->kbd_led_mc_subled_info[i].max_intensity = 
>>>>> KBD_LED_MAX_INTENSITY;
>>>>> +        data->kbd_led_mc_subled_info[i].channel = i;
>>>>> +    }
>>>>> +
>>>>> +    /* See uniwill_kbd_led_mc_brightness_set() for an explaination. */
>>>>> +    if (intensity_all_zeros) {
>>>>> +        for (int i = 0; i < KBD_LED_CHANNELS; i++) {
>>>>> +            data->kbd_led_mc_subled_info[i].intensity = 1;
>>>>> +            ret = regmap_write(data->regmap, 
>>>>> uniwill_kbd_led_channel_to_reg[i], 1);
>>>>> +            if (ret < 0)
>>>>> +                return ret;
>>>>> +        }
>>>>> +
>>>>> +        needs_trigger = true;
>>>>> +    }
>>>>> +
>>>>> +    if (needs_trigger) {
>>>>> +        ret = regmap_write_bits(data->regmap, EC_ADDR_TRIGGER, 
>>>>> RGB_APPLY_COLOR,
>>>>> +                    RGB_APPLY_COLOR);
>>>>> +        if (ret < 0)
>>>>> +            return ret;
>>>>> +    }
>>>>> +
>>>>> +    ret = devm_mutex_init(data->dev, &data->kbd_rgb_led_lock);
>>>>> +    if (ret < 0)
>>>>> +        return ret;
>>>>> +
>>>>> +    init_data.default_label = "multicolor:" LED_FUNCTION_KBD_BACKLIGHT;
>>>>> +    data->kbd_led_mc_cdev.led_cdev.max_brightness = 
>>>>> data->kbd_led_max_brightness;
>>>>> +    data->kbd_led_mc_cdev.led_cdev.color = LED_COLOR_ID_MULTI;
>>>>> +    data->kbd_led_mc_cdev.led_cdev.flags = LED_BRIGHT_HW_CHANGED | 
>>>>> LED_REJECT_NAME_CONFLICT;
>>>>> + data->kbd_led_mc_cdev.led_cdev.brightness_set_blocking = 
>>>>> uniwill_kbd_led_mc_brightness_set;
>>>>> +    data->kbd_led_mc_cdev.led_cdev.brightness_get = 
>>>>> uniwill_kbd_led_mc_brightness_get;
>>>>> +    data->kbd_led_mc_cdev.subled_info = data->kbd_led_mc_subled_info;
>>>>> +    data->kbd_led_mc_cdev.num_colors = KBD_LED_CHANNELS;
>>>>> +
>>>>> +    return devm_led_classdev_multicolor_register_ext(data->dev, 
>>>>> &data->kbd_led_mc_cdev,
>>>>> +                             &init_data);
>>>>> +}
>>>>> +
>>>>
>>>> Sorry I know I'm way to late with my comment, but I'm not at all a fan of 
>>>> how complex this whole function is:
>>>>
>>>> - When we have to set max brightness on a per device basis anyway, we can 
>>>> also set rgb or white only there and can skip this whole detection 
>>>> mechanism with the supported bits that are unreliable anyway
>>>>
>>>> - we have a 2nd "supported devices/features list" inside this function 
>>>> which is abstracting away from the actual supported feature list
>>>>
>>>> Should i try to spin up something much simpler, but that requires explicit 
>>>> setting in the device descriptor?
>>>>
>>>> Best regards
>>>>
>>>> Werner
>>>>
>>> Good point, but in this case i think having this small device list is OK, 
>>> because the original control center
>>> does something similar.
>> yeah the original cc and tuxedo-drivers has these small lists all over the 
>> place ... also don't like it there
>>> If we encounter a device that does not work with this strategy then we can 
>>> indeed
>>> move the code into the device descriptor.
>>
>> later we might not be able to get the information anymore which devices are 
>> rgb and which are white only when the supported devices lists grows, then we 
>> are stuck to reading the feature bits.
>>
>> best regards,
>>
>> Werner
>>
> Good point, in this case using the device descriptor for this feature detection
> might indeed be better in the long term.
>
> Do you want to send the patches or should i do it?

I will not stop you if you have time to do it ^^

you are probably quicker in working on your own code

i would do a

UNIWILL_FEATURE_KBL_WHITE_ONLY and a

UNIWILL_FEATURE_KBL_ONE_ZONE_RGB (there are also Uniwill devices with per-key 
RGB, but that is controlled via a usb device)

also required is a way to set max intensity via the device descriptor, most 
tuxedo devices have 200 as max value there and not 50

best regards,

Werner

>
> Thanks,
> Armin Wolf 
[...]
