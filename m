Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDB2C433B4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Apr 2021 15:03:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 546D1610CC
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Apr 2021 15:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbhDTPDi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Apr 2021 11:03:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37821 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232450AbhDTPDi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Apr 2021 11:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618930986;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rt7NKGaDjHDmt2xUfgF5jDi+mP8ivKolM0XswNMHLOA=;
        b=FWLJj0m1+VFaOj7ZtyHph9wn5au3sOBaZ4q8mn8hicPiFSKevewACfR7et5vPEAqa176Rm
        I2U/F2k1BA+EgjEpgXAmCqT4eZc7GaEbzqh5KxybQF+UL+BaVX2gnCLcjzsNzfupZ2XiZc
        on/wZ9X6pI/ZF7opRodS/SMSRxwaHiM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-404-MLIb4fB7OUqiAIpxo4YiDw-1; Tue, 20 Apr 2021 11:02:50 -0400
X-MC-Unique: MLIb4fB7OUqiAIpxo4YiDw-1
Received: by mail-ed1-f69.google.com with SMTP id cz7-20020a0564021ca7b02903853d41d8adso3984115edb.17
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Apr 2021 08:02:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rt7NKGaDjHDmt2xUfgF5jDi+mP8ivKolM0XswNMHLOA=;
        b=BS9MR0H6nq6NDC6KXuQ68J9dGDNuOR7NjD+yafd86G9f48lG1XVKRNRc7uh0+1Dvdi
         84v6gwAQgMbNvO0ylN9CamdUFkk6q/kKtADIDUadJoR0fMiDa0X7nTK5h7Xgsu05d8TD
         rUjosdPQkabF5SkgBRR0ZW3QiYVmH0occIjqGxuzvt1K4bi6F1D4DVTxeI6xf6vgcNnR
         huWSfeucfvm8U7dxwZ2ygoKmOL8EF0g4NfXs4VZ/bfzqva6GxPASrCdZ6WnAFU3GCwBa
         pRSAXy7Hwar46E6yTprO1ODvj1tSqDQx2zi9I/2Btil11eTpnjT/WrdDXn4Mepo2gU2a
         2VtQ==
X-Gm-Message-State: AOAM533eJZwZnJc7OvVl3RQzi6T2kt3F3O0q6CX8Xx+H9PuHtMTbveCd
        oo0IxwEYBupTQsCVnQWCA9BzLpOGLwudg8EeMwwmiyd4ZjU7Qqn1V7AKKgT0qRnQa6CLd/wHWRY
        No0Zc4JWqlhWmGnt3GwPQ+kE5BhaewYM0Qg==
X-Received: by 2002:a17:906:13d6:: with SMTP id g22mr28063986ejc.475.1618930969858;
        Tue, 20 Apr 2021 08:02:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8mzqn6L2EwFc7Dx0OfYgYfDc/bUY8zJsA2Mtisctwz4KFSvxkXRHeKmP7F7oY7klb0bilcA==
X-Received: by 2002:a17:906:13d6:: with SMTP id g22mr28063975ejc.475.1618930969667;
        Tue, 20 Apr 2021 08:02:49 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id bu20sm1745180ejb.76.2021.04.20.08.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 08:02:49 -0700 (PDT)
Subject: Re: [PATCH][next] platform/x86: intel_pmc_core: fix unsigned variable
 compared to less than zero
To:     Colin King <colin.king@canonical.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210420121044.379350-1-colin.king@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ba5a2360-68b2-a3e6-c379-5122e698bfca@redhat.com>
Date:   Tue, 20 Apr 2021 17:02:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420121044.379350-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Colin,

On 4/20/21 2:10 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The check for ret < 0 is always false because ret is a (unsigned) size_t
> and not a (signed) ssize_t, hence simple_write_to_buffer failures are
> never detected. Fix this by making ret a ssize_t
> 
> Addresses-Coverity: ("Unsigned compared against 0")
> Fixes: 8074a79fad2e ("platform/x86: intel_pmc_core: Add option to set/clear LPM mode")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thank you for the patch, but I already send out the same patch myself
yesterday, so this is a duplicate.

Regards,

Hans



> ---
>  drivers/platform/x86/intel_pmc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 3ae00ac85c75..d174aeb492e0 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -1360,7 +1360,7 @@ static ssize_t pmc_core_lpm_latch_mode_write(struct file *file,
>  	struct pmc_dev *pmcdev = s->private;
>  	bool clear = false, c10 = false;
>  	unsigned char buf[8];
> -	size_t ret;
> +	ssize_t ret;
>  	int idx, m, mode;
>  	u32 reg;
>  
> 

