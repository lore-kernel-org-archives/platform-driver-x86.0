Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87AC8C433DB
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 19:58:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37AB5619C8
	for <platform-driver-x86@archiver.kernel.org>; Tue, 23 Mar 2021 19:58:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232532AbhCWT5u (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 23 Mar 2021 15:57:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38060 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232742AbhCWT5q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 Mar 2021 15:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616529465;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mbFqSrG2sRrCLakQgnlxjqEMdTAJbCULaJ2riG7khHk=;
        b=HBNpyoZOFeTRKtyWxdDZss/+4ejLSULonZrr6KzocgO65VvEGYAayFOMj1TSyPwV8WqDv4
        +pFr5R1IG5MaGQHG2VQDjByBXjlrzfpJhhokxfncJucjU4VZ7OvyXhHE2WtzISCdveIJ4S
        J2STXc+7Dpogx72Uo+ytlpAB+Fozsv4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-491-8fXC_6vwOb-wVjO1dGRUsQ-1; Tue, 23 Mar 2021 15:57:42 -0400
X-MC-Unique: 8fXC_6vwOb-wVjO1dGRUsQ-1
Received: by mail-ej1-f70.google.com with SMTP id en21so1554283ejc.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 23 Mar 2021 12:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=mbFqSrG2sRrCLakQgnlxjqEMdTAJbCULaJ2riG7khHk=;
        b=JTyW3hSaMHi/I9vN/Md68sIS2VO4qCuPbATPnT7Ms4SWYylGYMcZE96rGKmBH2AJzX
         moqFXg5UXFfL/2dnrETa1RI2EMkytsivlsEILe7bCkKhcEkBqHnQc11trLU5xeo8pUws
         WFae79IYBxjm/njdlHl4IfHbMwpXFBHEPf5b3DZsBZRllcoSl/8CwYRAVsc+n7RfJ3bJ
         3m7YlxYB0rqZACNuhDjnOaXdNuWl+eMGi1H+cj337HsAUxNhzsb8LOHk2iSXwtIHP4iR
         73XI9L+Qc8sHikzZk353Ch+OJ3menJqawmUnrQM4O1g5P31fdn0eRthPOrSjZFeuzHW2
         XBqw==
X-Gm-Message-State: AOAM532EI1ifdakZ4s63zURa3qE6x2uGEguO7nBc2K+JB0lHoW2zK73k
        EfIyZtsofj/2mTrbtH2/ftftbMz/ce+jC+eRfaUzUryf7ON8+Rd6QFOYnxdR1LkKUpJ/iIeZ6b2
        X9OaIntd8GStBnxVWeIL3DP94PalqnUBmJg==
X-Received: by 2002:a50:f391:: with SMTP id g17mr6238594edm.26.1616529461845;
        Tue, 23 Mar 2021 12:57:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxHHuV1vGaArVZf6uYZWNsgfyNiDSm5PaHkBe1EgY+BBelGFs+NY9EtrRK66hgC/Ad5LuRBaw==
X-Received: by 2002:a50:f391:: with SMTP id g17mr6238585edm.26.1616529461655;
        Tue, 23 Mar 2021 12:57:41 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id f16sm3334768ejb.3.2021.03.23.12.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Mar 2021 12:57:41 -0700 (PDT)
Subject: Re: [PATCH] platform: x86: Typo fix in the file classmate-laptop.c
To:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, cascardo@holoscopio.com,
        don@syst.com.br, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     rdunlap@infradead.org
References: <20210317084343.3788084-1-unixbhaskar@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <458e9f69-6cbb-d470-d309-09feefef1475@redhat.com>
Date:   Tue, 23 Mar 2021 20:57:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210317084343.3788084-1-unixbhaskar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/17/21 9:43 AM, Bhaskar Chowdhury wrote:
> 
> s/derefence/dereference/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

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
>  drivers/platform/x86/classmate-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
> index 3e03e8d3a07f..9309ab5792cb 100644
> --- a/drivers/platform/x86/classmate-laptop.c
> +++ b/drivers/platform/x86/classmate-laptop.c
> @@ -956,7 +956,7 @@ static int cmpc_ipml_add(struct acpi_device *acpi)
>  	/*
>  	 * If RFKILL is disabled, rfkill_alloc will return ERR_PTR(-ENODEV).
>  	 * This is OK, however, since all other uses of the device will not
> -	 * derefence it.
> +	 * dereference it.
>  	 */
>  	if (ipml->rf) {
>  		retval = rfkill_register(ipml->rf);
> --
> 2.30.2
> 

