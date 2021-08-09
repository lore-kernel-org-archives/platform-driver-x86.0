Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB7FC4338F
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Aug 2021 09:01:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B52F60EE7
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Aug 2021 09:01:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234164AbhHIJBY (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Aug 2021 05:01:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48145 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234114AbhHIJBY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Aug 2021 05:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628499663;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FoO0nUKoGU4+yW1m7cbdBKZwkrdjkhDY5qQ8aeTmSZA=;
        b=UNZXXki0Zmg106X2fx8T42dkrAmh47AaCpjbfOXbO6ZKtvzFPFN6SCh2XWDe85rsszWTR6
        VbnwwQKK3EyjxgEsCfDpEOhECmoIQNs4K1Rh2CWIh8accPpQQE7JrrsHBug26xAg4EBbPr
        KATcW5U3oCiQnAkTjbabiRxG5W/l0Dk=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-5VvKcTZUON20OwAgG9uw5A-1; Mon, 09 Aug 2021 05:01:00 -0400
X-MC-Unique: 5VvKcTZUON20OwAgG9uw5A-1
Received: by mail-ej1-f71.google.com with SMTP id k12-20020a170906680cb02905aeccdbd1efso661555ejr.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Aug 2021 02:01:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FoO0nUKoGU4+yW1m7cbdBKZwkrdjkhDY5qQ8aeTmSZA=;
        b=XB6hUoxPSJ+SLwzuCWKko4YhHEMmhFykU1lAtQH5jXtvUDAjuiQQ1KIVWtvWnQA8pR
         0R5/vmO2zCWpKZtMZ+3w2ViAYrvJW7tNwMqrfjPbX5wFGsU5C2Xan61QKGdkWeUYDMiy
         LiIb8jzZBxNrx1PXHoqHnjsPxr7s3KwSPLAFAWUVIeb22ZeQm2cnZfgldxTZAvIoFpEJ
         YDi3zKO7CNhDwot9af87ocedXv1rccoWBfvjLAHBl4vz+mpGHATOlDrZ3qPOAq6IPcX+
         fNPQKHVg556MRgNwwwZ71Zq7bpi3bwM8tuliLBEucUOzuPJ+r05ek77VsCmjq7oiMMJa
         Y04g==
X-Gm-Message-State: AOAM533ieVRShnLkJvdZpGF9bDFErYVIWX7ZX4ZgSiycDwdqiC3Jfp84
        p25bBLOnA1z6Krkqfmdy5YfPZfpEvcUb0AnSXZuLtyvGLeaHJnQqKst0qMvC1dvNqvolyR1JpN6
        GnT/lzn0scFKchn5DsGTIfUQ/lgFfHg3nrA==
X-Received: by 2002:aa7:d499:: with SMTP id b25mr264723edr.360.1628499659227;
        Mon, 09 Aug 2021 02:00:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzciqT2dLJpKtZTsjmfVHRPiQE1ErZUf+FdcUCtHWDBh7wF3C/mmtt1TDR33+wvBc5LmB/EFQ==
X-Received: by 2002:aa7:d499:: with SMTP id b25mr264710edr.360.1628499659137;
        Mon, 09 Aug 2021 02:00:59 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id o17sm5666699ejb.84.2021.08.09.02.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 02:00:58 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] platform/x86/intel: int3472: Use y instead of objs
 in Makefile
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Daniel Scally <djrscally@gmail.com>,
        Mark Gross <mgross@linux.intel.com>
References: <20210806154951.4564-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5ac33176-3c70-681c-578b-639af929c0f4@redhat.com>
Date:   Mon, 9 Aug 2021 11:00:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806154951.4564-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/6/21 5:49 PM, Andy Shevchenko wrote:
> The 'objs' is for user space tools, for the kernel modules
> we should use 'y'.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

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
>  drivers/platform/x86/intel/int3472/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/Makefile b/drivers/platform/x86/intel/int3472/Makefile
> index 48bd97f0a04e..2362e04db18d 100644
> --- a/drivers/platform/x86/intel/int3472/Makefile
> +++ b/drivers/platform/x86/intel/int3472/Makefile
> @@ -1,5 +1,5 @@
>  obj-$(CONFIG_INTEL_SKL_INT3472)		+= intel_skl_int3472.o
> -intel_skl_int3472-objs			:= intel_skl_int3472_common.o \
> +intel_skl_int3472-y			:= intel_skl_int3472_common.o \
>  					   intel_skl_int3472_discrete.o \
>  					   intel_skl_int3472_tps68470.o \
>  					   intel_skl_int3472_clk_and_regulator.o
> 

