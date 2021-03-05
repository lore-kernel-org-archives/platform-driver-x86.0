Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A6C4C433E0
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Mar 2021 12:04:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F17964FED
	for <platform-driver-x86@archiver.kernel.org>; Fri,  5 Mar 2021 12:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbhCEMEA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 5 Mar 2021 07:04:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30940 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229821AbhCEMDz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Mar 2021 07:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614945834;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5KcyyYXzSqf69qVhnkK2ANTlfmtlCV/ZTK/kma3sC60=;
        b=JuBZhn4gUgve6ph0j5Smyu1ABNLymo+obHOmfaUpREWXjKItxEqzOej8cEcNu0D0psucV3
        kHGKLW+4Owtnj6tIr1oi/kwsBwXjPfDb2BOk7PbTRD9beQc521O7J1ItjXfyj5Fp3F6u0O
        QbwSTL9mOAHVQo7z5rLpbPyPg0iUhU8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-jFf61QAnMLi_u5fUEz0AmQ-1; Fri, 05 Mar 2021 07:03:53 -0500
X-MC-Unique: jFf61QAnMLi_u5fUEz0AmQ-1
Received: by mail-ed1-f69.google.com with SMTP id i4so819686edt.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Mar 2021 04:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=5KcyyYXzSqf69qVhnkK2ANTlfmtlCV/ZTK/kma3sC60=;
        b=g4j85dvfxCzArNoZ7P6lwjqzkhrfSdTz6yZpAd4vvN5OHdLpPMBuB4uSsD1uknMN90
         Y6/9a5rIe8bEPInv7fSrPhjxI6NIXbTdJkXLWnqRRvSQt98yrAIUPaNfRGzvs84hn4AO
         Nl3P+TQqVYE9JKynepmPUWqsZPcVFWEe9ws5Vr02kjKeNyQJgKZkLiqCyYGJ/Lj3rO07
         a/4Ltb033kgnBpQV3lZLUGR3koyjcdQ/S2+L8Ssj22Hr1pd7/rmc4kDywOtCDSVv5XuE
         8ivjojW/ZaP4fFTVuzDK+2nuRhjJjPBbde76HwRTkPCTJ5ACQUVjRWtjsUYOrozleh3A
         36ZQ==
X-Gm-Message-State: AOAM5327lUJwkDMoMH1yeqO/2KQHdqq37zky8Vd0o8aagPek7rh7r2XR
        JijFj/B7u+MmghNIcH3+L1/6FJpQyaVxXjsUdA2QaNIg94JQ/qIaRQ5vVon3nR89FUudng7PJAI
        sUu5eCTwRfowJA3/y5ZdXV3MO3exBmXP6A8aNjY43a2jh8pQLKn+QE+RZRX5AZKPGEWR7RdQdVI
        8kPxa6igB/Bg==
X-Received: by 2002:a17:906:489:: with SMTP id f9mr1889029eja.428.1614945831209;
        Fri, 05 Mar 2021 04:03:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz/Ro5roe6a5UaSsDcs8T2FiDVgqBOPtO8suOdLY7P//p0HV6PBd64+/Z7XZ0QwGmM5IaqW9g==
X-Received: by 2002:a17:906:489:: with SMTP id f9mr1888989eja.428.1614945830824;
        Fri, 05 Mar 2021 04:03:50 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bw22sm1386067ejb.78.2021.03.05.04.03.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 04:03:50 -0800 (PST)
Subject: Re: [PATCH] WMI: asus: Reduce G14 and G15 match to min product name
To:     Luke Jones <luke@ljones.dev>
Cc:     platform-driver-x86@vger.kernel.org
References: <20210227102010.65429-1-luke@ljones.dev>
 <94e01965-1511-c687-1c20-fe1f01041ac3@redhat.com>
 <GNOHPQ.KYXM8SR2TF8L@ljones.dev>
 <6bb6843e-f166-a1cc-f1ac-419a46c71622@redhat.com>
 <XXSHPQ.3IV4A1VDG7UR1@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <043998b9-53fa-766e-74e3-e149c0b5d978@redhat.com>
Date:   Fri, 5 Mar 2021 13:03:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <XXSHPQ.3IV4A1VDG7UR1@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/5/21 11:53 AM, Luke Jones wrote:
> First report:

Thank you.

> G14 / 2020 - integrated graphics only (NVIDIA disabled)
> 
> # cat /proc/cmdline
> BOOT_IMAGE=(hd0,gpt2)/vmlinuz-5.10.19-200.fc33.x86_64 root=UUID=c3fe67fb-a740-440b-bc2d-e7cfc9f19a42 ro rootflags=subvol=@ rd.luks.uuid=luks-cf5c7a8a-d5da-45ae-b556-db9c78b359e5 rhgb quiet rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 acpi_backlight=video
> 
> 1. # ls /sys/class/backlight
> acpi_video0 amdgpu_bl0
> 
> 2. acpi_video0 max_brightness 49, brightness is changing
> amdgpu_bl0 max_brightness 255, brightness is changing
> Both equal bright at max value
> 
> # cat /proc/cmdline
> BOOT_IMAGE=(hd0,gpt2)/vmlinuz-5.10.19-200.fc33.x86_64 root=UUID=c3fe67fb-a740-440b-bc2d-e7cfc9f19a42 ro rootflags=subvol=@ rd.luks.uuid=luks-cf5c7a8a-d5da-45ae-b556-db9c78b359e5 rhgb quiet rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 acpi_backlight=native
> 
> 3. # ls /sys/class/backlight
> amdgpu_bl0
> 
> 4. amdgpu_bl0 max_brightness 255, brightness is changing
> 
> # cat /proc/cmdline
> BOOT_IMAGE=(hd0,gpt2)/vmlinuz-5.10.19-200.fc33.x86_64 root=UUID=c3fe67fb-a740-440b-bc2d-e7cfc9f19a42 ro rootflags=subvol=@ rd.luks.uuid=luks-cf5c7a8a-d5da-45ae-b556-db9c78b359e5 rhgb quiet rd.driver.blacklist=nouveau modprobe.blacklist=nouveau nvidia-drm.modeset=1 acpi_backlight=vendor
> 
> 5. # ls /sys/class/backlight
> amdgpu_bl0
> 
> 6. amdgpu_bl0 max_brightness 255, brightness is changing

Ok, so basically in all cases we have working backlight control
and with "native", which is the default without quirks we get only
1 interface (so no userspace confusion possible) and that interface
has a better range then the acpi_video0 one which gets enabled
by the acpi_backlight=video option.

Also interesting here is that acpi_backlight=vendor is actually
not resulting in a "asus-nb-wmi" dir showing up under /sys/class/backlight
as it should. Which means that the Asus WMI interface on this model
does not support backlight control through the WMI interface at all.

Which matches my initial reaction of finding it very strange that
a vendor specific interface would be used for this in 2020/2021.

What I think is happening here is that depending on the BIOS setting
for which GPU to use, there might not be any native backlight interface
at all. IOW if that BIOS setting is set to nvidia only then
/sys/class/backlight/amdgpu_bl0 goes away and when nouveau is not
used /blacklisted it will not be replaced by a /sys/class/backlight/nouveau...
native interface.

The kernel-code which deals with selecting which backlight interface(s)
to register then notices there is no native backlight driver and thus
will allow the acpi_video0 interface to register; and I guess that
that interface is not working when the BIOS setting is set to only
use (or prefer) the nvidia GPU.

And I guess this showing up of the non-working
/sys/class/backlight/acpi_video0 interface is causing userspace
to prefer that over whatever mechanism the nvidia binary driver
is using to allow control over the backlight.

So, the quirks which have been added so far, which do the
equivalent of passing acpi_backlight=vendor on the cmdline are
not enabling the "vendor" (Asus) backlight interface at all,
instead all they are doing is disabling the auto backlight selection
code in the kernel which, without the quirk, automatically behaves
as if acpi_backlight=video is specified when no native backlight
interfaces are registered.

I think a couple of users first need to run some more tests to
confirm all this (with the nvidia GPU enabled and while using
the nvidia binary driver).

Then once we have this confirmed, the proper fix is to add
a quirk (with the generic model matching from your patch)
to set acpi_backlight=native by calling the
video_detect_force_native() callback from the DMI entries
in the video_detect_dmi_table[] in drivers/acpi/video_detect.c

The entries for this should be added at the end of the list
of models already using the video_detect_force_native() callback,
so around line 387, just before this comment block:

        /*
         * Desktops which falsely report a backlight and which our heuristics
         * for this do not catch.
         */

And then once that change has landed upstream, the existing
quirks for this can be dropped from the asus-nb-wmi.c code.

But first we need more testing / logs to confirm my theory here.

> 5.10 kernel includes the quirk patches. Were you wanting data
> with that patch removed completely? (not just the submitted one)

No that is not necessary, the quirk does the equivalent of passing
acpi_backlight=vendor and the kernel-commandline setting
trumps (overrides) the DMI quirk.

> From what you've said, I think I expected acpi_backlight=video to
> work regardless of the patch being applied.

Correct.

Regards,

Hans



> On Fri, Mar 5, 2021 at 10:36, Hans de Goede <hdegoede@redhat.com> wrote:
>> <note adding the pdx86 list back to the Cc>
>>
>> Hi Luke,
>>
>> On 3/5/21 10:21 AM, Luke Jones wrote:
>>>  Hello Hans,
>>>
>>>  Many thanks for taking the time to review this and provide some
>>>  knowledge.
>>>
>>>  Most of what has come about in this patch is through direct user
>>>  with a fairly large community I maintain on Discord centered
>>>  around a utility I wrote to make ROG laptop users lives a bit
>>>  better - https://gitlab.com/asus-linux. The community has been
>>>  beneficial to getting some realtime testing done, shortening
>>>  time.
>>>
>>>  In the case of the 2021 Ryzen laptops I'm pleased you asked
>>>  questions. I asked the single G15 laptop owner we have to
>>>  check functionality and yes, we don't need that code.
>>>  It appears there were some crossed wires in conversations.
>>>
>>>  I will amend the patch keeping the glob style got 2020 G14
>>>  and G15 as we do have concrete anecdotal evidence that all
>>>  *those* models, and some un-added ones need the quirk.
>>
>> If possible I would like to see some more research done on
>> those 2020 models too.
>>
>> Specifically it would be good to get the following info:
>>
>> 1. Output of "ls /sys/class/backlight" with "acpi_backlight=video"
>> on the kernel commandline.
>>
>> 2. Testing of *all* the present backlight devices with "acpi_backlight=video"
>> on the kernel commandline. The user can test this by doing:
>>
>> cd /sys/class/backlight/$backlight-name
>> cat max_brightness
>> echo $value-between-0-and-max_brightness > brightness
>> echo $another-value-between-0-and-max_brightness > brightness
>> etc.
>>
>> And then see if the brightness of the screen actually changes.
>>
>> 3. Output of "ls /sys/class/backlight" with "acpi_backlight=native"
>> on the kernel commandline.
>>
>> 4. Testing of *all* the present backlight devices with "acpi_backlight=native"
>> on the kernel commandline (see 2.)
>>
>> 5. Output of "ls /sys/class/backlight" with "acpi_backlight=vendor"
>> on the kernel commandline.
>>
>> 6. Testing of *all* the present backlight devices with "acpi_backlight=vendor"
>> on the kernel commandline (see 2.)
>>
>>
>> My hope/expectation is that acpi_backlight=video will also work,
>> because as said using acpi_backlight=vendor is somewhat weird for
>> 2020 / 2021 laptop models.  Also typically the acpi-video backlight
>> interface will have a larger max_brightness giving finer grained
>> (more steps) brightness control.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>>  On Thu, Mar 4, 2021 at 15:35, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>  Hi,
>>>>
>>>>  On 2/27/21 11:20 AM, Luke D Jones wrote:
>>>>>   This patch reduces the product match for GA401 series laptops to
>>>>>   the minimum string required.
>>>>>
>>>>>   The GA401 series of laptops has a lengthy list of product
>>>>>   variations in the 2020 series and the 2021 series refresh
>>>>>   is using the same base product ID of GA401.
>>>>>
>>>>>   The same is also true for the GA502 series, and the new GA503
>>>>>   series which is added in this patch as a variant of the G15.
>>>>
>>>>  Thank you for your patch.
>>>>
>>>>  I msut say that I find it very strange that 2021 series laptops need
>>>>  to use the Asus vendor specific WMI interface for backlight control.
>>>>
>>>>  I see that the GA401 GA502 and GA503 models are all models with
>>>>  AMD 4000/5000 series CPUs + Nvidia 2060 series GPUs.
>>>>  So I guess it may be possible that this is the right thing
>>>>  to do, and I do realize that we are already doing this for the
>>>>  listed models. But it seems weird.
>>>>
>>>>  Modern laptops almost always use the native backlight control
>>>>  build into the drm/kms driver. And in some special cases
>>>>  (hybrid GPU setups) they might use the good old ACPI-video
>>>>  interface. But using vendor specific interfaces sounds very
>>>>  wrong to me. That is something which was typically done on
>>>>  pre Windows XP era hardware.
>>>>
>>>>  Have you tried passing acpi_backlight=video on the kernel commandline?
>>>>
>>>>  What is the output of ls /sys/class/backlight before and after this
>>>>  patch?
>>>>
>>>>  What is the output of ls /sys/class/backlight when using
>>>>  acpi_backlight=video on the kernel commandline?
>>>>
>>>>  If the ls output shows multiple interfaces have you tried using all
>>>>  listed interfaces directly from sysfs / the commandline ?
>>>>
>>>>  (perhaps userspace is picking the wrong interface in the case there
>>>>  are multiple interfaces?)
>>>>
>>>>  Note what you are doing now is the equivalent of passing
>>>>  acpi_backlight=vendor, which again is a weird thing to do on
>>>>  recent / new hardware.
>>>>
>>>>  Also your commit message seems to lack a lot of details like:
>>>>
>>>>  1. Do you own an effected or multiple affected models yourself on
>>>>  which you tested this?
>>>>
>>>>  2. Was this tested by others on other models of these series?
>>>>
>>>>  3. I assume this was discussed with others in some mailinglist /
>>>>  forum discussion please provide links to this discussion.
>>>>
>>>>  4. Has this been tested with with both the nouveau and the
>>>>  nvidia binary driver or only with the nvidia binary driver ?
>>>>
>>>>  5. What were the symptoms / problems noticed before making this change
>>>>  and how do things work after making the change?
>>>>
>>>>  Regards,
>>>>
>>>>  Hans
>>>>
>>>>
>>>>
>>>>
>>>>
>>>>>
>>>>>   Signed-off-by: Luke D Jones <luke@ljones.dev>
>>>>>   ---
>>>>>    drivers/platform/x86/asus-nb-wmi.c | 57 ++++--------------------------
>>>>>    1 file changed, 6 insertions(+), 51 deletions(-)
>>>>>
>>>>>   diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>>>>>   index d41d7ad14be0..f4db67c3eba2 100644
>>>>>   --- a/drivers/platform/x86/asus-nb-wmi.c
>>>>>   +++ b/drivers/platform/x86/asus-nb-wmi.c
>>>>>   @@ -427,73 +427,28 @@ static const struct dmi_system_id asus_quirks[] = {
>>>>>        },
>>>>>        {
>>>>>            .callback = dmi_matched,
>>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA401IH",
>>>>>   +        .ident = "ASUSTeK COMPUTER INC. GA401",
>>>>>            .matches = {
>>>>>                DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IH"),
>>>>>   +            DMI_MATCH(DMI_PRODUCT_NAME, "GA401"),
>>>>>            },
>>>>>            .driver_data = &quirk_asus_vendor_backlight,
>>>>>        },
>>>>>        {
>>>>>            .callback = dmi_matched,
>>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA401II",
>>>>>   +        .ident = "ASUSTeK COMPUTER INC. GA502",
>>>>>            .matches = {
>>>>>                DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401II"),
>>>>>   +            DMI_MATCH(DMI_PRODUCT_NAME, "GA502"),
>>>>>            },
>>>>>            .driver_data = &quirk_asus_vendor_backlight,
>>>>>        },
>>>>>        {
>>>>>            .callback = dmi_matched,
>>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA401IU",
>>>>>   +        .ident = "ASUSTeK COMPUTER INC. GA503",
>>>>>            .matches = {
>>>>>                DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IU"),
>>>>>   -        },
>>>>>   -        .driver_data = &quirk_asus_vendor_backlight,
>>>>>   -    },
>>>>>   -    {
>>>>>   -        .callback = dmi_matched,
>>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA401IV",
>>>>>   -        .matches = {
>>>>>   -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IV"),
>>>>>   -        },
>>>>>   -        .driver_data = &quirk_asus_vendor_backlight,
>>>>>   -    },
>>>>>   -    {
>>>>>   -        .callback = dmi_matched,
>>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA401IVC",
>>>>>   -        .matches = {
>>>>>   -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA401IVC"),
>>>>>   -        },
>>>>>   -        .driver_data = &quirk_asus_vendor_backlight,
>>>>>   -    },
>>>>>   -        {
>>>>>   -        .callback = dmi_matched,
>>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA502II",
>>>>>   -        .matches = {
>>>>>   -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA502II"),
>>>>>   -        },
>>>>>   -        .driver_data = &quirk_asus_vendor_backlight,
>>>>>   -    },
>>>>>   -    {
>>>>>   -        .callback = dmi_matched,
>>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA502IU",
>>>>>   -        .matches = {
>>>>>   -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA502IU"),
>>>>>   -        },
>>>>>   -        .driver_data = &quirk_asus_vendor_backlight,
>>>>>   -    },
>>>>>   -    {
>>>>>   -        .callback = dmi_matched,
>>>>>   -        .ident = "ASUSTeK COMPUTER INC. GA502IV",
>>>>>   -        .matches = {
>>>>>   -            DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>>>>>   -            DMI_MATCH(DMI_PRODUCT_NAME, "GA502IV"),
>>>>>   +            DMI_MATCH(DMI_PRODUCT_NAME, "GA503"),
>>>>>            },
>>>>>            .driver_data = &quirk_asus_vendor_backlight,
>>>>>        },
>>>>>
>>>>
>>>
>>>
>>
> 
> 

