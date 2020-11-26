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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22949C56202
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Nov 2020 10:39:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7BD5221F8
	for <platform-driver-x86@archiver.kernel.org>; Thu, 26 Nov 2020 10:39:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UKl0Qs/U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbgKZKjL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 26 Nov 2020 05:39:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39962 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730927AbgKZKjL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 26 Nov 2020 05:39:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606387149;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yo9d18j2JYmcCVTus4QfEo0yCONfJHdLzX0h7oSMmXc=;
        b=UKl0Qs/UtT8sjWgA5uTNmNmch6b2k2BHNEpij3KtV9vGAHFapas+NQciYg7TBL1WI9V5xV
        LAQOn1ugUIUIOLm1W3gYdwmzIhwWaauFRlylbeTrg34UlB8ZNhPs/gCr6N6CzcutFWamYk
        b5+sLU9HGmKUVAUOzM2ytTF5sxLNlPw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-NA2VePARPtSkVNXZj-u_Rg-1; Thu, 26 Nov 2020 05:39:07 -0500
X-MC-Unique: NA2VePARPtSkVNXZj-u_Rg-1
Received: by mail-ed1-f70.google.com with SMTP id y11so879823edv.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 26 Nov 2020 02:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yo9d18j2JYmcCVTus4QfEo0yCONfJHdLzX0h7oSMmXc=;
        b=UkzOnLZd491GGy/VGY6DSJL4C4JzDY4ld55q20qbhk89BhAXuFtM2COneBhNNCsOuR
         3Za8MXMlY/RgUGfHfqX2k9TdNxS5zKuY/jg12ljO0viBtPcPTm/Vbc39K120TWxy/Cqr
         QbWfA6vMfcZ+ZWmfwXVy3jzqareSKFM/LY+szbwJm/v/BuZ2AAvNhusmgrGjHXLcSus0
         l0EbV7FPaNzkaRog+H53XQIBBTCfvtzS74yS/cxEppZEbCeW7a69jYleaefrnlipAjbN
         ukw7UepJWUob3/ZiHKaKstOb6JtHXC/0D4bwZO9aSJR7C0Sso4kkmHl1yaR5BWT1skQR
         eOQQ==
X-Gm-Message-State: AOAM5305JZ0GOjKspW9TmauZI6mW4E1acbZ31oGDZ59cyBqi6CbASL1U
        LfaEh4mLhH6ydBeqtno0RcDn8emLYMySUzsKjDOTeeeok61dEKFxvNy06fW0kracKrgZAk62rLo
        Uu/d3MZplCUGTD6Gm8kzHMhAv7rDRznJtrA==
X-Received: by 2002:a17:906:5396:: with SMTP id g22mr57512ejo.111.1606387146253;
        Thu, 26 Nov 2020 02:39:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNqyNPOsDiAGgbbM5IQoz3m9FelhIsADjjDJACM8vb6NtTGhRKPRR3xeOyoTkIcLDaA2Gjww==
X-Received: by 2002:a17:906:5396:: with SMTP id g22mr57496ejo.111.1606387146055;
        Thu, 26 Nov 2020 02:39:06 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a26sm2961625edt.74.2020.11.26.02.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2020 02:39:05 -0800 (PST)
Subject: Re: [PATCH v3 0/5] x86/platform/uv: Add uv_sysfs platform driver
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
        Vaibhav Jain <vaibhav@linux.ibm.com>,
        Mike Travis <mike.travis@hpe.com>
References: <20201125175444.279074-1-justin.ernst@hpe.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ac3d704e-4403-2dfb-7fb5-a2c4cbaa1deb@redhat.com>
Date:   Thu, 26 Nov 2020 11:39:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125175444.279074-1-justin.ernst@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/25/20 6:54 PM, Justin Ernst wrote:
> Introduce a new platform driver to gather topology information from UV systems
> and expose that information via a sysfs interface at /sys/firmware/sgi_uv/.
> 
> This is version 3 with these changes since version 2:
> 
>  * Export sn_coherency_id to fix build failure when UV_SYSFS=m, caused by re-introduction
> 	of /sys/firmware/sgi_uv/coherence_id in v2.
> 
>  * Fix a null pointer dereference in drivers/platform/x86/uv_sysfs.c:uv_ports_exit()
> 	caused by calling kobject_put() on an out of range index value.
> 
> Version 2 included these changes since version 1:
> 
>  * Re-introduced /sys/firmware/sgi_uv/coherence_id file in the new driver after
> 	removing it in Patch 1/5. This keeps the userspace API unbroken.
> 
> Justin Ernst (5):
>   x86/platform/uv: Remove existing /sys/firmware/sgi_uv/ interface
>   x86/platform/uv: Add and export uv_bios_* functions
>   x86/platform/uv: Add new uv_sysfs platform driver
>   x86/platform/uv: Update ABI documentation of /sys/firmware/sgi_uv/
>   x86/platform/uv: Update MAINTAINERS for uv_sysfs driver
> 
>  .../ABI/testing/sysfs-firmware-sgi_uv         | 141 ++-
>  MAINTAINERS                                   |   6 +
>  arch/x86/include/asm/uv/bios.h                |  49 +
>  arch/x86/include/asm/uv/uv_geo.h              | 103 +++
>  arch/x86/platform/uv/Makefile                 |   2 +-
>  arch/x86/platform/uv/bios_uv.c                |  55 ++
>  arch/x86/platform/uv/uv_sysfs.c               |  63 --
>  drivers/platform/x86/Kconfig                  |  11 +
>  drivers/platform/x86/Makefile                 |   3 +
>  drivers/platform/x86/uv_sysfs.c               | 862 ++++++++++++++++++
>  10 files changed, 1217 insertions(+), 78 deletions(-)
>  create mode 100644 arch/x86/include/asm/uv/uv_geo.h
>  delete mode 100644 arch/x86/platform/uv/uv_sysfs.c
>  create mode 100644 drivers/platform/x86/uv_sysfs.c

My acked-by for merging the drivers/platform/x86 bits through the x86/tip
tree still stands:

Acked-by: Hans de Goede <hdegoede@redhat.com>

REgards,

Hans

