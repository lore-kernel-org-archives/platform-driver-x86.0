Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B5C33F39F
	for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 20:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764188367; cv=none; b=NzNyvCKzJjJ36K8SQ3rXn4OFYWepfFNxUrOz8oMlYBoQPQqAyomhWd5l84XCi9gmC7RMG1LJ5brazJvZOAcbYcs4xHYy9XRkIXqf+tQydqLEmhYTqb1N08LXVo0oIDiq1lxmeSoE7+hz56fLZSCMS+2xJEjowLD/NDSlGfD65hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764188367; c=relaxed/simple;
	bh=g5Fr1Y91CN1eYjHaq8/b0+/Y7/N5wUY3nKM8EZtt6V4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYZmId4btIFnI9w+/sQ4DJBBmpFPt7vn4OFTJ/0G2h+ebgEko+91Zmd1+SCFz2tR82cLAWtbsLtTL57Gilt+xgekndeXEnzBO+Aj8wtpHexyDOAH3+S5lc5Czv54qTKXfMhb3IHD4NsHqPLLytwcD6SgA+zNV5jYkg4yLScVVAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuuyK2UX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuuyK2UX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a1c28778so986965e9.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Nov 2025 12:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764188363; x=1764793163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ko2WGomDBU5ihf8yWTpnC2yEwVaFXplOqQuHFsqXEm0=;
        b=JuuyK2UXzTHnf909iGItwDq/QmkCQs0/Hy0uY+cUWTdLpSubDZJm10kQdMQ+AGlDCh
         ukwhSXFXYr4TifYY2egqro+0xW2wnQ3nkGB/AZQVFf8l9FYc8L/7Cqlbtfly+xPgUDCg
         CNc7tCmYbvz0SVgJWU5EffdGTSTbSTcmuuTjZTOAfd4yiOEuOklVc5vYlQ4v/C+7mthA
         aSNjzhTPXhAFQGVBlhSPrc+4tQeeLGtHFrf2uM+4v8N/HCPupdcX+p58iKR8wViJOwju
         ua90S/6SxEpY783Zoo4JwAVKDNLtPKjlWThTKqi/1Y7qw/inBGs/wNQ5JsDfkA1YO2pK
         1xuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764188363; x=1764793163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko2WGomDBU5ihf8yWTpnC2yEwVaFXplOqQuHFsqXEm0=;
        b=AXvzlNrsKkvaE2fyTviLtObxSqhbk7zD+TnHfKRM9bM/rXYhQAwBUF9RKt+tP0MitJ
         MAOq2rGoxHvxFyHnBndy6EtelO6BF2e5Sr+4NK+VrimTJ2i00ecPlTH038tt8mgYzkIa
         /ndgL2syXyji7phHPtQP2BxRvf1AgRl5yr9z5xC21XknGI4hBE68YxSYFYB1mtG7KxDN
         vV+RkM/CDLo6hf0d0Iic3Jftl7Alfllx5Q0RDOlJbk7L0Uk1mjwDXaEYKGfRg1hnoD6o
         l94idKR/5JYkwH88KT19QGZlXksMFTfJuKsw5IDWu4Eqz4lykEI4KoV9ZsgPAN98MrDp
         sIbg==
X-Forwarded-Encrypted: i=1; AJvYcCUEJfX5ypYNWpCabZ0sRf2YZA4A7yDrkZrhw99lXUHLcMn18xwh/RYizB7ozUvrq9aGXyJcmpcAHaptph0qAXWheCWY@vger.kernel.org
X-Gm-Message-State: AOJu0YxUw7xHrhT4AOSyvc3UUvFzdLc5AHYSI2F6rX3dgM5VlZP4ZEjF
	8p7R/kyhK/HPXxpHLMixNBmSooGRBoFhpiMKoGVkizMIXNmuT4BKStbm
X-Gm-Gg: ASbGncs9thAtwYdKuSZxN4MIiTpTP2v0Gh1hhRllLxwIhhB36fZCtyDR/mkSi+vzHgU
	rl/HbxIJmBjTSB2BG/xeM5AIfQiEVnSv7vTC1Kke/L/++Gi70B3pfER7+3B6trbXMqtpzJuFUB4
	P6l3kl3xT4Yhy5ZjXDBe5hhSdYxoCiihUVCDz1bEAYcM3esdiyeOeu/QuW00B2eh/sfQf1yEWcf
	Y89Nb6u1M6p+SZ/CQamwjUQDKG4O1lE+m2vAZYNr41+649q7dD1rnX9gdXjsMqHxaeZ95isv0KE
	SXUuC8K5VfKK9VSDqPrteMkR3waDDMdY+gaTFnanMbuzo86sULQhaYQ5pHFmSY1YpPNruqZBzmt
	y1/l5QlJfsns3JWomUGQI9xJKd+cibearqiUUgwxjgwXkF0hRKj7PPN2xnkHjPDR8qQxHeTUyTG
	7XapuqoW1/JGFNMbuLnkvB7oc=
X-Google-Smtp-Source: AGHT+IHyrt5rJz/OleXqf+iljE6Qa5FQy72PBgGwDUpEx2U9WDfSut3M7axMc/Jc9ApVmM10bqfBQw==
X-Received: by 2002:a05:600c:4e8e:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-47904adb12bmr83913195e9.12.1764188363135;
        Wed, 26 Nov 2025 12:19:23 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0c3a28sm63008225e9.9.2025.11.26.12.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 12:19:22 -0800 (PST)
Message-ID: <1326eb84-e952-43f5-b505-99b9a784c593@gmail.com>
Date: Wed, 26 Nov 2025 21:19:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/11] HID: asus: listen to the asus-wmi brightness
 device instead of creating one
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251122110032.4274-1-lkml@antheas.dev>
 <20251122110032.4274-9-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251122110032.4274-9-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/22/25 12:00, Antheas Kapenekakis wrote:
> Some ROG laptops expose multiple interfaces for controlling the
> keyboard/RGB brightness. This creates a name conflict under
> asus::kbd_brightness, where the second device ends up being
> named asus::kbd_brightness_1 and they are both broken.
>
> Therefore, register a listener to the asus-wmi brightness device
> instead of creating a new one.
Reviewed-by: Denis Benato <benato.denis96@gmail.com>
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 65 +++++++-----------------------------------
>  1 file changed, 10 insertions(+), 55 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 461b0f8efdfb..475e34187326 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -27,7 +27,6 @@
>  #include <linux/hid.h>
>  #include <linux/module.h>
>  #include <linux/platform_data/x86/asus-wmi.h>
> -#include <linux/platform_data/x86/asus-wmi-leds-ids.h>
>  #include <linux/input/mt.h>
>  #include <linux/usb.h> /* For to_usb_interface for T100 touchpad intf check */
>  #include <linux/power_supply.h>
> @@ -103,7 +102,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define TRKID_SGN       ((TRKID_MAX + 1) >> 1)
>  
>  struct asus_kbd_leds {
> -	struct led_classdev cdev;
> +	struct asus_hid_listener listener;
>  	struct hid_device *hdev;
>  	struct work_struct work;
>  	unsigned int brightness;
> @@ -493,11 +492,11 @@ static void asus_schedule_work(struct asus_kbd_leds *led)
>  	spin_unlock_irqrestore(&led->lock, flags);
>  }
>  
> -static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
> -				   enum led_brightness brightness)
> +static void asus_kbd_backlight_set(struct asus_hid_listener *listener,
> +				   int brightness)
>  {
> -	struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
> -						 cdev);
> +	struct asus_kbd_leds *led = container_of(listener, struct asus_kbd_leds,
> +						 listener);
>  	unsigned long flags;
>  
>  	spin_lock_irqsave(&led->lock, flags);
> @@ -507,20 +506,6 @@ static void asus_kbd_backlight_set(struct led_classdev *led_cdev,
>  	asus_schedule_work(led);
>  }
>  
> -static enum led_brightness asus_kbd_backlight_get(struct led_classdev *led_cdev)
> -{
> -	struct asus_kbd_leds *led = container_of(led_cdev, struct asus_kbd_leds,
> -						 cdev);
> -	enum led_brightness brightness;
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&led->lock, flags);
> -	brightness = led->brightness;
> -	spin_unlock_irqrestore(&led->lock, flags);
> -
> -	return brightness;
> -}
> -
>  static void asus_kbd_backlight_work(struct work_struct *work)
>  {
>  	struct asus_kbd_leds *led = container_of(work, struct asus_kbd_leds, work);
> @@ -537,34 +522,6 @@ static void asus_kbd_backlight_work(struct work_struct *work)
>  		hid_err(led->hdev, "Asus failed to set keyboard backlight: %d\n", ret);
>  }
>  
> -/* WMI-based keyboard backlight LED control (via asus-wmi driver) takes
> - * precedence. We only activate HID-based backlight control when the
> - * WMI control is not available.
> - */
> -static bool asus_kbd_wmi_led_control_present(struct hid_device *hdev)
> -{
> -	struct asus_drvdata *drvdata = hid_get_drvdata(hdev);
> -	u32 value;
> -	int ret;
> -
> -	if (!IS_ENABLED(CONFIG_ASUS_WMI))
> -		return false;
> -
> -	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
> -			dmi_check_system(asus_use_hid_led_dmi_ids)) {
> -		hid_info(hdev, "using HID for asus::kbd_backlight\n");
> -		return false;
> -	}
> -
> -	ret = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS,
> -				       ASUS_WMI_DEVID_KBD_BACKLIGHT, 0, &value);
> -	hid_dbg(hdev, "WMI backlight check: rc %d value %x", ret, value);
> -	if (ret)
> -		return false;
> -
> -	return !!(value & ASUS_WMI_DSTS_PRESENCE_BIT);
> -}
> -
>  /*
>   * We don't care about any other part of the string except the version section.
>   * Example strings: FGA80100.RC72LA.312_T01, FGA80100.RC71LS.318_T01
> @@ -709,14 +666,11 @@ static int asus_kbd_register_leds(struct hid_device *hdev)
>  	drvdata->kbd_backlight->removed = false;
>  	drvdata->kbd_backlight->brightness = 0;
>  	drvdata->kbd_backlight->hdev = hdev;
> -	drvdata->kbd_backlight->cdev.name = "asus::kbd_backlight";
> -	drvdata->kbd_backlight->cdev.max_brightness = 3;
> -	drvdata->kbd_backlight->cdev.brightness_set = asus_kbd_backlight_set;
> -	drvdata->kbd_backlight->cdev.brightness_get = asus_kbd_backlight_get;
> +	drvdata->kbd_backlight->listener.brightness_set = asus_kbd_backlight_set;
>  	INIT_WORK(&drvdata->kbd_backlight->work, asus_kbd_backlight_work);
>  	spin_lock_init(&drvdata->kbd_backlight->lock);
>  
> -	ret = devm_led_classdev_register(&hdev->dev, &drvdata->kbd_backlight->cdev);
> +	ret = asus_hid_register_listener(&drvdata->kbd_backlight->listener);
>  	if (ret < 0) {
>  		/* No need to have this still around */
>  		devm_kfree(&hdev->dev, drvdata->kbd_backlight);
> @@ -1105,7 +1059,7 @@ static int __maybe_unused asus_resume(struct hid_device *hdev) {
>  
>  	if (drvdata->kbd_backlight) {
>  		const u8 buf[] = { FEATURE_KBD_REPORT_ID, 0xba, 0xc5, 0xc4,
> -				drvdata->kbd_backlight->cdev.brightness };
> +				drvdata->kbd_backlight->brightness };
>  		ret = asus_kbd_set_report(hdev, buf, sizeof(buf));
>  		if (ret < 0) {
>  			hid_err(hdev, "Asus failed to set keyboard backlight: %d\n", ret);
> @@ -1231,7 +1185,6 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  	}
>  
>  	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
> -	    !asus_kbd_wmi_led_control_present(hdev) &&
>  	    asus_kbd_register_leds(hdev))
>  		hid_warn(hdev, "Failed to initialize backlight.\n");
>  
> @@ -1278,6 +1231,8 @@ static void asus_remove(struct hid_device *hdev)
>  	unsigned long flags;
>  
>  	if (drvdata->kbd_backlight) {
> +		asus_hid_unregister_listener(&drvdata->kbd_backlight->listener);
> +
>  		spin_lock_irqsave(&drvdata->kbd_backlight->lock, flags);
>  		drvdata->kbd_backlight->removed = true;
>  		spin_unlock_irqrestore(&drvdata->kbd_backlight->lock, flags);
