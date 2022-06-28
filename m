Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC7EC43334
	for <platform-driver-x86@archiver.kernel.org>; Tue, 28 Jun 2022 20:16:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbiF1UQF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 28 Jun 2022 16:16:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbiF1UPk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Jun 2022 16:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2655C37024
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jun 2022 13:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656447113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LuudToaHFtY71z1dT24Ygd09rqfeP3tpw++rIcnycEA=;
        b=T91yXH+PQSUBe9u4iiuSMcDZcthSkkTmeegGkewgjAmpLN0efIj8kl+GCylyEHph9/17PS
        aBHYaJwfWzylOl5nYZEvtJ1nbEcWgVcVH0OlE3onjjK014LePPrlbdHiCJ/vdpQI2vQ57n
        DYIF71LXdXIwjf5eCe7OGFj5ZzpinGQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-163-Js0kjD0nNkKO55f-QfEccA-1; Tue, 28 Jun 2022 16:11:51 -0400
X-MC-Unique: Js0kjD0nNkKO55f-QfEccA-1
Received: by mail-ed1-f70.google.com with SMTP id v16-20020a056402349000b00435a1c942a9so10388878edc.15
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Jun 2022 13:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LuudToaHFtY71z1dT24Ygd09rqfeP3tpw++rIcnycEA=;
        b=6pmJE0o7iLdw+pdB+0mmLailCafK/ZnygG8v9Ac5hfTsq+7MiQVj7Dm8T3g1u+rH+0
         x1wlXKuI3nnrLrAvw2BrTn0uh8M3E3M78D5PpH6DA3NhAHvMOTytM26gEns58vJ/Ct24
         MuqAZcxarZeEs1yYG3QUAVRPYBLnyHd8Ji9dfpcQPDUbJ9aeVSW9Q67nBoXgXkSwPKum
         tStLrhIhb/cJV0Geu/lNkoaNn+q1LFn+Dalxg+dBY9bz2RKe0VqwMjqy3Lb1oyvmoThd
         vtWPvkp7wbimo9k/AY63fEpbsFXQQxTaJjCFuHk4bjS9AM7Y6gcsAM1vmfOpnRlQLPDE
         PaRw==
X-Gm-Message-State: AJIora/BDd6P5a6RmxsVbiedGt9Y4Ke1iD9rKXAq/SEFkoIqquPLL3yG
        DPcywi+tddxByUWEXAEszdZVbMp7Avl/A+aK9ZgY7PpaQ450CalknEFd5THPsxdSNri5m0wxvRW
        71BnOmLn7EkEgMeF1Whme5uf+gCCPmbQ97w==
X-Received: by 2002:a17:907:6289:b0:6e0:eb0c:8ee7 with SMTP id nd9-20020a170907628900b006e0eb0c8ee7mr18777659ejc.245.1656447109997;
        Tue, 28 Jun 2022 13:11:49 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s2SzIp/JmJiAANPviK+4LqMHmI57kKWr8P7h6Z/LEQZxTGfWFpnKjLwLj4/gZ6OCkXlOmrBw==
X-Received: by 2002:a17:907:6289:b0:6e0:eb0c:8ee7 with SMTP id nd9-20020a170907628900b006e0eb0c8ee7mr18777646ejc.245.1656447109838;
        Tue, 28 Jun 2022 13:11:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id k12-20020a17090666cc00b007041e969a8asm6871952ejp.97.2022.06.28.13.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jun 2022 13:11:49 -0700 (PDT)
Message-ID: <cf39c305-7b19-8088-ea70-a485034f1e34@redhat.com>
Date:   Tue, 28 Jun 2022 22:11:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: do not use PSC mode on
 Intel platforms
Content-Language: en-US
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     markgross@kernel.org, platform-driver-x86@vger.kernel.org
References: <markpearson@lenovo.com>
 <20220627181449.3537-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220627181449.3537-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/27/22 20:14, Mark Pearson wrote:
> PSC platform profile mode is only supported on Linux for AMD platforms.
> 
> Some older Intel platforms (e.g T490) are advertising it's capability
> as Windows uses it - but on Linux we should only be using MMC profile
> for Intel systems.
> 
> Add a check to prevent it being enabled incorrectly.
> 
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>> ---
> Changes in v2: rebased on for-next stream

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



> 
>  drivers/platform/x86/thinkpad_acpi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 17d503e65a54..09047ca14b43 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10565,6 +10565,11 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  				dytc_mmc_get_available = true;
>  		}
>  	} else if (dytc_capabilities & BIT(DYTC_FC_PSC)) { /* PSC MODE */
> +		/* Support for this only works on AMD platforms */
> +		if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD) {
> +			dbg_printk(TPACPI_DBG_INIT, "PSC not support on Intel platforms\n");
> +			return -ENODEV;
> +		}
>  		pr_debug("PSC is supported\n");
>  	} else {
>  		dbg_printk(TPACPI_DBG_INIT, "No DYTC support available\n");

