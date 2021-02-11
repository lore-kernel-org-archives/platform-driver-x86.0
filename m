Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21EF6C433E6
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Feb 2021 12:02:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D26BD64E92
	for <platform-driver-x86@archiver.kernel.org>; Thu, 11 Feb 2021 12:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231682AbhBKMB5 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 11 Feb 2021 07:01:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231487AbhBKL7k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Feb 2021 06:59:40 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DC13C061574;
        Thu, 11 Feb 2021 03:58:49 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id u16so1652729wmq.1;
        Thu, 11 Feb 2021 03:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ObOPE3Vxw9na61V0nCVGRHaYvQwK9e3MP9lFm6Pn/DM=;
        b=WhEfeNahuHSnhs1wD7y0pT8PtEV20fASmSIfOaChNE8De45D/94euh8T+PYlykHH/D
         Bll//mbnzGIylluxY2ifqW/wiRUx9x4pZSPuOQ5i37bSZ8dtEU+e+lK7pPhxdOONCVns
         hp4DScKOdMMFahoEDXZ0+U8kf8/NkgOtJ5jNpHFcf2+20un6BNw79/6hGMX7NYrg8vLp
         2SuKaqP3hxu0XBPTK2hvzJQkQF+4g/AVIRdLOYOgHRS2vJmUoFX5zu+yMR2oSr/MvJXA
         YtDSezGN4TQ8V0984dWfI/R1dakCfEBB8WwkHjJwY4DHKsavzKygF3+n/IJe5cM6LiQs
         /AkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ObOPE3Vxw9na61V0nCVGRHaYvQwK9e3MP9lFm6Pn/DM=;
        b=s0PVes3og/0LMQzauAuW8ogl6Xa2d8fQee62QvDPMw/4sXz0k/aOIDT5HUmy1GSGqj
         HkWLUzRfZsYB1p/J1yrVu+akFXtf3FQpAx/tK+iNHhxSpw/0mZfGBPicoOFdUxzpRdr1
         n7bfqVImj2IgSGXhcYSQUHuwXah9OFK0Y8HRH2oH8hu9RJjq3GrfsN8rn88bde5SOGPH
         g+DgT6gUhSkJHl3A4WIGAg4xAXAG8AdPBIJieCZjy8Q13xqJsPrk7W27jrLh7H6uf52V
         e5m74Owdqjhwq74pgfqaohZED46uIIvlk8iFptdfkbGjke5f+KS7JFO0sZZ60bH6uXu4
         alPQ==
X-Gm-Message-State: AOAM530DBr8ZgbCQjWBVPn98PH7hQNxsJH4xeMzqS4OjSa4duBq2bJMA
        Jwh9/lOiW5AAxrn1dOr4bzp/fVyRQRGh9Q==
X-Google-Smtp-Source: ABdhPJzwBdXYcgzpPyh6B5OyvA4ZsH8yFVbfUv0QT/5HyVa9ggvzBWp3jphrqpVYa9UBOHLpMR57bA==
X-Received: by 2002:a05:600c:4f14:: with SMTP id l20mr5011471wmq.155.1613044728374;
        Thu, 11 Feb 2021 03:58:48 -0800 (PST)
Received: from [192.168.2.202] (p5487b829.dip0.t-ipconnect.de. [84.135.184.41])
        by smtp.gmail.com with ESMTPSA id x18sm9596308wmi.8.2021.02.11.03.58.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 03:58:47 -0800 (PST)
Subject: Re: [PATCH] platform/surface: aggregator: Fix access of unaligned
 value
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-test-robot <lkp@intel.com>
References: <20210210230411.1938660-1-luzmaximilian@gmail.com>
 <YCUFgF9gmyeO+796@smile.fi.intel.com>
From:   Maximilian Luz <luzmaximilian@gmail.com>
Message-ID: <b68b7547-5be4-c823-d015-febb5e7f84e9@gmail.com>
Date:   Thu, 11 Feb 2021 12:58:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCUFgF9gmyeO+796@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2/11/21 11:22 AM, Andy Shevchenko wrote:
> On Thu, Feb 11, 2021 at 12:04:11AM +0100, Maximilian Luz wrote:
>> The raw message frame length is unaligned and explicitly marked as
>> little endian. It should not be accessed without the appropriatte
>> accessor functions. Fix this.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Though a few nit-picks below.
> 
>> Reported-by: kernel-test-robot <lkp@intel.com>
>> Fixes: c167b9c7e3d6 ("platform/surface: Add Surface Aggregator subsystem")
>> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
>> ---
>>   drivers/platform/surface/aggregator/ssh_packet_layer.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/surface/aggregator/ssh_packet_layer.c b/drivers/platform/surface/aggregator/ssh_packet_layer.c
>> index 583315db8b02..9a78188d8d1c 100644
>> --- a/drivers/platform/surface/aggregator/ssh_packet_layer.c
>> +++ b/drivers/platform/surface/aggregator/ssh_packet_layer.c
>> @@ -1774,7 +1774,8 @@ static size_t ssh_ptl_rx_eval(struct ssh_ptl *ptl, struct ssam_span *source)
>>   		break;
>>   	}
>>   
>> -	return aligned.ptr - source->ptr + SSH_MESSAGE_LENGTH(frame->len);
>> +	return aligned.ptr - source->ptr
>> +		+ SSH_MESSAGE_LENGTH(get_unaligned_le16(&frame->len));
> 
> I would leave + on previous line.

I can fix that if it bugs you.

> Also it's possible to annotate temporary variable and use it, but it seems not
> worth to do.

Now that you mention it, we already have the correct frame length in
payload.len. Let me draft up a new patch with that.

> Side question: Do you think the below is correct (& operator)?
> 
>          sp.len = get_unaligned_le16(&((struct ssh_frame *)sf.ptr)->len);
> 
> To me seems like you take an address to len member rather its value.

That's the point though, no? The signature is

         u16 get_unaligned_le16(const void *p)

so we do want a pointer to the len member. So I believe that is correct.

> 
>>   }
>>   
>>   static int ssh_ptl_rx_threadfn(void *data)
> 
