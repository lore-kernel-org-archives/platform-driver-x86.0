Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6C0FA373E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Oct 2022 20:32:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbiJYUcm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Oct 2022 16:32:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232656AbiJYUcl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Oct 2022 16:32:41 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C31ABF25
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Oct 2022 13:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666729960;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4P2ABpjEqSTVTEkx9cKhWwG+CP5X9PoCvvt9+EPcxqQ=;
        b=MTkkPxaTKtu/MiUIR0osdLO6KMJWMXFXamt5pavAwXjjLPAw0p4bO6YWtBxK+qVtBbfKb0
        UZnBEn+ry0JJVFoTFPAnDXaTNY4GPNL9u+itX+SUUdyH7fLA9gRNi9BLYq/gTKPXhrvubI
        y7oaZk4m6Rk50Y15Ee9REqZNCRvqYP4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-121-jzP65g7wNtenbvknqDd02A-1; Tue, 25 Oct 2022 16:32:38 -0400
X-MC-Unique: jzP65g7wNtenbvknqDd02A-1
Received: by mail-ej1-f70.google.com with SMTP id ho8-20020a1709070e8800b0078db5e53032so3377084ejc.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Oct 2022 13:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4P2ABpjEqSTVTEkx9cKhWwG+CP5X9PoCvvt9+EPcxqQ=;
        b=sv4UoNcy/Dhv4KI1hBbrEQEFNJHpzf2lP0qQn835CVzHP58SGv20R34VcyFBEfhyGO
         RAcWhOEesacWa03W8Er4jx7t4aAL4EYX4v6n60hWO7AfCVFdlpiH+dcy9cm74s2lOpOd
         SKlFcZqGY99U3uqQbj7vkbn8ZZ8i49d17HM2JWvQ8VTbe17OO+I9aoXJkESbQSwADKWm
         whwd8zL7YMyq4jhS0RNQiB1KCvSWFGAC9W2dZWY164DIrTzELCGegNaRk0MqP29MTocO
         /V7fudRlOUuI8XXrmpxAgiNCYFLuz1avaI+z1G3Iadxey9cjaQZofIBQfHpl/R1HVQ3z
         mERA==
X-Gm-Message-State: ACrzQf1FYq41oIrnzjVHPDs94k5gv4hap0zvaYxpPDxcfSCCQPGGt+Xc
        w18v69DqacMiW0SrL9T4mzbWOo13XoXnXX3s7ZUigqgyrrc9/Cjq5QpK6FwWm/R45tqIsts8Ezb
        cl1fzjLe/CDjlLeK4gdsB2f+0j6RVs3aLig==
X-Received: by 2002:a05:6402:a46:b0:461:ed76:cb56 with SMTP id bt6-20020a0564020a4600b00461ed76cb56mr8670259edb.264.1666729957454;
        Tue, 25 Oct 2022 13:32:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6rX3+ePQsTyJYF+i2iWFugymXxMZcnRY2gE9uairsp91rDdpSyc8kecBPMFXy/fx1WVWo3tg==
X-Received: by 2002:a05:6402:a46:b0:461:ed76:cb56 with SMTP id bt6-20020a0564020a4600b00461ed76cb56mr8670233edb.264.1666729957267;
        Tue, 25 Oct 2022 13:32:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id b12-20020a1709063f8c00b0078d4e39d87esm1863438ejj.225.2022.10.25.13.32.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 13:32:36 -0700 (PDT)
Message-ID: <ed0f7d4a-3fa4-1be6-85fa-54dd82dce56b@redhat.com>
Date:   Tue, 25 Oct 2022 22:32:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 02/31] drm/i915: Don't register backlight when another
 backlight should be used (v2)
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
To:     Matthew Garrett <mjg59@srcf.ucam.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
        Daniel Dadap <ddadap@nvidia.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, linux-acpi@vger.kernel.org,
        Jani Nikula <jani.nikula@intel.com>,
        nouveau@lists.freedesktop.org,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>
References: <20220825143726.269890-1-hdegoede@redhat.com>
 <20220825143726.269890-3-hdegoede@redhat.com>
 <f914ceb3-94bd-743c-f8b6-0334086e731a@gmail.com>
 <42a5f2c9-a1dc-8fc0-7334-fe6c390ecfbb@redhat.com>
 <20221024203057.GA28675@srcf.ucam.org>
 <8f53b8b6-ead2-22f5-16f7-65b31f7cc05c@redhat.com>
 <20221025193248.GA21457@srcf.ucam.org>
 <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
In-Reply-To: <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi (again),

On 10/25/22 22:25, Hans de Goede wrote:
> Hi Matthew,
> 
> On 10/25/22 21:32, Matthew Garrett wrote:
>> On Tue, Oct 25, 2022 at 08:50:54PM +0200, Hans de Goede wrote:
>>
>>> That is a valid point, but keep in mind that this is only used on ACPI
>>> platforms and then only on devices with a builtin LCD panel and then
>>> only by GPU drivers which actually call acpi_video_get_backlight_type(),
>>> so e.g. not by all the ARM specific display drivers.
>>>
>>> So I believe that Chromebooks quite likely are the only devices with
>>> this issue.
>>
>> My laptop is, uh, weird, but it falls into this category.
>>  
>>>> I think for this to work correctly you need to have 
>>>> the infrastructure be aware of whether or not a vendor interface exists, 
>>>> which means having to handle cleanup if a vendor-specific module gets 
>>>> loaded later.
>>>
>>> Getting rid of the whole ping-ponging of which backlight drivers
>>> get loaded during boot was actually one of the goals of the rework
>>> which landed in 6.1 this actually allowed us to remove some quirks
>>> because some hw/firmware did not like us changing our mind and
>>> switching backlight interfaces after first poking another one.
>>> So we definitely don't want to go back to the ping-pong thing.
>>
>> Defaulting to native but then having a vendor driver be able to disable 
>> native drivers seems easiest? It shouldn't be a regression over the 
>> previous state of affairs since both drivers were being loaded already.
> 
> Part of the reason for the ACPI backlight detect refactor is
> because of a planned new backlight uAPI where the brightness
> control becomes a property on the drm connector object, for a
> RFC including the rationale behind this planned uAPI change see:
> https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/
> 
> These plans require that there is only 1 backlight device
> registered (per panel).
> 
> Having the native driver come and then go and be replaced
> with the vendor driver would also be quite inconvenient
> for these planned changes.
> 
> As such I would rather find a solution for your "weird"
> laptop so that acpi_video_get_backlight_type() just always
> returns vendor there.

I just realized that your have vendor driver unregister
the native one is suggested as an alternative for
the new behavior where the i915 driver no longer
registers its native backlight in cases where
acpi_video_get_backlight_type() does not return native,
and that you probably actually want the native backlight
device, right ?

So the above should read:

"so that acpi_video_get_backlight_type() just always
returns native there."

> Note that drivers/acpi/video_detect.c already has a DMI
> quirk tables for models where the heuristics from
> acpi_video_get_backlight_type() don't work. In general
> we (mostly me) try to make it so that the heuristics
> work on most models, to avoid needing to add every model
> under the sun to the DMI quirk table, but if your laptop
> is somehow special then adding a DMI quirk for it should
> be fine ?
> 
> Can you perhaps explain a bit in what way your laptop
> is weird ?

I guess it is weird in that it does not have the ACPI video,
or at least does not offer ACPI video bus backlight control
in its ACPI tables?

Can you perhaps email me an acpidump of the laptop ?

> Note that technically if the native backlight does not work,
> then the GPU driver really should not even try to register
> it. But sometimes the video-bios-tables claim the backlight
> pwm input is attached to the GPU while it is not and things
> have evolved in such a way that the DMI quirks for that
> live in acpi/video_detect.c rather then in the GPU driver.

And this bit can be ignored then because it certainly
is not relevant if you actually want the native driver.

Regards,

Hans


