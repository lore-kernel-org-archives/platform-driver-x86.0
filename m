Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9645EC433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 18:54:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60F9823125
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 18:54:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbhAFSyR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Jan 2021 13:54:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35405 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725890AbhAFSyR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jan 2021 13:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609959169;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SlDnd0VEqsWJEQpZ1EacmJCcX+1Wxro9cFs6IiTUslI=;
        b=U+N3XntHIYQk9m4lcStv523OiuWh8p89ybtlu6dWCGSH0o2G/+8RcdrZ8J+PCqupK1RYoi
        bFY4Mz5MekvZZikGOEr+uSQwmU3OsthcUgBd8nZInziznALGguM86UYeP8UUlS6kiYx2sC
        TVkm84jZkbeli1VxMR2ZbRBl/bxsBBA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-ywbx0oDRMM2DyADsWxD28Q-1; Wed, 06 Jan 2021 13:52:47 -0500
X-MC-Unique: ywbx0oDRMM2DyADsWxD28Q-1
Received: by mail-ed1-f70.google.com with SMTP id l33so2271488ede.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Jan 2021 10:52:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SlDnd0VEqsWJEQpZ1EacmJCcX+1Wxro9cFs6IiTUslI=;
        b=arUR3cwC3fKnrA85InBgWD7qHcD0QecaixraRyj6WoukWa3Yvxgjvcl1IfhtWwcZMY
         /Nk1egTn/MrBTAh42xJj8Jtr2JOqoeoiu7wA9c1JgG2GMoPIKbJDzyIaEjDRMT8jz30n
         6fIVA4ep4IJI2jo+3dpQydlYVBRZ1V3bNwp6vBXHa/W7QS1GehjHNfywZR7vlMxgHsau
         GJWINeN/8KjZl7+zNV0XOXxCpW7cKJhG2PljSOueqOHiC+YiEtl3RQa+5+azVLUTcMWY
         LCstcqJGdrgqk03Z6JWl+g2LbUePNcAleFn+gIqrhOBlCm2BqhQQy864xHrUczycEVca
         BsrQ==
X-Gm-Message-State: AOAM533V8q1vzIAg7QZRaHlTMDTWXyDBntxSw/Wlihh5IhtastV7wY/F
        LyD84+FaqiRuTbOv6Ri2b3JjrH2v8z8H+9rAZQKt37J4p62mJD33mqyRxqO0xbanOBurloJQ1xW
        46N7eoDo9fCWecRZy8dXa0/vSB4ricEHaTw==
X-Received: by 2002:a17:907:373:: with SMTP id rs19mr3551099ejb.298.1609959165741;
        Wed, 06 Jan 2021 10:52:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyr3PRMfJtdx/qmoxY3KxU3lRjelLpV4kruipQk1RnU7RN5x5mmjIdSg7Us/8AVAHr0DhWUHA==
X-Received: by 2002:a17:907:373:: with SMTP id rs19mr3551086ejb.298.1609959165563;
        Wed, 06 Jan 2021 10:52:45 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id f8sm1779705eds.19.2021.01.06.10.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 10:52:45 -0800 (PST)
Subject: Re: [PATCH 21/24] platform/x86: ideapad-laptop: add keyboard
 backlight control support
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
References: <20201216013857.360987-22-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <770007e6-a06f-eb0a-112c-17e2eb396ae5@redhat.com>
Date:   Wed, 6 Jan 2021 19:52:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201216013857.360987-22-pobrn@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/16/20 2:40 AM, Barnabás Pőcze wrote:
> On certain models it is possible to control/query the keyboard backlight
> via the SALS/HALS ACPI methods. Add support for that, and register an LED
> class device to expose this functionality.
> Tested on: Lenovo YOGA 520-14IKB 80X8
> 
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>
> 
> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
> index 075056075b2d..a43574e65f61 100644
> --- a/drivers/platform/x86/ideapad-laptop.c
> +++ b/drivers/platform/x86/ideapad-laptop.c
> @@ -9,6 +9,7 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <acpi/video.h>
> +#include <dt-bindings/leds/common.h>
>  #include <linux/acpi.h>
>  #include <linux/backlight.h>
>  #include <linux/bitops.h>
> @@ -22,6 +23,7 @@
>  #include <linux/input/sparse-keymap.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
> +#include <linux/leds.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <linux/rfkill.h>

I guess you need a "depends on LEDS_CLASS" in the Kconfig for this?

> @@ -56,12 +58,16 @@ enum {
>  };
>  
>  enum {
> +	HALS_KBD_BL_SUPPORT_BIT  = 4,
> +	HALS_KBD_BL_STATE_BIT    = 5,
>  	HALS_FNLOCK_SUPPORT_BIT  = 9,
>  	HALS_FNLOCK_STATE_BIT    = 10,
>  	HALS_HOTKEYS_PRIMARY_BIT = 11,
>  };
>  
>  enum {
> +	SALS_KBD_BL_ON  = 0x8,
> +	SALS_KBD_BL_OFF = 0x9,
>  	SALS_FNLOCK_ON  = 0xe,
>  	SALS_FNLOCK_OFF = 0xf,
>  };
> @@ -114,6 +120,11 @@ struct ideapad_private {
>  		     fn_lock           : 1,
>  		     hw_rfkill_switch  : 1;
>  	} features;
> +	struct {
> +		bool initialized;
> +		struct led_classdev led;
> +		unsigned int last_brightness;
> +	} kbd_bl;
>  };
>  
>  static bool no_bt_rfkill;
> @@ -934,6 +945,110 @@ static void ideapad_backlight_notify_brightness(struct ideapad_private *priv)
>  		backlight_force_update(priv->blightdev, BACKLIGHT_UPDATE_HOTKEY);
>  }
>  
> +/*
> + * keyboard backlight
> + */
> +static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
> +{
> +	unsigned long hals;
> +	int err;
> +
> +	err = eval_hals(priv->adev->handle, &hals);
> +	if (err)
> +		return err;
> +
> +	return test_bit(HALS_KBD_BL_STATE_BIT, &hals);
> +}
> +
> +static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_classdev *led_cdev)
> +{
> +	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
> +
> +	return ideapad_kbd_bl_brightness_get(priv);
> +}
> +
> +static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, unsigned int brightness)
> +{
> +	int err;
> +
> +	err = eval_sals(priv->adev->handle,
> +			brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF);
> +	if (err)
> +		return err;
> +
> +	priv->kbd_bl.last_brightness = brightness;
> +
> +	return 0;
> +}
> +
> +static int ideapad_kbd_bl_led_cdev_brightness_set(struct led_classdev *led_cdev,
> +						  enum led_brightness brightness)
> +{
> +	struct ideapad_private *priv = container_of(led_cdev, struct ideapad_private, kbd_bl.led);
> +
> +	return ideapad_kbd_bl_brightness_set(priv, brightness);
> +}
> +
> +static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
> +{
> +	int brightness;
> +
> +	if (!priv->kbd_bl.initialized)
> +		return;
> +
> +	brightness = ideapad_kbd_bl_brightness_get(priv);
> +	if (brightness < 0)
> +		return;
> +
> +	if (brightness == priv->kbd_bl.last_brightness)
> +		return;
> +
> +	priv->kbd_bl.last_brightness = brightness;
> +
> +	led_classdev_notify_brightness_hw_changed(&priv->kbd_bl.led, brightness);
> +}

So I guess that there is some hotkey combo on the laptops keyboards which
directly changes the state of the kbd backlight "underneath" us and that
is why this is necessary ?

> +
> +static int ideapad_kbd_bl_init(struct ideapad_private *priv)
> +{
> +	unsigned long hals;
> +	int err;
> +
> +	err = eval_hals(priv->adev->handle, &hals);
> +	if (err)
> +		return err;

So you are checking for presence of the HALS method here, but not
for SALS which is being used in ideapad_kbd_bl_led_cdev_brightness_set()
and you are needlessly re-evaluating HALS here. Would it not be better
to add a features.kbd_bl flag and set that from ideapad_check_features()
as done for other features ? That would avoid an extra evaluation of
the HALS method and also check for SALS.

You can then still unconditionally call this function but just bail
with -ENODEV if the feature flag is not set.

Otherwise this looks good to me.

Regards,

Hans



> +
> +	if (!test_bit(HALS_KBD_BL_SUPPORT_BIT, &hals))
> +		return -ENODEV;
> +
> +	err = ideapad_kbd_bl_brightness_get(priv);
> +	if (err < 0)
> +		return err;
> +
> +	priv->kbd_bl.last_brightness = err;
> +
> +	priv->kbd_bl.led.name                    = "platform::" LED_FUNCTION_KBD_BACKLIGHT;
> +	priv->kbd_bl.led.max_brightness          = 1;
> +	priv->kbd_bl.led.brightness_get          = ideapad_kbd_bl_led_cdev_brightness_get;
> +	priv->kbd_bl.led.brightness_set_blocking = ideapad_kbd_bl_led_cdev_brightness_set;
> +	priv->kbd_bl.led.flags                   = LED_BRIGHT_HW_CHANGED;
> +
> +	err = led_classdev_register(&priv->platform_device->dev, &priv->kbd_bl.led);
> +	if (err)
> +		return err;
> +
> +	priv->kbd_bl.initialized = true;
> +
> +	return 0;
> +}
> +
> +static void ideapad_kbd_bl_exit(struct ideapad_private *priv)
> +{
> +	if (!priv->kbd_bl.initialized)
> +		return;
> +
> +	led_classdev_unregister(&priv->kbd_bl.led);
> +}
> +
>  /*
>   * module init/exit
>   */
> @@ -1000,8 +1115,9 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>  			 * Some IdeaPads report event 1 every ~20
>  			 * seconds while on battery power; some
>  			 * report this when changing to/from tablet
> -			 * mode. Squelch this event.
> +			 * mode.
>  			 */
> +			ideapad_kbd_bl_notify(priv);
>  			break;
>  		default:
>  			dev_warn(&priv->platform_device->dev,
> @@ -1101,6 +1217,11 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  	if (err)
>  		goto input_failed;
>  
> +	err = ideapad_kbd_bl_init(priv);
> +	if (err && err != -ENODEV)
> +		dev_warn(&pdev->dev,
> +			 "Could not register keyboard backlight led: %d\n", err);
> +
>  	/*
>  	 * On some models without a hw-switch (the yoga 2 13 at least)
>  	 * VPCCMD_W_RF must be explicitly set to 1 for the wifi to work.
> @@ -1161,6 +1282,7 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>  	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
>  		ideapad_unregister_rfkill(priv, i);
>  
> +	ideapad_kbd_bl_exit(priv);
>  	ideapad_input_exit(priv);
>  
>  input_failed:
> @@ -1188,6 +1310,7 @@ static int ideapad_acpi_remove(struct platform_device *pdev)
>  	for (i = 0; i < IDEAPAD_RFKILL_DEV_NUM; i++)
>  		ideapad_unregister_rfkill(priv, i);
>  
> +	ideapad_kbd_bl_exit(priv);
>  	ideapad_input_exit(priv);
>  	ideapad_debugfs_exit(priv);
>  	ideapad_sysfs_exit(priv);
> 

