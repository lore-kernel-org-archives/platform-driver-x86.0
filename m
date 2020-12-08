Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 362A6C1B0D9
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 10:20:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E9F9F23A84
	for <platform-driver-x86@archiver.kernel.org>; Tue,  8 Dec 2020 10:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727260AbgLHKUg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 8 Dec 2020 05:20:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49625 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728050AbgLHKUg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Dec 2020 05:20:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1607422749;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=p/Ycxbdy3VSNXHW3src/1FNwaL1hgG86LfpEipasEQg=;
        b=Dy12gaFwjFuBhUJlzVufDN8AIoadrUlEfbbTb44zbjWEq2Jtl3dz+dqy48VeB6r+MgLNDr
        1Iikv36qhQh7/KD8w4iLxNPxGb6vXr1PfdyQac6QpJcfmTLJNxOfANRbFyTTi6YDs9/3CI
        InGM3eKK884vbiTgOydJKzMXngFYFxU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-EmzMjZoFNviDthDg1QtQvg-1; Tue, 08 Dec 2020 05:19:08 -0500
X-MC-Unique: EmzMjZoFNviDthDg1QtQvg-1
Received: by mail-ed1-f70.google.com with SMTP id d12so4895440edx.23
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Dec 2020 02:19:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p/Ycxbdy3VSNXHW3src/1FNwaL1hgG86LfpEipasEQg=;
        b=pBsV5P/dRTnKkEMke8+lwkaXj6fe1tP2mBYYxY1fwKffRpaqBU8B8wWy3A2IbAtfE6
         UDoaZuYwJPC1/BinVzhhOxMzw2H3Pg+kw3lwVR0jTaEWvWsgNfsHMfrmb+1KndAUAGGZ
         /D5k5DXgNGSBID9/9d0HCfgg02Ka5sIyb0JY8UIzXrUJVQ3kRrZdL+cQa0nBMB+IhF5V
         g//OxhfTVBn6jbKZDh6uGlwgrtk0m8xxsZ7eM8VGWBigSmDIRCpHd/c/1XQL2bpT++vD
         sVBpVRs2dPQ/AY6XZEQWJ/Yu4JLyKVJc8lp7Ij5aSfKlpUxIU+4aX34LivXaWqE/oilH
         Fwjg==
X-Gm-Message-State: AOAM532f2t1t+8P1/dejIDFLWJ6rxNVNChpeLMWDMB7taI5Jq0DBawtF
        zlHeryUxLWT8OSxGDFRqQyWtXMiTjs5NcwU4tO+uiUebLtl2ppJau3k6SF4oXWlZ3hDH1Z/1VBa
        ToSE/e/OY2wqj7S576xmCYzu2oXKRFsR/+PpU/5nNwGv7oh2QQccVNAob96JbRGrXRdxgjjIWUp
        N8aW1qkY8/Zw==
X-Received: by 2002:a50:e68a:: with SMTP id z10mr23669477edm.28.1607422746692;
        Tue, 08 Dec 2020 02:19:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwv6Mfvq3wSK9a98AZ0XnNokywuv3KFkfCwU15tR1CFKqwPJ1laNBr+fONOLiyZrhgPzY2Gaw==
X-Received: by 2002:a50:e68a:: with SMTP id z10mr23669458edm.28.1607422746459;
        Tue, 08 Dec 2020 02:19:06 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id r24sm8976505edc.21.2020.12.08.02.19.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Dec 2020 02:19:05 -0800 (PST)
Subject: Re: [PATCH] platform/x86: intel-hid: add Rocket Lake ACPI device ID
To:     Alex Hung <alex.hung@canonical.com>, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
References: <20201208020620.101455-1-alex.hung@canonical.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2ea73e0d-d0ae-e7b3-47e9-d82562a71465@redhat.com>
Date:   Tue, 8 Dec 2020 11:19:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208020620.101455-1-alex.hung@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/8/20 3:06 AM, Alex Hung wrote:
> Rocket Lake has a new ACPI ID for Intel HID event filter device.
> 
> Signed-off-by: Alex Hung <alex.hung@canonical.com>

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
>  drivers/platform/x86/intel-hid.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel-hid.c b/drivers/platform/x86/intel-hid.c
> index 8626197..a65c48c 100644
> --- a/drivers/platform/x86/intel-hid.c
> +++ b/drivers/platform/x86/intel-hid.c
> @@ -21,6 +21,7 @@ MODULE_AUTHOR("Alex Hung");
>  static const struct acpi_device_id intel_hid_ids[] = {
>  	{"INT33D5", 0},
>  	{"INTC1051", 0},
> +	{"INTC1054", 0},
>  	{"", 0},
>  };
>  MODULE_DEVICE_TABLE(acpi, intel_hid_ids);
> 

