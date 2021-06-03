Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C160C47082
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 11:06:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FA61613D2
	for <platform-driver-x86@archiver.kernel.org>; Thu,  3 Jun 2021 11:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbhFCLHs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 3 Jun 2021 07:07:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51646 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229620AbhFCLHs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Jun 2021 07:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1622718363;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TRhiOoZe1mTEXihan/H9F13k5t1L9W/jbplk2JNgig4=;
        b=FmXNuODqC3Kxp0doNzZja32G9sRvxL8DhCQWiS96Llp6BP+VQVUPJf3DuktbTc0hhC3lMy
        Lsfp9hqn50/nerjfpvSFZaVhw95BzlfakRTZoArbk5FijQ49n9UDpU+oIg9LWuIOh+HTTH
        CGAnwvHKKOlaQDJtU0KZjzhW8NXvFaw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-_Uq_PFLWNXyh9amM6Llh-A-1; Thu, 03 Jun 2021 07:06:02 -0400
X-MC-Unique: _Uq_PFLWNXyh9amM6Llh-A-1
Received: by mail-ed1-f71.google.com with SMTP id j26-20020aa7ca5a0000b029038ffacf1cafso3075307edt.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Jun 2021 04:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TRhiOoZe1mTEXihan/H9F13k5t1L9W/jbplk2JNgig4=;
        b=j9EBepx72rriAMI6hjhOi+Gb88Ut3ZTmUK3kush+u33srSuolm1duFppdacYe/brG3
         yLsHugDIGvbj96mrGzx0BmaAn5GQAf7/mJMMin8DR4M4IrZN9mSSguWYdiOZfA85XLI4
         Ceus0NLVbr6fhqAdUHNCWqIVDmTpKRfr74Rb9f7Wz8XQH+jMIr2W/x37mMVEOgDKJL5m
         F8BIJcHC5EONzjWYtJnVy0MTeS8I+jxNYlnwby+ik8SXp3+1xUKSBIbk/6pNfbDtN/51
         uZCnx2mKu2NlNrAeZrW68OTwD1r06A3JobrfTMKdkhEgtVNcpBJM0q4wbVa3rUHv5Dxx
         XOgw==
X-Gm-Message-State: AOAM532qWwv3fPqIhgJ+f4ZGXF58HiyriiFf8BwU6jpfgnQskl4COPR1
        fRVbr/uURmiFVMdEWoy0DxLIxDoVgdEFUy1ys2X2XYA1yN4AFoRfW0Yx7doGVvDPiFb8GYZhxYD
        f+ffcdAsZoljnHd8fCb+55Eb2yIaubzTlyg==
X-Received: by 2002:a50:fd0d:: with SMTP id i13mr43784600eds.163.1622718360936;
        Thu, 03 Jun 2021 04:06:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHUn+3A7/1pTM/kN+87ikBefLFwqocZZGD74h0oNyoZ+eWqf4gmNGMHHT7DQLZTza+eAJ7ZQ==
X-Received: by 2002:a50:fd0d:: with SMTP id i13mr43784589eds.163.1622718360827;
        Thu, 03 Jun 2021 04:06:00 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id r1sm1557815edp.90.2021.06.03.04.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 04:06:00 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: toshiba_acpi: Fix missing error code in
 toshiba_acpi_setup_keyboard()
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        coproscefalo@gmail.com
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1622628348-87035-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <3921079d-92cf-a057-0404-231280f2c092@redhat.com>
Date:   Thu, 3 Jun 2021 13:05:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1622628348-87035-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/2/21 12:05 PM, Jiapeng Chong wrote:
> The error code is missing in this code scenario, add the error code
> '-EINVAL' to the return value 'error'.
> 
> Eliminate the follow smatch warning:
> 
> drivers/platform/x86/toshiba_acpi.c:2834 toshiba_acpi_setup_keyboard()
> warn: missing error code 'error'.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

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
>  drivers/platform/x86/toshiba_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
> index fa7232a..352508d 100644
> --- a/drivers/platform/x86/toshiba_acpi.c
> +++ b/drivers/platform/x86/toshiba_acpi.c
> @@ -2831,6 +2831,7 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
>  
>  	if (!dev->info_supported && !dev->system_event_supported) {
>  		pr_warn("No hotkey query interface found\n");
> +		error = -EINVAL;
>  		goto err_remove_filter;
>  	}
>  
> 

