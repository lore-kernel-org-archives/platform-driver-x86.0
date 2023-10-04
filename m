Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43E8E7B5E1
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Oct 2023 09:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241777AbjJDJ5G (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Oct 2023 05:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232999AbjJDJ5F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Oct 2023 05:57:05 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BED1BF
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Oct 2023 02:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1696413375;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t3llrRzvIKILbc5TgXedn7Q8bVVVp8C9PO7vaMagqQM=;
        b=RHxe+x1cWZHMk9urU3wrTqYaNfByBUQtDPHDHOFlO8dPaE5LRx5hWam2bmEARJG6VVcuLI
        66+c7K38N7QHg1wo2kEWuNVOOe3K5R8tvkNh4THRo+6kRh6Ys44PZw9UfLG/hvyE3WcMYr
        JgbpgtY+8xLUgwzAKJ6JjisZFKDNwrM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-7-Eu24C_M5eeEnfc_LsooQ-1; Wed, 04 Oct 2023 05:55:58 -0400
X-MC-Unique: 7-Eu24C_M5eeEnfc_LsooQ-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-538ed3724bcso195957a12.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Oct 2023 02:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696413357; x=1697018157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3llrRzvIKILbc5TgXedn7Q8bVVVp8C9PO7vaMagqQM=;
        b=cycGAkjUiUz/dmnPvhIr0GTir58LSon8nuGfNYdg2pVIssB05ZvE6r9KA6DLKXNOXv
         yXCGmWOupJDwcoIPu/PmphPCfQ5XkJu1kfMsFwJD5K+uU0zJf40OyB7cvu29ot2drh6y
         utePVbLTvXCYvCgT552+GRA2JzbQbzAGrLiCvIiF8L6uNGZFONMYlWRUwRtQKXCljvCr
         S7G+RmysjxSzxQKR0YGxfzAHvYjZk4loIOl0eSyuGQzcNqWXgT9+Kq4+h5d2HFN9/9qC
         v34BNmoPvR6p92H1Xm11//xhmrnIS9w+KDt9jAd3CP99rxg7hm1wfDI1CKJijmW/JLdy
         4Hfg==
X-Gm-Message-State: AOJu0Ywu9pn1oYd43Lw0vQ70yMRkV+b2yUax48+bcY5yh9vvLu/rpoZ9
        AsIFFXMqq+Dqgwe8Ad8xuj3FzinZ+7Ib1j5h9MvpiYzfXSzuuAlVmmj8Lb8WGdb3ytpAK2DGZoH
        CIPUKuA5Woa3Or6O8vGfn49bA/0SLHlERYA==
X-Received: by 2002:a50:fb12:0:b0:536:e03f:62b6 with SMTP id d18-20020a50fb12000000b00536e03f62b6mr1522891edq.30.1696413357195;
        Wed, 04 Oct 2023 02:55:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9V7fiXYUDKWE6UMTUNBgtOKzLLtTO5ZqS9lXx9adtCMpIzRBwm8IhSJIk/MU1t/HJfHyOtg==
X-Received: by 2002:a50:fb12:0:b0:536:e03f:62b6 with SMTP id d18-20020a50fb12000000b00536e03f62b6mr1522871edq.30.1696413356839;
        Wed, 04 Oct 2023 02:55:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dy26-20020a05640231fa00b005256771db39sm2170533edb.58.2023.10.04.02.55.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 02:55:56 -0700 (PDT)
Message-ID: <bce65f65-66d9-3242-4656-7b2266a0e010@redhat.com>
Date:   Wed, 4 Oct 2023 11:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] platform/x86/intel/ifs: release cpus_read_lock()
Content-Language: en-US, nl
To:     Jithu Joseph <jithu.joseph@intel.com>, markgross@kernel.org
Cc:     ashok.raj@intel.com, tony.luck@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev
References: <20230927184824.2566086-1-jithu.joseph@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230927184824.2566086-1-jithu.joseph@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/27/23 20:48, Jithu Joseph wrote:
> Couple of error paths in do_core_test() was returning directly without
> doing a necessary cpus_read_unlock().
> 
> Following lockdep warning was observed when exercising these scenarios
> with PROVE_RAW_LOCK_NESTING enabled:
> 
> [  139.304775] ================================================
> [  139.311185] WARNING: lock held when returning to user space!
> [  139.317593] 6.6.0-rc2ifs01+ #11 Tainted: G S      W I
> [  139.324499] ------------------------------------------------
> [  139.330908] bash/11476 is leaving the kernel with locks still held!
> [  139.338000] 1 lock held by bash/11476:
> [  139.342262]  #0: ffffffffaa26c930 (cpu_hotplug_lock){++++}-{0:0}, at:
> do_core_test+0x35/0x1c0 [intel_ifs]
> 
> Fix the flow so that all scenarios release the lock prior to returning
> from the function.
> 
> Fixes: 5210fb4e1880 ("platform/x86/intel/ifs: Sysfs interface for Array BIST")
> Cc: stable@vger.kernel.org
> Signed-off-by: Jithu Joseph <jithu.joseph@intel.com>

Thank you for your patch/series, I've applied this patch
(series) to the pdx86 fixes branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in the pdx86 fixes branch once I've pushed
my local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans





> ---
>  drivers/platform/x86/intel/ifs/runtest.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/ifs/runtest.c b/drivers/platform/x86/intel/ifs/runtest.c
> index 1061eb7ec399..43c864add778 100644
> --- a/drivers/platform/x86/intel/ifs/runtest.c
> +++ b/drivers/platform/x86/intel/ifs/runtest.c
> @@ -331,14 +331,15 @@ int do_core_test(int cpu, struct device *dev)
>  	switch (test->test_num) {
>  	case IFS_TYPE_SAF:
>  		if (!ifsd->loaded)
> -			return -EPERM;
> -		ifs_test_core(cpu, dev);
> +			ret = -EPERM;
> +		else
> +			ifs_test_core(cpu, dev);
>  		break;
>  	case IFS_TYPE_ARRAY_BIST:
>  		ifs_array_test_core(cpu, dev);
>  		break;
>  	default:
> -		return -EINVAL;
> +		ret = -EINVAL;
>  	}
>  out:
>  	cpus_read_unlock();
> 
> base-commit: 6465e260f48790807eef06b583b38ca9789b6072

