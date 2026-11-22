Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.196
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795366592;
	b=URDhK4NK4nY1VqwJ7mmrahC27y5TzrSCHzmqMKbY40OI0a8R5r+fXFBuWbJRQy2CpqEr
	 e61sEXBcJGRTuKIZCh65dFJa9MoJ1TowOex3mQIxFuzsAvaa+CNPvSkCPVoZcoIc8YUVd
	 TH5eh47GnaxHoIsUzaSsYOY5c9VWQRu7PWYaxJPm8+LCrr2RxE8wWO4z+Kt5ovptJEHqk
	 TbeyKrIHiSGH0i9SqdIjNtDuizwp8FxoZG1tMEyRiyXB3pExv+raMPScdUX9UGxr70cPL
	 5l0j+f4MsQV9h3Mh7nGSeIGao0zSxI7L6fweV1Z/G9IYHrt5KceaMHNR/KwP/vCLXag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795366592;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=v1kNeOQu+4BY6X4rTSwpWmefqs7ZSAnCTA8ogX2zsJQ=;
	b=Zn7Hl+YtddxU1pwy9g8CoW2CLiJg+OLr+Q/VuTUSS8y6/Hclv6lyHsm1ue27wAekC1nb
	 FrlGLZ8tdyT9DChFu+x5ZHnbg+jBtm0WcvjCmY5DBenoIW/XmxElXpL36csWXEO0OnuFq
	 7IhEyT3AwYgI45IulQAmgnghe4jJFjQMjVpIR4DIYTlGvlvTGvoWpx2E1SVGuwk/gILFK
	 1x+/de+pRPz3vVFhClPbC8WMjgeSc/gSIx8mxyvCyufYyZIM6/2Jo1x2NZSFD+oLCrZpM
	 u91lOSKVQyeK4QpFeO/wxeXmbliXpfiMfjSWgEl1DeeHZLrpDIM97AMEjagfdeqL7Hw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="uWtG/lLD";
	arc=none smtp.remote-ip=95.215.58.196
Received: from mta1.migadu.com (out-196.mta1.migadu.com [95.215.58.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70F9606A320
	for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2026 16:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C70F9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uWtG/lLD
X-Envelope-To: platform-driver-x86@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HT6xGk6aWBw6plYQ6H9yDcFRbJ4qGLQ/U/j3PxZYUAk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795366588; v=1; x=1795971388;
 b=uWtG/lLDB5ajRDDdeoS7M5sM6ifH5nVZ3uFrAjSlExbFJQNfgEtUZ/ubaQ8U0Tq2a1FEKjUs
 6ourCnpN3NV+oKjD2pxnk4tnPUqJxdeVdrdEbCiuhue5nh7NQyr2GznCGcRTvmZW5Cp3HUBrLl0
 nQyFb4CIPqrrsCFqfJRgxSjY=
X-Envelope-To: platform-driver-x86@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1b93da790149d8eb;
	Sun, 22 Nov 2026 16:56:28 +0000
X-Mizu-Trace-ID: 1b93da790149d8eb
X-Migadu-Flow: FLOW_OUT
Message-ID: <805ec74b-08ee-4b5d-b53e-643d6fa7f483@linux.dev>
Date: Sun, 22 Nov 2026 17:56:27 +0100
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
Subject: Re: [PATCH v2] platform/asus: asus-wmi: Add quirk for on/off-only
 keyboard backlight
To: Martin Szathmari <martin.szathmari@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20261122144147.7916-1-martin.szathmari@gmail.com>
 <20261122164034.7175-1-martin.szathmari@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261122164034.7175-1-martin.szathmari@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/22/26 17:40, Martin Szathmari wrote:
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
>
> Link: https://www.notebookcheck.net/Asus-ExpertBook-B7-Flip-in-review-2-in-1-laptop-with-5G-modem-and-long-battery-life.600053.0.html
> Signed-off-by: Martin Szathmari <martin.szathmari@gmail.com>
> ---
> Changes in v2:
> - Use a ternary for the quirked clamp in kbd_led_read() (Denis Benato).
>   I kept the clamp limited to quirked models so that behaviour on all
>   other models stays strictly unchanged; happy to make it unconditional
>   if you prefer.
> - Drop the comment on the new quirk_entry field (Denis Benato)
> - Re-tested on the B7402FEA
>
> v1: https://lore.kernel.org/platform-driver-x86/20261122144147.7916-1-martin.szathmari@gmail.com/
>
> Based on pdx86 for-next; happy to rebase if other keyboard lighting
> changes need to go in first.
>
> Note: This patch was developed with the help of an AI coding assistant
> (Claude Opus 5.5). I reviewed the change and tested it myself on my
> ASUS ExpertBook B7402FEA as described above.
>
>  drivers/platform/asus/asus-nb-wmi.c | 14 ++++++++++++++
>  drivers/platform/asus/asus-wmi.c    | 14 ++++++++------
>  drivers/platform/asus/asus-wmi.h    |  1 +
>  3 files changed, 23 insertions(+), 6 deletions(-)
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
> index b33ebdb21..0b85308b8 100644
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
> @@ -1923,7 +1923,8 @@ static int kbd_led_read(struct asus_wmi *asus, int *level, int *env)
>  		return retval;
>  
>  	if (level)
> -		*level = retval & 0x7F;
> +		*level = asus->driver->quirks->kbd_led_on_off ?
> +			 min(retval & 0x7F, 1) : retval & 0x7F;

I'm not understanding why you are checking the quirk here when a min(..., max_level) is
enough.

Generally one either goes for the ternary or for the unified one unless there is a problem,
but I am not seeing one.

You can answer me no problem if I need to know something I am not considering.

If not go for the suggested code I gave you before.

Thanks!

>  	if (env)
>  		*env = (retval >> 8) & 0x7F;
>  	return 0;
> @@ -1937,7 +1938,7 @@ static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
>  	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
>  
>  	scoped_guard(spinlock_irqsave, &asus_ref.lock)
> -		asus->kbd_led_wk = clamp_val(value, 0, ASUS_EV_MAX_BRIGHTNESS);
> +		asus->kbd_led_wk = clamp_val(value, 0, led_cdev->max_brightness);
>  
>  	if (asus->kbd_led_avail)
>  		kbd_led_update(asus);
> @@ -2164,7 +2165,8 @@ static int asus_wmi_led_init(struct asus_wmi *asus)
>  	asus->kbd_led.flags = LED_BRIGHT_HW_CHANGED;
>  	asus->kbd_led.brightness_set_blocking = kbd_led_set;
>  	asus->kbd_led.brightness_get = kbd_led_get;
> -	asus->kbd_led.max_brightness = ASUS_EV_MAX_BRIGHTNESS;
> +	asus->kbd_led.max_brightness = asus->driver->quirks->kbd_led_on_off ?
> +				       1 : ASUS_EV_MAX_BRIGHTNESS;
>  	asus->kbd_led_avail = !kbd_led_read(asus, &led_val, NULL);
>  	INIT_WORK(&asus->kbd_led_work, kbd_led_update_all);
>  
> @@ -4706,7 +4708,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>  		return;
>  	}
>  	if (code == NOTIFY_KBD_BRTTOGGLE) {
> -		if (led_value >= ASUS_EV_MAX_BRIGHTNESS)
> +		if (led_value >= asus->kbd_led.max_brightness)
>  			kbd_led_set_by_kbd(asus, 0);
>  		else
>  			kbd_led_set_by_kbd(asus, led_value + 1);
> diff --git a/drivers/platform/asus/asus-wmi.h b/drivers/platform/asus/asus-wmi.h
> index b45f81b38..74e30a2d7 100644
> --- a/drivers/platform/asus/asus-wmi.h
> +++ b/drivers/platform/asus/asus-wmi.h
> @@ -41,6 +41,7 @@ struct quirk_entry {
>  	bool wmi_force_als_set;
>  	bool wmi_ignore_fan;
>  	bool filter_i8042_e1_extended_codes;
> +	bool kbd_led_on_off;
>  	int key_wlan_event;
>  	enum asus_wmi_tablet_switch_mode tablet_switch_mode;
>  	int wapf;
