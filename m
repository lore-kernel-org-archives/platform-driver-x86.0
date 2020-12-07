Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCCEC4361B
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 14:18:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C140235F9
	for <platform-driver-x86@archiver.kernel.org>; Mon,  7 Dec 2020 14:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726230AbgLGOS1 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 7 Dec 2020 09:18:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22818 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726412AbgLGOS0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Dec 2020 09:18:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607350619;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s53RZYILsGtwM83jxx1xgqBZlFTvrwRxd01Lxzro7PM=;
        b=hkkBDe0AFrrPx2NK7E4Q+ymENtv6QGWUrjADhOSaT2erPXQ5BZk6ceyvBgjZm+0PUp53cX
        WiW4MBcEsLz1e5Q8W8H+8600jQa/s4dwLERID6Q9qmqLwMn0VpSdlFdGXrWsEO6rf9/9mL
        G1Jw/HLpDe8qtHnyZAVPgV1jszu/ZfE=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-8CUGiIghPUaB2IhXmtYANw-1; Mon, 07 Dec 2020 09:16:57 -0500
X-MC-Unique: 8CUGiIghPUaB2IhXmtYANw-1
Received: by mail-ej1-f70.google.com with SMTP id n17so3905195eja.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Dec 2020 06:16:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s53RZYILsGtwM83jxx1xgqBZlFTvrwRxd01Lxzro7PM=;
        b=nVT6gkMKKH7vZmzBDID+gbtKEeUsRFDpRy6pGYXIpPBINVhkcNHr9kvQ1ovbDzIRIT
         60LqcEMKWxkKgeEdq5FXAREjGA+2Qv7s62e6AY5DAi6sLX8X+s9SmMqf2QWmQ4zIzG7X
         0fypkbMD/6bNWjjh1H5ORQuzATzayEusJoVssXx+NMXNyDiyMHjMoU3PtWRFwHO7wu5w
         eb/7xsZYpoVXjADkZOHlDy5m8zfQV5Pqk1ON+neYUcY4t+R03rP0dhJjQKHWjZ+Gi3BR
         wCmAN2k8HgWR+mjnOVfLb48EQAipeQP7LezpIIxvbIgd7uHxhf1Jn9HshhjcTZ8btkj8
         TjhQ==
X-Gm-Message-State: AOAM530Rggf5Bc9NJFiwqBU7ZNttzbRre0KPUSc3qeNZMN4Qu5igNhJp
        +BfY8Z1rqB/pDLteO5raVU7orcUehb2lmrohpmDBN4EJizvlxsbdNNit6Wl5FLSxJSSN1DwUx2h
        gzmCEr3gxElbXrf93Y+fUDypfw5dZZFzEbQ==
X-Received: by 2002:a17:906:b143:: with SMTP id bt3mr19227274ejb.318.1607350616410;
        Mon, 07 Dec 2020 06:16:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzuQwbVhuYI/1XHG55Js/DNsfUhgSclENPUQ9U+GNFJ8u84Voy3So1uMAHP/3H5mVOpNV0AUw==
X-Received: by 2002:a17:906:b143:: with SMTP id bt3mr19227252ejb.318.1607350616149;
        Mon, 07 Dec 2020 06:16:56 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id f18sm13423408edt.60.2020.12.07.06.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 06:16:55 -0800 (PST)
Subject: Re: [PATCH 1/3] platform/x86: ISST: Check for unaligned mmio address
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        mgross@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201204015746.1168941-1-srinivas.pandruvada@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <535e4198-4244-2650-b1d4-4d81262c3198@redhat.com>
Date:   Mon, 7 Dec 2020 15:16:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201204015746.1168941-1-srinivas.pandruvada@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/4/20 2:57 AM, Srinivas Pandruvada wrote:
> The address should be aligned to 4 byte boundary. So send an error for
> unaligned address.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thank you for your patch-series.

One thing which still seems to be missing after this series is a check for
attempting to read/write the hole between the 2 ranges. Can you please
provide a follow-up patch adding such a check?

###

I've applied the series to my review-hans branch:
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
>  drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
> index aa17fd7817f8..e7e9808a1aed 100644
> --- a/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
> +++ b/drivers/platform/x86/intel_speed_select_if/isst_if_mmio.c
> @@ -42,6 +42,9 @@ static long isst_if_mmio_rd_wr(u8 *cmd_ptr, int *write_only, int resume)
>  	if (io_reg->reg < 0x04 || io_reg->reg > 0xD0)
>  		return -EINVAL;
>  
> +	if (io_reg->reg % 4)
> +		return -EINVAL;
> +
>  	if (io_reg->read_write && !capable(CAP_SYS_ADMIN))
>  		return -EPERM;
>  
> 

