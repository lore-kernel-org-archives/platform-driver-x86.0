Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF6534402F
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 20:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764188607; cv=none; b=pNSOSIYjJ0pElEa929lQYtytH2cjAHlHDXIJvM+F7+3D8OESmRDs6pfrXCmunkPRXYsunmT31ZgxgDYYKXKSiqX7OLpqyId9ZBT3o1HilaX1R4RUK6FMdrIskUWwrDhO30MvOW6yxcplqx319gsDseEguGpW6rTbHWgUMCMDitQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764188607; c=relaxed/simple;
	bh=BvKp1Pm0EPTmZAe59dPrhdR9Vh/e6nl2VFvjo1mMjJU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C5PBh6cv8TIch2QGecSChUVWiPOAMQZBy8tPqCAkrsA9Vzg81i8Sy+ByFfw11ICNMOqY7LCH3ulcPJniqq4eB2sWMcbefmZ41pUQmMMJ790GoNUIUvb4MeIXq+paT267mX8ShkKqRSxxPHe9IWoWm22P9PGhMhZnOMRBPbA22c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ink+lO96; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ink+lO96"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so873565e9.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 12:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764188603; x=1764793403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=23SrKYtvqEmYcd7SJn9TAzaqrE7buc6/uI1lnhjUDts=;
        b=Ink+lO96625dOrjvRXqlbixhVOC+cJ1kP3r8XdouG5dyZJ33/Q3JucyNCf/QZSsHFp
         UGPminIQoPG8DEJpYuiG1xJA81NkVDHc3/FRMcceWf4l1kjLGrUjoryxlI7zCLQ6auKs
         TOJdtwxZITsO8+62wY2Rx+qwFSWqZLVcrlDUupB7phNEhPjdgvOXzoz9+ogRDkV5Cn8f
         zTsPzqpn1zW2n2AiYA9NNe9bN6+9EPFRKn+4CKcuB4se61kPEgjncMfXYNBrbvtceQym
         N00ldH5XP9TRdrYS2tCYFY5qxXJ/PvLjFEpC9fVPoq/x79BUIvRK7yKmA6fjzAwhnqxB
         AZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764188603; x=1764793403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23SrKYtvqEmYcd7SJn9TAzaqrE7buc6/uI1lnhjUDts=;
        b=uTM1jV+549nKBGVH4Ee4ay9jO/B9D+GegA+Vlajv5aCdl2fC2LafKad2P9HpbrbdDt
         tsDnqH5FjuLTaM2MS9wT5Zw+VATEOjtO3NKloIPGXTh2IO1bXkug1WHn993t/5eS7XEt
         ARcrIw2G/dNgWMQqWMm6D2p361tSLaXW4LXWPmFVIp5h73irZDQxbPewZkUAKUULvMkH
         yfybtCVoi1Hxz1ZDNQFTOUGbNzFJveV07o4ORLLvtCO8WY6Qt48QuUbZbMMQVT6ShuWS
         vlRwSZMVjTl0NkcAWoa5oPXhcyy9e4mbz/t480LKkm3zEpPI5tEon44tZgyONfi8gImE
         4pHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmuRBoEYAvW8PevtQTOlLKtYUIk/lxjpkNPjY6btsyXvpVGHL39afdu2wHsPNU6jq8aYSadcl8VSaiT/2ipCnDQRZw@vger.kernel.org
X-Gm-Message-State: AOJu0YywIyJDXgeLhuckSs8YKy0rrdx+Gz7IU8XAJ+mdJ386gdox6Sq5
	vRlTamZKBvEc5WPfwQbTpLmcMX8kNUFO3ZJCeXgV106hWdc4leftKpzf
X-Gm-Gg: ASbGncuy//e77eOHps0GQ6XtunDrp6HODZI8btAx+ebIWBuW7I5pyoDeq/W7sJ8l2nC
	/Mt8RCI3nft3Szrk/htsSgGZ6i7KlY7r4S3PcVhiwDCMugXgUpnZ3qboroEdTIQ4H8sGkjWu3Y7
	Q2QhigylAEzHuQkTSqWmNdLpof6jaLWQdDm7tbwaV0sQE2+I1A3ZM1VN2xmo+vArQllPqkPDCM6
	R65pbkcTi0mDsNJvLqNMx/yiVkvkKI1jpEePf9Szjc1fuoCzU69dd+MxCb5UIBrsJxsSStcOGf3
	8C9rZCPpMgEGj3+blhelxSM8W06xUijnGPls+9GrdghatfTxYIP/e26bp9TETK871Tfi7wi5p9R
	ruBc1MNQloiNecgytYyyZScVG4jXfgo4gMTE9uPJHRGoRvQIxwftwACXZvM8YY7oZilgRrqjSj+
	eKjDgGl5Hc3uAIE6xAN/L7MQ0=
X-Google-Smtp-Source: AGHT+IHmabu5fT7Cb9c0FYaokARBDxYgpwJwJ0z7pMVHcgZVQ4Xy48MzbuDh8GVHnCLrTz4cgrBzJg==
X-Received: by 2002:a05:600c:1382:b0:477:9b35:3e49 with SMTP id 5b1f17b1804b1-477c1103274mr205531805e9.3.1764188603348;
        Wed, 26 Nov 2025 12:23:23 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fd9b45sm43336612f8f.43.2025.11.26.12.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:23:22 -0800 (PST)
Message-ID: <713cc4fd-e6a1-4db4-907a-a0575a2b7b8f@gmail.com>
Date: Wed, 26 Nov 2025 21:23:22 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 10/11] platform/x86: asus-wmi: add keyboard brightness
 event handler
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <20251122110032.4274-11-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251122110032.4274-11-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/22/25 12:00, Antheas Kapenekakis wrote:
> The keyboard brightness control of Asus WMI keyboards is handled in
> kernel, which leads to the shortcut going from brightness 0, to 1,
> to 2, and 3.
>
> However, for HID keyboards it is exposed as a key and handled by the
> user's desktop environment. For the toggle button, this means that
> brightness control becomes on/off. In addition, in the absence of a
> DE, the keyboard brightness does not work.
>
> Therefore, expose an event handler for the keyboard brightness control
> which can then be used by hid-asus. Since this handler is called from
> an interrupt context, defer the actual work to a workqueue.
>
> In the process, introduce ASUS_EV_MAX_BRIGHTNESS to hold the constant
> for maximum brightness since it is shared between hid-asus/asus-wmi.
>
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Tested-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/platform/x86/asus-wmi.c            | 46 +++++++++++++++++++---
>  include/linux/platform_data/x86/asus-wmi.h | 13 ++++++
>  2 files changed, 54 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 84cde34ab6a8..a69464e45ca4 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1719,6 +1719,44 @@ static void kbd_led_update_all(struct work_struct *work)
>  	}
>  }
>  
> +/*
> + * This function is called from hid-asus to inform asus-wmi of brightness
> + * changes initiated by the keyboard backlight keys.
> + */
> +int asus_hid_event(enum asus_hid_event event)
> +{
> +	struct asus_wmi *asus;
> +	int brightness;
> +
> +	guard(spinlock_irqsave)(&asus_ref.lock);
> +	asus = asus_ref.asus;
> +	if (!asus || !asus->kbd_led_registered)
> +		return -EBUSY;
> +
> +	brightness = asus->kbd_led_wk;
> +
> +	switch (event) {
> +	case ASUS_EV_BRTUP:
> +		brightness += 1;
> +		break;
> +	case ASUS_EV_BRTDOWN:
> +		brightness -= 1;
> +		break;
> +	case ASUS_EV_BRTTOGGLE:
> +		if (brightness >= ASUS_EV_MAX_BRIGHTNESS)
> +			brightness = 0;
> +		else
> +			brightness += 1;
> +		break;
> +	}
> +
> +	asus->kbd_led_wk = clamp_val(brightness, 0, ASUS_EV_MAX_BRIGHTNESS);
> +	asus->kbd_led_notify = true;
> +	queue_work(asus->led_workqueue, &asus->kbd_led_work);
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(asus_hid_event);
> +
>  /*
>   * These functions actually update the LED's, and are called from a
LEDs as opposed to LED's?
>   * workqueue. By doing this as separate work rather than when the LED
> @@ -1801,13 +1839,11 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>  {
>  	struct asus_hid_listener *listener;
>  	struct asus_wmi *asus;
> -	int max_level;
>  
>  	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
> -	max_level = asus->kbd_led.max_brightness;
>  
>  	scoped_guard(spinlock_irqsave, &asus_ref.lock)
> -		asus->kbd_led_wk = clamp_val(value, 0, max_level);
> +		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
>  
>  	if (asus->kbd_led_avail)
>  		kbd_led_update(asus);
> @@ -2011,7 +2047,7 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
>  	asus->kbd_led.brightness_set = kbd_led_set;
>  	asus->kbd_led.brightness_get = kbd_led_get;
> -	asus->kbd_led.max_brightness = 3;
> +	asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
>  	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
>  	INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
>  
> @@ -4530,7 +4566,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  		return;
>  	}
>  	if (code == NOTIFY_KBD_BRTTOGGLE) {
> -		if (led_value == asus->kbd_led.max_brightness)
> +		if (led_value == ASUS_EV_MAX_BRIGHTNESS)
>  			kbd_led_set_by_kbd(asus, 0);
>  		else
>  			kbd_led_set_by_kbd(asus, led_value + 1);
> diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
> index d347cffd05d5..7b872b5d0960 100644
> --- a/include/linux/platform_data/x86/asus-wmi.h
> +++ b/include/linux/platform_data/x86/asus-wmi.h
> @@ -178,6 +178,14 @@ struct asus_hid_listener {
>  	void (*brightness_set)(struct asus_hid_listener *listener, int brightness);
>  };
>  
> +enum asus_hid_event {
> +	ASUS_EV_BRTUP,
> +	ASUS_EV_BRTDOWN,
> +	ASUS_EV_BRTTOGGLE,
> +};
> +
> +#define ASUS_EV_MAX_BRIGHTNESS 3
> +
>  #if IS_REACHABLE(CONFIG_ASUS_WMI)
>  void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
>  void set_ally_mcu_powersave(bool enabled);
> @@ -186,6 +194,7 @@ int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
>  int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
>  int asus_hid_register_listener(struct asus_hid_listener *cdev);
>  void asus_hid_unregister_listener(struct asus_hid_listener *cdev);
> +int asus_hid_event(enum asus_hid_event event);
>  #else
>  static inline void set_ally_mcu_hack(enum asus_ally_mcu_hack status)
>  {
> @@ -213,6 +222,10 @@ static inline int asus_hid_register_listener(struct asus_hid_listener *bdev)
>  static inline void asus_hid_unregister_listener(struct asus_hid_listener *bdev)
>  {
>  }
> +static inline int asus_hid_event(enum asus_hid_event event)
> +{
> +	return -ENODEV;
> +}
>  #endif
>  
>  #endif	/* __PLATFORM_DATA_X86_ASUS_WMI_H */
