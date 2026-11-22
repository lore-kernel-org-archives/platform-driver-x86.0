Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359675;
	b=RtN94D1wSlodZiWLQ5XgI93TStvcqu4Sxdeoo56o2iNR6LtKQ/uAeNiQJejvK5YEZ+gy
	 KHOXJkXUhBd6vaAmxC3bZklvi+2Rz7TWcmHuxbMJM4/ljiID5TrmvJr5QmyxqTbrt50TF
	 eDa67kWMT2Jw1DErZHfXzpgOgV/o11xPYTldPxwqm+hF5w0d8jX4tP9dgQUW4HmeqT4Iv
	 9KDrb1HOY7e2VwdCNgYib46BazDCkfnHHDiuPWLT6FbQRChE0MkavUctWDZWMfMsJzPo+
	 oWQXTeo8ih2yjakAGj0J1BC6rUFbVBcI1Zj0UZOstsgJtIbsxObGOPff6jPtzG098nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359675;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=x8Ty2wRzyL9rzLru17SyKR2v+xxStczC7lbH5HBOwbE=;
	b=pPNO1La6byXQfC7JCyKjMBLBbAcrSeNTAclIdW71ObD8J4Kjlwt1AqEnI6zBrXR28wkZ
	 VPFeiKgNn0gFEhS57BgUO1fchhuzA+G02/xJFZk0S3DkcOvb1gbPdTwMT9LUpFwJTHx2O
	 LsgfNtjgoCQjoCMYwFKSHUf5GmP7gHjS3dLhOQuiYUaUxmC8/D4DloLV6aSqpgpAumceP
	 XnzzWW0dBikHnLpv+Fgg3A2OAjn07OPuqUAvlq6JdJGDinzYdcameTHGMkZHdLWDXFaR0
	 Sh2UH5DKsOqT1jMysHLGznXP6YsBuqpUZE3US36RqsCURAq1Z1Oif2G3b+z89GWa+jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iKT4kdyy;
	arc=none smtp.remote-ip=95.215.58.237
Received: from mta1.migadu.com (out-237.mta1.migadu.com [95.215.58.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A83606A32A
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 15:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68A83606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=iKT4kdyy
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=zCgkald5JKUaQHDpoZpqzA1eA7p71sazcE3AkjFzpFo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795359672; v=1; x=1795964472;
 b=iKT4kdyyuuaAN8DC092CqkC7R9juGSyBP7/tFgktt9mcPk28QU1tj6ibwL5TbmNySK2GCCu4
 6CVBHi8bwWd/zVQQw5XjIuoLpYRJfbDwTBnX+wL3/wQCRKRyfTdpg850oXsPWAeRIYejyN8/ZjK
 Br3bHxdQFsDSZ9MP5cWmTWKo=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f2aa8bd4dd6c4821;
	Sun, 22 Nov 2026 15:01:12 +0000
X-Mizu-Trace-ID: f2aa8bd4dd6c4821
X-Migadu-Flow: FLOW_OUT
Message-ID: <00919820-b513-447c-97a2-e3d5ce9d6172@linux.dev>
Date: Sun, 22 Nov 2026 16:01:07 +0100
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
Subject: Re: [PATCH] platform/asus: asus-wmi: Add quirk for on/off-only
 keyboard backlight
To: Martin Szathmari <martin.szathmari@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20261122144147.7916-1-martin.szathmari@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261122144147.7916-1-martin.szathmari@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/22/26 15:41, Martin Szathmari wrote:
> asus-wmi always registers asus::kbd_backlight with max_brightness = 3
> (ASUS_EV_MAX_BRIGHTNESS). On the ASUS ExpertBook B7402FEA the keyboard
> backlight only supports two states: levels 1, 2 and 3 all produce the
> same, full brightness. Userspace therefore shows a 4-step control where
> the top three steps are identical, and the backlight hotkey cycles
> through steps that visibly do nothing.
>
> This matches the vendor-supplied review unit tested by Notebookcheck,
> which describes the B7402FEA as having "single-level key illumination".
>
> Add a kbd_led_on_off quirk which registers the LED with
> max_brightness = 1, and use the LED's max_brightness instead of
> ASUS_EV_MAX_BRIGHTNESS when clamping and when wrapping around on the
> toggle hotkey. For quirked models, also clamp the level read back from
> firmware to 1. Enable the quirk for the B7402FEA via an exact DMI board
> name match, keeping the default wmi_backlight_set_devstate behaviour.
>
> Behaviour on models without the quirk is unchanged.
>
> I tested this personally on my own ASUS ExpertBook B7402FEA (BIOS WMI
> version 9.0) with the change backported to v7.3.4: max_brightness reads
> 1, writing 1/0 turns the backlight fully on/off, the Fn backlight hotkey
> toggles on/off, and KDE Plasma's keyboard brightness control shows
> 0%/100%.

Hi Martin,

Thanks for your effort! I have a few comments, but generally it looks good,
just be mindful that there may be other pending patches about keyboard
lighting that may beed to go in before this one (I lost track of things
taken/not taken in my mind).

> Link: https://www.notebookcheck.net/Asus-ExpertBook-B7-Flip-in-review-2-in-1-laptop-with-5G-modem-and-long-battery-life.600053.0.html
> Signed-off-by: Martin Szathmari <martin.szathmari@gmail.com>
> ---
> Note: This patch was developed with the help of an AI coding assistant
> (Claude Opus 5.5). I reviewed the change and tested it myself on my
> ASUS ExpertBook B7402FEA as described above.
>
>  drivers/platform/asus/asus-nb-wmi.c | 14 ++++++++++++++
>  drivers/platform/asus/asus-wmi.c    | 16 ++++++++++------
>  drivers/platform/asus/asus-wmi.h    |  2 ++
>  3 files changed, 26 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/platform/asus/asus-nb-wmi.c b/drivers/platform/asus/asus-nb-wmi.c
> index 3b0f3346d..9204213be 100644
> --- a/drivers/platform/asus/asus-nb-wmi.c
> +++ b/drivers/platform/asus/asus-nb-wmi.c
> @@ -154,6 +154,11 @@ static struct quirk_entry quirk_asus_zenbook_duo_kbd = {
>  	.key_wlan_event = ASUS_WMI_KEY_IGNORE,
>  };
>  
> +static struct quirk_entry quirk_asus_kbd_led_on_off = {
> +	.wmi_backlight_set_devstate = true,
> +	.kbd_led_on_off = true,
> +};
> +
>  static struct quirk_entry quirk_asus_z13 = {
>  	.key_wlan_event = ASUS_WMI_KEY_ARMOURY,
>  	.tablet_switch_mode = asus_wmi_kbd_dock_devid,
> @@ -585,6 +590,15 @@ static const struct dmi_system_id asus_quirks[] = {
>  		},
>  		.driver_data = &quirk_asus_proart_px13,
>  	},
> +	{
> +		.callback = dmi_matched,
> +		.ident = "ASUS ExpertBook B7402FEA",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_EXACT_MATCH(DMI_BOARD_NAME, "B7402FEA"),
> +		},
> +		.driver_data = &quirk_asus_kbd_led_on_off,
> +	},
>  	{},
>  };
>  
> diff --git a/drivers/platform/asus/asus-wmi.c b/drivers/platform/asus/asus-wmi.c
> index b33ebdb21..2e06aac9a 100644
> --- a/drivers/platform/asus/asus-wmi.c
> +++ b/drivers/platform/asus/asus-wmi.c
> @@ -1837,14 +1837,14 @@ int asus_hid_event(enum asus_hid_event event)
>  		brightness -= 1;
>  		break;
>  	case ASUS_EV_BRTTOGGLE:
> -		if (brightness >= ASUS_EV_MAX_BRIGHTNESS)
> +		if (brightness >= asus->kbd_led.max_brightness)
>  			brightness = 0;
>  		else
>  			brightness += 1;
>  		break;
>  	}
>  
> -	asus->kbd_led_wk = clamp_val(brightness, 0, ASUS_EV_MAX_BRIGHTNESS);
> +	asus->kbd_led_wk = clamp_val(brightness, 0, asus->kbd_led.max_brightness);
>  	asus->kbd_led_notify = true;
>  	queue_work(asus->led_workqueue, &asus->kbd_led_work);
>  	return 0;
> @@ -1922,8 +1922,11 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
>  	if (retval < 0)
>  		return retval;
>  
> -	if (level)
> +	if (level) {
>  		*level = retval & 0x7F;
> +		if (asus->driver->quirks->kbd_led_on_off)
> +			*level = min(*level, 1);

Ternary operator instead? Or maybe, even better, just use min(*level, max_brightness) regardless
of the quirk.

like this:

*level = min(retval & 0x7F, max_level);

> +	}
>  	if (env)
>  		*env = (retval >> 8) & 0x7F;
>  	return 0;
> @@ -1937,7 +1940,7 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>  	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>  
>  	scoped_guard(spinlock_irqsave, &asus_ref.lock)
> -		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
> +		asus->kbd_led_wk = clamp_val(value, 0, led_cdev->max_brightness);
>  
>  	if (asus->kbd_led_avail)
>  		kbd_led_update(asus);
> @@ -2164,7 +2167,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
>  	asus->kbd_led.brightness_set_blocking = kbd_led_set;
>  	asus->kbd_led.brightness_get = kbd_led_get;
> -	asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
> +	asus->kbd_led.max_brightness = asus->driver->quirks->kbd_led_on_off ?
> +				       1 : ASUS_EV_MAX_BRIGHTNESS;
>  	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
>  	INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
>  
> @@ -4706,7 +4710,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  		return;
>  	}
>  	if (code == NOTIFY_KBD_BRTTOGGLE) {
> -		if (led_value >= ASUS_EV_MAX_BRIGHTNESS)
> +		if (led_value >= asus->kbd_led.max_brightness)
>  			kbd_led_set_by_kbd(asus, 0);
>  		else
>  			kbd_led_set_by_kbd(asus, led_value + 1);
> diff --git a/drivers/platform/asus/asus-wmi.h b/drivers/platform/asus/asus-wmi.h
> index b45f81b38..2a9060b6e 100644
> --- a/drivers/platform/asus/asus-wmi.h
> +++ b/drivers/platform/asus/asus-wmi.h
> @@ -41,6 +41,8 @@ struct quirk_entry {
>  	bool wmi_force_als_set;
>  	bool wmi_ignore_fan;
>  	bool filter_i8042_e1_extended_codes;
> +	/* Keyboard backlight only supports on/off, not 3 levels */

No other quirk has a comment there, why should this have one?

> +	bool kbd_led_on_off;
>  	int key_wlan_event;
>  	enum asus_wmi_tablet_switch_mode tablet_switch_mode;
>  	int wapf;
