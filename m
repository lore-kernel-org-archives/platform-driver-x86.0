Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36E53C4332F
	for <platform-driver-x86@archiver.kernel.org>; Fri, 25 Nov 2022 11:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230357AbiKYLDM (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 25 Nov 2022 06:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbiKYLDM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Nov 2022 06:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1A1F4A5A7
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Nov 2022 03:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669374132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=uSFrKMRx9F4MbJ3pxDLdoIyd2lK2S5t/+AdLLV4BlLs=;
        b=JrJIAlmKlD04xJ9yJlBwLUUupn9W5vF6rcOJOlVkvfuvbA5S3wZs8IUAPAb4ox5ok4L3Bh
        GOtSrwhuS0//KSjmyCz5QPhLkkUK9TA/Xts6Qfa8Hhxzh9wX1F1ZhCq+1QzjsssqJk0mpW
        xfyd6Tw0fwy5O/jX+HLxsz9y/uU6DlU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-490-UjyC7dDpNIuTJd3838iIug-1; Fri, 25 Nov 2022 06:02:10 -0500
X-MC-Unique: UjyC7dDpNIuTJd3838iIug-1
Received: by mail-ej1-f70.google.com with SMTP id gn36-20020a1709070d2400b007ba3374574dso2127247ejc.23
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Nov 2022 03:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSFrKMRx9F4MbJ3pxDLdoIyd2lK2S5t/+AdLLV4BlLs=;
        b=SrohhCpuztgh9mRpIP4NsvZ5UA1wpH3li2SyphP4yPp26NdVRjpdIM/UL5vM8e/4zE
         ZU1ePvqgggtYrSGBcglQO8SkQ7A0R/Hx/NAOG/J4BRumB5oOxShmUfisL6tLHa+tc/Ta
         AeLGOJF9K/R9ybJF4sTY4D1ZXJF6A62TGsaOTvL14SKdkQQZPTmF5z+VW1akTEKeav9Y
         UJca1T7mVpnknDDFri0nmzr2jtQuljCy8Z26KAzczmPkuiIeeJ+ePktoDyYGPEKTiku/
         15qR454mEHEF8wYbpqd0uhxe9a5hYsYmlKmW5BznCuOCADA32v1Fb67UUYeJFRBa5EpJ
         YSgA==
X-Gm-Message-State: ANoB5pkakxuD/5f+bce0Q46mYPzMaUAJlEhrvSRUR8B08Co3dYlI8J81
        2P/iwDeQopeWGOVCBHAMU/TJ2ur0Yp5Olm05ga2cbSnyA6Jh9U2t8LHZN1OyAy5cocYri03DlE2
        eVhZyVR9mAXBmSOByKzXbgCRofXJGL4r2og==
X-Received: by 2002:aa7:c844:0:b0:461:a130:ea3c with SMTP id g4-20020aa7c844000000b00461a130ea3cmr33474090edt.272.1669374129249;
        Fri, 25 Nov 2022 03:02:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5FdiUpm7V8FhHJpDv3e8ePhpFJ4XQsO+Uk0fmKF/leaKerNddG8jLYpvyr8y0yYLXFE/r0Jw==
X-Received: by 2002:aa7:c844:0:b0:461:a130:ea3c with SMTP id g4-20020aa7c844000000b00461a130ea3cmr33474041edt.272.1669374128780;
        Fri, 25 Nov 2022 03:02:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id l18-20020a1709060cd200b00779a605c777sm709227ejh.192.2022.11.25.03.02.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 03:02:08 -0800 (PST)
Message-ID: <c2f364ec-c31e-e6ec-c546-f25078c104ec@redhat.com>
Date:   Fri, 25 Nov 2022 12:02:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/3] platform/x86: int3472/discrete: Make it work with
 IPU6
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e5d8913c-13ba-3b11-94bc-5d1ee1d736b0@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/25/22 11:17, Dan Scally wrote:
> Morning Hans - thanks for the set
> 
> On 24/11/2022 20:00, Hans de Goede wrote:
>> Hi All,
>>
>> Here is a small set of patches to make the int3472/discrete code
>> work with the sensor drivers bundled with the (unfortunately out of tree)
>> IPU6 driver.
>>
>> There are parts of the out of tree IPU6 code, like the sensor drivers,
>> which can be moved to the mainline and I do plan to work on this at some
>> point and then some of this might need to change. But for now the goal is
>> to make the out of tree driver work with standard mainline distro kernels
>> through e.g. dkms. Otherwise users need to run a patched kernel just for
>> a couple of small differences.
>>
>> This is basically a rewrite of this patch:
>> https://github.com/intel/ipu6-drivers/blob/master/patch/int3472-support-independent-clock-and-LED-gpios-5.17%2B.patch
>>
>> Wich users who want to use the IPU6 driver so far have had to manually
>> apply to their kernels which is quite inconvenient.
>>
>> This rewrite makes 2 significant changes:
>>
>> 1. Don't break things on IPU3 platforms
>>
>> 2. Instead of extending the int3472_sensor_configs[] quirks table for each
>> model which needs "clken" and "pled" GPIOs, do this based on matching
>> the ACPI HID of the ACPI device describing the sensor.
>>
>> The need for these GPIOs is a property of the specific sensor driver which
>> binds using this same HID, so by using this we avoid having to extend the
>> int3472_sensor_configs[] quirks table all the time.
>>
>> This allows roling back the behavior to at least use a clk-framework
>> clk instead of clken GPIO on a per sensor(-driver) basis as we mainline
>> the sensor drivers, assuming that the drivers are switched over to the
>> clk framework as part of their mainlining.
>>
>> A bigger question is what to do with the privacy-led GPIO on IPU3
>> we so far have turned the LED on/off at the same as te clock,
>> but at least on some IPU6 models this won't work, because they only
>> have a privacy-led GPIO and no clk_en GPIO (there is no sensor
>> clk-control at all on some models).
> 
> 
> Ah how annoying, we hadn't come across any situations for IPU3 with a privacy LED but no clock GPIO
> 
>>
>> I think we should maybe move all models, including IPU3 based
>> models over to using a normal GPIO for controlling the privacy-led
>> to make things consistent.
> 
> 
> I think they probably should be represented as LED devices then, and have the media subsytem call some framework to find associated LEDs and cycle them at power on time in the sensor drivers. I know there's the v4l2_flash structure at the moment, but not sure if a privacy one exists.

That is actually a pretty good idea, the LED subsystem has the notion
of triggers, which are identified simply with a string.

So we could simple add a LED class device which sets it default trigger
to "camera-front" and then have either the sensor-drivers start-stream
or maybe even something more generic, so in the media subsystem code
somewhere set the led trigger.

See e.g. the LED class device in drivers/hid/hid-lenovo.c and how
it sets data->led_micmute.default_trigger = "audio-micmute",
combined with the drivers/leds/trigger/ledtrig-audio.c code,
where the ALSA kernel code just does, e.g.:

ledtrig_audio_set(LED_AUDIO_MUTE, 1);
or:
ledtrig_audio_set(LED_AUDIO_MUTE, 0);

We would then probably need to do something like rename
the drivers/leds/trigger/ledtrig-audio.c code and extend the
enum led_audio type with front + back cameras. That or copy the
code, but just renaming it seems better then adding a copy.

And then all need is to have something call:

ledtrig_multimedia_set(LED_CAMERA_FRONT, 0);
ledtrig_multimedia_set(LED_CAMERA_FRONT, 1);

And we are done.

I think the biggest question here is where to put those
ledtrig_multimedia_set() calls ?

These calls will be no-ops when no LED has its trigger
set to "camera-front", so there is no need to worry
about making them conditional (other then them being
conditional (or stubbed out?) when the LED subsystem
is disabled).

Note I would like to move forward with this patch set as is,
to unblock distros wanting to package the out of tree
IPU6 driver for now and then we can convert things to this
model later.

Please let me know if there are any objections with going
with this patch-set as an intermediate solution.

Regards,

Hans


