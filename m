Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E956C43334
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Jun 2022 10:06:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbiFUKG4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Jun 2022 06:06:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbiFUKGz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Jun 2022 06:06:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CDADE27FED
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jun 2022 03:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1655806012;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OVKCPH4a0JKLpBoajp+D/luYrEgaQCvDF1hMTvEYmdY=;
        b=Y9rqJ24QvNz+LV/goHeMUxvaoPY7kQNYqxTxuufaax8THicH59WCwMaIY2MrCtGHXENklM
        L7wuVMvxlQ2bTTZExYxv8VC3vVbkRCxkyU7XxsX4ncv7XpXlPI75kWUuVPgrYz6mwBOfBB
        nlIudVjCE1hr+IGY696Jo7wngWavPNs=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-yYHlErPlODGXsLHq_C4ujg-1; Tue, 21 Jun 2022 06:06:51 -0400
X-MC-Unique: yYHlErPlODGXsLHq_C4ujg-1
Received: by mail-ej1-f70.google.com with SMTP id p10-20020a170906b20a00b0070c21a6d378so4573401ejz.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jun 2022 03:06:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OVKCPH4a0JKLpBoajp+D/luYrEgaQCvDF1hMTvEYmdY=;
        b=DwFqCE6aX7vNns/XeRTL9HKGZyUTLgMIJR7WzW8u0Be2b/zh4g7DAY6hTK18oWq9FC
         U7Ik4OuxGOyewsL8KHhwraoS22JeCep6NvOppQkgeF0AfwbodFYUKmefj1kgqgM0INWU
         8htw5qBwpnmwYWLoQK2IAzAschddRSesE69U9A25QjgKNt91+BcVmCkstmw887A7YsQa
         rrqNwnaIiFZbXU3+EI29DuAGSvX9F61g8uQnG+QIgQKJIiZKlEDvGpyWfwNQOS/LYCsR
         sPZOk2rci9csX1BrtPQY8LnFGH8TnWKm/3G4efuQRyCYO5zNHHBeUDoLMX2XWMZloNA1
         8E5A==
X-Gm-Message-State: AJIora/OzbYXdP76fYnZA5Kx2146jn3C7WVxUGLkCivYSuh+isIJIq2M
        rYqKgLxxf249rgEBoXnDs3tjSexRiP7gdmrdZSfLThpX1FKtHksQ4zELnFDn0sZ5MehhHpKXBIG
        VB2uRiVkJhInhrlGKBRJvYI9CXfCUr3hGjA==
X-Received: by 2002:a17:907:7e90:b0:704:b67d:623e with SMTP id qb16-20020a1709077e9000b00704b67d623emr24830595ejc.634.1655806009494;
        Tue, 21 Jun 2022 03:06:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfDU5HBc6eg5PVLcqUujSoxltFjtYrZOrHgADfRD8wTvWQQMXNdkhuwCq1OBqcEKcR1dzWmQ==
X-Received: by 2002:a17:907:7e90:b0:704:b67d:623e with SMTP id qb16-20020a1709077e9000b00704b67d623emr24830566ejc.634.1655806009205;
        Tue, 21 Jun 2022 03:06:49 -0700 (PDT)
Received: from [10.1.0.34] ([31.137.219.240])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906304d00b00704757b1debsm7329217ejd.9.2022.06.21.03.06.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jun 2022 03:06:48 -0700 (PDT)
Message-ID: <7a9bec36-b699-4a5f-ba79-36806f3d36b5@redhat.com>
Date:   Tue, 21 Jun 2022 12:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 01/14] ACPI: video: Add a native function parameter to
 acpi_video_get_backlight_type()
Content-Language: en-US
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
        Daniel Dadap <ddadap@nvidia.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     nouveau@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20220517152331.16217-1-hdegoede@redhat.com>
 <20220517152331.16217-2-hdegoede@redhat.com> <87y1yzdxtk.fsf@intel.com>
 <dc30ddc2-b00e-234e-5ec3-b1ea79c74082@redhat.com> <87pmk9dhe1.fsf@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87pmk9dhe1.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/19/22 11:02, Jani Nikula wrote:
> On Wed, 18 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
>>
>> On 5/18/22 10:55, Jani Nikula wrote:
>>> On Tue, 17 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>>>> ATM on x86 laptops where we want userspace to use the acpi_video backlight
>>>> device we often register both the GPU's native backlight device and
>>>> acpi_video's firmware acpi_video# backlight device. This relies on
>>>> userspace preferring firmware type backlight devices over native ones, but
>>>> registering 2 backlight devices for a single display really is undesirable.
>>>>
>>>> On x86 laptops where the native GPU backlight device should be used,
>>>> the registering of other backlight devices is avoided by their drivers
>>>> using acpi_video_get_backlight_type() and only registering their backlight
>>>> if the return value matches their type.
>>>>
>>>> acpi_video_get_backlight_type() uses
>>>> backlight_device_get_by_type(BACKLIGHT_RAW) to determine if a native
>>>> driver is available and will never return native if this returns
>>>> false. This means that the GPU's native backlight registering code
>>>> cannot just call acpi_video_get_backlight_type() to determine if it
>>>> should register its backlight, since acpi_video_get_backlight_type() will
>>>> never return native until the native backlight has already registered.
>>>>
>>>> To fix this add a native function parameter to
>>>> acpi_video_get_backlight_type(), which when set to true will make
>>>> acpi_video_get_backlight_type() behave as if a native backlight has
>>>> already been registered.
> 
> Regarding the question below, this is the part that throws me off.
> 
>>>>
>>>> Note that all current callers are updated to pass false for the new
>>>> parameter, so this change in itself causes no functional changes.
>>>
>>>
>>>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>>>> index becc198e4c22..0a06f0edd298 100644
>>>> --- a/drivers/acpi/video_detect.c
>>>> +++ b/drivers/acpi/video_detect.c
>>>> @@ -17,12 +17,14 @@
>>>>   * Otherwise vendor specific drivers like thinkpad_acpi, asus-laptop,
>>>>   * sony_acpi,... can take care about backlight brightness.
>>>>   *
>>>> - * Backlight drivers can use acpi_video_get_backlight_type() to determine
>>>> - * which driver should handle the backlight.
>>>> + * Backlight drivers can use acpi_video_get_backlight_type() to determine which
>>>> + * driver should handle the backlight. RAW/GPU-driver backlight drivers must
>>>> + * pass true for the native function argument, other drivers must pass false.
>>>>   *
>>>>   * If CONFIG_ACPI_VIDEO is neither set as "compiled in" (y) nor as a module (m)
>>>>   * this file will not be compiled and acpi_video_get_backlight_type() will
>>>> - * always return acpi_backlight_vendor.
>>>> + * return acpi_backlight_native when its native argument is true and
>>>> + * acpi_backlight_vendor when it is false.
>>>>   */
>>>
>>> Frankly, I think the boolean native parameter here, and at the call
>>> sites, is confusing, and the slightly different explanations in the
>>> commit message and comment here aren't helping.
>>
>> Can you elaborate the "slightly different explanations in the
>> commit message and comment" part a bit (so that I can fix this) ?
>>
>>> I suggest adding a separate function that the native backlight drivers
>>> should use. I think it's more obvious all around, and easier to document
>>> too.
>>
>> Code wise I think this would mean renaming the original and
>> then adding 2 wrappers, but that is fine with me. I've no real
>> preference either way and I'm happy with adding a new variant of
>> acpi_video_get_backlight_type() for the native backlight drivers
>> any suggestion for a name ?
> 
> Alternatively, do the native backlight drivers have any need for the
> actual backlight type information from acpi? They only need to be able
> to ask if they should register themselves, right?
> 
> I understand this sounds like bikeshedding, but I'm trying to avoid
> duplicating the conditions in the drivers where a single predicate
> function call could be sufficient, and the complexity could be hidden in
> acpi.
> 
> 	if (!acpi_video_backlight_use_native())
> 		return;

acpi_video_backlight_use_native() sounds good, I like I will change
this for v2. This also removes churn in all the other
acpi_video_get_backlight_type() callers.

> Perhaps all the drivers/platform/x86/* backlight drivers could use:
> 
> 	if (acpi_video_backlight_use_vendor())
> 		...

Hmm, as part of the ractoring there also will be new apple_gmux
and nvidia_wmi_ec types. I'm not sure about adding seperate functions
for all of those vs get_type() != foo. I like get_type != foo because
it makes clear that there will also be another caller somewhere
where get_type == foo and that that one will rbe the one which
actually gets to register its backlight.

> You can still use the native parameter etc. internally, but just hide
> the details from everyone else, and, hopefully, make it harder for them
> to do silly things?

Ack.

Regards,

Hans

