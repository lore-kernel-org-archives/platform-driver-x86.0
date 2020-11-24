Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B79C2D0E4
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 12:12:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 085542076E
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 12:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hUMLn53S"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732987AbgKXMM2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 07:12:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25188 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732523AbgKXMM2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 07:12:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606219946;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=QYtm4WS/VKbRUCOq0XLPYf6Vll9ag4HN6eyUxZktLK0=;
        b=hUMLn53SOOxKyNamTEU8aqOvfZELcZc1a972Gsg2Y34cHeA3QM40E/gx22jlAJkfgfwMjx
        qWjB1F8fPNxNrbA4B3x06hQ9/hIAdot8tTsr6kpuWLF1xihHkP1LzQgtUXlt4v4PHDhEcH
        zlnlVDHERSc4qVR7JZpZle6DsRs4ThI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-y-rjmfPsPTu1_JR03DdtOw-1; Tue, 24 Nov 2020 07:12:25 -0500
X-MC-Unique: y-rjmfPsPTu1_JR03DdtOw-1
Received: by mail-ed1-f70.google.com with SMTP id bm10so7914543edb.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 04:12:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QYtm4WS/VKbRUCOq0XLPYf6Vll9ag4HN6eyUxZktLK0=;
        b=sYqhFQJ6D8vpqvU/3M/e+ltaEFYuNv5dILqWgduBAP4hYzmncy4pQEiJqor1qKy9ze
         mH/W/YDUe/45mAeoT/profdmBV8l+Ur8VukMbFK2wMBh06kJjeeKfLNkxlif5Z0IsdcE
         uqcfEQkYhC04+nqCHMtiMi3Ku0bILneQrLNQnZ+I69vxsyAdutdAwOmuPhZXI6CPJH5C
         HiuxkkcV/n6Pd71Z/r3JpQ3dP/zGSYjFkR+xRvrIXnJuXhZFy0vvG8lXeRvhR5+pSerR
         h/s+FhqBgPIRnqP8euj2pOrgx6q1AqbrcbHdSS+UDJs48KzCqZ8XcSNfUwgPiixTMvc8
         tW5g==
X-Gm-Message-State: AOAM530OT6mAEksHYWsVOqSqc7lQu08nPKG6HRANpa7mf2iql6kHKWSi
        sru1je3V1Hnz4A9phIbxelC4BcZFI+dv/f4BGeJ1lDg1ggCtOGWxnrm8k9YcIOLfvpisp76yAs/
        47VpjsjUGJ9nNhERNQLi7ULeYqIM/hOWbLA==
X-Received: by 2002:a17:906:1183:: with SMTP id n3mr3751835eja.188.1606219943570;
        Tue, 24 Nov 2020 04:12:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxk/PTwzMP+ErI6EGlqY2qYdUTtV53aR0KLZ94Bj3nBwadWAvcZpZNWLEJ5MKudenQ/xcOiPw==
X-Received: by 2002:a17:906:1183:: with SMTP id n3mr3751822eja.188.1606219943366;
        Tue, 24 Nov 2020 04:12:23 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id j7sm6742345ejk.14.2020.11.24.04.12.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 04:12:22 -0800 (PST)
Subject: Re: [PATCH] platform/x86: intel-vbtn: Support for tablet mode on HP
 Pavilion 13 x360 PC
To:     Max Verevkin <me@maxverevkin.tk>
Cc:     AceLan Kao <acelan.kao@canonical.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201124131652.11165-1-me@maxverevkin.tk>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a7efc180-be37-8058-465a-5e334e131b48@redhat.com>
Date:   Tue, 24 Nov 2020 13:12:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124131652.11165-1-me@maxverevkin.tk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/24/20 2:16 PM, Max Verevkin wrote:
> Signed-off-by: Max Verevkin <me@maxverevkin.tk>

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
>  drivers/platform/x86/intel-vbtn.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index f5901b0b07cd..0419c8001fe3 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -206,6 +206,12 @@ static const struct dmi_system_id dmi_switches_allow_list[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "HP Stream x360 Convertible PC 11"),
>  		},
>  	},
> +	{
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "HP Pavilion 13 x360 PC"),
> +		},
> +	},
>  	{} /* Array terminator */
>  };
>  
> 

