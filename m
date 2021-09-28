Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BD3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 14:15:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB98761206
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Sep 2021 14:15:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241256AbhI1ORd (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Sep 2021 10:17:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22582 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241054AbhI1ORc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Sep 2021 10:17:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632838553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AWD5TlJk9nEWaPVGYxsFMEI0pK3OkzOISyOGy4sUKVk=;
        b=U4MTJA1ip221059GlNadnLFluwpl1ZP+OnNPjv2t2oiaJIcpbRPaR3L0PoFRQXaJ2T2kNV
        fr/JDwbYzo8Lj/K+TOfzaNGu5FFDwcvQzQPQfHFOP0JPLS8a3GOwsteAQmEiVljjydywQ2
        hQfEAaK6qFsKGgol6DFHLN7e1ouFwcU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-t4e6USSBN_OGuLAfdx1TLA-1; Tue, 28 Sep 2021 10:15:51 -0400
X-MC-Unique: t4e6USSBN_OGuLAfdx1TLA-1
Received: by mail-ed1-f70.google.com with SMTP id x26-20020a50f19a000000b003da81cce93bso4327475edl.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Sep 2021 07:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AWD5TlJk9nEWaPVGYxsFMEI0pK3OkzOISyOGy4sUKVk=;
        b=rdAkg9wDTQz5uxCVzPlFZ3gb9s15rkLqHS0pYBk08zUr/pU+J5PJKm5A6tROlj0XRg
         /oUcc3bgDzn5MII+IXP4Pu5EMQputkw8U71hOG9SRnWFu5Zd+cOwnGA2tpfWBqbNPkEC
         9URc8qxS2KJo64l1p6MFq9QLeLXTeIzxWEELhFItiBQLYRkpH8lC2Vk1P8d4zy1S/ULt
         5dhrqFjaJ+uHUoAkdLSgGt1tQxa7ZYROGSBx6vum9Mwjo+Aftrq8D/q4Fs7cWklZjSmK
         LwsZJJ0ED8rZDwFSrZrARQwdIbQtyaC/3ZTD6ulaA7ogkV2aWWb8qY2qtHgNgXqHi9q0
         UO2g==
X-Gm-Message-State: AOAM533D6vsTARzIsMTLCXZpEbKPxvFXrWh/v/SlKRFy7o5Vs8LNLi9D
        7G0wIuDdo226t51Os54/MoFWuNi5DQjUBdCRlVnWpovYgwEWi2lscSIByW9NAWN9TTgboDzKDJ8
        4oP3ZLkN3Yi2qtCBsA2kBiIYbdsnjgAys0Q==
X-Received: by 2002:aa7:cd41:: with SMTP id v1mr7736194edw.393.1632838550518;
        Tue, 28 Sep 2021 07:15:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfHnHmottUyITNFI3BM8y9fnS2kCoEoR02Q5lm5KG8/zwP0QPMUq5GonGE/k8IAfaEtgzmVw==
X-Received: by 2002:aa7:cd41:: with SMTP id v1mr7736179edw.393.1632838550363;
        Tue, 28 Sep 2021 07:15:50 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k18sm12063530edv.41.2021.09.28.07.15.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 07:15:49 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: amd-pmc: Export Idlemask values based on
 the APU
To:     Nathan Chancellor <nathan@kernel.org>,
        Sanket Goswami <Sanket.Goswami@amd.com>
Cc:     Shyam-sundar.S-k@amd.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210916124002.2529-1-Sanket.Goswami@amd.com>
 <YUz2t+bdes2I+gMK@archlinux-ax161>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <09b3489b-3474-c626-d312-cde1cb023397@redhat.com>
Date:   Tue, 28 Sep 2021 16:15:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUz2t+bdes2I+gMK@archlinux-ax161>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/23/21 11:50 PM, Nathan Chancellor wrote:
> On Thu, Sep 16, 2021 at 06:10:02PM +0530, Sanket Goswami wrote:
>> IdleMask is the metric used by the PM firmware to know the status of each
>> of the Hardware IP blocks monitored by the PM firmware.
>>
>> Knowing this value is key to get the information of s2idle suspend/resume
>> status. This value is mapped to PMC scratch registers, retrieve them
>> accordingly based on the CPU family and the underlying firmware support.
>>
>> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>> Signed-off-by: Sanket Goswami <Sanket.Goswami@amd.com>
> 
> This patch as commit f6045de1f532 ("platform/x86: amd-pmc: Export
> Idlemask values based on the APU") in -next causes the following errors
> when CONFIG_DEBUG_FS is disabled:
> 
> drivers/platform/x86/amd-pmc.c:424:2: error: implicit declaration of function 'amd_pmc_idlemask_read' [-Werror,-Wimplicit-function-declaration]
>         amd_pmc_idlemask_read(pdev, dev, NULL);
>         ^
> drivers/platform/x86/amd-pmc.c:424:2: note: did you mean 'amd_pmc_reg_read'?
> drivers/platform/x86/amd-pmc.c:131:19: note: 'amd_pmc_reg_read' declared here
> static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>                   ^
> drivers/platform/x86/amd-pmc.c:448:2: error: implicit declaration of function 'amd_pmc_idlemask_read' [-Werror,-Wimplicit-function-declaration]
>         amd_pmc_idlemask_read(pdev, dev, NULL);
>         ^
> drivers/platform/x86/amd-pmc.c:536:2: error: implicit declaration of function 'amd_pmc_get_smu_version' [-Werror,-Wimplicit-function-declaration]
>         amd_pmc_get_smu_version(dev);
>         ^
> 3 errors generated.
> 
> Should these functions be stubbed or should there be a different fix?

Thank you for the bug report.

Since these functions are also used outside of the debugfs show functions
they simply need to be moved outside of the #ifdef CONFIG_DEBUG_FS
block. I'll add a patch fixing this to pdx86/review-hans and include
it in my next pdx86-fixes pull-req to Linus.

Regards,

Hans

