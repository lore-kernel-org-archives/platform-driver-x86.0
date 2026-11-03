Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793690512;
	b=yj8MKncpUuwgn08Pnr20bsQlFDDBdRUBIxDaI0bWLTUOt/RqXcz7iRlFQuH4O7exOfJo
	 QPL1cmeYjNeR9UooCEw5VTZwZMdQ2lgKckjh17b/iiG7jYP1gRHZutIXEkhZTe5QvViGN
	 Fzi5fX8rI+2135AB7c3/15MOWQHqjS+b9MkFGLZOCrAGAdihxI1zUSKyAv/Z4WT6YJvca
	 r5A86nj+x9/5VBcH7M0PLoLFzEo7NnTPdfuzHAdcHjPWVpr/iOY7Leh1rlmBxZPhyN/vo
	 A2KdxRgEuu6H+29PhPBZoC9Io4woXFVdIOK9hDnYOLQ2UMEaQigLlWUjwsnlte/vEpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793690512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qxNaHg0QwAKV8JFvr9izfGFpZQV2tly781er29vLsvA=;
	b=RJw0BRInPuhwdZWhElaOyIPeNp5v6B2OhJQ9YvlKfYuQ0IvKQH/FmfrZ0lehpiJkRK0I
	 FzlkQRWzqYJ+SdyvNtD4LFnpfdV/Xoth+oRAtIpyhl5FXTMXF/9KTjLLzmYrvOZeQfRlH
	 y+FWjLYQrxVWd1Zk/E0Iv8Nmwu3HEwaLjVO+tCUvUGOrp5QNU6woVSJ65KLuEKTh8HPgw
	 YZhUywVlorFb4SwZ2hkLG2oEVonE5MN9mRbG99p/39uQFSyf+p6d/Ky1oh33PdJb25VFc
	 tB6uB75LVG6+7py6nhvumBKJNXoxWov8of6WzkQr8EQm5l6xEzZDJyr2JAvh33+U5hA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybY5HE2t;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCFDF606A33A
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Nov 2026 07:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BCFDF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybY5HE2t
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e20edd106so2918131f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 02 Nov 2026 23:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793690510; x=1794295310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qxNaHg0QwAKV8JFvr9izfGFpZQV2tly781er29vLsvA=;
        b=ybY5HE2t5kZnS14uxoTv3e2uQeumA1UZ/ccTKbO3vU8azOvBBnDg5yloy4Yei86IaW
         tfofRUm1ZvD9UV5WgpUc7tonFFzfrxJB45s1ZskF8/N+Xdupj62uuf5GOuXHWzy6afn9
         bPeYMILWtthTb1oXNm6SVJNSJ7f5i/bLcXql4uaxfhg5US1lI7SnD7tqmZJc6j5+xxsP
         HI+JBgEV9w91onxX8fncHzOCiysfDMECiEX7xDUNeLZBg7wDCuhaYEfvHUQkSoCrZA0I
         v4V9SqTPrbyxELmyjIW57rCJVjM6ZtGrRnfo73C8vOtGdfhnida1wzpZTPGUsZEHB8Ag
         TyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793690510; x=1794295310;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qxNaHg0QwAKV8JFvr9izfGFpZQV2tly781er29vLsvA=;
        b=AJzVgtRzfEVPzpgpYqyufY22tuK0UbbZ9Zzpj6KI9UqIw4SosKTHQBsxcz/5uy5zFK
         ksEsieotDpLN3qyFPD4Os1IpGuPdmjvmCgU01FZW5XTak46JyOsIYXhDlUtP9rj+1ccr
         +ouMiHBDNd5zBVXDx2rdlHGdienVBnAaiLPSSkEhydirXeDFyf90/I1+oYLi8G3boeK0
         GfrlV3zc1FJ2tuu3nRQwnJh3NhRHC/Dji7ZVC3EOo27wizw4yOu1gQmH7QRuMdUG7P1c
         YWmDV+7fIp8teq4GQ98ZWigV5YhXb0XJdlNXCf1TT/rBFIBlAmjUOhP1Xh2J7n40Uag3
         eZsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEonDO8DAzrLntTKtL11UwW4MX/TM1rsd9LDp/tJe1l9LRotcSzcvWImyLUUQHmV5ifOgCZkwOrGcOXNKiniHd6iX/@vger.kernel.org
X-Gm-Message-State: APuU4Z992MMbFyZ+fSMjBw+DQ0l9XcxkLutX4O4830hXUL6izVWKcKKY
	hqVL6p3lHYLeQRCWN6RZ+sO4WJ51uc4nD0qjPo2fthDvnXEXHh4wdGf4
X-Gm-Gg: AYBFou3Ag0LARnCKYhOmv2sUwqls5LifFtPsVsm+q3F1/iaxTRbJlCjNPn2QXK8ZgrX
	FaDfrav4ddCvofgSraWbDk/BNQAzZ0tWe6jgVX2G+mpZnJWumTOKL4LN3R+VBfluJEailW2KVc0
	g98aSMCbpFxBoIM1kOtJcIAxSwXc5suv22x2O/X6D+yWH1HqZOP8H5xE2pll4pgtXw15VknDwq8
	deQDwRX7Z+rN/ng65xLlAteP8DLDYbW+M/3dNq5SYk4RxOEeaalc66wXBZljTKNnwjcqJVOOdyf
	1uAK+zDR/L64XC+ki89xavXsNUs0XFlgbM2re4sIhG5DMNmNVaz9PUE+5s93ZUqPt8Vf4bZpGhg
	1cu0PSGYH2/E7cNBSvmwoOeIHqafzmSSd9nUHbSDFIUFTmyV1OnxaSpursPCB8bEeC8DDm40wbP
	GsUmH+TifNVOaSgoCMmponlDY/ItTr7wxHGL+szc9xKL/jepOHfrXdQ2BszHrIHAIs+qVilJTt0
	3DSvNO47XPAWyqfKVlu5ZBXEsp88xl2m/uc4nlq6ioOtlK/E8tuO1uXgx5O5Hlu48yjgKR/IP2D
	0UDWOmu522i8iKDfA3PZsECxbw+8s/qoxQ5k9GYWfRgMkpKeHaok7YgNLeqSUkZzTn8SaGFFfKQ
	EarnY4DW3vdbifkKN27ty4aRgEBWqkVJ60vghoVcgSs4DpvrwBg53eq1MUw==
X-Received: by 2002:a05:600c:698d:b0:4a2:994:575c with SMTP id 5b1f17b1804b1-4ac185bcc4emr280845615e9.34.1793690509954;
        Mon, 02 Nov 2026 23:21:49 -0800 (PST)
Received: from [10.77.100.5] (ipservice-092-209-215-046.092.209.pools.vodafone-ip.de. [92.209.215.46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a80e0fe6sm43172275e9.1.2026.11.02.23.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 23:21:49 -0800 (PST)
Message-ID: <06ca6c0e-ba61-4ac7-900d-8f4d588ab4d6@gmail.com>
Date: Tue, 3 Nov 2026 08:21:25 +0100
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: surface-hid: support keyboard backlight on Surface
 Pro Keyboard (045E:09AE)
To: =?UTF-8?B?UmFtw7NuIEplc8O6cyBNaXJhbmRh?= <ramonjesusmiranda@gmail.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261023173213.6219-1-ramonjesusmiranda@gmail.com>
Content-Language: en-US
From: Maximilian Luz <luzmaximilian@gmail.com>
In-Reply-To: <20261023173213.6219-1-ramonjesusmiranda@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 23.10.2026 um 19:32 schrieb Ramón Jesús Miranda:
> The Surface Pro Keyboard / Flex Keyboard (VID 045E, PID 09AE) attached to
> the Microsoft Surface Pro 11 (Snapdragon X Elite / X1E80100) exposes its
> keyboard backlight through the HID Consumer Control collection (Usage Page
> 0x0c, Usage 0x07) rather than through the legacy Surface Aggregator Module
> (SAM) TC/KBD category:
> 
> - Feature Report 0xd5 (Usage 0x0517, unit Candela) advertises the 4
>    supported discrete brightness levels: [0x00, 0x03, 0x06, 0x0c].
> - Feature Report 0xd6 (Usage 0x007b) returns the current brightness level
>    (0, 3, 6, or 12).
> - Output Report 0xd5 ([0xd5, level]) sets the brightness level.
> - Input Report 0xd5 (Usage 0x0515, Keyboard Brightness Next) fires
>    [0xd5, 0x01] whenever the hardware backlight key (F5) is pressed and the
>    embedded controller cycles the brightness in hardware.
> 
> Register a LED class device named "surface::kbd_backlight" (max_brightness
> = 3, flags = LED_BRIGHT_HW_CHANGED) when the HID device matches VID 045E /
> PID 09AE, mapping steps 0..3 to hardware values {0, 3, 6, 12}. Also hook
> raw_event to read back Feature Report 0xd6 and notify userspace via
> led_classdev_notify_brightness_hw_changed() when Input Report 0xd5 arrives
> from the F5 key, and restore the saved brightness level on resume.

Should this whole thing not be an HID driver? I don't like the idea of
hard-coding report parsing here.

Best,
Max

> 
> Tested on a Microsoft Surface Pro 11 OLED (X1E80100) with UPower and KDE
> PowerDevil.
> 
> Assisted-by: Antigravity:gemini-2.5-pro
> Signed-off-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>
> ---
>   drivers/hid/surface-hid/surface_hid.c      |   4 +
>   drivers/hid/surface-hid/surface_hid_core.c | 104 ++++++++++++++++++++-
>   drivers/hid/surface-hid/surface_hid_core.h |   8 ++
>   3 files changed, 114 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hid/surface-hid/surface_hid.c b/drivers/hid/surface-hid/surface_hid.c
> index eae47e0..0f81732 100644
> --- a/drivers/hid/surface-hid/surface_hid.c
> +++ b/drivers/hid/surface-hid/surface_hid.c
> @@ -161,6 +161,10 @@ static u32 ssam_hid_event_fn(struct ssam_event_notifier *nf, const struct ssam_e
>   	if (event->command_id != 0x00)
>   		return 0;
>   
> +	if (shid->has_kbd_bl && event->length >= 2 &&
> +	    event->data[0] == 0xd5 && (event->data[1] & 0x01))
> +		schedule_work(&shid->kbd_bl_work);
> +
>   	hid_input_report(shid->hid, HID_INPUT_REPORT, (u8 *)&event->data[0], event->length, 0);
>   	return SSAM_NOTIF_HANDLED;
>   }
> diff --git a/drivers/hid/surface-hid/surface_hid_core.c b/drivers/hid/surface-hid/surface_hid_core.c
> index 6690c24..afee61f 100644
> --- a/drivers/hid/surface-hid/surface_hid_core.c
> +++ b/drivers/hid/surface-hid/surface_hid_core.c
> @@ -184,6 +184,98 @@ static const struct hid_ll_driver surface_hid_ll_driver = {
>   };
>   
>   
> +/* -- Keyboard backlight (Surface Pro Flex / Type Cover 045E:09AE). --------- */
> +
> +static u8 surface_kbd_bl_raw_to_idx(struct surface_hid_device *shid, u8 raw)
> +{
> +	u8 i;
> +
> +	for (i = 0; i < 4; i++) {
> +		if (shid->kbd_bl_levels[i] >= raw)
> +			return i;
> +	}
> +	return 3;
> +}
> +
> +static enum led_brightness surface_kbd_bl_get(struct led_classdev *cdev)
> +{
> +	struct surface_hid_device *shid =
> +		container_of(cdev, struct surface_hid_device, kbd_bl_led);
> +	u8 buf[2] = { 0xd6, 0 };
> +
> +	if (surface_hid_is_hot_removed(shid))
> +		return shid->kbd_bl_cur;
> +
> +	if (shid->ops.get_feature_report(shid, 0xd6, buf, sizeof(buf)) < 0)
> +		return shid->kbd_bl_cur;
> +
> +	shid->kbd_bl_cur = surface_kbd_bl_raw_to_idx(shid, buf[1]);
> +	return shid->kbd_bl_cur;
> +}
> +
> +static int surface_kbd_bl_set(struct led_classdev *cdev, enum led_brightness value)
> +{
> +	struct surface_hid_device *shid =
> +		container_of(cdev, struct surface_hid_device, kbd_bl_led);
> +	u8 idx = clamp_t(u8, value, 0, 3);
> +	u8 buf[2] = { 0xd5, shid->kbd_bl_levels[idx] };
> +	int ret;
> +
> +	if (surface_hid_is_hot_removed(shid))
> +		return -ENODEV;
> +
> +	ret = shid->ops.output_report(shid, 0xd5, buf, sizeof(buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	shid->kbd_bl_cur = idx;
> +	return 0;
> +}
> +
> +static void surface_kbd_bl_work_fn(struct work_struct *work)
> +{
> +	struct surface_hid_device *shid =
> +		container_of(work, struct surface_hid_device, kbd_bl_work);
> +	u8 prev = shid->kbd_bl_cur;
> +	u8 hw_idx = surface_kbd_bl_get(&shid->kbd_bl_led);
> +
> +	if (hw_idx == prev) {
> +		u8 next = (prev + 1) % 4;
> +
> +		surface_kbd_bl_set(&shid->kbd_bl_led, next);
> +	}
> +
> +	led_classdev_notify_brightness_hw_changed(&shid->kbd_bl_led, shid->kbd_bl_cur);
> +}
> +
> +static void surface_hid_kbd_bl_init(struct surface_hid_device *shid)
> +{
> +	u8 feat[5] = { 0xd5, 0 };
> +	u8 cur[2] = { 0xd6, 0 };
> +
> +	if (shid->hid->vendor != 0x045e || shid->hid->product != 0x09ae)
> +		return;
> +
> +	if (shid->ops.get_feature_report(shid, 0xd5, feat, sizeof(feat)) < 0 ||
> +	    feat[4] == 0)
> +		return;
> +
> +	memcpy(shid->kbd_bl_levels, &feat[1], 4);
> +	if (shid->ops.get_feature_report(shid, 0xd6, cur, sizeof(cur)) >= 0)
> +		shid->kbd_bl_cur = surface_kbd_bl_raw_to_idx(shid, cur[1]);
> +
> +	INIT_WORK(&shid->kbd_bl_work, surface_kbd_bl_work_fn);
> +	shid->kbd_bl_led.name = "surface::kbd_backlight";
> +	shid->kbd_bl_led.max_brightness = 3;
> +	shid->kbd_bl_led.flags = LED_BRIGHT_HW_CHANGED;
> +	shid->kbd_bl_led.brightness_set_blocking = surface_kbd_bl_set;
> +	shid->kbd_bl_led.brightness_get = surface_kbd_bl_get;
> +	shid->kbd_bl_led.brightness = shid->kbd_bl_cur;
> +
> +	if (led_classdev_register(shid->dev, &shid->kbd_bl_led) == 0)
> +		shid->has_kbd_bl = true;
> +}
> +
>   /* -- Common device setup. -------------------------------------------------- */
>   
>   int surface_hid_device_add(struct surface_hid_device *shid)
> @@ -218,15 +310,23 @@ int surface_hid_device_add(struct surface_hid_device *shid)
>   	shid->hid->ll_driver = &surface_hid_ll_driver;
>   
>   	status = hid_add_device(shid->hid);
> -	if (status)
> +	if (status) {
>   		hid_destroy_device(shid->hid);
> +		return status;
> +	}
>   
> -	return status;
> +	surface_hid_kbd_bl_init(shid);
> +	return 0;
>   }
>   EXPORT_SYMBOL_GPL(surface_hid_device_add);
>   
>   void surface_hid_device_destroy(struct surface_hid_device *shid)
>   {
> +	if (shid->has_kbd_bl) {
> +		cancel_work_sync(&shid->kbd_bl_work);
> +		led_classdev_unregister(&shid->kbd_bl_led);
> +		shid->has_kbd_bl = false;
> +	}
>   	hid_destroy_device(shid->hid);
>   }
>   EXPORT_SYMBOL_GPL(surface_hid_device_destroy);
> diff --git a/drivers/hid/surface-hid/surface_hid_core.h b/drivers/hid/surface-hid/surface_hid_core.h
> index 4b1a7b5..c874489 100644
> --- a/drivers/hid/surface-hid/surface_hid_core.h
> +++ b/drivers/hid/surface-hid/surface_hid_core.h
> @@ -11,8 +11,10 @@
>   #define SURFACE_HID_CORE_H
>   
>   #include <linux/hid.h>
> +#include <linux/leds.h>
>   #include <linux/pm.h>
>   #include <linux/types.h>
> +#include <linux/workqueue.h>
>   
>   #include <linux/surface_aggregator/controller.h>
>   #include <linux/surface_aggregator/device.h>
> @@ -67,6 +69,12 @@ struct surface_hid_device {
>   	struct hid_device *hid;
>   
>   	struct surface_hid_device_ops ops;
> +
> +	struct led_classdev kbd_bl_led;
> +	struct work_struct kbd_bl_work;
> +	u8 kbd_bl_levels[4];
> +	u8 kbd_bl_cur;
> +	bool has_kbd_bl;
>   };
>   
>   int surface_hid_device_add(struct surface_hid_device *shid);

