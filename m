Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D27C3A5A7
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Dec 2022 16:39:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229521AbiLHQjU (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Dec 2022 11:39:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiLHQjQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Dec 2022 11:39:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 363AD27DF4
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Dec 2022 08:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670517496;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yFOU2ACZ8eAqoWeKHZA4V+eNp3dHVTtAydCNW+YjKng=;
        b=WLFtEzNbCxJjq4eLRBaeLrrxIlmVQTp317yIAkSMClRC4msfYwRXhnI+7RBzNhTxRd5iwo
        FWiYi5fcLWC5OZ5dSciXbzwh8NAs/xofm2kFsJ3ga/Q4WTuhUcNxYnijR95M7dwWT4+Qru
        vrdgV4Ik0LRPxthYvfvTQQTqRymNC6M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-452-sgIdvn2HObGT0T1rZ6LEtg-1; Thu, 08 Dec 2022 11:38:15 -0500
X-MC-Unique: sgIdvn2HObGT0T1rZ6LEtg-1
Received: by mail-ed1-f70.google.com with SMTP id x20-20020a05640226d400b0046cbe2b85caso1229415edd.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Dec 2022 08:38:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yFOU2ACZ8eAqoWeKHZA4V+eNp3dHVTtAydCNW+YjKng=;
        b=bOm+2Ij3RU4nkxN0LkX0hv8H5OquBji0fhMyqVzkpq9SFy0mYj8EbvV8/xV5VYN5iW
         xel4zG+ImRjCEuBTnk+spZGsf0DohmyMiQ5Tz+q/3uf+ilZifQCPxduSKswHUJXTm8DR
         dEC42RQB+uON07jaMdNYSRiJzasHrPeMAxyQQxzsuDTSsAs4ZDwo9FEMBgPc6hlDaANB
         +wfENfmOknMyUvyUJAFtH3YOyZ7V5w8dP1D22aUTkuyKHrEYkHOjNiGPJTTJ31wIcm5u
         syVrCTGy8DFwM0z+QkGYsWbw0xyS4pDdrVJhzF1PNgPDoyc8OHQT8OKahqRuOuCoRMBi
         Pufw==
X-Gm-Message-State: ANoB5pny5ohm6/BOD5S87/oS/SAnROLs3C43QmO4hYTpbYzZj9RtKh8e
        O9nTxPZ3ecMhTdFvv0eUeezHKdZtRrBmHefEeTA6ktZX7rRMg3GwHbo3iZ6uOW1HTeDntVEWRD3
        UbXV/I67Jg+Kb0jzEQrKkEndZRhyS2fJREQ==
X-Received: by 2002:a05:6402:22f6:b0:46d:183e:82e with SMTP id dn22-20020a05640222f600b0046d183e082emr2619593edb.15.1670517493979;
        Thu, 08 Dec 2022 08:38:13 -0800 (PST)
X-Google-Smtp-Source: AA0mqf64NxzUVoeO816pOn2TxFNFabX52o+RHFr54/Tg5teqOoZscTUgtGq6heFDumbRzclT5Yve2w==
X-Received: by 2002:a05:6402:22f6:b0:46d:183e:82e with SMTP id dn22-20020a05640222f600b0046d183e082emr2619583edb.15.1670517493836;
        Thu, 08 Dec 2022 08:38:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id i3-20020a05640200c300b00461cdda400esm3602532edu.4.2022.12.08.08.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 08:38:13 -0800 (PST)
Message-ID: <efd7cf51-f83d-9564-2881-3504f3a2cb12@redhat.com>
Date:   Thu, 8 Dec 2022 17:38:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] platform/x86: intel_scu_ipc: fix possible name leak in
 __intel_scu_ipc_register()
Content-Language: en-US, nl
To:     Yang Yingliang <yangyingliang@huawei.com>,
        mika.westerberg@linux.intel.com, markgross@kernel.org,
        lee.jones@linaro.org, andriy.shevchenko@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org
References: <20221208151916.2404977-1-yangyingliang@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221208151916.2404977-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 12/8/22 16:19, Yang Yingliang wrote:
> In some error paths before device_register(), the names allocated
> by dev_set_name() are not freed. Move dev_set_name() front to
> device_register(), so the name can be freed while calling
> put_device().
> 
> Fixes: 54b34aa0a729 ("platform/x86: intel_scu_ipc: Split out SCU IPC functionality from the SCU driver")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

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
>  drivers/platform/x86/intel_scu_ipc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
> index 7cc9089d1e14..e7a3e3402817 100644
> --- a/drivers/platform/x86/intel_scu_ipc.c
> +++ b/drivers/platform/x86/intel_scu_ipc.c
> @@ -583,7 +583,6 @@ __intel_scu_ipc_register(struct device *parent,
>  	scu->dev.parent = parent;
>  	scu->dev.class = &intel_scu_ipc_class;
>  	scu->dev.release = intel_scu_ipc_release;
> -	dev_set_name(&scu->dev, "intel_scu_ipc");
>  
>  	if (!request_mem_region(scu_data->mem.start, resource_size(&scu_data->mem),
>  				"intel_scu_ipc")) {
> @@ -612,6 +611,7 @@ __intel_scu_ipc_register(struct device *parent,
>  	 * After this point intel_scu_ipc_release() takes care of
>  	 * releasing the SCU IPC resources once refcount drops to zero.
>  	 */
> +	dev_set_name(&scu->dev, "intel_scu_ipc");
>  	err = device_register(&scu->dev);
>  	if (err) {
>  		put_device(&scu->dev);

