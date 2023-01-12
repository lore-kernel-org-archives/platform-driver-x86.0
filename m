Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1EB8C54EBE
	for <platform-driver-x86@archiver.kernel.org>; Thu, 12 Jan 2023 19:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232194AbjALTKJ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 12 Jan 2023 14:10:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240395AbjALTJb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 14:09:31 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48378101F0
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673549476;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gQT6kbVnh7LGmchU/CgBL+HDXmd5H1kHabNR2ns9vnw=;
        b=SDKuUe5rjPQk5gYVyB4AdIIVN9tzWJujx2sml5rlLYyxJKGfVx1NkunPNO6oHyMCREXfqp
        38SEYumvjx1LwyqVS9ysWbc8IwKqcu/FmoD2KVQXF84G68OtdwJ/kWj2bo8vq0Q4i+xhJg
        zYU/Cl62pOe4n7pqlaQaiO4fRFa+ccs=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-608-aGdss4LGPRO-0PHaIm9crQ-1; Thu, 12 Jan 2023 13:51:15 -0500
X-MC-Unique: aGdss4LGPRO-0PHaIm9crQ-1
Received: by mail-ej1-f69.google.com with SMTP id sb39-20020a1709076da700b0084ed1ee4919so8450438ejc.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Jan 2023 10:51:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gQT6kbVnh7LGmchU/CgBL+HDXmd5H1kHabNR2ns9vnw=;
        b=E//3Ar07puiAOOhX2tf2ZkEzjq5tLReDR9Q2GbIkw8hQJ7RMmbo3peciRwYk+qMyXS
         yOltJUYe2EQnzpLeHZ3569vE25qeseVfXXzKzNGyrQ1ApgUfHiBqtil3K72bYUW4tX/m
         1vrimScg+zniaLp/oeJ+a+PjGtE7C44aeKC2z1CXJjXE6djRn+yohHv0WV2p5u/LGI3l
         sAo0xZb1zi9ABKgpIGZ4ZrfFzBHGFsrsCLjuvlQWnXlm4gmglYucxTFqYSNZj3k/UUBG
         MShTPg+mVQulDz62pWO/I7KctrkfV/QDHUAeJ7Y0lXUAgK9/Ez1xu5xhqZ0w/vCLR+kz
         fwCQ==
X-Gm-Message-State: AFqh2kpDmBidFatK95mQRBWzKQU0TbUpkGiUrDE4uoES8A+fLaWtG5TB
        JHiDV/TtPX/NC3S2OxvPHUH/Cxt8ozqsBgcWuNmSVWixpl3UeHSniFBhpLfEkai5sV5R4hQfDlV
        w0BODscxfFFClmw02p7W/RYTN91k3KWag8g==
X-Received: by 2002:a17:906:308e:b0:860:c12c:14f9 with SMTP id 14-20020a170906308e00b00860c12c14f9mr6014667ejv.40.1673549473420;
        Thu, 12 Jan 2023 10:51:13 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuyMGMWxPO0+4Fa/LRiHJC3qvn0L2hSTyjEeeBxblQnjaAfDuZkcxAIY91oMKAl3HAwlTAj1Q==
X-Received: by 2002:a17:906:308e:b0:860:c12c:14f9 with SMTP id 14-20020a170906308e00b00860c12c14f9mr6014658ejv.40.1673549473290;
        Thu, 12 Jan 2023 10:51:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 15-20020a170906310f00b00738795e7d9bsm7620034ejx.2.2023.01.12.10.51.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 10:51:12 -0800 (PST)
Message-ID: <a2fbf35d-7275-7f49-9e87-ec5cdd243719@redhat.com>
Date:   Thu, 12 Jan 2023 19:51:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v1] platform/x86: intel/pmc/core: Add Meteor Lake mobile
 support
Content-Language: en-US, nl
To:     Gayatri Kammela <gayatri.kammela@linux.intel.com>
Cc:     irenic.rajneesh@gmail.com, markgross@kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        David E Box <david.e.box@linux.intel.com>
References: <20221228230553.2497183-1-gayatri.kammela@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221228230553.2497183-1-gayatri.kammela@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/29/22 00:05, Gayatri Kammela wrote:
> Add Meteor Lake mobile support to pmc core driver. Meteor Lake mobile
> parts reuse all the Meteor Lake PCH IPs.
> 
> Cc: David E Box <david.e.box@linux.intel.com>
> Signed-off-by: Gayatri Kammela <gayatri.kammela@linux.intel.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans


> ---
>  drivers/platform/x86/intel/pmc/core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index f1d802f6ec3f..3a15d32d7644 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -1029,6 +1029,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
>  	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE,		adl_core_init),
>  	X86_MATCH_INTEL_FAM6_MODEL(RAPTORLAKE_S,	adl_core_init),
>  	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE,          mtl_core_init),
> +	X86_MATCH_INTEL_FAM6_MODEL(METEORLAKE_L,	mtl_core_init),
>  	{}
>  };
>  
> 
> base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2

