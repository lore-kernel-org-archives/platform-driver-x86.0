Return-Path: <SRS0=nDDs=C2=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612AEC433E2
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 12:19:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 13CE82087D
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Sep 2020 12:19:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FYA2A+Kh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgIQMRq (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Sep 2020 08:17:46 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54212 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726950AbgIQMQe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 08:16:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600344982;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SoisXRLqWddF3VDGVnR2urzq3JASfg0vD91MUOUDVZc=;
        b=FYA2A+KhwbbxkWXCfgyXCISU/5Uw+0VjlBx4Nkde2odLP4239WlMroncmR2VzYUAHSV/TC
        38DqjZzbcbUvloeBxH6xLip4acfnaUbew2GTvp3we1qH3HcOgOaQRxaW1tz+W800CKiSTW
        dNG9L0w+ECtwC9kRt/iSznWEtkMrDjs=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-VAbvTKRJOfa2dO-9F9qAYQ-1; Thu, 17 Sep 2020 08:16:20 -0400
X-MC-Unique: VAbvTKRJOfa2dO-9F9qAYQ-1
Received: by mail-ed1-f71.google.com with SMTP id r9so825937edi.9
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Sep 2020 05:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SoisXRLqWddF3VDGVnR2urzq3JASfg0vD91MUOUDVZc=;
        b=pIGOMXo/ggNdkIz38/oinusUUPWKcYxRu0fWKzWnX/Em1ifdpNcvfIf+RsLS2G69af
         WHCEnuL5NleNgTxViQLiNbYOxjbIqO/yocyVNq4rZn3wK3X4wgHCs4AD0Zh97Yxdqowy
         wMvSMDTNTYCGkYEp9F5ph12dADYbKOU0xCSDc6IKsBOuJ0HYNLPY6BR45i1mNbLGzH1n
         jDyz+wi9OwJUQS89mVt/KD288azhqTEDCNNf14SR9yzpdeqeD3P8FwE+JrhzGxLOWmoM
         tP6SG4hyeGzYlE2dJWpjrE+Nyur/28+QlZ2QjmgpVHqf6Hyl+d7eo/6T1OdfenLDXqXA
         CsYQ==
X-Gm-Message-State: AOAM531DjyeiP56EAAYky5u4OvQLcF63oEftDorbGlfu4kupfbZxTd/W
        3jp3F4k/qFrWkhJcJAcwakeb2r9rDxWyv6nzGJ4R5qBDwakH5zDKLCuKH0C3XLrpEszWeB8xMT1
        McGCRBylHpAnCDKyB7NLcHKzXN3IwhO4CEQ==
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr29373382ejo.33.1600344978798;
        Thu, 17 Sep 2020 05:16:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwlxdseiRtGLbuvARReNI+oSg+5sWhq9w5x49k3FnbysMpp0+VSrVTqyupzwkRn/+IBhxQHQ==
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr29373368ejo.33.1600344978632;
        Thu, 17 Sep 2020 05:16:18 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id n7sm14912134eji.13.2020.09.17.05.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2020 05:16:17 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: fix kconfig dependency warning for
 LG_LAPTOP
To:     Necip Fazil Yildiran <fazilyildiran@gmail.com>, andy@infradead.org
Cc:     matan@svgalib.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, paul@pgazz.com, jeho@cs.utexas.edu
References: <20200915090922.16423-1-fazilyildiran@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ddb882a5-99f6-b726-d017-3d4c6a695e76@redhat.com>
Date:   Thu, 17 Sep 2020 14:16:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915090922.16423-1-fazilyildiran@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/15/20 11:09 AM, Necip Fazil Yildiran wrote:
> When LG_LAPTOP is enabled and NEW_LEDS is disabled, it results in the
> following Kbuild warning:
> 
> WARNING: unmet direct dependencies detected for LEDS_CLASS
>    Depends on [n]: NEW_LEDS [=n]
>    Selected by [y]:
>    - LG_LAPTOP [=y] && X86 [=y] && X86_PLATFORM_DEVICES [=y] && ACPI [=y] && ACPI_WMI [=y] && INPUT [=y]
> 
> The reason is that LG_LAPTOP selects LEDS_CLASS without depending on or
> selecting NEW_LEDS while LEDS_CLASS is subordinate to NEW_LEDS.
> 
> Honor the kconfig menu hierarchy to remove kconfig dependency warnings.
> 
> Fixes: dbf0c5a6b1f8 ("platform/x86: Add LG Gram laptop special features driver")
> Signed-off-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>

Thnak you, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Note it seems that the FUJITSU_LAPTOP Kconfig symbol has the same
issue, can you submit a patch for that one too?

Regards,

Hans

> ---
>   drivers/platform/x86/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 40219bba6801..81f6079d08e6 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1112,6 +1112,7 @@ config LG_LAPTOP
>   	depends on ACPI_WMI
>   	depends on INPUT
>   	select INPUT_SPARSEKMAP
> +	select NEW_LEDS
>   	select LEDS_CLASS
>   	help
>   	 This driver adds support for hotkeys as well as control of keyboard
> 

