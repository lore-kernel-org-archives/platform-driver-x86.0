Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50386C6379D
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Nov 2020 11:00:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8812221FE
	for <platform-driver-x86@archiver.kernel.org>; Wed, 18 Nov 2020 11:00:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ceh8c7rM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727811AbgKRLA6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 18 Nov 2020 06:00:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53093 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726424AbgKRLA6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Nov 2020 06:00:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1605697256;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BHgwWsxqfyxpx05VciZN0+XFPaB0CWdQNUMluxEj1l4=;
        b=Ceh8c7rMk1i6diWcx/7i1bOak6fJ2H3JHXiQRYUi6gYrHGMygComQbuREV7jC7NLte56Xj
        jf5icbV6GVM46svgun31XwBk/VeLLfh9fMZ7VERKCjq0oSiIkizcJ2+zyUspywkyaLWSvG
        UE3uIEa6oe4Hn4datkkKwM3efuw42Cs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-5XdntTw7NgWbjLvoDWv5lQ-1; Wed, 18 Nov 2020 06:00:54 -0500
X-MC-Unique: 5XdntTw7NgWbjLvoDWv5lQ-1
Received: by mail-ed1-f71.google.com with SMTP id o11so657092edq.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Nov 2020 03:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=BHgwWsxqfyxpx05VciZN0+XFPaB0CWdQNUMluxEj1l4=;
        b=sdQ2vvTVbuLvyxJVlQb8+sqogZS2UH7xExUfSr9WLVfiA4ehAd9ORwnZNCd8787wOn
         xuAlXq50MQ7iWnCkrsL2VSp/gOEFHWWmzjNRu/aTRFjpsN1NrEVpguJCaeqBbvJr9XUL
         WcJJKYprbGXS3qudqUJjAcFXrRFQSIWb4H8vE5xFPq/zd/5sCwTgheAam9aE3mrQItyt
         PMpV3MpZl1/2jJh+bKWH4R/k9novRIpQA+b54Nyz1BlbPMuNb15KjNGsG6iFQeE3B4zD
         zsDKVOQEwcbAkVLCNNAAwEJfLJujfSEBodVCFQsMW0jLU/6trsGOBkxFxYG1FppaLC2q
         jAAA==
X-Gm-Message-State: AOAM532v8L2uUiUcHAg28JMM8w54pnbC5AHn4qFh+QPM73C0WHDV/fxW
        V+5p37heaZW6Lq5/sL6Rewldhg7xoEZ+Qu0skFmsjpQKXCiwnsliBJWbSdlA97ifMfYVUnelE5o
        8ForlPOdFvbwNx/q8bUBpKUIQvSsykzRzMA==
X-Received: by 2002:a17:906:a856:: with SMTP id dx22mr24507875ejb.134.1605697252934;
        Wed, 18 Nov 2020 03:00:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+GAjBHUWjn6hPBGFbrVITqQ9sqQ54HoZMU+4La/yd5R1Uo4ZbK2hUgvmGYP6WYH67B0ZMEA==
X-Received: by 2002:a17:906:a856:: with SMTP id dx22mr24507840ejb.134.1605697252666;
        Wed, 18 Nov 2020 03:00:52 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id n12sm12766284ejs.19.2020.11.18.03.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 03:00:51 -0800 (PST)
Subject: Re: [PATCH 0/5] Add uv_sysfs platform driver
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
References: <20201117204224.51230-1-justin.ernst@hpe.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <99d26b0e-efd7-a32d-7be0-607c98ac2569@redhat.com>
Date:   Wed, 18 Nov 2020 12:00:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117204224.51230-1-justin.ernst@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/17/20 9:42 PM, Justin Ernst wrote:
> Introduce a new platform driver to gather topology information from UV systems
> and expose that information via a sysfs interface at /sys/firmware/sgi_uv/.
> 
> Justin Ernst (5):
>   x86/platform/uv: Remove existing /sys/firmware/sgi_uv/ interface
>   x86/platform/uv: Add and export uv_bios_* functions
>   x86/platform/uv: Add new uv_sysfs platform driver
>   x86/platform/uv: Update ABI documentation of /sys/firmware/sgi_uv/
>   x86/platform/uv: Update MAINTAINERS for uv_sysfs driver

So patch 1/1 drops the existing 

/sys/firmware/sgi_uv/coherence_id
/sys/firmware/sgi_uv/partition_id

sysfs API, then according to patch 4/5 patch 3/5 reintroduces
the /sys/firmware/sgi_uv/partition_id API, but the /sys/firmware/sgi_uv/coherence_id
file is gone for ever ?

I'm not sure what userspace bits (may) depend on this but without more info
this looks like a clear violation of the do not break userspace APIs rule.

So, based on this, I have to nack this series in its current state.

Now if there is a strong believe there are 0 (not a few, but _zero_) users
out there who rely on the /sys/firmware/sgi_uv/coherence_id file then this
might be ok. But then there needs to be a technical analysis of why this is
ok in the commit message of the patch dropping this sysfs file.

Also the commit message of patch 1/5 should mention that
/sys/firmware/sgi_uv/partition_id will be re-introduced later through
another driver.

Regards,

Hans


> 
>  .../ABI/testing/sysfs-firmware-sgi_uv         | 137 ++-
>  MAINTAINERS                                   |   6 +
>  arch/x86/include/asm/uv/bios.h                |  49 +
>  arch/x86/include/asm/uv/uv_geo.h              | 103 +++
>  arch/x86/platform/uv/Makefile                 |   2 +-
>  arch/x86/platform/uv/bios_uv.c                |  54 ++
>  arch/x86/platform/uv/uv_sysfs.c               |  63 --
>  drivers/platform/x86/Kconfig                  |  11 +
>  drivers/platform/x86/Makefile                 |   3 +
>  drivers/platform/x86/uv_sysfs.c               | 853 ++++++++++++++++++
>  10 files changed, 1202 insertions(+), 79 deletions(-)
>  create mode 100644 arch/x86/include/asm/uv/uv_geo.h
>  delete mode 100644 arch/x86/platform/uv/uv_sysfs.c
>  create mode 100644 drivers/platform/x86/uv_sysfs.c
> 
> 
> base-commit: 4ef8451b332662d004df269d4cdeb7d9f31419b5
> 

