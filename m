Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DC9FC433DB
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 16:42:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 286196193E
	for <platform-driver-x86@archiver.kernel.org>; Sun, 21 Mar 2021 16:42:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhCUQl7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 21 Mar 2021 12:41:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59953 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229784AbhCUQl6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Mar 2021 12:41:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616344918;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=h6LcyQdL67TywNRgTjU1+Uq/iaHBABx2JVQI0NPHu58=;
        b=D5/ggeGHSIWx1urj+E/OkXwNgzIxTTHwn6OmtQtTeGILGcmfckgvkI3ftRAg0H/wVHyKHy
        IIiCm8oy4DiTyaiiMakJmg6RkIj5bcM+an2a9fTtmYKjrGrw2aogCcT6uHjBD2WAEAXlP8
        wZqxJ/+DUZ0EUj7j1IQsOdofsGIw0dc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-M00dFfYANmubIElmd5rE0Q-1; Sun, 21 Mar 2021 12:41:54 -0400
X-MC-Unique: M00dFfYANmubIElmd5rE0Q-1
Received: by mail-ed1-f70.google.com with SMTP id w18so23205461edu.5
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Mar 2021 09:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=h6LcyQdL67TywNRgTjU1+Uq/iaHBABx2JVQI0NPHu58=;
        b=APIt76dUYqttjp7g2GyP2ZsHBS9OJ009VudBSgfd1SxeymdQjqtx2aUAt6n8hlYzkt
         eAQjvqRKOLrMzj+5eEIfm+/YarsqpFBN7xmMzfEnIZDfnrPL03v3a8E+W4g5cPnGhg51
         h+Xzs7brn324tyLBQHqZGfk10S7OGbLUo2q0JFiFy6g66D2nlCtx5GBtRHBqr4EWRJmi
         1G6W5z1YRijub1fcyKy3F7Gsu581xQdlg+JePcAy24D/Bot1LmoJrZ4qoF4YHW86f0tI
         ElxGwsjWppnY7fEeK2bgbqgpCb7EpkvyyHKLwluzBRlcLl0PBX5JbhOhqM6wJ+VQKOkl
         3hsQ==
X-Gm-Message-State: AOAM5321N3IkS+MiJBRjcD4J8uawVXQqU1G8xSD6sFNSLlPJWB5TkPYX
        gCUOUca+PbzHKvIzuMUZpCYP5086OxwdqNL74cpEv2MEIuJl6EroGBjQGDbvGMtOZEIDcgA19ZW
        KEQvJ5HyfnH8/4wC62f75c+EnPs2yvLYwHGHrtf3+Mm+31h6n1wz6u4kHMjt3+h1TPM2zkQM6GJ
        yMN3vD2Tvk+Q==
X-Received: by 2002:a17:907:2661:: with SMTP id ci1mr14957794ejc.403.1616344913279;
        Sun, 21 Mar 2021 09:41:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz28r4Ho9554cAspGy5juLaLVZItgiVonioGTxu1zmWLxddNCX1ex2NV7Xva7r4/C8kAwzyyA==
X-Received: by 2002:a17:907:2661:: with SMTP id ci1mr14957774ejc.403.1616344913059;
        Sun, 21 Mar 2021 09:41:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q26sm7413627eja.45.2021.03.21.09.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Mar 2021 09:41:52 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] platform/x86: dell-wmi-sysman: Various
 error-handling and robustness fixes
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <Divya_Bharathi@dell.com>,
        Alexander Naumann <alexandernaumann@gmx.de>,
        platform-driver-x86@vger.kernel.org
References: <20210321115901.35072-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <01d018aa-9b78-afff-5268-976a55c7117c@redhat.com>
Date:   Sun, 21 Mar 2021 17:41:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210321115901.35072-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/21/21 12:58 PM, Hans de Goede wrote:
> Hi All,
> 
> There have been several bug-reports about crashes related to the
> dell-wmi-sysman module:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1936171
> https://bugzilla.kernel.org/show_bug.cgi?id=211895
> https://bugs.archlinux.org/task/69702
> 
> Here is v2 of my series with a bunch of fixes for NULL pointer derefs,
> double-frees, etc. which fixes this.
> 
> New in v2:
> -New patch: "platform/x86: dell-wmi-sysman: Fix crash caused by calling 
> kset_unregister twice" which addresses the direct-cause of
> the crash.  Note that the crash was already fixed in v1 because
> that removed the code-path where kset_unregister ended up being
> called twice.
> 
> -Dropped: "platform/x86: dell-wmi-sysman: Make init_bios_attributes() 
> ACPI object parsing more robust". This needs more testing / discussion
> and is not necessary to fix the boot-failure which people are seeing.

I've added this series to the pdx86/review-hans and pdx86/fixes branches,
so it should show up in linux-next soon and it will also be included
in my next pull-req to Linus for 5.12.

Regards,

Hans



> Hans de Goede (7):
>   platform/x86: dell-wmi-sysman: Fix crash caused by calling
>     kset_unregister twice
>   platform/x86: dell-wmi-sysman: Fix possible NULL pointer deref on exit
>   platform/x86: dell-wmi-sysman: Make it safe to call
>     exit_foo_attributes() multiple times
>   platform/x86: dell-wmi-sysman: Fix release_attributes_data() getting
>     called twice on init_bios_attributes() failure
>   platform/x86: dell-wmi-sysman: Cleanup sysman_init() error-exit
>     handling
>   platform/x86: dell-wmi-sysman: Make sysman_init() return -ENODEV of
>     the interfaces are not found
>   platform/x86: dell-wmi-sysman: Cleanup
>     create_attributes_level_sysfs_files()
> 
>  .../dell/dell-wmi-sysman/enum-attributes.c    |  3 +
>  .../x86/dell/dell-wmi-sysman/int-attributes.c |  3 +
>  .../dell/dell-wmi-sysman/passobj-attributes.c |  3 +
>  .../dell/dell-wmi-sysman/string-attributes.c  |  3 +
>  .../x86/dell/dell-wmi-sysman/sysman.c         | 84 +++++++------------
>  5 files changed, 44 insertions(+), 52 deletions(-)
> 

