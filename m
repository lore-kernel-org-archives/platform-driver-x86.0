Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAE8C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:30:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 764AF61040
	for <platform-driver-x86@archiver.kernel.org>; Wed, 19 May 2021 13:30:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353711AbhESNbn (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 19 May 2021 09:31:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33850 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240121AbhESNbj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 May 2021 09:31:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1621431019;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0enBGImmf0zzRSgY4Jvs9Yb1j7HX7ZFUvmCoMGislyU=;
        b=OrHunx0TRDOaOz9G0YpYrsYFd7OwIpimRqepK5y/yDFEuNsxiN/nJng7LqpJHiFPCSpubp
        1LiEaawvio1fNT38Atnzln34Amyv3CJCG2YYwH2890EKj2Zw/oSxrQcHe4NW3zoLqPALq4
        uJ0saLkrSYqKd4ikHOWVaJw2qrTVgdo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-M0OENYWkOd6e0wZ733QQ0g-1; Wed, 19 May 2021 09:30:15 -0400
X-MC-Unique: M0OENYWkOd6e0wZ733QQ0g-1
Received: by mail-ed1-f71.google.com with SMTP id cn20-20020a0564020cb4b029038d0b0e183fso7692488edb.22
        for <platform-driver-x86@vger.kernel.org>; Wed, 19 May 2021 06:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0enBGImmf0zzRSgY4Jvs9Yb1j7HX7ZFUvmCoMGislyU=;
        b=PY/kOBpHHLKwB4NO7R0SGPDVFd3PFekc5+7VBWT9DPI+4OvNGUXFsiDjpRs4aDuDeH
         CyN4pOVjDYwBY75qy1JA2fAWAHkJTKnPR8/7Dp5azl5ed7XvTiz0bbTxTwHg0j1/UhPv
         Uc10dQNqypvzKiIuA1BnPLzQASAgsqKLwycnT/75MQCLPPwqf89XCY76QJPZABqx6TXz
         R5OL7eBzKnSiMm0UsePOvs8e+Ktq3nGqI69GCOaweClE0feoy0MvBHgK6GrtwbAiSLVh
         bNFxctEBuSfjW/953PonOXFtlxD6XJGMf3/3myckbLULUXaxZCILFUXc3VCrNVzTZJqU
         FeJw==
X-Gm-Message-State: AOAM531p8Q/9ryjcmZ3n07V5mCiyMwjbXneivHNGoB8nqbLf9bo98l7E
        gC66hM7LgofuImZQevJGh2xs7D6MEW3DRPPOuaip325jrGFhVjMxcWWuUViQWVmnu8ySqB+oxzW
        uOiU1JkSu82iHZqTSONmS+0DeacOwF6szfA==
X-Received: by 2002:a05:6402:524d:: with SMTP id t13mr14673579edd.209.1621431014286;
        Wed, 19 May 2021 06:30:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhQYmo98nIJU06ikZWUMw+VNg8NVZR1DVoi2wiFl3JQLCr8KbjzI8qgU97PezGaXRfM/T7zA==
X-Received: by 2002:a05:6402:524d:: with SMTP id t13mr14673549edd.209.1621431014120;
        Wed, 19 May 2021 06:30:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t23sm11492856edq.74.2021.05.19.06.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 May 2021 06:30:13 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] platform/x86: intel_punit_ipc: Append
 MODULE_DEVICE_TABLE for ACPI
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Zha Qipeng <qipeng.zha@intel.com>,
        Mark Gross <mgross@linux.intel.com>
References: <20210519101521.79338-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5d04884e-2094-3272-cf13-d661ec9025f9@redhat.com>
Date:   Wed, 19 May 2021 15:30:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210519101521.79338-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/19/21 12:15 PM, Andy Shevchenko wrote:
> The intel_punit_ipc driver might be compiled as a module.
> When udev handles the event of the devices appearing
> the intel_punit_ipc module is missing.
> 
> Append MODULE_DEVICE_TABLE for ACPI case to fix the loading issue.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

I will also include this in the next pdx86-fixes pull-req for 5.13.

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/intel_punit_ipc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel_punit_ipc.c b/drivers/platform/x86/intel_punit_ipc.c
> index e0f838f0791b..b5763ca699b9 100644
> --- a/drivers/platform/x86/intel_punit_ipc.c
> +++ b/drivers/platform/x86/intel_punit_ipc.c
> @@ -320,6 +320,7 @@ static const struct acpi_device_id punit_ipc_acpi_ids[] = {
>  	{ "INT34D4", 0 },
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(acpi, punit_ipc_acpi_ids);
>  
>  static struct platform_driver intel_punit_ipc_driver = {
>  	.probe = intel_punit_ipc_probe,
> 

