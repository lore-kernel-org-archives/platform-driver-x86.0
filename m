Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0016C00144
	for <platform-driver-x86@archiver.kernel.org>; Mon,  1 Aug 2022 13:58:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiHAN6j (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 1 Aug 2022 09:58:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbiHAN6f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 1 Aug 2022 09:58:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id EBFF62B24A
        for <platform-driver-x86@vger.kernel.org>; Mon,  1 Aug 2022 06:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659362313;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=J3cRrc9fvUIckYj0jMFgqh302FV9rRAYNgHGKbFDb1c=;
        b=c4SKSgMtaf4VeM7Ka4M3lLRyLeO2q4qg9YfSbehB0y5wHQbZd+u7KMjgJF7k0u12TOI3RX
        R6xjgS8bDDpUC1XDyMn9x6yu5Nc4+9tPhpzJJr2VUttXPaByN/v+xCPZUulAgbTfEQ8ths
        d+9ZGZnd9WsaisdttS2idCvlV0tFrkw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-AAnqW5ZDPwe6XzjJou07NA-1; Mon, 01 Aug 2022 09:58:31 -0400
X-MC-Unique: AAnqW5ZDPwe6XzjJou07NA-1
Received: by mail-ed1-f71.google.com with SMTP id f13-20020a0564021e8d00b00437a2acb543so7146864edf.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 01 Aug 2022 06:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=J3cRrc9fvUIckYj0jMFgqh302FV9rRAYNgHGKbFDb1c=;
        b=nwD13oUDnEgYAsZQ5oKImnjYUkt4LOd0xA3WVJoPWigCiPpwa46G7PFMS+giU0nFiU
         /3FVXe31RD1+QlhLPDk3ZR3cToNLkFkzUPXPWCDwkmVvVkMs/agexPgKvAAQqCfcV0Zs
         UOMqg45L638fOZFMypE4Kjeg0Nt8amRHZ9OMlDJaAae9cGzIGmEzssS55lc426hU87wl
         nTPndnUEhlvRMDG4iXJS2aiHedhZiQIy1Pr6QZ1+X6nHeUUsVwToGd5HGcZCZ4kKhId2
         g6w7tEHtsDXPNhKn72DCphoVoebFIminHYeL8KfGuP2XBfsgUQ806+3s+8enFqMzx3G4
         ixwA==
X-Gm-Message-State: AJIora+/yOqkzD0wjPoSoomI7fEETIw9WUDT0RBV8ZRRRDwfUv7p5Uc4
        Az55pbkQ9+gFDEficLoFjID8JXLs9QLPPHbgDsn0KJ9OI0Z8Vy+mU8UG1hQ8o3bqOi8oVUIH11F
        CWjzrOl1O6DKp3jT0GkBSHKA6Kh2M4TVzDA==
X-Received: by 2002:a17:907:16a2:b0:72b:87c9:af07 with SMTP id hc34-20020a17090716a200b0072b87c9af07mr12758585ejc.121.1659362310657;
        Mon, 01 Aug 2022 06:58:30 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sx2BNmT2RoDQ9aYi7hjNdmMeSETv98FkaVLcCcj7Tctig2ghje8kulVxyXQD7pSov9j64JiA==
X-Received: by 2002:a17:907:16a2:b0:72b:87c9:af07 with SMTP id hc34-20020a17090716a200b0072b87c9af07mr12758576ejc.121.1659362310495;
        Mon, 01 Aug 2022 06:58:30 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id k10-20020a05640212ca00b0043a7c24a669sm6850508edx.91.2022.08.01.06.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Aug 2022 06:58:29 -0700 (PDT)
Message-ID: <01ed9c54-e2df-a7a0-977e-7d9f2f6da891@redhat.com>
Date:   Mon, 1 Aug 2022 15:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 RESEND 11/11] MAINTAINERS: Add AMD PMF driver entry
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220728182028.2082096-1-Shyam-sundar.S-k@amd.com>
 <20220728182028.2082096-12-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220728182028.2082096-12-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/28/22 20:20, Shyam Sundar S K wrote:
> Update the MAINTAINERS file with AMD PMF driver details.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>


This patch still looks good to me.

Regards,

Hans


> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e01478062c56..d3f6cabcaab2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -998,6 +998,13 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/amd/pmc.c
>  
> +AMD PMF DRIVER
> +M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/ABI/testing/sysfs-amd-pmf
> +F:	drivers/platform/x86/amd/pmf/
> +
>  AMD HSMP DRIVER
>  M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>  R:	Carlos Bilbao <carlos.bilbao@amd.com>

