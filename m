Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B5D6C19F2A
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Aug 2022 15:01:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234601AbiHKPB0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Aug 2022 11:01:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235400AbiHKPBZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Aug 2022 11:01:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 127BCE019
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 08:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660230083;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XatOoqy1kloo+8/8ON6RPBD/1hsnqJ37T+E0u/+44gw=;
        b=cerEgfCJa6jFt5+ac2NDwBR+Mq0Jzk9XeenlX07FPJB9WPvYrjrWhgj+FlQ0dPGeXjedd2
        dOhDtJywjV7cFUTKNiJ215vTnkZ3DRcRiYkb06JSTQJnypKrN4/RPAp0gFMYhTFRoJYou0
        nLwyEqbRkhY76dyi0lyP2/X+AqcC1WI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-641-RYThsUapOG6WTX66g-sCYQ-1; Thu, 11 Aug 2022 11:01:20 -0400
X-MC-Unique: RYThsUapOG6WTX66g-sCYQ-1
Received: by mail-ej1-f69.google.com with SMTP id qf23-20020a1709077f1700b007308a195618so5534859ejc.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Aug 2022 08:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=XatOoqy1kloo+8/8ON6RPBD/1hsnqJ37T+E0u/+44gw=;
        b=Ji9X1cC8Sfyivd4DayqnzDOEDtDuMwwoi7mKgi2uSazW+P06Cu0gbMPrw2lcqcZFSA
         iWDrhtmct4eCX1fGXV8TA2TFIqUvur9B62QKSmBew7Leo+UKFGTjaUnH0fsfTn6YX3CU
         4w9XGbf4Y2hsg/Ofeq42vvMjsmIh3xXVEWkAy/f6jVRyPWHbooXKFsn2inC5z566OpPA
         qDHGzylPqaIkt2zqKOd76cWKxxRi1+E3Vzx66AN7qMAB7i/iUKXEJGjNoQrMElBUO8CC
         4UOJRKTWeYvMBA8xOfq6vhkDAn+mmtc1H9JzQrfZNaF7iLARpDGpZnhMHYffNZQBJTKb
         4jCw==
X-Gm-Message-State: ACgBeo3h04DUmd1vwKJmPPFB15ytm9PIUSbYvKerkB8rjvPchB+eH45Z
        s1qkHCv6ZYMXKBD3zGq8o74pPuzskVk0BTL7gEj+Esy4gCO3fCyLxjH9f/GUyFZP7RG2m3B90cd
        gezGm1s7nQDiZoPenp/exg6e82I6FCmQb2w==
X-Received: by 2002:a17:906:8a63:b0:730:9e5c:b456 with SMTP id hy3-20020a1709068a6300b007309e5cb456mr23611714ejc.571.1660230078539;
        Thu, 11 Aug 2022 08:01:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6bpuPGafJ4RMWsMMpJ582Vk9xLkZ4cfPW0qAws5sX8IpU8vAS9bb+qoVNPrC2tx6DWfhIi0A==
X-Received: by 2002:a17:906:8a63:b0:730:9e5c:b456 with SMTP id hy3-20020a1709068a6300b007309e5cb456mr23611689ejc.571.1660230078258;
        Thu, 11 Aug 2022 08:01:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id gn19-20020a1709070d1300b007307e7df83bsm3588081ejc.21.2022.08.11.08.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Aug 2022 08:01:17 -0700 (PDT)
Message-ID: <f1ad35f6-acdf-0fc8-1ee1-99bd8c7a5e77@redhat.com>
Date:   Thu, 11 Aug 2022 17:01:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/6] asus-wmi: Implement TUF laptop keyboard RGB
 control
Content-Language: en-US
To:     Luke Jones <luke@ljones.dev>, Pavel Machek <pavel@ucw.cz>
Cc:     andy.shevchenko@gmail.com, pobrn@protonmail.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220809025054.1626339-1-luke@ljones.dev>
 <20220809025054.1626339-2-luke@ljones.dev> <20220809105031.GA4971@duo.ucw.cz>
 <fcc7b7eb29abc1ac9053bce02fd9f705e5f06b0b.camel@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <fcc7b7eb29abc1ac9053bce02fd9f705e5f06b0b.camel@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/10/22 06:44, Luke Jones wrote:
> Hi Pavel, Andy, Hans,
> 
>>>>>>>>> +               /*
>>>>>>>>> +                * asus::kbd_backlight still controls a
>>>>>>>>> base > > > > > > 3-level backlight and when
>>>>>>>>> +                * it is on 0, the RGB is not visible
>>>>>>>>> at all. > > > > RGB > > should be treated as
>>>>>>>>> +                * an additional step.
>>>>>>>>> +                */
>>>>>
>>>>> Ouch. Lets not do that? If rgb interface is available, hide the
>>>>> 3
>>>>> level one, or something.
>>>>>
> 
> I really don't think this is safe or sensible. There are some laptops
> that default the 3-stage method to off, and this means that the LEDs
> will not show regardless of multicolor brightness.
> 
> 
> 
>>>>>>>>> +               mc_cdev->led_cdev.name =   > > > > > >
>>>>>>>>> "asus::multicolour::kbd_backlight";
>>>>>
>>>>> Make this "rgb:kbd_backlight" or "inputX:rgb:kbd_backligh" and
>>>>> document it in Documentation/leds/well-known-leds.txt.
> 
> Will do.
> 
> -- 4 hours later --
> 
> I've spent a lot of time working on this now. I don't think multicolor
> LED is suitable for use with the way these keyboards work.
> 
> The biggest issue is related to the brightness setting.
> 1. If the ASUS_WMI_DEVID_KBD_BACKLIGHT method defaults to 0 on boot
> then RGB is not visible

Note to others following this thread I asked Luke to clarify this
a bit in an unrelated 1:1 conversation we were having:

On 8/10/22 23:45, Luke Jones wrote:
> On 8/10/22, Hans de Goede wrote:
>> I plan to go through all the asus-wmi stuff you've posted tomorrow,
>> so I'll reply to this then. One thing which is not entirely
>> clear to me is that:
>>
>> 1. If I understand you correctly the laptops
>> with the RGB keyboards have both the old mono-color
>> "asus::kbd_backlight"
>> as well as a new RGB interface and these somehow interact with each
>> other, do I understand that correctly?
> 
> Yes, and that is the problem. The "mono" switch takes precedence.
> 
>> 2. If yes, then can you explain the interaction in a bit more detail,
>> I see you say someting along the lines of the RGB controls only
>> working when the old mono-color "asus::kbd_backlight" brightness
>> is set to 3 (which is its max brightness) ?
> 
> Adjusting this changes the overall keyboard brightness. So if this is
> at 1, and all RGB is at 255, then when you switch 2, 3, the overall
> brightness increases.
> 
>> 3. So what happens e.g. if writing 2 to the old mono-color
>> "asus::kbd_backlight" brightness after setting some RGB values ?
> 
> If the brightness was 3, then the overall brightness decreases.
> If it was at 1, then it increases.

I see, so the old (still present) mono-color "asus::kbd_backlight"
brightness works as a master brightness control and the rgb values
in the ASUS_WMI_DEVID_TUF_RGB_MODE WMI set commands are really
just to set the color.

And I guess that the Fn + whatever kbd brightness hotkey also still
modifies the old mono-color "asus::kbd_backlight"? Which means that
the "asus::kbd_backlight" device is also the device on which the
led_classdev_notify_brightness_hw_changed is done as you mention
below.

(continued below.

> I worked around this by setting it to "3" by default in module if
> ASUS_WMI_DEVID_TUF_RGB_MODE is found. And added a check in the button
> events to adjust multicolor brightness (+/- 17). This works but now I
> can't do led notify (led_classdev_notify_brightness_hw_changed).
> 
> 2. Pattern trigger can't be used for these keyboard modes as the modes
> are done entirely in hardware via a single switch in the complete
> command packet.
> 
> I don't see any way forward with this, and looking at the complexity I
> don't have time either.
> 
> 3. Nodes everywhere..
> 
> To fully control control these keyboards there are two WMI methods, one
> for mode/rgb, one for power-state. Splitting each of these parameters
> out to individual nodes with sensible naming and expectations gives:

<snip>

> Quite frankly I would rather use the method I had in the first patch I
> submitted where mode and state had two nodes each,
> - keyboard_rgb_mode, WO = "n n n n n n"
> - keyboard_rgb_mode_index, output = "save/apply, mode, r, g, b, speed"
> - keyboard_rgb_state, WO = "n n n n n"
> - keyboard_rgb_state_index, output = "save/apply, boot, awake, sleep,
> keyboard"
> 
> A big benefit of this structure is that not being able to read settings
> back from the keyboard (not possible!) becomes a non-issue because
> users have to write a full input, not partial, and it will apply right
> away.

Right to me this not being able to read back the values shows that
the firmware API here really is not suitable for doing a more
fancy "nice" / standard sysfs API on top.

Since we cannot read back any of the r, g, b, mode or speed values
we would need to pick defaults and then setting any of them would
override the actual values the hw is using for the others, which
is really not a good thing to do.

So that only leaves something akin to keyboard_rgb_mode[_index] +
keyboard_rgb_state[_index] which sets all values at once, mirroring
the limited WMI API as a good option here, I agree with you on this.

Sorry Pavel, I know you don't like custom sysfs attributes
being added to LED class devices, but I have to agree with Luke
that there really is not a good way to deal with this here and
we did try!

Only request I have for the next version wrt the decision to
circle all the way back to having:

> - keyboard_rgb_mode, WO = "n n n n n n"
> - keyboard_rgb_mode_index, output = "save/apply, mode, r, g, b, speed"
> - keyboard_rgb_state, WO = "n n n n n"
> - keyboard_rgb_state_index, output = "save/apply, boot, awake, sleep,

Is please put these new attributes under the:
/sys/class/leds/asus::kbd_backlight

Using the led_class_device.groups member as discussed before, now
that we have decided to drop the multicolor LED stuff that should
work :)

Although maybe Pavel prefers to have the new sysfs attributes
under /sys/bus/platform/devices/asus-nb-wmi/ instead since they
are non standard.

Pavel, to me having these under /sys/class/leds/asus::kbd_backlight
seems more logical. But since there are non-standard and since
there already is a bunch of asus-wmi sysfs API under
/sys/bus/platform/devices/asus-nb-wmi/ putting them there if you
prefer that is fine with me too. So what do you prefer ?

> Hans, Andy, can I please revert back to the node + _index pairs taking
> an array input. Everything will be cleaner and simpler.

Ack, see above. Thank you for at least trying to use the multi-color
LED API. 

Regards,

Hans

