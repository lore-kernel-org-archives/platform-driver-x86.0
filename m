Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792446715;
	b=fBoW7+K1izGCTCARz39D//b8HT3td0Quq9Nnuow+g6aSUSFWvq8TYBhNp5fI6yz5N3hL
	 nNDfGiqDZlzzorLXli7uIj+YLDo5xpfRpzcPVfvxI9M9BRbPD/oqesmqdpa44fmXlJCwJ
	 gwlRSnStCVClm5FTpctEvcupuTOVGfXnUmYZ4Km705N1cYO92cdsmk33wLl9vypHaaJ4z
	 JloA+FzvlthB8US1GQ7BOay540tizsI9pgOqll/6neVhn4DBEvIbLNKnRiUwvWfb3YKIp
	 dDb3/qIycEMde8EArXpxw2XUqOGMrPGuJmOe59XSeVKLQvPnc5b4WnZxbMEJSjpZOKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792446715;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=LqjyEKLTkX6+1Aqf9iomjAog7kKxzRPzlu8iaZzTXog=;
	b=ORdAV0Tw3ouw57LCvIC4cmqS9yXWll73xXet6pCjOlBn/YtD6prBzjDqgiK/utEaxsKs
	 G3Ks0CXFHi9AATz8qeq+T+hDGARmzycz9wcS6dms8AnmK9ALX9mjoYJ6kf6i7Ps0e9eUD
	 jKhGZ2eaNSpWqCWpcKF3u+MBQR6XEaJLd5Bkqqw18nowN0pRZa7tml91/TaZFUVVVUS0g
	 a+UAibZ9rV/TsVU6GaXlCbsF/rRNVXGwGmIwQieOXlHDaj+Bm9JZMBSc8Fqw3DNGsNX+9
	 GQWv/v5XUO2+hwEQjUtHB0YIOEnC8Y0jYkYt40WIdFb5FKH2oOb5C5+G1LzNRAbhQhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rUrh4AGz;
	arc=none smtp.remote-ip=95.215.58.54
Received: from mta1.migadu.com (out-54.mta1.migadu.com [95.215.58.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70048606A319
	for <platform-driver-x86@vger.kernel.org>; Mon, 19 Oct 2026 21:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70048606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=rUrh4AGz
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=iuINLRNPHC+Snxt6vGRFDY7i0T8cvdP6Sc9wX0VcqPU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792446712; v=1; x=1793051512;
 b=rUrh4AGzuU2aDuc52tCobwUYVZaPw1cs1NFlVHQRZeX5Wr9K5SSXdHlPdXIYiKEim/ju584I
 CA5WhsKmbIZLgDWveLgJjChxb10qtrSiQcYVQxaXweR7aQXG1al7y8U1UVRRqSiYpR4A6u+YUCd
 vgxYdFnHAPtjPkrXPniP+twg=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 78e351183aea031e;
	Mon, 19 Oct 2026 21:51:52 +0000
X-Mizu-Trace-ID: 78e351183aea031e
X-Migadu-Flow: FLOW_OUT
Message-ID: <f71595e8-8553-4e18-89a8-cca93cd65f56@linux.dev>
Date: Mon, 19 Oct 2026 23:51:51 +0200
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
Subject: Re: [PATCH] platform/x86: asus-wmi: Clamp keyboard backlight level
 from hotkeys
To: Alex Bogusta <alex@bogusta.com>, Corentin Chary
 <corentin.chary@gmail.com>, "Luke D. Jones" <luke@ljones.dev>,
 Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Antheas Kapenekakis <lkml@antheas.dev>
Cc: Denis Benato <benato.denis96@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261016015117.32174-1-alex@bogusta.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261016015117.32174-1-alex@bogusta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/16/26 03:51, Alex Bogusta wrote:
> Pressing the keyboard backlight down key at level 0 drives the cached
> level negative, so the backlight then needs one extra up press per
> extra down press before it turns back on. brightness_hw_changed also
> reports out-of-range values: 4 after pressing up at the maximum level,
> and ENODATA or values like 4294967294 below 0.
>
> kbd_led_set_by_kbd() stores the new level without clamping it, and
> kbd_led_update_all() skips do_kbd_led_set() for negative levels and
> notifies userspace with the unclamped value. The level is computed in
> enum led_brightness, which is unsigned, so the subtraction at level 0
> wraps around.
>
> Compute the level as int and clamp it in kbd_led_set_by_kbd(), which
> covers every hotkey path.

Hi Alex,

thanks for taking a look at this!


> Fixes: fac55d29581f ("platform/x86: asus-wmi: Add support for multiple kbd led handlers")
> Signed-off-by: Alex Bogusta <alex@bogusta.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 9fb3fe4b161c..599a73862903 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -1949,10 +1949,10 @@ static int kbd_led_set(struct led_classdev *led_cdev, enum led_brightness value)
>  	return 0;
>  }
>  
> -static void kbd_led_set_by_kbd(struct asus_wmi *asus, enum led_brightness value)
> +static void kbd_led_set_by_kbd(struct asus_wmi *asus, int value)

Is the change of type really necessary? I think clamp_value does everything required already.

>  {
>  	scoped_guard(spinlock_irqsave, &asus_ref.lock) {
> -		asus->kbd_led_wk = value;
> +		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
>  		asus->kbd_led_notify = true;
>  	}
>  	queue_work(asus->led_workqueue, &asus->kbd_led_work);
> @@ -4668,9 +4668,9 @@ static int asus_wmi_get_event_code(union acpi_object *obj)
>  
>  static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  {
> -	enum led_brightness led_value;
>  	unsigned int key_value = 1;
>  	bool autorelease = 1;
> +	int led_value;
>  

Honestly I don't like the change of type... I would prefer something that prevents the
bad thing from happening without changing the type.

>  	if (asus->driver->key_filter) {
>  		asus->driver->key_filter(asus->driver, &code, &key_value,
>
> base-commit: 98f039265e580291d5e76a11b2072541fbb1c393

Best regards,
Denis Benato
