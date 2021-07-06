Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862BBC07E96
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 11:11:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6438A61C1A
	for <platform-driver-x86@archiver.kernel.org>; Tue,  6 Jul 2021 11:11:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231569AbhGFLNo (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 6 Jul 2021 07:13:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48095 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229834AbhGFLNn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jul 2021 07:13:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625569864;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9kuUHAECMKavLk/WcvBJoLEIR+Gp7azqYD++WDj4XmA=;
        b=SfTWRaqBSZuy3AVkCzs3z3GApoxF6NDEiicimhBRZbFQyJSyg//fPavlKFrcg40uvSUShQ
        cBHOrKrziUcIw4RQY49mJk+ftjUUlGVVAhHNHcdtc+yF+wzjZY9UuYevdou6IZ466VAPXU
        sooRDCeEkdMejJ9HUO6h/9Uo8xm34+M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-120-0AiL3Zo7NiWvb_CUUdOXyg-1; Tue, 06 Jul 2021 07:11:03 -0400
X-MC-Unique: 0AiL3Zo7NiWvb_CUUdOXyg-1
Received: by mail-ej1-f70.google.com with SMTP id d21-20020a1709063455b02904c609ed19f1so5681195ejb.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jul 2021 04:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9kuUHAECMKavLk/WcvBJoLEIR+Gp7azqYD++WDj4XmA=;
        b=L0InINGSnSpt2zC8u8nKBGf7GFpMKzjmRDFdZLzcZcUc1ieZEMK/yVDzO8rQ0luvN4
         0aAcBDNOD9MbBc4oFAdR76hAOh10WfjB4+qTquL32qYLXn0ynylDw8K7GKfBskUCiAgF
         LMk4uj/q+vcbnYZBE3Tb+1pYUn+u2Xl+AEG9x47a7ij4hzDj348WnVvHapicr8+VCsGs
         n8CNdJ+3hxHL4ta0eZFQjz+rtOISwZhEKp36Y4TUUGJHnZDoN47LoMcO2sHrgvWKIWOM
         7gbTRbEf2tlZXnwh5mMKAfcU+L8YemvctY4maa67ljsOqzztToau7LfeyYgaAIX/V2lL
         24Pg==
X-Gm-Message-State: AOAM5336s6oDJiMt2nEHn3WTlMPREeF3CslBksZagE6bfrM/+9vIfu3g
        fnyapcvksl/YegCWFAwfkTBmcRB/gT5Jy5eRHzsMYkbieuB/pZI1PNbul78q+LbixKKyQAmi5AZ
        7U+rMJsILWej1myP0JZaA2io462/2ZqfqsA==
X-Received: by 2002:a17:906:bc2:: with SMTP id y2mr17811022ejg.489.1625569862093;
        Tue, 06 Jul 2021 04:11:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFkzHYBJ5IZYwRgpEVIVxWy11ry/uHTPEE7IZRVW6Or/SV39pT3eEI+kiKq0Q6wS7X1IMuZw==
X-Received: by 2002:a17:906:bc2:: with SMTP id y2mr17811006ejg.489.1625569861873;
        Tue, 06 Jul 2021 04:11:01 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ar7sm2196707ejc.64.2021.07.06.04.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 04:11:01 -0700 (PDT)
Subject: Re: [PATCH v1 0/4] Add Alder Lake PCH-S support to PMC core driver
To:     Gayatri Kammela <gayatri.kammela@intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     mgross@linux.intel.com, irenic.rajneesh@gmail.com,
        Srinivas Pandruvada <srinivas.pandruvada@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        David Box <david.e.box@intel.com>
References: <cover.1625191274.git.gayatri.kammela@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <730127ef-9569-9c16-08f9-6d86b4e18337@redhat.com>
Date:   Tue, 6 Jul 2021 13:11:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <cover.1625191274.git.gayatri.kammela@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/2/21 4:19 AM, Gayatri Kammela wrote:
> Hi,
> The patch series add Alder Lake PCH-S support to PMC core driver.
> 
> Patch 1: Add Alderlake support to pmc_core driver
> Patch 2: Add Latency Tolerance Reporting (LTR) support to Alder Lake
> Patch 3: Add Alder Lake low power mode support for pmc_core
> Patch 4: Add GBE Package C10 fix for Alder Lake
> 
> David E. Box (1):
>   platform/x86: intel_pmc_core: Add GBE Package C10 fix for Alder Lake
>     PCH
> 
> Gayatri Kammela (3):
>   platform/x86: intel_pmc_core: Add Alderlake support to pmc_core driver
>   platform/x86: intel_pmc_core: Add Latency Tolerance Reporting (LTR)
>     support to Alder Lake
>   platform/x86: intel_pmc_core: Add Alder Lake low power mode support
>     for pmc_core
> 
>  drivers/platform/x86/intel_pmc_core.c | 307 +++++++++++++++++++++++++-
>  drivers/platform/x86/intel_pmc_core.h |  17 ++
>  2 files changed, 321 insertions(+), 3 deletions(-)
> 
> Cc: Srinivas Pandruvada <srinivas.pandruvada@intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: David Box <david.e.box@intel.com>
> 
> base-commit: 62fb9874f5da54fdb243003b386128037319b219

Thanks, the series looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

For the series. As Andy already mentioned we are trying to move all
the Intel files to drivers/platform/x86/intel. Can you please send
a new version with an extra patch which first moves all the

drivers/platform/x86/intel_pmc_*.c files to: drivers/platform/x86/intel/pmc
and then apply the 4 patches from this series on top, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=72fbcac2f40e690e1a5584358750e546a2678c2c

For an example of a commit moving files to under drivers/platform/x86/intel/<subdir>

Regards,

Hans

