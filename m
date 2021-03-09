Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77509C433E0
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Mar 2021 19:00:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 472FE652C1
	for <platform-driver-x86@archiver.kernel.org>; Tue,  9 Mar 2021 19:00:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230525AbhCIS7w (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 9 Mar 2021 13:59:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58779 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230328AbhCIS7f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Mar 2021 13:59:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615316374;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kiTVUES8vuZVl3f+K0HPi56Y64nEHybIHmhWCkJ5UXQ=;
        b=JIDnhnlY11m7CisK2+slb6IYc4vv4fzviyohPKMLx3HMdD33+Y3DSarpLQ42YFuDtz31W/
        CTTLEtL0rgB6dCMrbkLwJguCQxYjqCfrARSBlNoOT1fKleOT9g6UE6mYBK+h9Cnfz5Z/fv
        6aQJ2/ocXLCvAMJTSTxwgPhv/PEm0k4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-qP6MSV5IP5yxMfUeXMlG3w-1; Tue, 09 Mar 2021 13:59:32 -0500
X-MC-Unique: qP6MSV5IP5yxMfUeXMlG3w-1
Received: by mail-ed1-f72.google.com with SMTP id w18so4438263edu.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Mar 2021 10:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kiTVUES8vuZVl3f+K0HPi56Y64nEHybIHmhWCkJ5UXQ=;
        b=C4Lxi76us7rjoBhLnqjXxrTIr2Uqn+uss/434M1hLtYjD7XpOobYYIiW1E/jSRzo1A
         CuhWLrzcd2hT8ciRjwR5rbkHt2rrx03rlLShamuTaQ6Qmm4h8MH7/QgjJjqpoD5rU0zA
         JBFSNkbJIiTp+otZeICvsDq25wVPEFxIusAQhobIoS8A87lQ8n8szZvztufa0k3/eWpq
         ALxo9zOdkLYgySpRWkl+A6HalyI7aPS4VjiT+MssTPYwIMvqFNIXR8dQ9IshJHPmYWwX
         WTbcUpiHj27LNTepByRMzmOJtHq698cKb31zbLMfEnC+uVrKSXRlT7qwu2j2JVz80oeN
         bXkg==
X-Gm-Message-State: AOAM533VAqVhCS2Y9yKHENMsSUzTMAkvxHDOsQmVeoAG/Ju6dYL4ACXV
        0nbNNgFcrWNjos7305Cjx0peNDhoiTtDxp4ZAJ6O/CcsDkh7AqwIXe6ULlYP73M33xQcY7By8L/
        a7SM1q1BNaqHC+KTgTp38z20v5uiC2AFn1WZPFwNfEcq5k3kTnvJU5gsjWcnFspke0ihwcE5yxT
        0xQEFfPA/6oA==
X-Received: by 2002:a17:907:d8a:: with SMTP id go10mr22145780ejc.46.1615316371333;
        Tue, 09 Mar 2021 10:59:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYfMQ890bIIJkVycr+ggzTu4KM8aNL2+u0yGwuNutOnRSUNapgRQXWRcxMv5fsU3B5qhS73w==
X-Received: by 2002:a17:907:d8a:: with SMTP id go10mr22145743ejc.46.1615316371195;
        Tue, 09 Mar 2021 10:59:31 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id k22sm9276950edv.33.2021.03.09.10.59.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Mar 2021 10:59:30 -0800 (PST)
Subject: Re: [GIT PULL] Immutable branch between MFD and Platform/X86 due for
 the v5.13 merge window
To:     Lee Jones <lee.jones@linaro.org>,
        "David E. Box" <david.e.box@linux.intel.com>
Cc:     mgross@linux.intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20210128172846.99352-1-david.e.box@linux.intel.com>
 <20210224201005.1034005-1-david.e.box@linux.intel.com>
 <20210309181206.GT4931@dell>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <4b282693-95c5-a738-e114-ae07f6e113fc@redhat.com>
Date:   Tue, 9 Mar 2021 19:59:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210309181206.GT4931@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Lee,

On 3/9/21 7:12 PM, Lee Jones wrote:
> Enjoy!
> 
> The following changes since commit fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8:
> 
>   Linux 5.12-rc1 (2021-02-28 16:05:19 -0800)

I thought we were supposed to avoid using 5.12-rc1 as a base to avoid people
hitting the swapfile related disk-corruption when bisecting?

See: https://lwn.net/Articles/848431/

So it might be better to redo this branch with 5.12-rc2 as a base ?

Regards,

Hans


> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-platform-x86-v5.13
> 
> for you to fetch changes up to ccafe3126ad3f48ea1cd9ae460c69d1ba879fb65:
> 
>   mfd: intel_pmt: Add support for DG1 (2021-03-09 17:05:25 +0000)
> 
> ----------------------------------------------------------------
> Immutable branch between MFD and Platform/X86 due for the v5.13 merge window
> 
> ----------------------------------------------------------------
> David E. Box (2):
>       mfd: intel_pmt: Fix nuisance messages and handling of disabled capabilities
>       mfd: intel_pmt: Add support for DG1
> 
>  drivers/mfd/intel_pmt.c                    | 112 +++++++++++++++++++----------
>  drivers/platform/x86/intel_pmt_class.c     |  46 ++++++++++++
>  drivers/platform/x86/intel_pmt_class.h     |   1 +
>  drivers/platform/x86/intel_pmt_telemetry.c |  20 ------
>  4 files changed, 122 insertions(+), 57 deletions(-)
> 

