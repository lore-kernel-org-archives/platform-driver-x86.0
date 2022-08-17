Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D34C25B08
	for <platform-driver-x86@archiver.kernel.org>; Wed, 17 Aug 2022 13:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239649AbiHQNI0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 17 Aug 2022 09:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239738AbiHQNH7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Aug 2022 09:07:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB28F95AE7
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Aug 2022 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660741556;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5Bb7dToDVYNe7JAROkpJKR5S/ALfzfxwMNw63SU+PbA=;
        b=RfEXLVpNPJzukI07gkHr6bJKuRovi0cXaqrth4OcVrIrjXSY97c2voG+ppLYo+Sdh6CLFu
        IRDAy5WaizWArD7vNktAELNfceWiq+uFdWfqJM89A2YgXmd5MCXRXyMfkEzf0q1rZz5zX1
        Owv9CaEvx6YVoyMo+BlMBWUR7D8dN2Q=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-1-RzutiiFgOY2N5oR8Gqv5SQ-1; Wed, 17 Aug 2022 09:05:54 -0400
X-MC-Unique: RzutiiFgOY2N5oR8Gqv5SQ-1
Received: by mail-ed1-f69.google.com with SMTP id j19-20020a05640211d300b0043ddce5c23aso8710274edw.14
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Aug 2022 06:05:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=5Bb7dToDVYNe7JAROkpJKR5S/ALfzfxwMNw63SU+PbA=;
        b=JKIxHTHF8ZLMagkI8cJag1+Rb2Gc7HMnaMgYA9Yd5GpGFSXM/euBmZP9aasLYCDaiK
         zKdTDJPaUvPuNzv6RPYtMs6BC+m5ocaN0RH2iZJK8LDBYIioamdX1hR9jcKf7rlxI0xL
         juzv4e6rXjS3N2z5HzenGkKo0WZ0ocBc1vDl1+th0/8WGSuxWQtMhepprwxvj/rUo4nk
         WYAfJGHnj4uq+a5fqJvy4JElWrrtciowLpZZ98JOxsPiyIJoNJ+z7QBDyCb2WQ83U9hV
         41pgIQLELbNoYMyYrzDEAJCi8vcmfKQzMxt0M6BVfYR8WSsmHOCqBADP5JFvqeaHnHww
         sDyQ==
X-Gm-Message-State: ACgBeo2cJGedI1Avi+diffRrL/khbtvCmyl4BwE+uuQTQgMlBLNhN0li
        BCiT1072AmLxX/ZvqzMqrlyph/zKmn9p8vhtG1KnYkxF6NhGMJ1WrVP/r4c/FdCMzVtYoNe3/AL
        japVTb/+znB7ahMZL3G2J8I0KsyWf/Gupfg==
X-Received: by 2002:a05:6402:438d:b0:43d:b383:660f with SMTP id o13-20020a056402438d00b0043db383660fmr22910433edc.283.1660741553759;
        Wed, 17 Aug 2022 06:05:53 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4s4Ny0f0Ire0xndhK1NrT/mXOvYYx89AxmZwcwm0z10Nafkp7oHY0nXhWi10Hz10jrx9IRwA==
X-Received: by 2002:a05:6402:438d:b0:43d:b383:660f with SMTP id o13-20020a056402438d00b0043db383660fmr22910393edc.283.1660741553531;
        Wed, 17 Aug 2022 06:05:53 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id e20-20020a50ec94000000b0043c83ac66e3sm10606845edr.92.2022.08.17.06.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Aug 2022 06:05:52 -0700 (PDT)
Message-ID: <13f55d75-ce98-5ee7-9d7c-5205dfcf1582@redhat.com>
Date:   Wed, 17 Aug 2022 15:05:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 03/29] drm/amdgpu: Don't register backlight when
 another backlight should be used
Content-Language: en-US
To:     Alex Deucher <alexdeucher@gmail.com>
Cc:     Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
        Lyude <lyude@redhat.com>, Daniel Dadap <ddadap@nvidia.com>,
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
        David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        Len Brown <lenb@kernel.org>
References: <20220712193910.439171-1-hdegoede@redhat.com>
 <20220712193910.439171-4-hdegoede@redhat.com>
 <CADnq5_PcpwtgdBrn7_1B4Fq5CNGbkSO94c5Qzf8NfbnpwBqHAw@mail.gmail.com>
 <CADnq5_PBMtshPza9yRAZCEtwVSiHAs6AY8B8CttHF8ZyLuiX6w@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CADnq5_PBMtshPza9yRAZCEtwVSiHAs6AY8B8CttHF8ZyLuiX6w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/20/22 18:46, Alex Deucher wrote:
> On Wed, Jul 20, 2022 at 12:44 PM Alex Deucher <alexdeucher@gmail.com> wrote:
>>
>> On Tue, Jul 12, 2022 at 3:39 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>> Before this commit when we want userspace to use the acpi_video backlight
>>> device we register both the GPU's native backlight device and acpi_video's
>>> firmware acpi_video# backlight device. This relies on userspace preferring
>>> firmware type backlight devices over native ones.
>>>
>>> Registering 2 backlight devices for a single display really is
>>> undesirable, don't register the GPU's native backlight device when
>>> another backlight device should be used.
>>>
>>> Changes in v2:
>>> - To avoid linker errors when amdgpu is builtin and video_detect.c is in
>>>   a module, select ACPI_VIDEO and its deps if ACPI && X86 are enabled.
>>>   When these are not set, ACPI_VIDEO is disabled, ensuring the stubs
>>>   from acpi/video.h will be used.
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Acked-by: Alex Deucher <alexander.deucher@amd.com>
> 
> Actually, can you use dev_info for the messages below rather than
> DRM_INFO?  That makes it easier to tell which GPU is affected in a
> multi-GPU system.  With that changed,
> Acked-by: Alex Deucher <alexander.deucher@amd.com>

Thank you for the ack. I've changed the DRM_INFO(...) calls with
drm_info(drm_dev, ...) calls for the version 3 of this series
which I'm preparing.

Regards,

Hans


> 
>>
>>> ---
>>>  drivers/gpu/drm/Kconfig                           | 6 ++++++
>>>  drivers/gpu/drm/amd/amdgpu/atombios_encoders.c    | 7 +++++++
>>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 +++++++
>>>  3 files changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>>> index aaa7ad1f0614..d65119860760 100644
>>> --- a/drivers/gpu/drm/Kconfig
>>> +++ b/drivers/gpu/drm/Kconfig
>>> @@ -258,6 +258,12 @@ config DRM_AMDGPU
>>>         select HWMON
>>>         select BACKLIGHT_CLASS_DEVICE
>>>         select INTERVAL_TREE
>>> +       # amdgpu depends on ACPI_VIDEO when X86 and ACPI are both enabled
>>> +       # for select to work, ACPI_VIDEO's dependencies must also be selected
>>> +       select INPUT if ACPI && X86
>>> +       select X86_PLATFORM_DEVICES if ACPI && X86
>>> +       select ACPI_WMI if ACPI && X86
>>> +       select ACPI_VIDEO if ACPI && X86
>>>         help
>>>           Choose this option if you have a recent AMD Radeon graphics card.
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
>>> index fa7421afb9a6..abf209e36fca 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
>>> @@ -26,6 +26,8 @@
>>>
>>>  #include <linux/pci.h>
>>>
>>> +#include <acpi/video.h>
>>> +
>>>  #include <drm/drm_crtc_helper.h>
>>>  #include <drm/amdgpu_drm.h>
>>>  #include "amdgpu.h"
>>> @@ -184,6 +186,11 @@ void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encode
>>>         if (!(adev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
>>>                 return;
>>>
>>> +       if (!acpi_video_backlight_use_native()) {
>>> +               DRM_INFO("Skipping amdgpu atom DIG backlight registration\n");
>>> +               return;
>>> +       }
>>> +
>>>         pdata = kmalloc(sizeof(struct amdgpu_backlight_privdata), GFP_KERNEL);
>>>         if (!pdata) {
>>>                 DRM_ERROR("Memory allocation failed\n");
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> index 5eb111d35793..3b03a95e59a8 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>> @@ -86,6 +86,8 @@
>>>  #include <drm/drm_audio_component.h>
>>>  #include <drm/drm_gem_atomic_helper.h>
>>>
>>> +#include <acpi/video.h>
>>> +
>>>  #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
>>>
>>>  #include "dcn/dcn_1_0_offset.h"
>>> @@ -4050,6 +4052,11 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
>>>         amdgpu_dm_update_backlight_caps(dm, dm->num_of_edps);
>>>         dm->brightness[dm->num_of_edps] = AMDGPU_MAX_BL_LEVEL;
>>>
>>> +       if (!acpi_video_backlight_use_native()) {
>>> +               DRM_INFO("Skipping amdgpu DM backlight registration\n");
>>> +               return;
>>> +       }
>>> +
>>>         props.max_brightness = AMDGPU_MAX_BL_LEVEL;
>>>         props.brightness = AMDGPU_MAX_BL_LEVEL;
>>>         props.type = BACKLIGHT_RAW;
>>> --
>>> 2.36.0
>>>
> 

