Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC7BC433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 19:32:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FE556143B
	for <platform-driver-x86@archiver.kernel.org>; Wed, 21 Apr 2021 19:32:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242502AbhDUTc6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 21 Apr 2021 15:32:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59622 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240272AbhDUTc5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Apr 2021 15:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619033544;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1BBZbDPdoILFAbDCTmIR8WakICnxwYOnEVliMh8JCfw=;
        b=Om1GGWAQJTxZsulkCqVWJ2pm7NebDXE8LQ/DQbTVW9g316P2a0C9TRMut4vAnefSOOKADD
        e0VSOxZNiq7lSUdE1DiLoyZvG0GoYWCD5QfgB6pXHm9XHorKhktNsgtjZqcvqPTkkdUaFs
        eoMAcWmIRsrNgtm+ukXiOkOfZMMAkE4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-Bx6KkAVvNBevjOgVjSC1ZA-1; Wed, 21 Apr 2021 15:32:21 -0400
X-MC-Unique: Bx6KkAVvNBevjOgVjSC1ZA-1
Received: by mail-ed1-f72.google.com with SMTP id l22-20020a0564021256b0290384ebfba68cso11718242edw.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Apr 2021 12:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1BBZbDPdoILFAbDCTmIR8WakICnxwYOnEVliMh8JCfw=;
        b=kI61URzD+IGHZDziYUEf9cYKYsO5MRnUFPL43G0UDHK2eo65ZJ22Y3hVtqnnamwxsP
         wIAK/LqjDLCUG8JoYRJ7bApRtmzLFZaZ8Xx5wzc56h4bavyHf3sTEgAoah1UjJNQHYD3
         sCMqK10UWeh2uNHZKzmBIyxWoK0hSt2d9aC9vu9iFlwEG+h3aX36N8cveq4KnQsTd0Pv
         scS9p1AOysCmaFeboVSS+mVQg5UofB/ZIbhQIyvmaD0pAaxwcazqLPPReeIj0Lk+J5QE
         +WkRtITHm1KL32/msUuskpMJ8B/SC4LTp/WDdKY382iKm7LjxZQJQQFi1xAm/sEtheIH
         1t8w==
X-Gm-Message-State: AOAM530lcHBSdRJ5Ya4rOGZopdrm0xopWmYMAgcGAFAjiNhx8fgkkBnS
        R6g+SDIrkRg7L3YoS0ksOLphfP/B2xvZAmm024aQYCS7kECjCIt6oCZWVDClpqw/CPU9CuyCuO5
        AXPxUaVjd0AHBg9rI3HK3HQCSx5ASNBaTnw==
X-Received: by 2002:a17:906:49c1:: with SMTP id w1mr35176157ejv.178.1619033540664;
        Wed, 21 Apr 2021 12:32:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdRpxiINqsS4aMzDxg+dVxuQVoOGhMEjSyLCURLTc1al9CQeb0bDFM8n1U/vBFgVyVwEwFUw==
X-Received: by 2002:a17:906:49c1:: with SMTP id w1mr35176126ejv.178.1619033540350;
        Wed, 21 Apr 2021 12:32:20 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gn19sm287812ejc.68.2021.04.21.12.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Apr 2021 12:32:19 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: intel_pmc_core: Uninitialized data in
 pmc_core_lpm_latch_mode_write()
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Cc:     David E Box <david.e.box@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <YIBCf+G9Ef8wrGJw@mwanda>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ad05f502-b3dc-b62f-1f9f-ca8c806e1e3c@redhat.com>
Date:   Wed, 21 Apr 2021 21:32:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YIBCf+G9Ef8wrGJw@mwanda>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/21/21 5:19 PM, Dan Carpenter wrote:
> The simple_write_to_buffer() can return success if even a single byte
> is copied from user space.  In this case it can result in using
> uninitalized data if the buf[] array is not fully initialized.  Really
> we should only succeed if the whole buffer is copied.
> 
> Just using copy_from_user() is simpler and more appropriate.
> 
> Fixes: 8074a79fad2e ("platform/x86: intel_pmc_core: Add option to set/clear LPM mode")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> v2: The first version of this patch returned -EINVAL if userspace didn't
> give us NUL terminated strings.  That's not necessarily a good
> assumption.
> 
> This patch is just simpler as well.  No need to introduce the "len"
> variable because "count" is capped at the start of the function.

Much better, thank you.

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




>  drivers/platform/x86/intel_pmc_core.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index d174aeb492e0..b0e486a6bdfb 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -1360,17 +1360,13 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
>  	struct pmc_dev *pmcdev = s->private;
>  	bool clear = false, c10 = false;
>  	unsigned char buf[8];
> -	ssize_t ret;
>  	int idx, m, mode;
>  	u32 reg;
>  
>  	if (count > sizeof(buf) - 1)
>  		return -EINVAL;
> -
> -	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, ppos, userbuf, count);
> -	if (ret < 0)
> -		return ret;
> -
> +	if (copy_from_user(buf, userbuf, count))
> +		return -EFAULT;
>  	buf[count] = '\0';
>  
>  	/*
> 

