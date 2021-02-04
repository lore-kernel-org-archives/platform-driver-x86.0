Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAE4C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 09:25:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64CCC64F47
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Feb 2021 09:25:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234600AbhBDJYs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Feb 2021 04:24:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24874 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234763AbhBDJYm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Feb 2021 04:24:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612430594;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0yqwd/vtMmXP36ASOQHNZcm9I69XP2GTJ1HQsj7YQLQ=;
        b=LL96U3lMFkuBsNJ2sQ6vCVjpgEEac6h7n25QahSbSnoR4J4Id8ny1l2Fnj9ZGYwBZTylG1
        durjHNr0um0RzWCwli9dfbe6spvhZHu4vi+9oa/pYfwQeyUuXdkf0WSY+OpEOzwS2y/KTx
        mNmNdpvFJ6Q0en8Yst4O2rsbosElK80=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-7JXW5f7wMS69PUyM7gEYxQ-1; Thu, 04 Feb 2021 04:23:12 -0500
X-MC-Unique: 7JXW5f7wMS69PUyM7gEYxQ-1
Received: by mail-ej1-f71.google.com with SMTP id n25so2221196ejd.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Feb 2021 01:23:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0yqwd/vtMmXP36ASOQHNZcm9I69XP2GTJ1HQsj7YQLQ=;
        b=GWFzr7gQXTKDNkdU8If5cM9IBFJdspIEWoNA9uqxkgJ+35jnqPE3FjH/PDvfgQU18T
         SwmFS5vh1qMlZBoyBiA6xj14GHMku3UqU3rrTwJjuO+GszUiobGPIeNf7crNRSbG/zmX
         unorMspyhCVlvGJcW5zN2UH/fLl70KIzvzgBcbyc5RyfCEz6mvx0GSEA7rIAocBPtUB3
         BF/oxtEsiw0UYYbgH8SiWyEu8f9F5cZpn8Io9wMeWepYc67D2bTYoZOGINsoiFploO6W
         NZ0i/1YmLmgvC7yDVVQyuM5DsgDf78whMrcac27AOIRoqER0be6+QQ+/qzBDB9whBeEM
         Xnsw==
X-Gm-Message-State: AOAM531t/JjBfAyX8euMJn12xVH4NxjOyAtdxLoOcYUk7KgUUIYySHeL
        nIRcS3kECQqfKdNhOo7iOfw1hhTBSzd0AcbzQDWzeADqSq4L8jgVXeT2HKFjljDJlW6vtBwc9zY
        +Nf9NuYNSGYKUpLn5NQ/0uMa7OzqbTv7jQQ==
X-Received: by 2002:a17:906:ada:: with SMTP id z26mr7017987ejf.218.1612430591106;
        Thu, 04 Feb 2021 01:23:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzUZsxsqH70NeSAESAOYKsbGFnAwWtyZ1nwiVR/+tjsfXod6DsH6t31FY7BidGi9xBVgS0aw==
X-Received: by 2002:a17:906:ada:: with SMTP id z26mr7017977ejf.218.1612430590938;
        Thu, 04 Feb 2021 01:23:10 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id u18sm2201629ejc.76.2021.02.04.01.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Feb 2021 01:23:10 -0800 (PST)
Subject: Re: [PATCH v3 00/29] platform/x86: ideapad-laptop: cleanup, keyboard
 backlight and "always on USB charging" control support, reenable touchpad
 control
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20210203215403.290792-1-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <83bd11d4-9bda-4a74-4fb1-1da1be2872de@redhat.com>
Date:   Thu, 4 Feb 2021 10:23:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210203215403.290792-1-pobrn@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/3/21 10:54 PM, Barnabás Pőcze wrote:
> Changes in v3:
>  -      rebase on eabe533904cbcb6c7df530fd807cf2a3c3567d35
>         ("platform/x86: ideapad-laptop: DYTC Platform profile support"),
>         which is referred to as "DYTC patch" in this changelog
>  - {02} *new patch*
>  - {03} minor formatting changes
>  - {05} *new patch*
>  - {07} *new patch*
>  - {08} *new patch*
>  - {09} minor formatting change
>  - {10} use while loop
>  - {11} restore log message severity
>  - {12} *new patch*
>  - {13} reorder variable definitions,
>         apply to DYTC patch
>  - {14} mention ABI breakage
>  - {15} mention ABI breakage,
>         use `!!` to convert to `int` and "%d" in sysfs_emit(),
>         convert 'camera_power' attribute to boolean-like
>  - {17} reorder varible definitions,
>         apply to DYTC patch
>  - {18} minor formatting changes,
>         add log messages
>  - {19} minor formatting change
>  - {20} move `&&` to end of line
>  - {21} no longer return -ENODATA due to {02},
>         explicit alignment instead of tabs in output
>  - {22} no longer return -ENODATA due to {02}
>  - {24} reorder device attribute callbacks,
>         remove some empty lines,
>         apply to DYTC patch
>  - {26} use `!!` to map to range [0, 1],
>         add log messages
>  - {27} move documentation change to this patch
>  - {28} add "Fixes" tag
>  - {29} add "Fixes" tag
> 
> I hope I addressed all concerns adequately, if not, do not hesistate to remind me.

Thank you for your patch-series, I've applied the series to my
review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Question, given all the work you have done have you considered adding yourself
to the MAINTAINERS file as a co-maintainer or reviewer of the ideapad-laptop code ?

I certainly would welcome a co-maintainers / reviewer for this.


Note this will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



>  
> History:
>  - v2: https://lore.kernel.org/platform-driver-x86/20210113182016.166049-1-pobrn@protonmail.com/
>  - v1: https://lore.kernel.org/platform-driver-x86/20201216013857.360987-1-pobrn@protonmail.com/
> 
> Barnabás Pőcze (29):
>   platform/x86: ideapad-laptop: remove unnecessary dev_set_drvdata()
>     call
>   platform/x86: ideapad-laptop: remove unnecessary NULL checks
>   platform/x86: ideapad-laptop: use appropriately typed variable to
>     store the return value of ACPI methods
>   platform/x86: ideapad-laptop: sort includes lexicographically
>   platform/x86: ideapad-laptop: add missing call to submodule destructor
>   platform/x86: ideapad-laptop: use sysfs_emit()
>   platform/x86: ideapad-laptop: use device_{add,remove}_group
>   platform/x86: ideapad-laptop: use kobj_to_dev()
>   platform/x86: ideapad-laptop: use for_each_set_bit() helper to
>     simplify event processing
>   platform/x86: ideapad-laptop: use msecs_to_jiffies() helper instead of
>     hand-crafted formula
>   platform/x86: ideapad-laptop: use dev_{err,warn} or appropriate
>     variant to display log messages
>   platform/x86: ideapad-laptop: check return value of
>     debugfs_create_dir() for errors
>   platform/x86: ideapad-laptop: convert ACPI helpers to return -EIO in
>     case of failure
>   platform/x86: ideapad-laptop: always propagate error codes from device
>     attributes' show() callback
>   platform/x86: ideapad-laptop: misc. device attribute changes
>   platform/x86: ideapad-laptop: group and separate (un)related constants
>     into enums
>   platform/x86: ideapad-laptop: rework and create new ACPI helpers
>   platform/x86: ideapad-laptop: rework is_visible() logic
>   platform/x86: ideapad-laptop: check for Fn-lock support in HALS
>   platform/x86: ideapad-laptop: check for touchpad support in _CFG
>   platform/x86: ideapad-laptop: change 'status' debugfs file format
>   platform/x86: ideapad-laptop: change 'cfg' debugfs file format
>   Revert "platform/x86: ideapad-laptop: Switch touchpad attribute to be
>     RO"
>   platform/x86: ideapad-laptop: fix checkpatch warnings, more consistent
>     style
>   platform/x86: ideapad-laptop: send notification about touchpad state
>     change to sysfs
>   platform/x86: ideapad-laptop: add keyboard backlight control support
>   platform/x86: ideapad-laptop: add "always on USB charging" control
>     support
>   Documentation/ABI: sysfs-platform-ideapad-laptop: update device
>     attribute paths
>   Documentation/ABI: sysfs-platform-ideapad-laptop: conservation_mode
>     attribute
> 
>  .../ABI/testing/sysfs-platform-ideapad-laptop |   26 +-
>  drivers/platform/x86/ideapad-laptop.c         | 1284 ++++++++++-------
>  2 files changed, 810 insertions(+), 500 deletions(-)
> 

