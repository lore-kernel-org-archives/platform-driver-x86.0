Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF72C54EE9
	for <platform-driver-x86@archiver.kernel.org>; Mon, 19 Sep 2022 12:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229852AbiISMIB (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 19 Sep 2022 08:08:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbiISMH7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Sep 2022 08:07:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 156C02B60C
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 05:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663589276;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bQPG1qSYwpLdETxNeyDxmc98p8o+CviwbIWCJA09kXY=;
        b=DXwM7p3F+hjVy/Xtk7CFDb0eQhy7RcxYk/sSTQGHxE8sk4QE4JZGJdiwQtuK2Qc8uuim69
        U6EwYfKet0UGEcvRClqyEt4vJGHn9PN2K7BBfv2N5/i4pCBlbZaqn46znXeoj4OIZvF4Y+
        t/anaYBAkcvj14S0Qw/BgQWIzpTyfc0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-53-Mu_RsvcoNEuwPnYo4-Ttog-1; Mon, 19 Sep 2022 08:07:55 -0400
X-MC-Unique: Mu_RsvcoNEuwPnYo4-Ttog-1
Received: by mail-ej1-f71.google.com with SMTP id jg32-20020a170907972000b0077ce313a8f0so8369517ejc.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Sep 2022 05:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=bQPG1qSYwpLdETxNeyDxmc98p8o+CviwbIWCJA09kXY=;
        b=OD+sPKFYEJdTP8iyg+iW207SVXAxXr+Ed4AX67gCpxmybexwHE547T/TQrCgPl3my9
         MHMEotOEfJoA59zNjIou03Nl6WsUhI+WYqu1OAjSN/SUnvKqM7r6AgvVZ6uvs2gYCYdH
         P+MD9sCXwquJbnfOprQ9AGyk+ZaXXgztokRRAW3FMvidPl3DO2fGD3kh1pb9AVXjJT3t
         3oG0VuwKZ8aCpoE1A5nKmvQiVNlAS5M3aJ0maNAGv6/zUW1Z+ysjdvHfHGPVhjzKokex
         rAc53CGTQ5oIehMzaEpoxs5jE5El8ohqg1RjlZbmm9obszXlJ6GNw060p/lpVL8A0RWw
         O5Og==
X-Gm-Message-State: ACrzQf2Drmy/ijm0HGGXjslFS8TdCcfrDmOC3PefYY2Id4lD9wSWhRtO
        fOy6GxAIeUrNUoKAf3OVi71KcQVb2Y7L0VPy9hNxzwvCvfsAo3eWUuO9y+GoY82CGnCffLMv3mO
        LRg3kv7bL9fhBQgr6CfnACkIVa78AmT6sGQ==
X-Received: by 2002:aa7:cd49:0:b0:451:e570:8a82 with SMTP id v9-20020aa7cd49000000b00451e5708a82mr15165990edw.369.1663589274719;
        Mon, 19 Sep 2022 05:07:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5rDPhMTswM42xaou7oAF155Gh5fuaM4Qd4Q/Xie2TotlBceYV/uNaABmos4TFrLOuAXSweAg==
X-Received: by 2002:aa7:cd49:0:b0:451:e570:8a82 with SMTP id v9-20020aa7cd49000000b00451e5708a82mr15165973edw.369.1663589274491;
        Mon, 19 Sep 2022 05:07:54 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id cf10-20020a170906b2ca00b007402796f065sm15535419ejb.132.2022.09.19.05.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 05:07:53 -0700 (PDT)
Message-ID: <1f144fc6-58a3-d799-acbd-f2bd40add442@redhat.com>
Date:   Mon, 19 Sep 2022 13:07:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 6.1-rc1
Content-Language: en-US
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
Cc:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <f5d261460d60c546005d126a7629bfd5e4deeaba.camel@intel.com>
 <49ef6e43-eb16-052e-3e58-f0290328cdd6@redhat.com>
 <e53c62fcb89a701e104513ffcd40cd79abd32123.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e53c62fcb89a701e104513ffcd40cd79abd32123.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/15/22 19:31, Pandruvada, Srinivas wrote:
> Hi Hans,
> 
> This pull request contains:
> - One fix for invalid display of cpu count for TDP level
> - Removal of unused code and data
> - consolidate package/die/cpu in a struct and use this
> instead of passing all and recompute package and die ids
> 
> These changes are on top of
> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> for-next
> 
> 
> The following changes since commit
> 76fba1221e3045570478381c3436c8c2a2656376:
> 
>   Merge tag 'backlight-detect-refactor-1' into review-hans (2022-09-05
> 11:01:56 +0200)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 97ec890d070158f15fe8ef2419a5ff677bdbbc20:
> 
>   tools/power/x86/intel-speed-select: Release v1.13 (2022-09-15
> 11:16:06 -0700)

Thanks, I have merged this into my review-hans (soon to be for-next)
branch now.

Regards,

Hans


> 
> ----------------------------------------------------------------
> Srinivas Pandruvada (1):
>       tools/power/x86/intel-speed-select: Release v1.13
> 
> Zhang Rui (13):
>       tools/power/x86/intel-speed-select: Fix cpu count for TDP level
> display
>       tools/power/x86/intel-speed-select: Remove dead code
>       tools/power/x86/intel-speed-select: Remove unused core_mask array
>       tools/power/x86/intel-speed-select: Introduce struct isst_id
>       tools/power/x86/intel-speed-select: Add pkg and die in isst_id
>       tools/power/x86/intel-speed-select: Convert more function to use
> isst_id
>       tools/power/x86/intel-speed-select: Cleanup get_physical_id usage
>       tools/power/x86/intel-speed-select: Introduce
> is_cpu_in_power_domain helper
>       tools/power/x86/intel-speed-select: Do not export get_physical_id
>       tools/power/x86/intel-speed-select: Enforce isst_id value
>       tools/power/x86/intel-speed-select: Remove unused struct
> clos_config fields
>       tools/power/x86/intel-speed-select: Utilize cpu_map to get
> physical id
>       tools/power/x86/intel-speed-select: Optimize CPU initialization
> 
>  tools/power/x86/intel-speed-select/hfi-events.c   |   5 +-
>  tools/power/x86/intel-speed-select/isst-config.c  | 511
> ++++++++++++++++++++++++++++++++++++-----------------------------------
> --
>  tools/power/x86/intel-speed-select/isst-core.c    | 313
> +++++++++++++++++++++------------------------
>  tools/power/x86/intel-speed-select/isst-daemon.c  |  36 +++---
>  tools/power/x86/intel-speed-select/isst-display.c |  76 +++++------
>  tools/power/x86/intel-speed-select/isst.h         |  88 ++++++-------
>  6 files changed, 496 insertions(+), 533 deletions(-)
> 
> Thanks,
> Srinivas
> 
> 

