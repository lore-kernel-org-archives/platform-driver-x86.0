Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF93B21257A
	for <platform-driver-x86@vger.kernel.org>; Wed, 19 Nov 2025 00:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763512725; cv=none; b=Dj4/xUMBSghtgGf9mGgNsifZmHZRpmW8uX2KZmACg4hPeeb45/AGao2PZ9kvoVGqC1LclpgH2eV/6nUBYGSovZwMVvRXvHmo2tP5si3vlScDzIpd5MrlrNivhloIn1CNd1YjFCWbFSc3ZBn62a8FUFUwOkr4sabtBVQ9IyX/jmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763512725; c=relaxed/simple;
	bh=FQaxPXXZmKDrIguQcyxuVrOlOw29mdZ5G7SYaGsQQMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MupqgSjHHaBAX4hogQS9nCme7l5zmdlCFhoXVHJ8nzlNoOqxvWZmNU7SCJPUM/4NKyn6v2IgCDb92mHNM0kCO/yw9koz9CNQM86C1zqTS6yZvw1uydA/Onzb7WSCGe/pwehxC6Iac7YXfFAviIYwzTu7a4/KYPqHxUkKeq1UM6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DY6KETBW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DY6KETBW"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477563e28a3so2419745e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 18 Nov 2025 16:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763512719; x=1764117519; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kyLrwLekDqqfuF4ZrXUeptybL6qreAeUb67QNuRLH2o=;
        b=DY6KETBW+m1ZYklOeFdjOnNf9L1c3ujnOlGo0fnnZJ9lqW72xIQZ00DSLNBdglKpJ7
         ALB3tg9IesFLcjxgo4goZMSPA3PLXcLI+ZHhy6ObtTwzRTHk3ipNEycAwgJAssClHKWv
         Y8SHgBkSocUo1AX31Zj0H6EKMMObViDQxgf3qPopC+CYdkbcL/EjtJfWBpvsEdBpaagB
         hZHLQkZp8DdtWFNstYWf11UrAZw7KOTX/i9Sahl+w10Jm39nYtRmKgXhjs1EDAY3JfeV
         5RlGMXVii4fWK8U3Q7LNXAvyOJFETfAF5qhYaRDXW+qmYJyO4IGZXWM1GAhulxPhC5IL
         is/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763512719; x=1764117519;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyLrwLekDqqfuF4ZrXUeptybL6qreAeUb67QNuRLH2o=;
        b=Sf6yfD/qBD5apKSwbFGoJNN9ImpChFa2ATJbFmhfmJxPJnTbuopWJq2NysZSyaa1u7
         lDZ7/XCUooaho1wJNAZqFx7lL/0tAS2UMptImo2+y/SeNGH58riy0sl5ABUtRMm6mUc2
         SkZ4sIM6j3C8naZUH2uahZIc6CgP8J89QeRzKf38YJ2I1HtHWP767v/C2MUHRnDpbTTr
         8LeGijfDyvej7PrOHKElHE5ZEIW3fzCkQyFk67etg5F9lMzj9Wly3Nacwtqyy1q54XRm
         uyBgXC/rlFsb1H9rlDjIjYtwQdYTkZmMchj5uInjzFCdxEGzpN7hotnPOohKf2/HdtBK
         cbGg==
X-Forwarded-Encrypted: i=1; AJvYcCWGAfXfDgA1Kh6o1XF1aJHxTiDFRWF554tb2GdW2IIW7wBbPaQPBp/Z8RepmdqdFGtMYkJT7P4ZwnaAjB1F8PKnN/8C@vger.kernel.org
X-Gm-Message-State: AOJu0YwTegCVe4MIgy37sAHA96V3vncP60K3fjoq695a71pvFOZaPLzh
	FnajtpAp1f1x3EXu8D8y6MSTq4YdZs3WiBj9UdwUuakgZ7pmzS7zk/Nw
X-Gm-Gg: ASbGncvhjc9ehbYj4l3pmtwpWj3CXZjW50/wjtkY558w8BmqagUlSWYzr4DEzYiZAz7
	Ywfk2qWjcPFOorKzh+E0RpJIs/65/xUbJpU9GHm5bz0eNubArXOXaZuYrTYlrP76xcuzTj4g3WI
	l273fpEj79jCRUYFtOryVmYpIW3V2sMW01yxrhcnngvTn+bq/oSXI3gWfMoly3sX7psmfKn/aTR
	IcGQkG0LrHXDE3yhJLIPr8kM7E7VGjCTY6qctihBiqZoQcLEzrzk/91ZRo+VMogZyLq1HwjiKyq
	dZ0PvhgpMFJlFphEDS5O5SLKx60DLytQfcxBbq5Q/piLWgYfOtLrnSItJbNumcppqO1BYFNjSmL
	DDYWH//PFlA9RPXVnNoj6QcVxAdqamhsIFJZfnbFeWnDiYSuwh5BLEpn3f9rMUuBuzhMnMyTzNv
	WsGLAlYnCVUtQrjPPvB7qWilg=
X-Google-Smtp-Source: AGHT+IFDXq69OMQ7MpGQRLax059x29B6T42fhIfqD9u905Fv4nbgdishN/Eh6nV2/O1mFE/JJgsJ4g==
X-Received: by 2002:a05:600c:1552:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-477b18cafa4mr4525805e9.8.1763512718502;
        Tue, 18 Nov 2025 16:38:38 -0800 (PST)
Received: from [192.168.1.121] ([176.206.93.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b0ffd37bsm17209055e9.3.2025.11.18.16.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 16:38:37 -0800 (PST)
Message-ID: <abeecb3b-8d51-4625-8743-1cfff355c0e9@gmail.com>
Date: Wed, 19 Nov 2025 01:38:36 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 04/10] HID: asus: prevent binding to all HID devices on
 ROG
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251101104712.8011-1-lkml@antheas.dev>
 <20251101104712.8011-5-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251101104712.8011-5-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/1/25 11:47, Antheas Kapenekakis wrote:
> Currently, when hid-asus is not loaded, NKEY keyboards load as ~6
> event devices with a pretty ASUSTEK name. When it loads, it concatenates
> all applications per HID endpoint, renames them, and prints errors
> when some of them do not have an input device.
>
> Therefore, change probe so that this is no longer the case. Stop
> renaming the devices, omit the check for .input which causes errors
> on e.g., the Z13 for some hiddev only devices, and move RGB checks
> into probe.
I have an issue with this "therefore" related to the renaming of device:
you are basically doing here:

state a matter of fact.
Therefore, change that.

Why? the check for .input is clear why, the rename not so much.

I have a few more comments below about the rename.
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 52 ++++++++++++++++++++++++++++--------------
>  1 file changed, 35 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 03f0d86936fc..726f5d8e22d1 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -47,6 +47,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define T100CHI_MOUSE_REPORT_ID 0x06
>  #define FEATURE_REPORT_ID 0x0d
>  #define INPUT_REPORT_ID 0x5d
> +#define HID_USAGE_PAGE_VENDOR 0xff310000
>  #define FEATURE_KBD_REPORT_ID 0x5a
>  #define FEATURE_KBD_REPORT_SIZE 64
>  #define FEATURE_KBD_LED_REPORT_ID1 0x5d
> @@ -89,6 +90,7 @@ MODULE_DESCRIPTION("Asus HID Keyboard and TouchPad");
>  #define QUIRK_ROG_NKEY_KEYBOARD		BIT(11)
>  #define QUIRK_ROG_CLAYMORE_II_KEYBOARD BIT(12)
>  #define QUIRK_ROG_ALLY_XPAD		BIT(13)
> +#define QUIRK_SKIP_REPORT_FIXUP		BIT(14)
>  
>  #define I2C_KEYBOARD_QUIRKS			(QUIRK_FIX_NOTEBOOK_REPORT | \
>  						 QUIRK_NO_INIT_REPORTS | \
> @@ -125,7 +127,6 @@ struct asus_drvdata {
>  	struct input_dev *tp_kbd_input;
>  	struct asus_kbd_leds *kbd_backlight;
>  	const struct asus_touchpad_info *tp;
> -	bool enable_backlight;
>  	struct power_supply *battery;
>  	struct power_supply_desc battery_desc;
>  	int battery_capacity;
> @@ -316,7 +317,7 @@ static int asus_e1239t_event(struct asus_drvdata *drvdat, u8 *data, int size)
>  static int asus_event(struct hid_device *hdev, struct hid_field *field,
>  		      struct hid_usage *usage, __s32 value)
>  {
> -	if ((usage->hid & HID_USAGE_PAGE) == 0xff310000 &&
> +	if ((usage->hid & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR &&
>  	    (usage->hid & HID_USAGE) != 0x00 &&
>  	    (usage->hid & HID_USAGE) != 0xff && !usage->type) {
>  		hid_warn(hdev, "Unmapped Asus vendor usagepage code 0x%02x\n",
> @@ -931,11 +932,6 @@ static int asus_input_configured(struct hid_device *hdev, struct hid_input *hi)
>  
>  	drvdata->input = input;
>  
> -	if (drvdata->enable_backlight &&
> -	    !asus_kbd_wmi_led_control_present(hdev) &&
> -	    asus_kbd_register_leds(hdev))
> -		hid_warn(hdev, "Failed to initialize backlight.\n");
> -
>  	return 0;
>  }
>  
> @@ -1008,15 +1004,6 @@ static int asus_input_mapping(struct hid_device *hdev,
>  			return -1;
>  		}
>  
> -		/*
> -		 * Check and enable backlight only on devices with UsagePage ==
> -		 * 0xff31 to avoid initializing the keyboard firmware multiple
> -		 * times on devices with multiple HID descriptors but same
> -		 * PID/VID.
> -		 */
> -		if (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT)
> -			drvdata->enable_backlight = true;
> -
>  		set_bit(EV_REP, hi->input->evbit);
>  		return 1;
>  	}
> @@ -1133,8 +1120,10 @@ static int __maybe_unused asus_reset_resume(struct hid_device *hdev)
>  
>  static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  {
> -	int ret;
> +	struct hid_report_enum *rep_enum;
>  	struct asus_drvdata *drvdata;
> +	struct hid_report *rep;
> +	int ret, is_vendor = 0;
>  
Why is is_vendor an int? Don't we have bools?
>  	drvdata = devm_kzalloc(&hdev->dev, sizeof(*drvdata), GFP_KERNEL);
>  	if (drvdata == NULL) {
> @@ -1218,12 +1207,37 @@ static int asus_probe(struct hid_device *hdev, const struct hid_device_id *id)
>  		return ret;
>  	}
>  
> +	/* Check for vendor for RGB init and handle generic devices properly. */
> +	rep_enum = &hdev->report_enum[HID_INPUT_REPORT];
> +	list_for_each_entry(rep, &rep_enum->report_list, list) {
> +		if ((rep->application & HID_USAGE_PAGE) == HID_USAGE_PAGE_VENDOR)
> +			is_vendor = true;
> +	}
> +
> +	/*
> +	 * For ROG keyboards, disable fixups except vendor devices.
> +	 */
multiline comment for no reason. Comma doesn't provide any value here.
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD && !is_vendor)
> +		drvdata->quirks |= QUIRK_SKIP_REPORT_FIXUP;
> +
Doing this will skip the report fixup entirely while before
it was called in every case: are we really sure we want this?
Or do we want it only for specific devices?

It's my understanding that function is only useful on
keyboard devices, so before keyboard devices (all)
while now is_vendor keyboard devices, right?

What about keyboard devices that are not is_vendor
for which function isn't called anymore? 
>  	ret = hid_hw_start(hdev, HID_CONNECT_DEFAULT);
>  	if (ret) {
>  		hid_err(hdev, "Asus hw start failed: %d\n", ret);
>  		return ret;
>  	}
>  
> +	if (is_vendor && (drvdata->quirks & QUIRK_USE_KBD_BACKLIGHT) &&
> +	    !asus_kbd_wmi_led_control_present(hdev) &&
> +	    asus_kbd_register_leds(hdev))
> +		hid_warn(hdev, "Failed to initialize backlight.\n");
> +
> +	/*
> +	 * For ROG keyboards, skip rename for consistency and ->input check as
> +	 * some devices do not have inputs.
> +	 */
> +	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD)
> +		return 0;
> +
This is a moot point: I have yet to see the real benefit of doing this,
but one thing is sure... having for the same driver multiple name
to basically the same interface across different lineups of
hardware is not something I would call "consistency".

As I said already I want you to either drop this or to present
a list of pros of doing this and to hear from Derek the plan
going forward to avoid breaking anything.
>  	/*
>  	 * Check that input registration succeeded. Checking that
>  	 * HID_CLAIMED_INPUT is set prevents a UAF when all input devices
> @@ -1352,6 +1366,10 @@ static const __u8 *asus_report_fixup(struct hid_device *hdev, __u8 *rdesc,
>  		rdesc = new_rdesc;
>  	}
>  
> +	/* Vendor fixups should only apply to NKEY vendor devices. */
> +	if (drvdata->quirks & QUIRK_SKIP_REPORT_FIXUP)
> +		return rdesc;
> +
Uhm... no? Or at least it's not obvious why.

If this is the case why is the check not at the top of the function?

Beside please refrain from using "should" in this context unless
backed up by evidence or it's otherwise obvious as "should"
can have many different interpretations.
>  	if (drvdata->quirks & QUIRK_ROG_NKEY_KEYBOARD &&
>  			*rsize == 331 && rdesc[190] == 0x85 && rdesc[191] == 0x5a &&
>  			rdesc[204] == 0x95 && rdesc[205] == 0x05) {
