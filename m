Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EE5C7618A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 10:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbjCTKcs (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 06:32:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230206AbjCTKcd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 06:32:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0564824723
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 03:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679308298;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4n8bWb2KiPyIVO86ZuijbXpENsFMRvDrfBE+34gfo+A=;
        b=HB3CXj3fH6Ti199aQsa2A7bB8KatfjAzWrf2f57yeuAC6sy8yroawPqd98eiry/Iu7FJs9
        TznODsi6yNuzpwuzXMyJuMx+TFHAZar4ylklG8P5hgps4sWRI5KtTM61qb3FfiSVMjArqi
        CTKx6YSR95iQBzIeMN78ocZA5aWDzrY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-439-_fDvzUtZOI6lb-2zhoeWDQ-1; Mon, 20 Mar 2023 06:31:37 -0400
X-MC-Unique: _fDvzUtZOI6lb-2zhoeWDQ-1
Received: by mail-ed1-f72.google.com with SMTP id e18-20020a056402191200b004fa702d64b3so17098188edz.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 03:31:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679308296;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4n8bWb2KiPyIVO86ZuijbXpENsFMRvDrfBE+34gfo+A=;
        b=AvTxlcDIKA2w4yvvvLQU3qLP1ZVZDp8uNdjycawOLPjdbozuFphqMTUUwircmPCLty
         WYZqPYOENixUN6td5r5yzfeOhYEZeo8tQ4/BGIY3uTjhh7HdSczcgNMQGTrI8tCBUbSe
         Kc0sYL8YIKh3Knhj153DKoG75Vnk/Zel0BFJWVKcYYDuTnIMGQr7n17AVL6P/jbBvRX/
         pJAJ5QLsRhw17RtVyMR/O2jMkGVSim7cgmRGxdJojTIGcYAHgFcSDQZpZXKa61hCRb0B
         6JbNvl76HZ7r4rmb9ZbGPb5vP5CWu6sKgvAowIjaYnBGMTOA1u4oWK+qNALurc4RVoCm
         CCsw==
X-Gm-Message-State: AO0yUKVu3AI0Nhgea2JQVyOtgsld+zhLnkLDv5DeSz+rZUIbw/tP9ZAN
        1Wb0Yi41GsLH+wIkJ7H8pnSeREZ21/NWoZrpdnaSc7gBt/ddbzgRSvGqCmzhlZPk17cjOQxqFl/
        kxC7nBHy0T6lFk+9+laXGDfldlg63vpsk0lyBmqBmRA==
X-Received: by 2002:a05:6402:12cd:b0:4ac:bd6f:cacc with SMTP id k13-20020a05640212cd00b004acbd6fcaccmr10464112edx.12.1679308296353;
        Mon, 20 Mar 2023 03:31:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set9yBLrsEsykYPmr6XCzfvBz9SvvmrPLdLpPO5whLop5rGfWnUA7uTMS/kJmgfpCC7qBPWJAfg==
X-Received: by 2002:a05:6402:12cd:b0:4ac:bd6f:cacc with SMTP id k13-20020a05640212cd00b004acbd6fcaccmr10464097edx.12.1679308296106;
        Mon, 20 Mar 2023 03:31:36 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id c14-20020a509f8e000000b005003fd12eafsm4552816edf.63.2023.03.20.03.31.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 03:31:35 -0700 (PDT)
Message-ID: <2ce0b1cc-f595-1fab-3f4d-d0891d04347b@redhat.com>
Date:   Mon, 20 Mar 2023 11:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH linux-next v2 3/3] drivers/platform/x86/intel: fix a
 memory leak in intel_vsec_add_aux
Content-Language: en-US
To:     Dongliang Mu <dzm91@hust.edu.cn>,
        "David E. Box" <david.e.box@linux.intel.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230309040107.534716-1-dzm91@hust.edu.cn>
 <20230309040107.534716-4-dzm91@hust.edu.cn>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230309040107.534716-4-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/9/23 05:01, Dongliang Mu wrote:
> The first error handling code in intel_vsec_add_aux misses the
> deallocation of intel_vsec_dev->resource.
> 
> Fix this by adding kfree(intel_vsec_dev->resource) in the error handling
> code.
> 
> Reviewed-by: David E. Box <david.e.box@linux.intel.com>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>

Thank you for your patch, I've applied this patch (as first patch
in the series) to my review-hans branch:
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
>  drivers/platform/x86/intel/vsec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> index 13decf36c6de..2311c16cb975 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -154,6 +154,7 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
>  	ret = ida_alloc(intel_vsec_dev->ida, GFP_KERNEL);
>  	mutex_unlock(&vsec_ida_lock);
>  	if (ret < 0) {
> +		kfree(intel_vsec_dev->resource);
>  		kfree(intel_vsec_dev);
>  		return ret;
>  	}

