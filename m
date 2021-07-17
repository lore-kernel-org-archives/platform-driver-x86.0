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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD8BC636CA
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 10:27:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB89B613D4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 17 Jul 2021 10:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233189AbhGQKaV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 17 Jul 2021 06:30:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34833 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229471AbhGQKaV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 17 Jul 2021 06:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1626517644;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vW7VhH2JVTl/tnbJV2Ttu+znaHsVaeNTgyFVMxtvZ1A=;
        b=LhlE4p7ZHxDSk9/gveb6hiPFnYWX0q/EcnOMkYCo2u5vhIurtAtV4AzxQPvovThRG7u8XG
        y61hBI0qudcMVpKIwbQj1m6J7/G7LhKJsWhx+kp9srazzGM5pE0gwEFkMo7FpIcV+QJ6Bj
        K34fPCE/OvSGRPw0JfFIJKEpXNre6Eo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-Rw7cIgpuPu6lgHK2Q8689Q-1; Sat, 17 Jul 2021 06:27:21 -0400
X-MC-Unique: Rw7cIgpuPu6lgHK2Q8689Q-1
Received: by mail-ed1-f71.google.com with SMTP id e3-20020a0564020883b029039ef9536577so6133271edy.5
        for <platform-driver-x86@vger.kernel.org>; Sat, 17 Jul 2021 03:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vW7VhH2JVTl/tnbJV2Ttu+znaHsVaeNTgyFVMxtvZ1A=;
        b=eMkZAvKWT85KNwm+RyiNmiKpEiiGSfRpuDNcXUeRTc1m7NKMzJEXZiGznkZM4cGJvU
         v+tb4mOYyk78/99GuQYYCiENPPGXtNIId/mgoSVXoFSQEhkJ78F8tXqSAChoHez7pp/O
         c8wAlYeN8bBG0gLCXEHgJSQA31tLhxGY7bIgLZ6NuBYKJniyMgh4Ho5n6XY0VHobN861
         UQSmlM2cc7QoAVcCCA8q1vA1OATnAIJSJksdbAu0ikSrvHkmSluAOevZD0BjR/ppyh/A
         iAvegpDJ1DNXUEnL2dpXw2JYw7BEndSkrrthzNqm+k3YoHr7R11xkpPZONxCGR/W0aes
         9gNQ==
X-Gm-Message-State: AOAM533nai4PM24zXQmMMttiCYsDnOoT0tTjFGwLcgMUljviyYXXxxO0
        EWlqjBJ3me4ByAExTYi6moVDOmOZWNKHaP3HmMoQ4bL9RsgZjES91uQEyJo2ZROjqtpX5wB8L1A
        1HMuviHS6hqGXUyeWNlyNSXtB539obBklCQ==
X-Received: by 2002:a17:906:fa8e:: with SMTP id lt14mr16593797ejb.21.1626517640589;
        Sat, 17 Jul 2021 03:27:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLlhNgCR87Txdj+JyPgVEvgja8Gg+AJzKv8PZDKl3QoK8WgPhq2XQ/9oPanKe6ybGEx4JLEQ==
X-Received: by 2002:a17:906:fa8e:: with SMTP id lt14mr16593786ejb.21.1626517640398;
        Sat, 17 Jul 2021 03:27:20 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id l18sm4810129eds.72.2021.07.17.03.27.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jul 2021 03:27:20 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: amd-pmc: Fix undefined reference to
 __udivdi3
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org,
        Randy Dunlap <rdunlap@infradead.org>
References: <20210716153802.2929670-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <09227138-1638-ee63-f42b-ffdfeee910c0@redhat.com>
Date:   Sat, 17 Jul 2021 12:27:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716153802.2929670-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/16/21 5:38 PM, Shyam Sundar S K wrote:
> It was reported that on i386 config
> 
> ------
> on i386:
> 
> ld: drivers/platform/x86/amd-pmc.o: in function `s0ix_stats_show':
> amd-pmc.c:(.text+0x100): undefined reference to `__udivdi3'
> -------
> 
> The reason for this is that 64-bit integer division is not supported
> on 32-bit architecture. Use do_div macro to fix this.
> 
> Fixes: b9a4fa6978be ("platform/x86: amd-pmc: Add support for logging s0ix counters")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also apply this to the fixes branch and include it in my
upcoming v5.14 pdx86 fixes pull-req to Linus.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/x86/amd-pmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index 680f94c7e075..45ce1d5e1e6d 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -189,7 +189,8 @@ static int s0ix_stats_show(struct seq_file *s, void *unused)
>  	exit_time = exit_time << 32 | ioread32(dev->fch_virt_addr + FCH_S0I3_EXIT_TIME_L_OFFSET);
>  
>  	/* It's in 48MHz. We need to convert it */
> -	residency = (exit_time - entry_time) / 48;
> +	residency = exit_time - entry_time;
> +	do_div(residency, 48);
>  
>  	seq_puts(s, "=== S0ix statistics ===\n");
>  	seq_printf(s, "S0ix Entry Time: %lld\n", entry_time);
> 

