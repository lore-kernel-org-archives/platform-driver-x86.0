Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC7A0C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 12:36:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F9F4611EE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 12:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245473AbhDGMgP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 08:36:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53482 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232859AbhDGMgI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 08:36:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617798958;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DbBwiDtUYHmi0Uc31qeFG810LcPTxh9wugQb1H38Esw=;
        b=U73+fRctFO5ndBoiaOQpatSyCjsKcKMi1QmqWQ9hf1N7nJojld8+j2jmdEksZLk+0e7rOW
        b8mFgOkoVuUOfsO2doKwKWnK+eqQkDmg2YinLVpR50sPQT019Ra3mvu5WahqBJS5A43MH7
        jIRCcuZrDxM5y0rZs+XIZAkRkAPCs/w=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-OhTjs7q9MhW-86uSJX4gHw-1; Wed, 07 Apr 2021 08:35:56 -0400
X-MC-Unique: OhTjs7q9MhW-86uSJX4gHw-1
Received: by mail-ej1-f69.google.com with SMTP id pj13so392431ejb.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 05:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DbBwiDtUYHmi0Uc31qeFG810LcPTxh9wugQb1H38Esw=;
        b=EShp+GB5c3uhk/h6q5N6Gnk2OjCumwTLgSiiJ+KsU56DksYg/VZbBb/Rex7+DVQIkK
         XuULvh4wzcDHzjUTSXpNmwU3tDzcui3fftaEt22OQEwayOLndvS0A3rCO0I//1VKB46u
         q0L6nX++45KdsAcdMSg/78y+tsc7q1SvXm8a8dVXcFWNWHFf61pl6aI06rzNyZG5g2Bp
         as6WdT07/63nWeIQM8mPgidD+z3lBHdxPX/OTdwgQYg7Y6GaNmNVqUYO6oUj9Ir/Z9/P
         i8SpNzYBOGtHwboIgtcHDKz9cQUdt7PYwh/mufrHzKLN40PFOoc1r54v7k97gageKype
         2TIw==
X-Gm-Message-State: AOAM533TLvXWCQN6BaZn4VkFj6H/ooKPPN5CdmLJQuF+fRu2x0VBhgHf
        5POjGUnDk4vKpLWrl+5QGeieq48E68cacPUBL8dM3ka/+AXwOmakLAZZgKXdFlg4VNy6x9ka++P
        pPYbVHrqZy4jU7USPcuM10Kw88XDfctuTNFNgaKU5kzGoU4/mGmMKdub4n2pOVl9vbXg7am/HAf
        XEXV9mNNLerg==
X-Received: by 2002:a05:6402:1004:: with SMTP id c4mr4211009edu.364.1617798954523;
        Wed, 07 Apr 2021 05:35:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJye6mki7LgBFnZ4KNKgd45hjRIaw7pEspsg/Me2kv+GhDnWbqCF2sdS4Q+jptGIggolMcPQDg==
X-Received: by 2002:a05:6402:1004:: with SMTP id c4mr4210991edu.364.1617798954334;
        Wed, 07 Apr 2021 05:35:54 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id wr20sm12477064ejb.111.2021.04.07.05.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 05:35:53 -0700 (PDT)
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select pull request for
 5.13-rc1
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>
Cc:     "srinivas.pandruvada@linux.intel.com" 
        <srinivas.pandruvada@linux.intel.com>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <96f15cef07d3995d9893ff3e671b0f78e2cdbf68.camel@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ef754c51-93e2-a0dd-6f8f-6e05cd0ddcb8@redhat.com>
Date:   Wed, 7 Apr 2021 14:35:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <96f15cef07d3995d9893ff3e671b0f78e2cdbf68.camel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/29/21 9:10 PM, Pandruvada, Srinivas wrote:
> Hi Mark, Hans,
> 
> The following changes are on top of:
> git://git.infradead.org/linux-platform-drivers-x86.git for-next
> 
> 
> The following changes since commit
> 0733e545fa5966701bc056cf62e3195ee92e4191:
> 
>   platform/x86: touchscreen_dmi: Handle device properties with software
> node API (2021-03-06 10:26:02 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/spandruvada/linux-kernel.git intel-sst
> 
> for you to fetch changes up to
> 26fa4c588f2894abee9aaed3097f38c6a0dfd1d2:
> 
>   tools/power/x86/intel-speed-select: v1.9 release (2021-03-29 11:45:04
> -0700)

Thank you, merged.

Regards,

Hans



> 
> ----------------------------------------------------------------
> Antonio Terceiro (1):
>       tools/power/x86/intel-speed-select: Drop __DATE__ and __TIME__
> macros
> 
> Srinivas Pandruvada (4):
>       tools/power/x86/intel-speed-select: Increase string size
>       tools/power/x86/intel-speed-select: Process mailbox read error
> for core-power
>       tools/power/x86/intel-speed-select: Add options to force online
>       tools/power/x86/intel-speed-select: v1.9 release
> 
>  tools/power/x86/intel-speed-select/isst-config.c  | 30
> ++++++++++++++++++++++++++----
>  tools/power/x86/intel-speed-select/isst-display.c | 12 ++++++++++--
>  2 files changed, 36 insertions(+), 6 deletions(-)
> 
> Thanks,
> Srinivas
> 

