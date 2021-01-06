Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20DC0C433E0
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 18:24:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6E2D23132
	for <platform-driver-x86@archiver.kernel.org>; Wed,  6 Jan 2021 18:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbhAFSYx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 6 Jan 2021 13:24:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41340 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725789AbhAFSYx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jan 2021 13:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609957406;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q+MismQCTmpHoskHpxv9tbcXSVwFIkJmOD6D++ZoRxs=;
        b=KHwBtqIxoqUaLKIBgCo+tfZjrIKHJc8zcChUNKYAJJguqkG4mFgQqSJ6rfdGTJ4lQhPMF9
        t2yrq7PesAP7887oQt7TF5H0zr2m+5/wftJvuq7EV9DSIWRENJnoPYUDfF31lT1TmbJkew
        i1UjuW98fbqj4mcb/ihtJarjrkqq/4E=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-YWrAthafPnOQYPgdPDEWxA-1; Wed, 06 Jan 2021 13:23:24 -0500
X-MC-Unique: YWrAthafPnOQYPgdPDEWxA-1
Received: by mail-ej1-f72.google.com with SMTP id m4so1615725ejc.14
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 Jan 2021 10:23:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q+MismQCTmpHoskHpxv9tbcXSVwFIkJmOD6D++ZoRxs=;
        b=RM8GtpWj4lsM9kzsD6skrHNSj+lz1jD3es9ZSVLxIMjsaIagm9wcok2SigtvCgxgty
         RZgD2HNpuLfq0LkttZN+ZUaHvH0aoVkDVJ2tGlJX996T78Ew/ITSq+PZ9NAtqLB6tQVs
         rj6PU+7oMXhtUzMSsgsBpcc8ky8L8mGkPivYyHqgqVU2VuaSoivzM6j8i8VjpSpQ6k2Q
         YnBpSK3kpe3sdO5e3KDjn5lSjXnNAFz+Hlkj4ilkD3xEM7hpw3iqYpMwqeFCvn0oy3Gu
         LVKVSN+5MND2U/9An/hrqFatfrA8VHXRQMSAXdZbrruPKwYyqABsBh0Cp6ijhH/ZFUl3
         53SQ==
X-Gm-Message-State: AOAM531XCeA4s4b41fuLraVgf/qevcyzbLXrBRyW76y1QUfz3SD0PogM
        VRA+iqMpifpbHA6CQNtUjW1ojhLWPiMHri8vhGx9ljgvflP3mmYsie4xbmwvl5JMlq0B6ca2HUO
        avuD9wxUP/gEkj7M5SdZTe3FzAkpBtSMX9w==
X-Received: by 2002:a05:6402:1c9b:: with SMTP id cy27mr4734503edb.253.1609957403098;
        Wed, 06 Jan 2021 10:23:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw/ReTXn0xbaPHdNm4yR0FipjgBBh+sFzLJrLmy1aaTsu3vTGyQjuGYuPd65OuFihrpCZ6Otw==
X-Received: by 2002:a05:6402:1c9b:: with SMTP id cy27mr4734495edb.253.1609957402920;
        Wed, 06 Jan 2021 10:23:22 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id u16sm1750536eds.10.2021.01.06.10.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jan 2021 10:23:22 -0800 (PST)
Subject: Re: [PATCH 00/24] platform/x86: ideapad-laptop: cleanup, keyboard
 backlight and "always on USB charging" control support, reenable touchpad
 control
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        platform-driver-x86@vger.kernel.org,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d7fbc7ed-801e-0cc2-7433-a829e48f4ec8@redhat.com>
Date:   Wed, 6 Jan 2021 19:23:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/16/20 2:39 AM, Barnabás Pőcze wrote:
> This series contains patches that aim to bring more consistency
> to the code; add keyboard backlight control support; add
> "always on USB charging" control support.
> Furthermore, commit 7f363145992cebf4ea760447f1cfdf6f81459683 is reverted
> since it made it impossible to disable/enable the touchpad via the
> ideapad-laptop module and on some devices the method implemented in the
> module works correctly to disable/enable the touchpad.

Thank you for this series, it is good to see all the
cleanups, as well as to see the new functionality.

Patches 1-20 and 22-24 look good to me and you may add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

To them for v2 of this patch-set.

I have some remarks about patch 21 I will reply to that one
separately.

One minor remark about patch 3/24, normally we put all
the #include <linux/foo.h> includes first (sorted
alphabetically as you already do in the patch) and then
follow up by other / subsys specific include such as
acpi/video.h. Again sorted alphabetically for the file-names
after the subsys dir. I don't think there really is any
preferred order for which subsys headers to include first,
but typically the generic linux/foo.h headers are included
first.

Regards,

Hans

p.s.

About merging this series vs other outstanding ideapad-laptop
changes. The other outstanding changes are quite small, so easy
to rebase. As such I would actually prefer to merge this series
first. So if you can send out a v2 soon-ish, then that would be
great.



> 
> Barnabás Pőcze (24):
>   platform/x86: ideapad-laptop: remove unnecessary dev_set_drvdata()
>     call
>   platform/x86: ideapad-laptop: use appropriately typed variable to
>     store the return value of ACPI methods
>   platform/x86: ideapad-laptop: sort includes lexicographically
>   platform/x86: ideapad-laptop: use sysfs_emit()
>   platform/x86: ideapad-laptop: use for_each_set_bit() helper to
>     simplify event processing
>   platform/x86: ideapad-laptop: use msecs_to_jiffies() helper instead of
>     hand-crafted formula
>   platform/x86: ideapad-laptop: use dev_{err,warn} or appropriate
>     variant to display log messages
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
>     and usb_charging
> 
>  .../ABI/testing/sysfs-platform-ideapad-laptop |   26 +-
>  drivers/platform/x86/ideapad-laptop.c         | 1047 +++++++++++------
>  2 files changed, 692 insertions(+), 381 deletions(-)
> 

