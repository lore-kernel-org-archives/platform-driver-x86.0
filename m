Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2ECECAAD5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  9 Sep 2022 17:25:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229989AbiIIRZm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 9 Sep 2022 13:25:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230500AbiIIRZk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Sep 2022 13:25:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E63BA7170D
        for <platform-driver-x86@vger.kernel.org>; Fri,  9 Sep 2022 10:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662744337;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/68DLX4ZB0BCPq/lxr4I9uNyopsJZrj50uBAQRwrOg4=;
        b=UAyt3eAgkp0QcaQfU35IWSLHFW6OocrFE0uBxAh8WYavS7vqE+xkzpvPKhFWNv55geATPF
        acOjl8ShBotJZx38ZbjUAKqtR86fUefvTcdHLbnLOc9HbWP7m8mm879ptxcJZdnhQApjib
        JY0owgltFIiFXpBJ66ws41NnaU1kuNM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-649-19-iujEFNtm0rccP6CB6qg-1; Fri, 09 Sep 2022 13:25:35 -0400
X-MC-Unique: 19-iujEFNtm0rccP6CB6qg-1
Received: by mail-ed1-f70.google.com with SMTP id i17-20020a05640242d100b0044f18a5379aso1751017edc.21
        for <platform-driver-x86@vger.kernel.org>; Fri, 09 Sep 2022 10:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=/68DLX4ZB0BCPq/lxr4I9uNyopsJZrj50uBAQRwrOg4=;
        b=C0LjZQB2qEFZ9FeJwATHQGmx6nKQgZdjDObjpRzb52e9TLJ5b7NPBZ81lBQABQtO9w
         SgRW0McN0z7AGwlus//HB+jBkzXu36ArIBVXLfkgQkbJh9joebBYkGxpzdzrp3SCEBvc
         ZgsmxhAoiqUSxK+oLl7pwvsf4h+UCB0vSLH0bIgFbmIpDTbE66Ze8qgShoLDb6qlu7+m
         mKcb09uLwIhxN9O1Mt9+w6wYCrI5t9ksOejjgbFMZ4A+jidJ4xB3mZIXLtPDX5GmxGbg
         7UR8HllOroG/MIaDQa+X4T00D+3Pc42Gaz4hFfIcQtndF8XY2lR33asKUpRENmHXFpqa
         qkEQ==
X-Gm-Message-State: ACgBeo0ZCQCD9Juo4LvCNH4QV+Jx3bvaeXVUUBviZaZ/XO9LJ0S8JagD
        u17G6Cvntr2tloKSBFQRHu1IGQ7r/sUG44D7k/pU9WAeBPt5lnHMDtn+gCoYsMNpmzx8XjOPpBa
        s8zPLuGcNVOkRa3bIvrTwz/Utu/NgjYfKRA==
X-Received: by 2002:a17:907:6e27:b0:77a:206e:4dbb with SMTP id sd39-20020a1709076e2700b0077a206e4dbbmr2146712ejc.435.1662744334730;
        Fri, 09 Sep 2022 10:25:34 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5od2I685u9Ty01Bf2WgchJdOnaNg2jSvHrss2tloVWS2k9NbiII5b9GExKsES4UiKLi7YvEQ==
X-Received: by 2002:a17:907:6e27:b0:77a:206e:4dbb with SMTP id sd39-20020a1709076e2700b0077a206e4dbbmr2146701ejc.435.1662744334464;
        Fri, 09 Sep 2022 10:25:34 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id u9-20020a50c2c9000000b0043cc2c9f5adsm736187edf.40.2022.09.09.10.25.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 10:25:33 -0700 (PDT)
Message-ID: <8c4a6b8e-cef0-6a68-eb3d-c2fe10225e6b@redhat.com>
Date:   Fri, 9 Sep 2022 19:25:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/3] platform/x86: Battery charge mode in toshiba_acpi
Content-Language: en-US
To:     Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     Sebastian Reichel <sre@kernel.org>,
        Azael Avalos <coproscefalo@gmail.com>
References: <20220902180037.1728546-1-lkml@vorpal.se>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220902180037.1728546-1-lkml@vorpal.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/2/22 20:00, Arvid Norlander wrote:
> Hi,
> 
> Here we go again.
> 
> Note that this patch series edits in the same place as my patch series
> adding HWMON support for the fan, so there will be a trivial merge
> conflict, as both series insert new functions in the same location in the
> file. Hopefully this is not a big issue, but if so I can rebase one on top
> of the other.
> 
> Changelog
> =========
> v2:
>   * Fix compiler warning discovered by "kernel test robot" in patch 2
>     (real issue).
>   * Added Acked-by in patch 3 (Thanks Sebastian Reichel).
> 
> 
> Mostly original (from v1 of this series) cover letter follows:
> 
> Summary
> =======
> 
> This patch series implements battery charge control for Toshiba Satellite
> Z830 (and posssibly some other models). The full background is available
> in the two emails linked below, but a short summary will follow, including
> only what is relevant for battery charge control.
> 
> Background (from link 1)
> ==========
> 
> The Toshiba Satellite/Portege Z830 supports not charging the battery fully
> in order to prolong battery life. Unlike for example ThinkPads where this
> control is granular here it is just off/on. When off it charges to 100%.
> When on it charges to about 80%.
> 
> According to the Windows program used to control the feature the setting
> will not take effect until the battery has been discharged to around 50%.
> However, in my testing it takes effect as soon as the charge drops below
> 80%. On Windows Toshiba branded this feature as "Eco charging"
> 
> In the following example ACPI calls I will use the following newly defined
> constants:
> #define HCI_BATTERY_CHARGE_MODE 0xba
> #define BATTERY_CHARGE_FULL 0
> #define BATTERY_CHARGE_80_PERCENT 1
> 
> To set the feature:
>   {HCI_SET, HCI_BATTERY_CHARGE_MODE, charge_mode, 0, 0, 0}
> To query for the existence of the feature:
>   {HCI_GET, HCI_BATTERY_CHARGE_MODE, 0, 0, 0, 0}
> To read the feature:
>   {HCI_GET, HCI_BATTERY_CHARGE_MODE, 0, 0, 0, 1}
> 
> The read may need to be retried if TOS_DATA_NOT_AVAILABLE is returned as
> the status code. This rarely happens (I have never observed it on Linux),
> but I have seen it happen under Windows once, and the software did retry
> it.
> 
> 
> Improvements
> ============
> 
> As discussed in link 2 & 3 below, the original approach was suboptimal.
> 
> This patch series instead consists of two patches.
> 
> The first patch implements detecting the feature as well as internal
> getter/setter methods.
> 
> The second patch adds battery hooks (heavily based on the code for this in
> thinkpad_acpi) which creates the standard charge_control_end_threshold file
> under /sys/class/power_supply/BAT1.
> 
> Side note: There is no BAT0 on this Toshiba, I'm not sure why the numbering
> ends up starting from 1 instead of 0 here. This differs from my Thinkpads,
> where the numbering starts from 0, with BAT1 being the second battery.
> However, I haven't spent much effort investigating this, as it did not seem
> important.
> 
> Patch 3 updates the ABI test documentation as suggested by Hans de Goede.
> Note that only the charge_control_end_threshold is updated, as this is the
> only limit supported by the Toshiba Z830. Possibly
> charge_control_start_threshold should also be updated similarly, or would
> it be better to wait for an actual example of this in the wild first?
> 
> Link (1): https://www.spinics.net/lists/platform-driver-x86/msg34314.html
> Link (2): https://www.spinics.net/lists/platform-driver-x86/msg34354.html
> Link (3): https://www.spinics.net/lists/platform-driver-x86/msg34320.html
> 
> Best regards,
> Arvid Norlander
> 
> 
> Arvid Norlander (3):
>   platform/x86: Battery charge mode in toshiba_acpi (internals)
>   platform/x86: Battery charge mode in toshiba_acpi (sysfs)
>   docs: ABI: charge_control_end_threshold may not support all values
> 
>  Documentation/ABI/testing/sysfs-class-power |   5 +-
>  drivers/platform/x86/toshiba_acpi.c         | 166 ++++++++++++++++++++
>  2 files changed, 170 insertions(+), 1 deletion(-)

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



