Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44E82C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 08:38:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F43660F46
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 08:38:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238213AbhIMIjm (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 04:39:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58662 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238815AbhIMIj2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 04:39:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631522289;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Qh6P33VcH3uz2AI1w5Pma4JSyKdtq+QIbmAMwM1Yrh0=;
        b=OH8u9DjrNnRlOD7KqZl5hY74E/C2bYHt3an/3OusxpohEEJBdELcHViGTCyPD2mwUOT5uh
        QXgVyohdjioww33WoznPYiknwGtWa+qWS+QdJ8eTJY2cYspcE19nSMKvwZxpneFTq7Afel
        EBSoRbLWKX3Shb2iqFk/AWV0znrZJ/s=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-bVqVxQx1Oiq25G9yKHDi3g-1; Mon, 13 Sep 2021 04:38:08 -0400
X-MC-Unique: bVqVxQx1Oiq25G9yKHDi3g-1
Received: by mail-ej1-f72.google.com with SMTP id z15-20020a170906074f00b005ef9f1d0e97so1319742ejb.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 01:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qh6P33VcH3uz2AI1w5Pma4JSyKdtq+QIbmAMwM1Yrh0=;
        b=hTywcjhxhYi1ij2rgFIgXerpz3gLaZKGsuNNnJyZOQr/cfzqBQDX0vIF8ZmrLIK0IM
         NDiUw8psaQBL+fjqmc0hPltLk1B7SGicj3Gf4ofZpumtxYEBqqEueqZLiuqCpRrtcGHa
         ZsId6grdO0iFZxqtfa/r/2c3aZVP9R5N5Hw/7SwuOcU4l3ScP+0WEg7WoN57ZR4QaDNh
         k5R5bdCSh8wPz5ii35YOXHJ34cIs1thBMmTMxGDhe6fA5T8HSjRRqyaaDqyuSLlaR88J
         D8jXzraD82/cGLdblZ7ePJIWDe+thLTF6RWIf/Uk30IDfXPfvEGHLhGj5V3tWb5sw74h
         KTKA==
X-Gm-Message-State: AOAM533/dErkPwUc/D6iR9eQJaOxtfz/1XDhz+Vup1KJbLxcTMnmmOLk
        2ibxBCtH6gvrRrwubrpjHhiH8r/iakHFWOysJ05Fs47GZpfnkwieBFVjT+MoIxYK6MiSNwJfbnf
        ft+RNKGvA7sebTCdxoYqx1CKmwNfHrl4tHw==
X-Received: by 2002:a17:906:a24d:: with SMTP id bi13mr11485261ejb.481.1631522287619;
        Mon, 13 Sep 2021 01:38:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqFgVyTdiuwa+TbhSuN62Ka8m3x9OzJ7llnV4DCsSH4Tdr20imAxFAMYAlZSlxYh2RnwSBDg==
X-Received: by 2002:a17:906:a24d:: with SMTP id bi13mr11485249ejb.481.1631522287465;
        Mon, 13 Sep 2021 01:38:07 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id d10sm3553926edx.57.2021.09.13.01.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 01:38:07 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] platform/x86/intel: punit_ipc: Drop wrong use of
 ACPI_PTR()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Zha Qipeng <qipeng.zha@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        kernel test robot <lkp@intel.com>
References: <20210827145310.76239-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <80f5cda9-2855-501a-5472-7d5ab6290835@redhat.com>
Date:   Mon, 13 Sep 2021 10:38:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210827145310.76239-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/27/21 4:53 PM, Andy Shevchenko wrote:
> ACPI_PTR() is more harmful than helpful. For example, in this case
> if CONFIG_ACPI=n, the ID table left unused which is not what we want.
> 
> Instead of adding ifdeffery here and there, drop ACPI_PTR()
> and unused acpi.h.
> 
> Fixes: fdca4f16f57d ("platform:x86: add Intel P-Unit mailbox IPC driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also add this to the fixes branch, so that it gets send out
to Linus in my next pull-request with fixes for 5.15.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/intel/punit_ipc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/punit_ipc.c b/drivers/platform/x86/intel/punit_ipc.c
> index f58b8543f6ac..66bb39fd0ef9 100644
> --- a/drivers/platform/x86/intel/punit_ipc.c
> +++ b/drivers/platform/x86/intel/punit_ipc.c
> @@ -8,7 +8,6 @@
>   * which provide mailbox interface for power management usage.
>   */
>  
> -#include <linux/acpi.h>
>  #include <linux/bitops.h>
>  #include <linux/delay.h>
>  #include <linux/device.h>
> @@ -319,7 +318,7 @@ static struct platform_driver intel_punit_ipc_driver = {
>  	.remove = intel_punit_ipc_remove,
>  	.driver = {
>  		.name = "intel_punit_ipc",
> -		.acpi_match_table = ACPI_PTR(punit_ipc_acpi_ids),
> +		.acpi_match_table = punit_ipc_acpi_ids,
>  	},
>  };
>  
> 

