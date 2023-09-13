Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7711CEDEC74
	for <platform-driver-x86@archiver.kernel.org>; Wed, 13 Sep 2023 15:29:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjIMP3j (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 13 Sep 2023 11:29:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbjIMP3N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Sep 2023 11:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AB0BB1BC8
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694618909;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mqBu8mRyD1iMsfix/4FWRYQGBRxdva1lJZzYzAlH/SY=;
        b=h78l2D60udZJfot/EkXVdAkEzdaa10mOpjTnVHxeqAS0JHNCVdWnbJox9ZdbJPqzglb1c3
        vlLcJ45pZ2P1W/uGmhIJLmF/4SKkXkcIR2hf5U+J5uQEp5kc5vZzImgSmo3ifNqaqQJuHM
        gp7Xw5aYvYzfPwMyNg3v7ytM09fBSfI=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-suvSwUESPVWKbAeKq8HNiQ-1; Wed, 13 Sep 2023 11:28:28 -0400
X-MC-Unique: suvSwUESPVWKbAeKq8HNiQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-993c2d9e496so515810666b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Sep 2023 08:28:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694618907; x=1695223707;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mqBu8mRyD1iMsfix/4FWRYQGBRxdva1lJZzYzAlH/SY=;
        b=Re6jT4Pu0lReI3ZnwAc1qDX1kGF3BipnseELZuvjbHFlUa0pdQ9e6MNwDzY1NM9UX9
         Cpe7sbim+F/THmYgBAFBoYgsC7lBaKhKGjObNI1T4QYGDPVP0Je9Lw5OL3MOBZ3s+71A
         qjMCTcQioPMD3l4rWwzZd789v3NRdoXUhY9FzBYkZCdAUCUSt7uW0ktrBmEvJR7dK8mg
         nlN9hBbvF+EfYsYMaWGkGLWvF0p8e59Odf8xokCveZy6TSIgqedjtiZ13t3N8T6YW8rU
         +w7U/oOaq4vWBwArozmX2PKSwd3Wz3Ghn0pkbHw/B70KZJy2VfW0Im6BtHNF2YSTB/qe
         pCGQ==
X-Gm-Message-State: AOJu0YxwkULnx1KnGJ0fnt1qMY/RdpJ/FCCdGL2+0LsGrmLZwGEw37Wf
        Kh9JsEEoKwWUpx1cPBE8savB6IfHEsPthIbPwZqjaGcIICNVanCLloPwLpnn8bc+3AbdjT+qITf
        fIk0mCl4EIPAJOqRIEK6qqOZquIwTGNKJvA==
X-Received: by 2002:a17:906:cc58:b0:9a9:f3df:80cd with SMTP id mm24-20020a170906cc5800b009a9f3df80cdmr1972545ejb.72.1694618907420;
        Wed, 13 Sep 2023 08:28:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgC7QZ7C1mSN9V1a9HhXRS7J8IUIJMRRv0YvRRF0Rgtsa7ubtk4eo+1nUfRcNrGPtmxSxrNA==
X-Received: by 2002:a17:906:cc58:b0:9a9:f3df:80cd with SMTP id mm24-20020a170906cc5800b009a9f3df80cdmr1972536ejb.72.1694618907164;
        Wed, 13 Sep 2023 08:28:27 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id re1-20020a170906d8c100b00993a37aebc5sm8537117ejb.50.2023.09.13.08.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 08:28:26 -0700 (PDT)
Message-ID: <c4e6b9de-30a5-37e3-9a7c-f58f102b542a@redhat.com>
Date:   Wed, 13 Sep 2023 17:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 4/4] Documentation: Add amd_hsmp sysfs file info
Content-Language: en-US, nl
To:     Suma Hegde <Suma.Hegde@amd.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Naveen Krishna Chatradhi <nchatrad@amd.com>
References: <20230906071302.291260-1-Suma.Hegde@amd.com>
 <20230906071302.291260-4-Suma.Hegde@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230906071302.291260-4-Suma.Hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Suma,

On 9/6/23 09:13, Suma Hegde wrote:
> sysfs bin file is added for metrics table information
> 
> Signed-off-by: Suma Hegde <Suma.Hegde@amd.com>
> Reviewed-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

Please squash this patch into patch 2/4 (since this documents
the metrics_bin sysfs attr added there).

Regards,

Hans




> ---
> Changes since v1:
> New patch
> 
>  Documentation/arch/x86/amd_hsmp.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/arch/x86/amd_hsmp.rst b/Documentation/arch/x86/amd_hsmp.rst
> index 440e4b645a1c..e4f4978f758b 100644
> --- a/Documentation/arch/x86/amd_hsmp.rst
> +++ b/Documentation/arch/x86/amd_hsmp.rst
> @@ -41,6 +41,22 @@ In-kernel integration:
>   * Locking across callers is taken care by the driver.
>  
>  
> +HSMP sysfs interface
> +====================
> +
> +1. Metrics table bin sysfs
> +
> +AMD MI300A MCM provides GET_METRICS_TABLE message to retrieve
> +all the system management information from SMU.
> +
> +The metrics table is made available as hexadecimal sysfs binary file
> +under per socket sysfs directory created at
> +/sys/devices/platform/amd_hsmp/socket%d/metrics_bin
> +
> +Metrics table definitions will be documented as part of Public PPR.
> +The same is defined in the amd_hsmp.h header.
> +
> +
>  An example
>  ==========
>  

