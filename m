Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF5FC433ED
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Apr 2021 15:02:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7475261104
	for <platform-driver-x86@archiver.kernel.org>; Tue, 20 Apr 2021 15:02:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbhDTPC6 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 20 Apr 2021 11:02:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33495 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232682AbhDTPC5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Apr 2021 11:02:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1618930944;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LOuxmsinNUEghHsSk9wjmamm7+xO1TJQ6v8YtLtqUfE=;
        b=ANCCS/2N1XC6lGqiKJuYTt/H7IQm8NiXFk3T/EUa+jTudKOt0+MR3jzbCFYntI3AEndatg
        O3NQqjdoh6Z2+DUoAmtZxFZAxTDc5XlyB35XzUEde8piFSdKKP4AaPnp2S8y/60iK1WdAq
        H9wNlNJGd2sIvD+c6J6Ok3PRS4Kl93g=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-NIp9daP0O4ut46I0FTJV2Q-1; Tue, 20 Apr 2021 11:02:12 -0400
X-MC-Unique: NIp9daP0O4ut46I0FTJV2Q-1
Received: by mail-ed1-f70.google.com with SMTP id bf25-20020a0564021a59b0290385169cebf8so5886890edb.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Apr 2021 08:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=LOuxmsinNUEghHsSk9wjmamm7+xO1TJQ6v8YtLtqUfE=;
        b=QCUURZbhiM1rB3SMhrudytWknO+X+IG8FwE/Cm4S7hunZ8vEwjvIsshKyEc0Zzeqba
         AVOVLQ462F2QRQnQtiqEXEwW3611EeBEtFiROyTSL5o/dj/Ya9JZNaxhYRR+BGftDdRQ
         zzyl+yuLJTibzf+8aLLMCULVrVb1pvNDkbvlGc+gRmWAENp/6NScrvIHfQAbX21NEn0j
         /bbtz0Lc1MndvOMil4o3MQBavSiRR8KjfE7pfaqttW88bOUWMQWIngcBI0s5Z4UqRt9Z
         QqfVJAeKQu69mMlRk6ft6kuo0h5U8nUjCEHtMD8+7eJS6bTd78KYHc0ky1NECp++CVhh
         42gg==
X-Gm-Message-State: AOAM533o7xZEb8sWr3zfCB4+OrJwDLyOxpOOaKSFALgTrrWXlWipXstD
        GC0GUHsc2+YN8K2gc++slF2NNBdvA/mKp7If4inSvEUTwL73E73jaQb9lVzCUsbmxzUAJv/snWF
        /nBlpphnMdamK4n+D819Va832L63Tr/lU1w==
X-Received: by 2002:a17:906:f283:: with SMTP id gu3mr27496260ejb.91.1618930930992;
        Tue, 20 Apr 2021 08:02:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQWxPdCEp09e5eROF29CuffU4EhqLD9KBqklnh3u0zpOB2tTW38ZDyfpc+9XF/YZYWAu2hoA==
X-Received: by 2002:a17:906:f283:: with SMTP id gu3mr27496250ejb.91.1618930930867;
        Tue, 20 Apr 2021 08:02:10 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id ke14sm13225815ejc.1.2021.04.20.08.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 08:02:10 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Fix "unsigned 'ret' is
 never less than zero" smatch warning
To:     Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        "David E . Box" <david.e.box@linux.intel.com>,
        kernel test robot <lkp@intel.com>
References: <20210419143109.30612-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d123d876-83ea-76f6-f325-f0076bb38af8@redhat.com>
Date:   Tue, 20 Apr 2021 17:02:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210419143109.30612-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/19/21 4:31 PM, Hans de Goede wrote:
> Change the type of ret form a size_t to a ssize_t, matching the prototype
> of simple_write_to_buffer(), fixing this warning reported by smatch:
> 
> drivers/platform/x86/intel_pmc_core.c:1369 pmc_core_lpm_latch_mode_write() warn: unsigned 'ret' is never less than zero.
> 
> Fixes: 8074a79fad2e ("platform/x86: intel_pmc_core: Add option to set/clear LPM mode")
> Cc: David E. Box <david.e.box@linux.intel.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've applied this to my review-hans branch now.

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

