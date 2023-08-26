Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3A4CC83F19
	for <platform-driver-x86@archiver.kernel.org>; Sat, 26 Aug 2023 10:09:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbjHZKJP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 26 Aug 2023 06:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbjHZKIy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 26 Aug 2023 06:08:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D26B198
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Aug 2023 03:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693044484;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=g+PPAdo2VrSnjmu7uL7JhWYoASziMdWVMZrpGAZMQsc=;
        b=R4q4QgBdZffgGyVC7QwC717j4Hy9c/3BUW7Qxg8L5xgqDWy5Khw4SCxXqpm46ZikaG+Z1B
        t6UjM7tDr33vV9fAGE78mu/iyPHlOikhDf5FCpb11Liup2eYiUjNvZ1v89gHGvbmXpIjL+
        24fZ+fU65EluQ/3uB4am7wCrD194jiU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-nKq1UB9AOs2TTtZ8WIEdCQ-1; Sat, 26 Aug 2023 06:08:02 -0400
X-MC-Unique: nKq1UB9AOs2TTtZ8WIEdCQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-52a06f5f4e2so1474227a12.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Aug 2023 03:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693044481; x=1693649281;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g+PPAdo2VrSnjmu7uL7JhWYoASziMdWVMZrpGAZMQsc=;
        b=eoRn7eyPCrMxEAh9V36t2rliRt9j8aOLEHczmWts3K4phJOdzEaQYEr9BJKH9wKoTx
         fzyI0gA9zT8uAvVrDI1+PqBghXC9cvRbOfwAkuyNdNRnBLoS+PApw/buqmkjYyMVji8U
         SDpIfTtnrT5UCPp5q0LV/ZcHKgmSpeyzBixItBCPJudYHzvP5SftPpGXjHEkV67Od+US
         S4e/qMgpTZrTb8BhROh8qN3OUF2FKwdFuxbqi7njNEWACE9+TL0QYflz+nLj7XOz0fIT
         8dIyrv0Gk2VKtDyx9+1BpUKI4HDnULdVdpvZixyPKcc8rxuLuQ5wbrZoB30XDB6zad5y
         g9Ew==
X-Gm-Message-State: AOJu0Yy4VfMJVp+dJ0urbkkWFH3NfMUCUr1mn3ALhch6S94ZdaMk5rk+
        Fk1I2rnwhoUkOiINng/dWzvrbKulqu1F9FWK4C0ERWyoHJla1VyVoHojqp3yl08nuZU0M4/UA9c
        M0d2kNk9gqaSuJhhIy3VRSTLmaheLddCjrR2Hllzykw==
X-Received: by 2002:aa7:c3c3:0:b0:523:47b0:9077 with SMTP id l3-20020aa7c3c3000000b0052347b09077mr14655919edr.38.1693044481468;
        Sat, 26 Aug 2023 03:08:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEJVpke1s50TygAdW7IEtknSQ5qlddXXbUNLKIGO/W5EkmotbRcmfUmYWjdw1NtW4yKP8aBA==
X-Received: by 2002:aa7:c3c3:0:b0:523:47b0:9077 with SMTP id l3-20020aa7c3c3000000b0052347b09077mr14655912edr.38.1693044481041;
        Sat, 26 Aug 2023 03:08:01 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id r14-20020aa7d58e000000b0052a1a623267sm1952336edq.62.2023.08.26.03.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 03:08:00 -0700 (PDT)
Message-ID: <7ab13275-b433-597a-bc5b-d1416c637974@redhat.com>
Date:   Sat, 26 Aug 2023 12:07:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] platform/x86: ideapad-laptop: Add support for
 keyboard backlights using KBLC ACPI symbol
To:     Stuart <stuart.a.hayhurst@gmail.com>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Mark Gross <markgross@kernel.org>,
        Ike Panhc <ike.pan@canonical.com>
References: <20230825122925.7941-1-stuart.a.hayhurst@gmail.com>
 <6b50fffa-57df-032-9418-206a919ab828@linux.intel.com>
 <CALTg27=QFgAqd5irDmg2E-=wnOb4RkDSUUdboEHVm5Ut2z+q8A@mail.gmail.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CALTg27=QFgAqd5irDmg2E-=wnOb4RkDSUUdboEHVm5Ut2z+q8A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Stuart,

On 8/25/23 18:42, Stuart wrote:
> Thanks for the quick review, I've addressed most of the comments for
> V2, do you want that submitted in this thread, or should I create a
> new one?

Either way is fine, just pick which way you prefer.

Regards,

Hans


>> Could these bits too be named with defines, it would be helpful for those
>> reading the code?
> 
>> (If you can add the names to all these other bits too, it should be put
>> into own patch and not into this one.)
> 
> Sorry, I have no idea about the other events. I can do this one if
> you'd like, or leave a comment for the future if you'd rather they all
> be done together.
> 
> On Fri, Aug 25, 2023 at 2:01 PM Ilpo Järvinen
> <ilpo.jarvinen@linux.intel.com> wrote:
>>
>> On Fri, 25 Aug 2023, Stuart Hayhurst wrote:
>>
>>> Newer Lenovo laptops seem to use the KBLC symbol to control the backlight
>>> Add support for handling the keyboard backlight on these devices
>>>
>>> Signed-off-by: Stuart Hayhurst <stuart.a.hayhurst@gmail.com>
>>> ---
>>>
>>> This has been tested on both new types of keyboard backlight being supported.
>>> KBD_BL_TRISTATE_AUTO is used for keyboards that support automatic brightness.
>>> AUTO is reported as '0' with this patch, as it doesn't fit numerically, I'm not sure how else to
>>> report AUTO, hopefully someone has some insight :)
>>>
>>> ---
>>>  drivers/platform/x86/ideapad-laptop.c | 107 ++++++++++++++++++++++++--
>>>  1 file changed, 100 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>>> index d2fee9a3e239..0e4cdd471a4a 100644
>>> --- a/drivers/platform/x86/ideapad-laptop.c
>>> +++ b/drivers/platform/x86/ideapad-laptop.c
>>> @@ -85,6 +85,21 @@ enum {
>>>       SALS_FNLOCK_OFF       = 0xf,
>>>  };
>>>
>>> +/*
>>> + * These correspond to the number of supported states - 1
>>> + * Future keyboard types may need a new system, if there's a collision
>>> + * KBD_BL_TRISTATE_AUTO has no way to report or set the auto state
>>> + * so it effectively has 3 states, but needs to handle 4
>>> + */
>>> +enum {
>>> +     KBD_BL_STANDARD      = 1,
>>> +     KBD_BL_TRISTATE      = 2,
>>> +     KBD_BL_TRISTATE_AUTO = 3,
>>> +};
>>> +
>>> +#define KBD_BL_COMMAND_GET 0x2
>>> +#define KBD_BL_COMMAND_SET 0x3
>>> +
>>>  struct ideapad_dytc_priv {
>>>       enum platform_profile_option current_profile;
>>>       struct platform_profile_handler pprof;
>>> @@ -122,6 +137,7 @@ struct ideapad_private {
>>>       } features;
>>>       struct {
>>>               bool initialized;
>>> +             int type;
>>>               struct led_classdev led;
>>>               unsigned int last_brightness;
>>>       } kbd_bl;
>>> @@ -242,6 +258,16 @@ static int exec_sals(acpi_handle handle, unsigned long arg)
>>>       return exec_simple_method(handle, "SALS", arg);
>>>  }
>>>
>>> +static int exec_kblc(acpi_handle handle, unsigned long arg)
>>> +{
>>> +     return exec_simple_method(handle, "KBLC", arg);
>>> +}
>>> +
>>> +static int eval_kblc(acpi_handle handle, unsigned long cmd, unsigned long *res)
>>> +{
>>> +     return eval_int_with_arg(handle, "KBLC", cmd, res);
>>> +}
>>> +
>>>  static int eval_dytc(acpi_handle handle, unsigned long cmd, unsigned long *res)
>>>  {
>>>       return eval_int_with_arg(handle, "DYTC", cmd, res);
>>> @@ -1272,14 +1298,42 @@ static void ideapad_backlight_notify_brightness(struct ideapad_private *priv)
>>>   */
>>>  static int ideapad_kbd_bl_brightness_get(struct ideapad_private *priv)
>>>  {
>>> -     unsigned long hals;
>>> +     unsigned long value;
>>>       int err;
>>>
>>> -     err = eval_hals(priv->adev->handle, &hals);
>>> +     if (priv->kbd_bl.type == KBD_BL_TRISTATE ||
>>> +         priv->kbd_bl.type == KBD_BL_TRISTATE_AUTO) {
>>> +             err = eval_kblc(priv->adev->handle,
>>> +                             (priv->kbd_bl.type << 4) | KBD_BL_COMMAND_GET,
>>> +                             &value);
>>> +
>>> +             if (err)
>>> +                     return err;
>>> +
>>> +             /* Convert returned value to brightness level */
>>> +             value = (value & 0xFFFF) >> 1;
>>
>> You should define a field for thiswith GENMASK() and use FIELD_GET()
>> instead of manual masking and shifting.
>>
>>> +
>>> +             if (value >= 0 && value <= 2) {
>>
>> How can unsigned long be < 0??
>>
>> If that 2 is the same as priv->kbd_bl.led.max_brightness, it would make
>> sense to use it rather than literal.
>>
>>> +                     /* Off, low or high */
>>> +                     return value;
>>> +             } else if (value == 3) {
>>> +                     /* Auto, report as off */
>>> +                     return 0;
>>> +             } else {
>>
>> Since those blocks above return, the elses are unnecessary.
>>
>>> +                     /* Unknown value */
>>> +                     dev_warn(&priv->platform_device->dev,
>>> +                              "Unknown keyboard backlight value: %i",
>>> +                              value);
>>> +                     return -EINVAL;
>>> +             }
>>> +     }
>>> +
>>> +
>>
>> Remove one of the newlines.
>>
>>> +     err = eval_hals(priv->adev->handle, &value);
>>>       if (err)
>>>               return err;
>>>
>>> -     return !!test_bit(HALS_KBD_BL_STATE_BIT, &hals);
>>> +     return !!test_bit(HALS_KBD_BL_STATE_BIT, &value);
>>>  }
>>>
>>>  static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_classdev *led_cdev)
>>> @@ -1291,13 +1345,27 @@ static enum led_brightness ideapad_kbd_bl_led_cdev_brightness_get(struct led_cla
>>>
>>>  static int ideapad_kbd_bl_brightness_set(struct ideapad_private *priv, unsigned int brightness)
>>>  {
>>> -     int err = exec_sals(priv->adev->handle, brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF);
>>> +     int err;
>>> +     unsigned long value;
>>> +     int type = priv->kbd_bl.type;
>>> +
>>> +     if (type == KBD_BL_TRISTATE ||
>>> +         type == KBD_BL_TRISTATE_AUTO) {
>>> +             if (brightness >= 0 && brightness <= 2) {
>>
>> Brightness is unsigned int so no need for < 0 check.
>>
>> Reverse the logic here:
>>
>>                 if (brightness > 2)
>>                         return -EINVAL;
>>
>> ...as it avoid the need to use else.
>>
>> Consider using .max_brightness here too.
>>
>>> +                     value = (brightness << 16) | (type << 4) | KBD_BL_COMMAND_SET;
>>
>> There would also be a readability benefit for these if you define these
>> as fields and use FIELD_PREP().
>>
>>> +             } else {
>>> +                     return -EINVAL;
>>> +             }
>>> +
>>> +             err = exec_kblc(priv->adev->handle, value);
>>> +     } else {
>>> +             err = exec_sals(priv->adev->handle, brightness ? SALS_KBD_BL_ON : SALS_KBD_BL_OFF);
>>> +     }
>>>
>>>       if (err)
>>>               return err;
>>>
>>>       priv->kbd_bl.last_brightness = brightness;
>>> -
>>
>> Stray change.
>>
>>>       return 0;
>>>  }
>>>
>>> @@ -1344,8 +1412,14 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
>>>
>>>       priv->kbd_bl.last_brightness = brightness;
>>>
>>> +     if (priv->kbd_bl.type == KBD_BL_TRISTATE ||
>>> +         priv->kbd_bl.type == KBD_BL_TRISTATE_AUTO) {
>>
>> Please add a helper for this check as it seems to appear multiple times in
>> this patch.
>>
>>> +             priv->kbd_bl.led.max_brightness = 2;
>>> +     } else {
>>> +             priv->kbd_bl.led.max_brightness = 1;
>>> +     }
>>> +
>>>       priv->kbd_bl.led.name                    = "platform::" LED_FUNCTION_KBD_BACKLIGHT;
>>> -     priv->kbd_bl.led.max_brightness          = 1;
>>>       priv->kbd_bl.led.brightness_get          = ideapad_kbd_bl_led_cdev_brightness_get;
>>>       priv->kbd_bl.led.brightness_set_blocking = ideapad_kbd_bl_led_cdev_brightness_set;
>>>       priv->kbd_bl.led.flags                   = LED_BRIGHT_HW_CHANGED;
>>> @@ -1456,6 +1530,7 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>>>               case 2:
>>>                       ideapad_backlight_notify_power(priv);
>>>                       break;
>>> +             case 12:
>>
>> Could these bits too be named with defines, it would be helpful for those
>> reading the code?
>>
>> (If you can add the names to all these other bits too, it should be put
>> into own patch and not into this one.)
>>
>>>               case 1:
>>>                       /*
>>>                        * Some IdeaPads report event 1 every ~20
>>> @@ -1557,13 +1632,31 @@ static void ideapad_check_features(struct ideapad_private *priv)
>>>                       if (test_bit(HALS_FNLOCK_SUPPORT_BIT, &val))
>>>                               priv->features.fn_lock = true;
>>>
>>> -                     if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val))
>>> +                     if (test_bit(HALS_KBD_BL_SUPPORT_BIT, &val)) {
>>>                               priv->features.kbd_bl = true;
>>> +                             priv->kbd_bl.type = KBD_BL_STANDARD;
>>> +                     }
>>>
>>>                       if (test_bit(HALS_USB_CHARGING_SUPPORT_BIT, &val))
>>>                               priv->features.usb_charging = true;
>>>               }
>>>       }
>>> +
>>> +     if (acpi_has_method(handle, "KBLC")) {
>>> +             if (!eval_kblc(priv->adev->handle, 0x1, &val)) {
>>> +                     if (val == 0x5) {
>>> +                             priv->features.kbd_bl = true;
>>> +                             priv->kbd_bl.type = KBD_BL_TRISTATE;
>>> +                     } else if (val == 0x7) {
>>
>> Name these three literals with defines.
>>
>>> +                             priv->features.kbd_bl = true;
>>> +                             priv->kbd_bl.type = KBD_BL_TRISTATE_AUTO;
>>> +                     } else {
>>> +                             dev_warn(&priv->platform_device->dev,
>>> +                                      "Unknown keyboard type: %i",
>>> +                                      val);
>>> +                     }
>>> +             }
>>> +     }
>>>  }
>>>
>>>  #if IS_ENABLED(CONFIG_ACPI_WMI)
>>>
>>
>> --
>>  i.
>>
> 

