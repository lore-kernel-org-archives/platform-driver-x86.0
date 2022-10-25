Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370E3C38A2D
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Oct 2022 20:25:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232805AbiJYUZn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Oct 2022 16:25:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiJYUZm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Oct 2022 16:25:42 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 631DC7CA9D
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Oct 2022 13:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666729537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9XonFPheAhtCegE797S1mcjxSh0z0UskbUv2fBkcMxo=;
        b=MTy+GSu7L2LRHrWhCzZU8mC3KUoV7XLBAjDNtjMdyBVByVd49ciKsNG+hIJVtQ53YGgH4P
        EMujxfBMOBuwSq1tUkT+heEVe4vsPLjoloITqYme5BP321JMzW+5EffCt+NEIn4R7TrLcZ
        eFT15iNg7RTvsYh8Jxe8htDn/5Jpm4A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-393-wxHOXwotNMOBNrPraR-ioQ-1; Tue, 25 Oct 2022 16:25:36 -0400
X-MC-Unique: wxHOXwotNMOBNrPraR-ioQ-1
Received: by mail-ej1-f69.google.com with SMTP id hd11-20020a170907968b00b0078df60485fdso3392907ejc.17
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Oct 2022 13:25:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XonFPheAhtCegE797S1mcjxSh0z0UskbUv2fBkcMxo=;
        b=CF8ZXE1lQ4YBxF3t07EqXXS9CM9TihDNc5wdulC1wOX2/gOcS2UxnAQrGik+gCTxwd
         evWUoewT4BjEvH5WThc1NKo0gRGoNuCirorVQj7IhuLDJoiKNep59J4i0oxXMNIQJaK+
         +JOZlXqbEoy0dZ8IGEdXPX30/KoBohIfIvLujbc9whMsbV4ZA0xUcJIKYf+nDV6KsIN8
         Gwn0xaSArr04g3pYfCRbAVIODKIXBlLwzO4ttl/YsHkPIGroBVDR5E3Sd6m530jL83r0
         LyK34uYL1qHmhEhkBzplLgQJZ0okTBYO8BWT4B+YX877HOsJcPfWUTUJV5y+tCbKS18h
         GYeg==
X-Gm-Message-State: ACrzQf27mjFfBpEX2dzwrDXkEYS2Ur7FDGHsqM0RVs0biTaNd+P/lks1
        8d/hWT5kJmuINTpOodS7d3N0QQU8wJ+Q+cAqC1Dw7pXVC0t9an/9eocD0z8+Pu8WtsDjUhc+Ztl
        v+8owkvrZfaQzdYFBwKKF2oMVIZdSL2G2Gw==
X-Received: by 2002:a05:6402:1906:b0:45d:db20:7709 with SMTP id e6-20020a056402190600b0045ddb207709mr36471715edz.406.1666729535490;
        Tue, 25 Oct 2022 13:25:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4AvLy3/xx91WJDsytfb8il98Gi/jdDsRHk8yLwQ8ZaFqjnH6cleAwDsF1BomERvdjpliBAIA==
X-Received: by 2002:a05:6402:1906:b0:45d:db20:7709 with SMTP id e6-20020a056402190600b0045ddb207709mr36471704edz.406.1666729535300;
        Tue, 25 Oct 2022 13:25:35 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 27-20020a508e1b000000b00456c6b4b777sm2150898edw.69.2022.10.25.13.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 13:25:34 -0700 (PDT)
Message-ID: <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
Date:   Tue, 25 Oct 2022 22:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 02/31] drm/i915: Don't register backlight when another
 backlight should be used (v2)
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
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221025193248.GA21457@srcf.ucam.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Matthew,

On 10/25/22 21:32, Matthew Garrett wrote:
> On Tue, Oct 25, 2022 at 08:50:54PM +0200, Hans de Goede wrote:
> 
>> That is a valid point, but keep in mind that this is only used on ACPI
>> platforms and then only on devices with a builtin LCD panel and then
>> only by GPU drivers which actually call acpi_video_get_backlight_type(),
>> so e.g. not by all the ARM specific display drivers.
>>
>> So I believe that Chromebooks quite likely are the only devices with
>> this issue.
> 
> My laptop is, uh, weird, but it falls into this category.
>  
>>> I think for this to work correctly you need to have 
>>> the infrastructure be aware of whether or not a vendor interface exists, 
>>> which means having to handle cleanup if a vendor-specific module gets 
>>> loaded later.
>>
>> Getting rid of the whole ping-ponging of which backlight drivers
>> get loaded during boot was actually one of the goals of the rework
>> which landed in 6.1 this actually allowed us to remove some quirks
>> because some hw/firmware did not like us changing our mind and
>> switching backlight interfaces after first poking another one.
>> So we definitely don't want to go back to the ping-pong thing.
> 
> Defaulting to native but then having a vendor driver be able to disable 
> native drivers seems easiest? It shouldn't be a regression over the 
> previous state of affairs since both drivers were being loaded already.

Part of the reason for the ACPI backlight detect refactor is
because of a planned new backlight uAPI where the brightness
control becomes a property on the drm connector object, for a
RFC including the rationale behind this planned uAPI change see:
https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/

These plans require that there is only 1 backlight device
registered (per panel).

Having the native driver come and then go and be replaced
with the vendor driver would also be quite inconvenient
for these planned changes.

As such I would rather find a solution for your "weird"
laptop so that acpi_video_get_backlight_type() just always
returns vendor there.

Note that drivers/acpi/video_detect.c already has a DMI
quirk tables for models where the heuristics from
acpi_video_get_backlight_type() don't work. In general
we (mostly me) try to make it so that the heuristics
work on most models, to avoid needing to add every model
under the sun to the DMI quirk table, but if your laptop
is somehow special then adding a DMI quirk for it should
be fine ?

Can you perhaps explain a bit in what way your laptop
is weird ?

Note that technically if the native backlight does not work,
then the GPU driver really should not even try to register
it. But sometimes the video-bios-tables claim the backlight
pwm input is attached to the GPU while it is not and things
have evolved in such a way that the DMI quirks for that
live in acpi/video_detect.c rather then in the GPU driver.

Regards,

Hans

