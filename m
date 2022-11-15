Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DF4C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 15 Nov 2022 10:17:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238363AbiKOKRO (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 15 Nov 2022 05:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230071AbiKOKRM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 05:17:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CFBB49
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 02:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668507380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3vno3X52jsRsUBAZe1JJk23Cpta5RuMmLgCyf1CTAVY=;
        b=NcIbDef2gMk0+DvAP3BwGoS2zoQ22PQokqrCCZMmAf0ai2CZPxWjTBTUTLTHqccnbTLfvv
        qHMU037Ac8cEwLcB2HdpyvXiE2kGndtw/HlNqSwJgv4hQp8uwXWGIHAoqLGPdQAsoqSJ5U
        ZvdOEUFikBd0np98eizr3YiawM4zti4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-654-ALZ-XjekOgSuPuemGjm24A-1; Tue, 15 Nov 2022 05:16:17 -0500
X-MC-Unique: ALZ-XjekOgSuPuemGjm24A-1
Received: by mail-ed1-f70.google.com with SMTP id q13-20020a056402518d00b00462b0599644so9898902edd.20
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 02:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3vno3X52jsRsUBAZe1JJk23Cpta5RuMmLgCyf1CTAVY=;
        b=F3O/oKKsIEUrug3BjnzxsW8QCn9aeFgyZwBYRYM96MhdM2nhCbjtoLAn7h0RL7EmSr
         AIKw4Z9wXAxu/3NjMSsEuZ32dIHfMIJXfwpctQAzQusvTw07D2Pf9qnaN16Jwgxgdsm7
         d3bKSGO/EWI1jtj5idp77rohqd1C46JZLY0ArIk1I1XVeL0If8XsNoH0Q9R5nHFPOO7A
         Vqe2v2Tb6zIIBMXd5oAJ6jKiDgi1W8ULN5GJ0zOEHh/lU5pqZwcczaZpJx2UUrM4EWtX
         5SSq9vFxcplG2cWUUxaOMjJlNVFPaMVFemUToX6X2K+MebEWz4Ndp0vABi83NnpA21vp
         B2wg==
X-Gm-Message-State: ANoB5pl/Q3v0tuRqCdKGY10JbYCRCpfEE0Ithcl7jqLLLQ4EwfAiZR3k
        kU7Jif4Cszan7t/+vaX21ErNrpc8oFY1iK4BG4/bcwvnhFB1UnVX97R9vi4hGyEtEr+RLrwkYbw
        m0Nu0pbbvC+CaS1jN9lGkUZLnfDN9fWvh1w==
X-Received: by 2002:aa7:c543:0:b0:458:dbc5:67c5 with SMTP id s3-20020aa7c543000000b00458dbc567c5mr14628578edr.214.1668507376108;
        Tue, 15 Nov 2022 02:16:16 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Zhzz++AzzFZUfj0rmr2lhuAtbuqQ1u0Z8Km4FngCPU7XLkRw0ICRP26+4y9nqUv4NcGZKcQ==
X-Received: by 2002:aa7:c543:0:b0:458:dbc5:67c5 with SMTP id s3-20020aa7c543000000b00458dbc567c5mr14628565edr.214.1668507375936;
        Tue, 15 Nov 2022 02:16:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 18-20020a170906201200b0078b83968ad4sm5286488ejo.24.2022.11.15.02.16.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 02:16:15 -0800 (PST)
Message-ID: <9339b523-0054-d9bb-12c5-016755f94aa3@redhat.com>
Date:   Tue, 15 Nov 2022 11:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2] x86/platform/intel/iosf_mbi: Fix error handling in
 iosf_mbi_init()
Content-Language: en-US, nl
To:     Yuan Can <yuancan@huawei.com>, dvhart@infradead.org,
        andy@infradead.org, tglx@linutronix.de, mingo@redhat.com,
        bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
        hpa@zytor.com, david.e.box@linux.intel.com,
        jarkko.nikula@linux.intel.com, wsa@kernel.org,
        rafael.j.wysocki@intel.com, platform-driver-x86@vger.kernel.org
References: <20221115091600.74246-1-yuancan@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221115091600.74246-1-yuancan@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/15/22 10:16, Yuan Can wrote:
> A problem about modprobe iosf_mbi failed is triggered with the following
> log given:
> 
>  debugfs: Directory 'iosf_sb' with parent '/' already present!
> 
> The reason is that iosf_mbi_init() returns pci_register_driver()
> directly without checking its return value, if pci_register_driver()
> failed, it returns without removing debugfs, resulting the debugfs of
> iosf_sb can never be created later.
> 
>  iosf_mbi_init()
>    iosf_mbi_dbg_init() # create debugfs
>    pci_register_driver()
>      driver_register()
>        bus_add_driver()
>          priv = kzalloc(...) # OOM happened
>    # return without remove debugfs and destroy workqueue
> 
> Fix by removing debugfs and iosf_mbi_pm_qos when pci_register_driver()
> returns error.
> 
> Fixes: 8dc12f933c9d ("x86/iosf: Add debugfs support")
> Fixes: e09db3d241f8 ("x86: baytrail/cherrytrail: Rework and move P-Unit PMIC bus semaphore code")
> Signed-off-by: Yuan Can <yuancan@huawei.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
> Changes in v2:
> - fix typos in commit msg
> - change to the suggested error handling style
>  arch/x86/platform/intel/iosf_mbi.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/platform/intel/iosf_mbi.c b/arch/x86/platform/intel/iosf_mbi.c
> index fdd49d70b437..2d64985c53f9 100644
> --- a/arch/x86/platform/intel/iosf_mbi.c
> +++ b/arch/x86/platform/intel/iosf_mbi.c
> @@ -545,11 +545,23 @@ static struct pci_driver iosf_mbi_pci_driver = {
>  
>  static int __init iosf_mbi_init(void)
>  {
> +	int ret;
> +
>  	iosf_debugfs_init();
>  
>  	cpu_latency_qos_add_request(&iosf_mbi_pm_qos, PM_QOS_DEFAULT_VALUE);
>  
> -	return pci_register_driver(&iosf_mbi_pci_driver);
> +	ret = pci_register_driver(&iosf_mbi_pci_driver);
> +	if (ret)
> +		goto err_remove;
> +
> +	return 0;
> +
> +err_remove:
> +	cpu_latency_qos_remove_request(&iosf_mbi_pm_qos);
> +	iosf_debugfs_remove();
> +
> +	return ret;
>  }
>  
>  static void __exit iosf_mbi_exit(void)

