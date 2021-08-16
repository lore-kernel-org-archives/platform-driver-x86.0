Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5781CC4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 08:09:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 36EF361AFC
	for <platform-driver-x86@archiver.kernel.org>; Mon, 16 Aug 2021 08:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234594AbhHPIKJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 16 Aug 2021 04:10:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20252 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234572AbhHPIKJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Aug 2021 04:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629101377;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U3Mqsy1GHKuneyt6DRg4gzQIMwS0siPfZTWPenyoskM=;
        b=Vzu7+k4lUPrepYbiDhxHyxvnPNQhxhnuz6j5Ohd/eBi/L6QKqwz4RogXgVPH/lJBrL6KNO
        CQ3gcE41mnZ2Caa57my76yutknRY8zIA3Wmo2Bb2/QVAggqZN5qE2C1YYJjiGH8g56Rnux
        ZNeat+i2AeDfCXMwMffxeKFlEjWYrqM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-zAm1VWA4OkqUj1xO8dgyJA-1; Mon, 16 Aug 2021 04:09:36 -0400
X-MC-Unique: zAm1VWA4OkqUj1xO8dgyJA-1
Received: by mail-ed1-f72.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so8462743edu.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Aug 2021 01:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U3Mqsy1GHKuneyt6DRg4gzQIMwS0siPfZTWPenyoskM=;
        b=g/ZRL/jB+wqWuksRc0tbp6gSqF2i/YIYX7474Vqj33kXVVZPxhOtW6q/qfIzSC294Y
         wmPrXklC06sXiyHpMvxg2fn8YsfuVjsP7+SwuatilVn8dd+r4fyJeCYkuB6JQONLmXrk
         QtkdGmlOjYJmnRgHHPD37HTaWznmlix6mvOvSkcx/i8/iQx0h83IJeGWK/opA5vIUSGG
         7XmUnXkyi/rjBsIzyS3kE4voSdPSFjQSjlZR5ur8Vp6zLsUbrfZq7Edmwt1eYQGkxXM3
         bk5Y2qxKc2hajN1IRjvxOLjFcFQZRleQhsejg21X7sNQCDCmucwRLN4lb9enTOv1qLPc
         fVqw==
X-Gm-Message-State: AOAM530/5oKpausRtY/qHB5VUluVDtGmyaSXNDQnfRGmITSlP/7ffxw+
        oSHM/LnkaduvHj5zNebWxkcJBUbi9VWSIg9PF1I0tLRVQhtpOEbKl1qWgbvNaHnx3k0DEwyyMtw
        Cgy3GVDYBOmhqWNB0Vl7+yABlRduXh9LWWuDyDXTQmxZQuEOvuR8FdqxVIUsd4DYFH8CmDtuukJ
        IZEbhcQDL2JQ==
X-Received: by 2002:a17:907:9152:: with SMTP id l18mr14786266ejs.190.1629101375025;
        Mon, 16 Aug 2021 01:09:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCnJMoW0dCCmdt9W9cemZ1R/FKf2hJMNAv2uOfJxbHeXCpy370r7r26LpY3sYc4fYUaLzn8g==
X-Received: by 2002:a17:907:9152:: with SMTP id l18mr14786247ejs.190.1629101374810;
        Mon, 16 Aug 2021 01:09:34 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id j29sm2562664ejo.10.2021.08.16.01.09.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 01:09:34 -0700 (PDT)
Subject: Re: [PATCH v3 0/1] asus-wmi: add platform_profile support
To:     Luke Jones <luke@ljones.dev>
Cc:     linux-kernel@vger.kernel.org, hadess@hadess.net,
        platform-driver-x86@vger.kernel.org
References: <20210814043103.2535842-1-luke@ljones.dev>
 <THKTXQ.ELSNF0TA7RAV1@ljones.dev>
 <a918bfe0-03c4-e7d3-8a99-efb1d11333e4@redhat.com>
 <18LWXQ.AIB2DGCZUVMW@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2636766d-4f17-2a5d-92d4-73f7f2bb26a7@redhat.com>
Date:   Mon, 16 Aug 2021 10:09:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <18LWXQ.AIB2DGCZUVMW@ljones.dev>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/16/21 1:00 AM, Luke Jones wrote:
> 
> 
> On Sun, Aug 15 2021 at 15:48:49 +0200, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi,
>>
>> On 8/14/21 9:51 AM, Luke Jones wrote:
>>>
>>>
>>>  On Sat, Aug 14 2021 at 16:31:02 +1200, Luke D. Jones <luke@ljones.dev> wrote:
>>>>  Changelog:
>>>>  - V2
>>>>    + Correctly unregister from platform_profile if
>>>>      throttle_thermal_policy fails
>>>>    + Do platform_profile_notify() in both throttle_thermal_policy_store()
>>>>      and in throttle_thermal_policy_switch_next()
>>>>    + Remove unnecessary prep for possible fan-boost modes as this
>>>>      doesn't match expected platform_profile behaviour
>>>>  - V3
>>>>    + Add missing declaration for err in
>>>>      throttle_thermal_policy_switch_next
>>>>
>>>>  Luke D. Jones (1):
>>>>    asus-wmi: Add support for platform_profile
>>>>
>>>>   drivers/platform/x86/asus-wmi.c | 139 +++++++++++++++++++++++++++++++-
>>>>   1 file changed, 135 insertions(+), 4 deletions(-)
>>>>
>>>>  --
>>>>  2.31.1
>>>
>>>  Hi,
>>>
>>>  I teested the patch again and it appears that the platform_profile_notify() in both throttle_thermal_policy_store() and throttle_thermal_policy_switch_next() updates the /sys/firmware/acpi/platform_profile sysfs path fine, but userspace isn't updated?
>>>
>>>  The way I'm checking is:
>>>  1. echo 1 |sudo tee /sys/devices/platform/asus-nb-wmi/throttle_thermal_policy
>>>  2. cat -p /sys/firmware/acpi/platform_profile
>>>    - performance (updated correctly by platform_profile_notify)
>>>  3. Check gnome-settings, not updated.
>>>
>>>  Doing `echo "performance" |sudo tee /sys/firmware/acpi/platform_profile` updates both throttle_thermal_policy and userspace as expected. I'm wondering if I've missed something?
>>
>> If you add a printk where you call platform_profile_notify() and you see that
>> happening, then you are likely seeing a userspace bug. Possibly your
>> power-profile-daemon is simply a bit old and therefor does not support
>> the combination of profiles which asus-wmi offers, IIRC it falls back to
>> using intel-pstate in that case.
> 
> It's possible that it's a userspace bug then. The power-profile-daemon I'm using is fresh from git (0.9+). To be clear updating via /sys/firmware/acpi/platform_profile works perfectly fine and power-profile-daemon updates etc. But if I do platform_profile_notify() then it doesn't seem to be updated. Nevertheless I will finalise the patch as it is and submit for merging and we can go from there.

This is weird, I wonder if there is a difference in glib versions used, where one does
include polling for POLLPRI on sysfs files in GFileMonitor and the other only uses
inotify which only catches changes from another userspace write ?

Regards,

Hans

