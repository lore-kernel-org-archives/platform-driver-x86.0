Return-Path: <SRS0=xf+z=EP=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF9FC2D0A3
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 14:04:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C91620665
	for <platform-driver-x86@archiver.kernel.org>; Mon,  9 Nov 2020 14:04:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OgNJTwY6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730035AbgKIOEg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 9 Nov 2020 09:04:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54266 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729854AbgKIOEg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 09:04:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604930674;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XYc2W30a1P9Hf38DokNp15xQhZTjwk1F6rxUIYV29fM=;
        b=OgNJTwY6Wi2t9yox4eGT6vVkd1lYFLhpR4dsJ3thHJ82cqORzCYSM3zL9Fxi5Vvo0Xo443
        gXMWMl/Ni5uA8dt3mfgi/NBN8L4Nu7zV8e9mFVQ1bJAsy216DpfLdYFGov2FRnI/MaKtyo
        uEWrM+eGBBm1RNzFkO9pQTtM7l/BT/s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-H9sIQzIDPi6SVpF6LtM-UQ-1; Mon, 09 Nov 2020 09:04:30 -0500
X-MC-Unique: H9sIQzIDPi6SVpF6LtM-UQ-1
Received: by mail-ej1-f71.google.com with SMTP id d13so3448613ejz.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2020 06:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XYc2W30a1P9Hf38DokNp15xQhZTjwk1F6rxUIYV29fM=;
        b=cFONOn2OnyQ8viVM/DW9Ww+fRWWD4J//niQ9/T6jJjDJ9fwBBib5UbDHFUheYjIPUd
         xU0FR4iYFGHGXNS7vEC3e1uWR3bPAPHj7L/gtE22FqkyfB+KAM0CEngC8BIRV34NHnoU
         jM3v5o/V0fbEJl9kaojUWBMuvGLXexb0eis8Dc2XlWymP6guQrCl0lsLrmQnfR/yb3sq
         p9M85K7n+p0LTBVs84I/kzywu0dRkH7mpmx6ouoZkaPD3GtKeh5pqP9V7wQ16VtBqljz
         xGWXLrkAOn8MVidk/lfGFi0g1zGnuzL559kBl+Gzh1a2gWf6TWqVoNKxWXXfEVekk+o9
         npZg==
X-Gm-Message-State: AOAM531LDdm2odKlHaQE0L+KRBjk3M5sSHWEBFIDlHP2zJdZgBi189YN
        HhIIEMZ3t3de39p7Y017Iz1IwnSFFFhlhksMjjFgH92lQulxOtdCs7WDR1ZDaqMFg2gYgTjP4zd
        C9C/e9m+W2/1VKY3QZZcsOXLpaVySsxHZbw==
X-Received: by 2002:a17:906:4bc4:: with SMTP id x4mr15011574ejv.66.1604930669083;
        Mon, 09 Nov 2020 06:04:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzXHtTNBz2pXk+EyM1T5dksZLvuxwlWthxd02xLDUkRSYwxLLNQWE3Ynhd34HdMg0FpbW3RPw==
X-Received: by 2002:a17:906:4bc4:: with SMTP id x4mr15011560ejv.66.1604930668916;
        Mon, 09 Nov 2020 06:04:28 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id y3sm8763258ejk.92.2020.11.09.06.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 06:04:28 -0800 (PST)
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Assign boolean values to a
 bool variable
To:     xiakaixu1987@gmail.com, irenic.rajneesh@gmail.com,
        david.e.box@intel.com
Cc:     platform-driver-x86@vger.kernel.org,
        Kaixu Xia <kaixuxia@tencent.com>
References: <1604753621-7387-1-git-send-email-kaixuxia@tencent.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9c2c3193-b5c3-c56f-eac3-2aadbee5e74c@redhat.com>
Date:   Mon, 9 Nov 2020 15:04:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1604753621-7387-1-git-send-email-kaixuxia@tencent.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/7/20 1:53 PM, xiakaixu1987@gmail.com wrote:
> From: Kaixu Xia <kaixuxia@tencent.com>
> 
> Fix the following coccinelle warnings:
> 
> ./drivers/platform/x86/intel_pmc_core.c:932:1-16: WARNING: Assignment of 0/1 to bool variable
> 
> Signed-off-by: Kaixu Xia <kaixuxia@tencent.com>

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
>  drivers/platform/x86/intel_pmc_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 3e5fe66333f1..ee2f757515b0 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -929,7 +929,7 @@ static void pmc_core_slps0_dbg_latch(struct pmc_dev *pmcdev, bool reset)
>  		fd |= CNP_PMC_LATCH_SLPS0_EVENTS;
>  	pmc_core_reg_write(pmcdev, map->slps0_dbg_offset, fd);
>  
> -	slps0_dbg_latch = 0;
> +	slps0_dbg_latch = false;
>  
>  out_unlock:
>  	mutex_unlock(&pmcdev->lock);
> 

