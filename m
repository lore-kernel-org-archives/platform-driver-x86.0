Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43F63C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 21 Oct 2021 18:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26B956136F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 21 Oct 2021 18:14:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231326AbhJUSQP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 21 Oct 2021 14:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60987 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229914AbhJUSQO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Oct 2021 14:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634840038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WOu0qllB+fT0oBa4IrNEKrfZQ1X1Q8v2WF3KPhNThx8=;
        b=BtcbY77mS+cv9RtwGVix/h2TGAM1X4fb1Bpxs6HVIXKrmtZOCafUAV4+cSN9sCcY5G8aEH
        VAVqEWte5dlp76SURRV1eb/ZbF8u17dyNQ8Ctph/xlT3lKvx62agZSKK96YFZSjfaphswR
        WisQnmiI5+hzs6X6c1N/0Tosnug8qeg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-0OTq0ZUZPF6Lre-MIBpMbg-1; Thu, 21 Oct 2021 14:13:57 -0400
X-MC-Unique: 0OTq0ZUZPF6Lre-MIBpMbg-1
Received: by mail-ed1-f71.google.com with SMTP id r25-20020a05640216d900b003dca3501ab4so1185720edx.15
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Oct 2021 11:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WOu0qllB+fT0oBa4IrNEKrfZQ1X1Q8v2WF3KPhNThx8=;
        b=iJkInTTyd/5bolVa9ENc036BWfn8WPm0pB9TKbpBPmHjTg8rJYagqUQtrimQUpSLnh
         seMJj8jt2QW1UNpICsBTQ2KeMHvriUEu3DTM7lUT1xgnjW+h66Q+ELliUiHRmfCYTHgD
         6QGDG2PP5sBa+sq2gdpO2N4oINTHN9/aLRHjq1sSaXdhv4dAFmZc+Q1E4PGOL34tPnQ3
         v/jv5SGtBQI2pxCLmwV/c3K0+UUM4G2KkJBtI0BZIVV1RIKvqSYcsdSPXjxnyndKcaKL
         +CFZounvpljcgFJRFwTjRBYypc4QswvjpkD696/XDGMIcOn+7ftgtCiCDM5pSQiqpQNM
         lOAg==
X-Gm-Message-State: AOAM531Cy2B2c8g9nvyAl0ttDF1g+vhrFv47JRHJr8oLMr0Q4IPkVMyr
        iLtPkRetaRtOgbONjIxU+oe0VU7/iSHZunO08gRE2iXNEpn2xcR0l05yaOaSaGYCzo9pPD7t53W
        4OPpsLHwmrUGhLnpTE1FiL9NiEWrYctPCUw==
X-Received: by 2002:a17:906:e2d3:: with SMTP id gr19mr9176817ejb.483.1634840035266;
        Thu, 21 Oct 2021 11:13:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy45L3FkNaUfcjbI4+CI+1aSK08Ti3Ou0ZGap5HLaQS24yMl1BxHP9AY009LUx76tzsP9B80g==
X-Received: by 2002:a17:906:e2d3:: with SMTP id gr19mr9176798ejb.483.1634840035033;
        Thu, 21 Oct 2021 11:13:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id jg13sm1068297ejc.26.2021.10.21.11.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Oct 2021 11:13:54 -0700 (PDT)
Message-ID: <6ce5e23d-1832-44c3-4330-7a05dbcd28b1@redhat.com>
Date:   Thu, 21 Oct 2021 20:13:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] platform/x86: amd-pmc: adjust arguments for
 `amd_pmc_send_cmd`
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
References: <20211020162946.10537-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20211020162946.10537-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/20/21 18:29, Mario Limonciello wrote:
> Currently the "argument" for the "message" is listed as a boolean
> value.  This works well for the commands used currently, but an
> additional upcoming command will pass more data in the message.
> 
> Expand it to be a full 32 bit value.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
>  drivers/platform/x86/amd-pmc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index b7b6ad4629a7..99ac50616bc3 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -126,7 +126,7 @@ struct amd_pmc_dev {
>  };
>  
>  static struct amd_pmc_dev pmc;
> -static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set, u32 *data, u8 msg, bool ret);
> +static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret);
>  
>  static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
>  {
> @@ -337,7 +337,7 @@ static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
>  	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
>  }
>  
> -static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set, u32 *data, u8 msg, bool ret)
> +static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, u32 arg, u32 *data, u8 msg, bool ret)
>  {
>  	int rc;
>  	u32 val;
> @@ -356,7 +356,7 @@ static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set, u32 *data, u8 msg
>  	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
>  
>  	/* Write argument into response register */
> -	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, set);
> +	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, arg);
>  
>  	/* Write message ID to message ID register */
>  	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
> 

