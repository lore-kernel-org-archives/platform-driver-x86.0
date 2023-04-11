Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51D0C7619A
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Apr 2023 08:41:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229641AbjDKIlv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Apr 2023 04:41:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjDKIlu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Apr 2023 04:41:50 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE35A121
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 01:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681202459;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aFgs05YTHRyCBfMPFMvJ8y1zhqBRiE7UKqj8lVxoLn4=;
        b=K+p6HeYvt7BPJ6mgB+8e4LIYAHaB9y63wSKxqoe4tM4GAzeQqWCpgzCfj3n93vj0kvJSH6
        tkE5OavwGaq7XjLD4YOGKTzqLBFXfKr7+kU/R4b8H8cdP9LfBr2K0c/DSzVDTxSJ+9ft8i
        TdL10x7HMJiprq+SkXYpvjnR+jp87Zg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-jiIT4ngcOg-cIIO5eEXgcg-1; Tue, 11 Apr 2023 04:40:58 -0400
X-MC-Unique: jiIT4ngcOg-cIIO5eEXgcg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a35b0ec78so79612466b.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Apr 2023 01:40:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681202457; x=1683794457;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aFgs05YTHRyCBfMPFMvJ8y1zhqBRiE7UKqj8lVxoLn4=;
        b=RTbbXaGfgaUyWJ8xsWvXvQizHPh8juj2VRy6bmJTzDpX0FdpUklw4VP6+5idgfxH+J
         4qGw+BXlyiKZC0gpeXQEw0FbwmYuYkNImGH7WLC6bdijJruzN0fLLv3Q2yUbNsEUXxBn
         qpnPyyibb/4m3A0HksPYoRqjc+tCnruH8/L/WIsbDyKL5y5OJfov9L6Jn01OnP9Jvj/H
         APTym6+cV4NQbcI9kkYv+C3DZslmXadmdGqjBtXbN5lUt9izA2+UHBsr8KfX5opQrMTN
         CknhpvIAAGNRXid27mklOtz2GysBNPL8usgF0v/z5xpIB5VCdznxn3alb5DBfB4Xz6cE
         bnfg==
X-Gm-Message-State: AAQBX9dCPpdeJoY3hUTJk/B4UdModQOwSE2pHjiDQ6EB1NhwxN93Clvj
        FIxxOPe+0t/8rqSDi5kRGH2yH1m8Tk0xts3HojrEZVN/hGaw8pdWrDbda9h3PwTnVTi+2hGyWA4
        1y6C6ayhEIc2wzP08Xj7DRliEa3qDHS8tLPrLxVOS4Q==
X-Received: by 2002:a05:6402:181a:b0:500:5627:a20b with SMTP id g26-20020a056402181a00b005005627a20bmr997016edy.1.1681202457191;
        Tue, 11 Apr 2023 01:40:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZRYK+Kcar8RhDNwoc/2MYlIy1PknYncmv9NaaBOakmYiHlTssQBI3o/MnAwTFCbEKcknSYBw==
X-Received: by 2002:a05:6402:181a:b0:500:5627:a20b with SMTP id g26-20020a056402181a00b005005627a20bmr997002edy.1.1681202456838;
        Tue, 11 Apr 2023 01:40:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a21-20020a50c315000000b0050481736f0csm3805410edb.12.2023.04.11.01.40.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:40:53 -0700 (PDT)
Message-ID: <26e46a7a-092a-aaed-8867-acb7ad3bf88a@redhat.com>
Date:   Tue, 11 Apr 2023 10:40:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/8] platform/x86/amd/pmc: Updates to AMD PMC driver
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, platform-driver-x86@vger.kernel.org
References: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230409185348.556161-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 4/9/23 20:53, Shyam Sundar S K wrote:
> This patch series includes:
> 
> 1. Fixes to Picasso from Mario
> 2. Change the SMN pair index for driver probing & STB init
> 3. New command ID for getting DRAM size from PMFW.
> 4. Change in smu metrics table data structure.
> 
> Mario Limonciello (4):
>   platform/x86/amd: pmc: Don't try to read SMU version on Picasso
>   platform/x86/amd: pmc: Hide SMU version and program attributes for
>     Picasso
>   platform/x86/amd: pmc: Don't dump data after resume from s0i3 on
>     picasso
>   platform/x86/amd: pmc: Move idlemask check into
>     `amd_pmc_idlemask_read`
> 
> Shyam Sundar S K (4):
>   platform/x86/amd: pmc: Utilize SMN index 0 for driver probe
>   platform/x86/amd: pmc: Move out of BIOS SMN pair for STB init
>   platform/x86/amd: pmc: Get STB DRAM size from PMFW
>   platform/x86/amd: pmc: update metrics table info for Pink Sardine
> 
>  drivers/platform/x86/amd/Kconfig |   2 +-
>  drivers/platform/x86/amd/pmc.c   | 240 ++++++++++++++++++-------------
>  2 files changed, 145 insertions(+), 97 deletions(-)

Thanks for the patches I have merged patches 1-6 into my
review-hans (soon to be for-next) branch now.

I agree with Mario that the firmware version check in 7/8
should look like this:

"""
Is this only for YC and not for PS?

The version check I think you should make it clear it's only intended for this program.

switch(dev->cpu_id) {
case AMD_CPU_ID_YC:
    if (version_check)
        goto err_dram_size;
    break;

default:
    goto err_dram_size;

} 
"""

Since we have seen in earlier patches in this series that we will otherwise need to make this a per CPU-id check later we might just as well do it now.

Please send a new version of patches 7 + 8 based on top of my review-hans branch.

Regards,

Hans


