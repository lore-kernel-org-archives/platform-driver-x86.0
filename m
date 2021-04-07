Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5ECC433B4
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:50:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B4E16135D
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353163AbhDGOuZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:50:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32569 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353094AbhDGOtz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 10:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617806985;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2JsGWtEoCdr3zGRUAMmhrIg8TDL4ft+B27TPb9qYrBY=;
        b=Q2/v8/mPITeoZvzY0nCtP9XI/f+TF1mzeCjVidLX1f4fxlAAJNtbQfuSvKBCmWa6ACJMjr
        qthpMHxN0MUAWVS9p+5C0KDU1xzVcDLQFe5Jy5Hq0J95aBVCgGOvwZb6wMWFIiwayxHkry
        RuaA8t/KYGf/wSClnFPKvONP/0/15Bo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-FeU2FEtaNqaS4kPavi0SjA-1; Wed, 07 Apr 2021 10:49:43 -0400
X-MC-Unique: FeU2FEtaNqaS4kPavi0SjA-1
Received: by mail-ed1-f69.google.com with SMTP id r6so12261424edh.7
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 07:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2JsGWtEoCdr3zGRUAMmhrIg8TDL4ft+B27TPb9qYrBY=;
        b=BKAVr8D5LJW+YICzVpPyfk3pTN62Wc86C0H3WX7/b4/0pA9WTwbLSq4jIiQaKw+/tf
         27BRHpM/Wbl1kYlJ3lY308P3XEaLGdWDL9yoKUHMQzzzYKLIng0zlpqJNvotLroJrkBt
         7qsagSv2lwfc3rRLV+R7JsUT4Ev8SsDH11DUprdXPbQcxzcUM2iO/HU5J3MQlNBLGFE8
         dk51P81+X47Vy7xai+XRFnReC14JhPslPSvXkqTwV99gnJ+GpggwCkWVFXL1QMXxlXUa
         zf9/BFwjAQiOvo1uus933AbenrvaF6eAkW3qlCOfghJKLIvlua1pbyxH9B9LJUfVvkL0
         MF2A==
X-Gm-Message-State: AOAM533MReFhvCXYJ49LkSNGL+Mpxjcc3Eh/v3+P6TjLAMn/7PBGooiF
        6OsPca2F55Im2SE/pTDO5LTtvw24IkeQ1leR655ZTd43B5auP56vSL8fkw2VKyiFcTcyAYHZOK6
        vaAB9JqupGW+TxOSSlmKUKFZjbzicp88Lxw==
X-Received: by 2002:a17:906:6bcf:: with SMTP id t15mr4254995ejs.252.1617806982557;
        Wed, 07 Apr 2021 07:49:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywzceHMmr/aBnghYFEU/cRHINVV7jvAY6AaT0S4fVfyNds5n7GPvYOsJRF+ILpB089AE4QCA==
X-Received: by 2002:a17:906:6bcf:: with SMTP id t15mr4254975ejs.252.1617806982278;
        Wed, 07 Apr 2021 07:49:42 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id e5sm7975833edr.64.2021.04.07.07.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 07:49:42 -0700 (PDT)
Subject: Re: [PATCH 0/9] intel_pmc_core: Add sub-state requirements and mode
 latching support
To:     "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, mgross@linux.intel.com,
        gayatri.kammela@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210401030558.2301621-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a5d476c8-5c38-b8fc-a0da-65a28c5a14e3@redhat.com>
Date:   Wed, 7 Apr 2021 16:49:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210401030558.2301621-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/1/21 5:05 AM, David E. Box wrote:
> - Patch 1 and 2 remove the use of the global struct pmc_dev
> - Patches 3-7 add support for reading low power mode sub-state
>   requirements, latching sub-state status on different low power mode
>   events, and displaying the sub-state residency in microseconds
> - Patch 8 adds missing LTR IPs for TGL
> - Patch 9 adds support for ADL-P which is based on TGL
> 
> Applied on top of latest 5.12-rc2 based hans-review/review-hans

Thnak you for this series, this mostly is fine, a few small remarks
on patch 5/9 and 7/9 if you can send a v2 addressing those, then
this is ready for merging.

Regards,

Hans


> 
> David E. Box (4):
>   platform/x86: intel_pmc_core: Don't use global pmcdev in quirks
>   platform/x86: intel_pmc_core: Remove global struct pmc_dev
>   platform/x86: intel_pmc_core: Add option to set/clear LPM mode
>   platform/x86: intel_pmc_core: Add support for Alder Lake PCH-P
> 
> Gayatri Kammela (5):
>   platform/x86: intel_pmc_core: Handle sub-states generically
>   platform/x86: intel_pmc_core: Show LPM residency in microseconds
>   platform/x86: intel_pmc_core: Get LPM requirements for Tiger Lake
>   platform/x86: intel_pmc_core: Add requirements file to debugfs
>   platform/x86: intel_pmc_core: Add LTR registers for Tiger Lake
> 
>  drivers/platform/x86/intel_pmc_core.c | 359 +++++++++++++++++++++++---
>  drivers/platform/x86/intel_pmc_core.h |  47 +++-
>  2 files changed, 370 insertions(+), 36 deletions(-)
> 

