Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC8C2FA3743
	for <platform-driver-x86@archiver.kernel.org>; Thu, 27 Oct 2022 12:17:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233884AbiJ0MRO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 27 Oct 2022 08:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbiJ0MRM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2022 08:17:12 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE692250B
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 05:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666873030;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nNSQHBPSHJEe/PSS7iMw1xD+BezXUHkmeN0CFT7EetY=;
        b=eEiqvbOPirEEnq9tkzdrEgRQ4Ufswx5A45iiZUS2yjK0uwdjNnSrrRCOsqECk8TjiYBif7
        05MZMGWi4ZvEPLj//HflT24KWDJC+HEXJcxImC+iHZSictqacI0Ssla2E2jGpU77gLTbee
        hUvp7+u3VvcuuDO/wWLY5QxZtNsv2Nc=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-201-EogN7tmZM2mXp2clJjHHmA-1; Thu, 27 Oct 2022 08:17:09 -0400
X-MC-Unique: EogN7tmZM2mXp2clJjHHmA-1
Received: by mail-ej1-f71.google.com with SMTP id sb13-20020a1709076d8d00b0078d8e1f6f7aso911039ejc.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Oct 2022 05:17:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nNSQHBPSHJEe/PSS7iMw1xD+BezXUHkmeN0CFT7EetY=;
        b=M9cKIcg8uoq9OvbBKgrZOP2XueDuVu57UPGaYIw2zJV4eqfLiPAZ8bLLXNeWbbRUYM
         iEFe6wuWk5cSUhI4pNQzXwxC4f/rf1zT2f8CNe4bxBb8PxiB8sHB73TtcuIsssOQiQFZ
         MJKXGQbI14jtm98nt0JI7nHlvtN7TXnYzooC7ikoSdlqLpfJg+lziay+m5HHKJwVSf+O
         esXcptpwCYyOykhMJTlTs+FouxxryuBBmTSttxGE5ICCrq7BLCvPIOzmJ7pskeEkNuFo
         l98iFpevchN0I7OaZTy08HLWSbwjjLkoG648RSx6u4afhASCxwOg94e+2CUG6ZDwHk5D
         M1MA==
X-Gm-Message-State: ACrzQf37AiyeH8bO0IAlUMR66AFzvXdwnntKJOVqaTgcFfj+OF0Yd6qv
        xr4YfVLN7vPg0tMTY1iISOXODpyu8yTcr2jsUS2Bl2yzhsuwi/3QfW5qY1KmahzHhqBxpfSpncf
        h74R/+DdsDxThiVQwORHfUA2wJh4LwcpgWg==
X-Received: by 2002:a17:907:60d3:b0:78d:f874:3267 with SMTP id hv19-20020a17090760d300b0078df8743267mr41647597ejc.409.1666873028262;
        Thu, 27 Oct 2022 05:17:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5kUJ8EV+Zs2dQ2kNzThHLFb2/0/6HQPEpmjy0US3opwfZNp14T88TCVeiHIyLkRkgiys3h2w==
X-Received: by 2002:a17:907:60d3:b0:78d:f874:3267 with SMTP id hv19-20020a17090760d300b0078df8743267mr41647570ejc.409.1666873028031;
        Thu, 27 Oct 2022 05:17:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id m2-20020a50ef02000000b00461c375d88csm858104eds.97.2022.10.27.05.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 05:17:07 -0700 (PDT)
Message-ID: <526db9ed-bc39-b6be-c977-d4509ce22152@redhat.com>
Date:   Thu, 27 Oct 2022 14:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v5 02/31] drm/i915: Don't register backlight when another
 backlight should be used (v2)
Content-Language: en-US, nl
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Matthew Garrett <mjg59@srcf.ucam.org>,
        Dmitry Osipenko <digetx@gmail.com>,
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
        Xinhui <Xinhui.Pan@amd.com>,
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
References: <20221025193248.GA21457@srcf.ucam.org>
 <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
 <20221025204043.GA23306@srcf.ucam.org>
 <cb5add36-c13c-ccd5-1b4b-71b45163a170@redhat.com>
 <20221025234040.GA27673@srcf.ucam.org>
 <fa6cc1d9-6740-b495-2c72-cae18c429ca6@redhat.com>
 <20221026204920.GA15326@srcf.ucam.org>
 <099dee98-8aeb-af36-828c-110f5ac6e9a3@redhat.com>
 <20221027091123.GA28089@srcf.ucam.org>
 <933be908-0bc2-56cc-8d6f-38f2d208ef20@redhat.com>
 <20221027095249.GA28666@srcf.ucam.org>
 <6df2016d-ed2d-57fa-dcad-48537732895f@redhat.com>
 <CAJZ5v0jM1JAySagv=u2be1bAmfTt3jJgVnOEjGzskBvZY7k6aw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAJZ5v0jM1JAySagv=u2be1bAmfTt3jJgVnOEjGzskBvZY7k6aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/27/22 14:09, Rafael J. Wysocki wrote:
> On Thu, Oct 27, 2022 at 12:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 10/27/22 11:52, Matthew Garrett wrote:
>>> On Thu, Oct 27, 2022 at 11:39:38AM +0200, Hans de Goede wrote:
>>>
>>>> The *only* behavior which actually is new in 6.1 is the native GPU
>>>> drivers now doing the equivalent of:
>>>>
>>>>      if (acpi_video_get_backlight_type() != acpi_backlight_native)
>>>>              return;
>>>>
>>>> In their backlight register paths (i), which is causing the native
>>>> backlight to disappear on your custom laptop setup and on Chromebooks
>>>> (with the Chromebooks case being already solved I hope.).
>>>
>>> It's causing the backlight control to vanish on any machine that isn't
>>> ((acpi_video || vendor interface) || !acpi). Most machines that fall
>>> into that are either weird or Chromebooks or old, but there are machines
>>> that fall into that.
>>
>> I acknowledge that their are machines that fall into this category,
>> but I expect / hope there to be so few of them that we can just DMI
>> quirk our way out if this.
>>
>> I believe the old group to be small because:
>>
>> 1. Generally speaking the "native" control method is usually not
>> present on the really old (pre ACPI video spec) mobile GPUs.
>>
>> 2. On most old laptops I would still expect there to be a vendor
>> interface too, and if both get registered standard desktop environments
>> will prefer the vendor one, so then we need a native DMI quirk to
>> disable the vendor interface anyways and we already have a bunch of
>> those, so some laptops in this group are already covered by DMI quirks.
>>
>> And a fix for the Chromebook case is already in Linus' tree, which
>> just leaves the weird case, of which there will hopefully be only
>> a few.
>>
>> I do share your worry that this might break some machines, but
>> the only way to really find out is to get this code out there
>> I'm afraid.
>>
>> I have just written a blog post asking for people to check if
>> their laptop might be affected; and to report various details
>> to me of their laptop is affected:
>>
>> https://hansdegoede.dreamwidth.org/26548.html
>>
>> Lets wait and see how this goes. If I get (too) many reports then
>> I will send a revert of the addition of the:
>>
>>         if (acpi_video_get_backlight_type() != acpi_backlight_native)
>>                 return;
>>
>> check to the i915 / radeon / amd / nouveau drivers.
>>
>> (And if I only get a couple of reports I will probably just submit
>> DMI quirks for the affected models).
> 
> Sounds reasonable to me, FWIW.
> 
> And IIUC the check above can be overridden by passing
> acpi_backlight=native in the kernel command line, right?

Right, that can be used as a quick workaround, but we really do
want this to work OOTB everywhere.

Regards,

Hans

