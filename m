Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C60A0C433ED
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9513961362
	for <platform-driver-x86@archiver.kernel.org>; Wed,  7 Apr 2021 14:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348717AbhDGOsw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 7 Apr 2021 10:48:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22568 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348673AbhDGOsu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 10:48:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617806916;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JjWRf2e6o/JzDynLaUHm4RQ83JFb64f/gW9Jl6qFnaQ=;
        b=ZO56fQpXl60ZWgpNX3TPW5+9ST1/48hhUcv0QyVrBWkV7EZYmydQl6lDQO11vu2XUEBmaq
        HgvHQttTQDlSnFZJ9onRNxeUB+9WuG+BpWQLCN4qHbdshFLy853R1bsViS7hFeYTWuI9L0
        Qafp7EGy9IAvfn78Wilo3Dx5uO1WBD4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-83-cVrlWg0oMX6vuAzmChSqgw-1; Wed, 07 Apr 2021 10:48:34 -0400
X-MC-Unique: cVrlWg0oMX6vuAzmChSqgw-1
Received: by mail-ej1-f69.google.com with SMTP id gn30so6999282ejc.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Apr 2021 07:48:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JjWRf2e6o/JzDynLaUHm4RQ83JFb64f/gW9Jl6qFnaQ=;
        b=ouKTs1+dUPg880F93SwDd6xL1eAgEhZLs0zcR1AQxxlSNAiFsmh7AbZOdHFbRFPnWx
         VjQuKODFf5kgis+I0JMKpqH8zvwFtilli5sQovcRVZn8zq2P4FYU2ktODntx0rrZY2WX
         0ifWWlX/eni4Pfk/HZ7Ln8iof65C2WuEkAGPIG+6W6tjHi+Vq2MDbWDKWzJei96yp6iQ
         6PUAmYi+2cxks5IUScdNlpX5t98iN4hN85hytKZQq2xIl4b2gqXlu8Xgxg5USq1NgaeX
         lj4x/fkL4Ggrsda6S8spk5mgam3zyHIuUGWdhogHjClo1DugQk2bxvgfaeG6U0ZPN/Kr
         kRNQ==
X-Gm-Message-State: AOAM531m623FnDBQ/m3jSG8PVRN7petW0mdJn2aQP8m1Kzt/oHtk0KWL
        6bvR7uPLsoE3EJfuJupO8hHyiCbWbp2xbzYI6hIo4WMW5g372RUXbfJZ54VS+KcBmLPSj/lh24/
        dtTygf27E5fWeDlj6VeAqnQ3tp2XxbAr0MA==
X-Received: by 2002:a17:906:aad4:: with SMTP id kt20mr4157071ejb.367.1617806913584;
        Wed, 07 Apr 2021 07:48:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypmXkcI7aFjUtZAONHueGeCKZ2vuS1trA2VvQKkE19ZBHZlRZsYsQZJx3SDVU9wleeMZE23Q==
X-Received: by 2002:a17:906:aad4:: with SMTP id kt20mr4157051ejb.367.1617806913483;
        Wed, 07 Apr 2021 07:48:33 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id lf6sm7731455ejc.33.2021.04.07.07.48.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 07:48:33 -0700 (PDT)
Subject: Re: [PATCH 9/9] platform/x86: intel_pmc_core: Add support for Alder
 Lake PCH-P
To:     "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, mgross@linux.intel.com,
        gayatri.kammela@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210401030558.2301621-1-david.e.box@linux.intel.com>
 <20210401030558.2301621-10-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <22931e34-f344-b29a-87dc-c80584ed7f37@redhat.com>
Date:   Wed, 7 Apr 2021 16:48:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210401030558.2301621-10-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/1/21 5:05 AM, David E. Box wrote:
> Alder PCH-P is based on Tiger Lake PCH.
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  drivers/platform/x86/intel_pmc_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 9168062c927e..88d582df829f 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -1440,6 +1440,7 @@ static const struct x86_cpu_id intel_pmc_core_ids[] = {
>  	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT,	&tgl_reg_map),
>  	X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT_L,	&icl_reg_map),
>  	X86_MATCH_INTEL_FAM6_MODEL(ROCKETLAKE,		&tgl_reg_map),
> +	X86_MATCH_INTEL_FAM6_MODEL(ALDERLAKE_L,		&tgl_reg_map),
>  	{}
>  };
>  
> 

