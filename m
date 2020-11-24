Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B94C2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 11:30:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48C6B2075A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 11:30:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aAGM5OP5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732673AbgKXLaA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 06:30:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22192 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732524AbgKXL37 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 06:29:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606217398;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q6Xqb21zXjK/7O+kdpHhBBqH6ZBB7Z2yzDkI1sWtGg8=;
        b=aAGM5OP5GtcU7qIIseSKlPq5lpwg9YdKRcH9eteyp6GCYbzDp/gDewqUqexH+ASW1oCnTa
        SUOdvQ2Ku7LWyhVqiD7sjkD1PrJkdK275iijAOArKP7HE81iB1TbFx/H3rkPEu+hwUOUHw
        AoMJTlNgnZwZbtnT8XX3atJiPScTVsU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-EZvTro9WP7qCD_31XK5mGg-1; Tue, 24 Nov 2020 06:29:56 -0500
X-MC-Unique: EZvTro9WP7qCD_31XK5mGg-1
Received: by mail-ed1-f70.google.com with SMTP id c24so7898000edx.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 03:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q6Xqb21zXjK/7O+kdpHhBBqH6ZBB7Z2yzDkI1sWtGg8=;
        b=f/YpxVUt9TbBebUPJEqhrxzw5O9BtfRq54piSMJYLzI94XHpukd82kylEShJM21rR9
         V0PdTBg1s1uHNpAYAFTpf769ISYePaQOaQTNmJ19GUWf78SPtDBgnMum36eCOkdn5X12
         ktV3kSLap/XhWErl4BdJnoZfpM5M94XnddknBwSHDW5yoMnl3xfg9VgpgYAvVkbXFmGs
         FjkbAiHMi+MBgyUcNIAsKPyY/r2EGlOM9p2NabhhuwYfk6cJ3pJtDsSWSl80irgJOm6V
         ZbPlMvB4Aklo+2NoX0SKGfSfBtmZ+UnQxsPIaBHMmFT5tjM10O2Kh6Qi5v73SC99A24J
         pZgQ==
X-Gm-Message-State: AOAM530XOCwPsed2xU5ZH0cP8uQ1EhqCVk2XEUU7oE3MqVFhjYIGuSKR
        GCIkWOJBDMK6Y+Pk4nUJnoB2uWpprXmv1syCg2L2IL/dAJv5+Ia5hKmFguTfAcf6cg3iHa/amv/
        yfurSVHR64UW5qj3zYxewwfPpR2wil2vUbw==
X-Received: by 2002:a17:906:4104:: with SMTP id j4mr3847520ejk.439.1606217394913;
        Tue, 24 Nov 2020 03:29:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw5onRZuE1L+BtuaQoGo0K2aZGHO1uHnQk+IRGpvWWcyDnMA2vDDM8mO1egGdwlhZKTO2w3Eg==
X-Received: by 2002:a17:906:4104:: with SMTP id j4mr3847499ejk.439.1606217394768;
        Tue, 24 Nov 2020 03:29:54 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id l7sm6660415ejc.5.2020.11.24.03.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 03:29:54 -0800 (PST)
Subject: Re: [PATCH v2 0/5] Add uv_sysfs platform driver
To:     Justin Ernst <justin.ernst@hpe.com>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Steve Wahl <steve.wahl@hpe.com>, x86@kernel.org
Cc:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        "H . Peter Anvin" <hpa@zytor.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Ilya Dryomov <idryomov@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
References: <20201118164747.236259-1-justin.ernst@hpe.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <dbf50917-8425-2eb8-8ccf-cf6645bd1891@redhat.com>
Date:   Tue, 24 Nov 2020 12:29:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118164747.236259-1-justin.ernst@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Quick self intro for the x86/tip maintainers: I have take over
drivers/platform/x86 maintainership from Andy.

On 11/18/20 5:47 PM, Justin Ernst wrote:
> Introduce a new platform driver to gather topology information from UV systems
> and expose that information via a sysfs interface at /sys/firmware/sgi_uv/.
> 
> This is version 2 with these changes since version 1:
> 
>  * Re-introduced /sys/firmware/sgi_uv/coherence_id file in the new driver after
> 	removing it in Patch 1/5. This keeps the userspace API unbroken.
> 
> Justin Ernst (5):
>   x86/platform/uv: Remove existing /sys/firmware/sgi_uv/ interface
>   x86/platform/uv: Add and export uv_bios_* functions
>   x86/platform/uv: Add new uv_sysfs platform driver
>   x86/platform/uv: Update ABI documentation of /sys/firmware/sgi_uv/
>   x86/platform/uv: Update MAINTAINERS for uv_sysfs driver> 
>  .../ABI/testing/sysfs-firmware-sgi_uv         | 141 ++-
>  MAINTAINERS                                   |   6 +
>  arch/x86/include/asm/uv/bios.h                |  49 +
>  arch/x86/include/asm/uv/uv_geo.h              | 103 +++
>  arch/x86/platform/uv/Makefile                 |   2 +-
>  arch/x86/platform/uv/bios_uv.c                |  54 ++
>  arch/x86/platform/uv/uv_sysfs.c               |  63 --
>  drivers/platform/x86/Kconfig                  |  11 +
>  drivers/platform/x86/Makefile                 |   3 +
>  drivers/platform/x86/uv_sysfs.c               | 862 ++++++++++++++++++
>  10 files changed, 1216 insertions(+), 78 deletions(-)
>  create mode 100644 arch/x86/include/asm/uv/uv_geo.h
>  delete mode 100644 arch/x86/platform/uv/uv_sysfs.c
>  create mode 100644 drivers/platform/x86/uv_sysfs.c

So this touches files under both arch/x86/ and drivers/platform/x86/ ,
I believe this is best merged through the x86/tip tree and I don't
expect conflicts for the drivers/platform/x86/{Kconfig,Makefile} changes.

So here is my ack for merging this series through the x86/tip tree:

Acked-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


