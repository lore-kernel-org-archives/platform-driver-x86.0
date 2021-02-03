Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A164C433DB
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 12:12:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A44C64E46
	for <platform-driver-x86@archiver.kernel.org>; Wed,  3 Feb 2021 12:12:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234220AbhBCMMb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 3 Feb 2021 07:12:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47249 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234343AbhBCMMa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 07:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612354263;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eNrxU4m48kCXgurPGNqZF1Ysv2wFEFXV5yTwl2DTSK0=;
        b=hvXdGwF/v9WgJxDSQco7gwvt+A++Nf7UITCgXC7VEPjqxe2hm/ZfkXaIHtp5xK/CpSAY3S
        m9Iiiff7shhoZj16E/s+vC4CEpIO8+B5Ao2nZg1SEAUjMlDAQDKZIkagwoXU8H7IO72rmu
        zyQikU/IDct58FHurdnr3l3//8/lQc0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-R4j3pQCLMOGtczxt2vvlog-1; Wed, 03 Feb 2021 07:11:02 -0500
X-MC-Unique: R4j3pQCLMOGtczxt2vvlog-1
Received: by mail-ed1-f72.google.com with SMTP id m18so11343533edp.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 03 Feb 2021 04:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eNrxU4m48kCXgurPGNqZF1Ysv2wFEFXV5yTwl2DTSK0=;
        b=UXLSln55C8PbxmSCUSmPhGHv3rMRfs8CAd2kqWGAjSozRXn4+QclT8w/W1jG5AEItc
         FdmpvTrMUuVkduAOemdDIMW0RbteToIwpJsNmUgE9GauAuhpbT+cREsIlAV5fssMR6bW
         FxT07XVcgwImXg828Ig8LlgLt/1J7uvTLZxRW4XeWRVgAXJ3r/Y39ea/az/ehzJ5at1i
         PnFbR3bSgluHJVCnbPY2loB/XTB7tWMVZSGCGzeC0iX//OEiiExR/p8eAW1dWwDFtNfn
         xbjjdV0WNFv6s8c7EvzQr0QnyF0wzY1I9W9UiOyVX8uM49l5UhckoeGTTIv3YgHgvVs+
         /Skw==
X-Gm-Message-State: AOAM530Vl+6E/hFgAfWQapIVm+VJSJjG/eyrrkmK2EjS6sK7NNnCAG4u
        hLdSMTaYKV/hU3q9Kbx0bBM0SxJDHHJVcDPYLpHd3MShOHrP4CepmAuSo1kgELp6LHKqHaNkrU9
        c57SrhMODBn13jsLBxheMomxphoIKswYl/w==
X-Received: by 2002:a05:6402:28e:: with SMTP id l14mr2655192edv.19.1612354261230;
        Wed, 03 Feb 2021 04:11:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVY6WTifrvLloI9VZH53nxwFUdupvWyj8T1hKEqfyzVNm9BOeA7KMLBND0m5A15QUVT1xy7w==
X-Received: by 2002:a05:6402:28e:: with SMTP id l14mr2655173edv.19.1612354261102;
        Wed, 03 Feb 2021 04:11:01 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id u9sm918518ejc.57.2021.02.03.04.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Feb 2021 04:11:00 -0800 (PST)
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: Add Sapphire Rapids
 server support
To:     Artem Bityutskiy <dedekind1@gmail.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210203114320.1398801-1-dedekind1@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <957581dd-bf8f-de6e-22dd-a0102d5de01f@redhat.com>
Date:   Wed, 3 Feb 2021 13:10:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210203114320.1398801-1-dedekind1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/3/21 12:43 PM, Artem Bityutskiy wrote:
> From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> 
> Sapphire Rapids uncore frequency control is the same as Skylake and Ice Lake.
> Add the Sapphire Rapids CPU model number to the match array.
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Reviewed-by: Tony Luck <tony.luck@intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/intel-uncore-frequency.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel-uncore-frequency.c b/drivers/platform/x86/intel-uncore-frequency.c
> index 12d5ab7e1f5d..3ee4c5c8a64f 100644
> --- a/drivers/platform/x86/intel-uncore-frequency.c
> +++ b/drivers/platform/x86/intel-uncore-frequency.c
> @@ -377,6 +377,7 @@ static const struct x86_cpu_id intel_uncore_cpu_ids[] = {
>  	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_X,	NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_X,	NULL),
>  	X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_D,	NULL),
> +	X86_MATCH_INTEL_FAM6_MODEL(SAPPHIRERAPIDS_X, NULL),
>  	{}
>  };
>  
> 

