Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBE0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 13:46:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9538E60F4B
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Oct 2021 13:46:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236303AbhJKNsh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Oct 2021 09:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60570 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233144AbhJKNsh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Oct 2021 09:48:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633959997;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=u6DOb9W+mr1GjdJH/2XbWUql9BRZsSj2QfBWX7iXaJU=;
        b=S7twIDh8n4hdFfYSWxaxlAbZhpYmv6QpWFUDmYaxxzAJ9+7cUo/tx6m7DHO55+a+bUvMmc
        wQFc/6LP0/D7s4qKRUAHaWDOAnBA/jOvwDKjGKFQ4DVJmyfT6Br0anz9/hWn4KNBB7sMOy
        I5wOhNxMQxNL8PU0iI0u9SO/095DWMo=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-y1ga-RDEPF6DcUFxOGlE-A-1; Mon, 11 Oct 2021 09:46:35 -0400
X-MC-Unique: y1ga-RDEPF6DcUFxOGlE-A-1
Received: by mail-ed1-f69.google.com with SMTP id u24-20020aa7db98000000b003db57b1688aso10561286edt.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Oct 2021 06:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=u6DOb9W+mr1GjdJH/2XbWUql9BRZsSj2QfBWX7iXaJU=;
        b=ye9hZJY+fLzvxZocCaaLkyZhy4VQQ9tBj/DgtpguMSds5bmuQOzkl9X+h4RNUE5fXu
         8hUv6ISj8u5WGqsxknsi3UpyCCA6FacgI4FRYIrHHwp8jJzjb3oJG3idQLrBF118ARdF
         IQx2ROeDZyNV/enBXZqmKjXkv/pJMCyFazjdW94t3DHOdWm6hqHix7JnPY7+QUZULgvx
         QTmtnyM2APAm//uI7TglSxs96xvcEQ1n5el8i+jlLxa9G8O4Sdzs4wDEHuviOVvTOjuE
         7s4k5khxv2JxR6Hq6hLC0bXfMHYeJheKWheD/BDljw1lgTXF5aquc2RGiYefy4dJlHdr
         cJYQ==
X-Gm-Message-State: AOAM532kGBcDBCmGsGa1teMdOfAiRNZNrJlP/bqUIZt9NPKEBL6u+/5h
        3ud+7S4dQS9O/+N4+S1rGikDiNeJXXjFAdsU81vU66mNqdRzBJeKQq5D4vOVHu6s12U8wPCaVlz
        fKUkqwe+PaIsXIWUj8octRLiLcBuGctz9bA==
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr43526203edt.189.1633959993700;
        Mon, 11 Oct 2021 06:46:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRwi9U7s2IhR5kI8VuvUR4QQwNMVV7wDkQjkuDwgGNm8rg71fZHIgmHCovzrOcnv2oFED7dw==
X-Received: by 2002:aa7:db8a:: with SMTP id u10mr43526174edt.189.1633959993550;
        Mon, 11 Oct 2021 06:46:33 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id f12sm757429edx.90.2021.10.11.06.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Oct 2021 06:46:33 -0700 (PDT)
Subject: Re: [PATCH 1/2] platform/x86: amd-pmc: Add alternative acpi id for
 PMC controller
To:     Sachi King <nakato@nakato.io>, Shyam-sundar.S-k@amd.com,
        mgross@linux.intel.com, mario.limonciello@amd.com,
        rafael@kernel.org, lenb@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, stable@vger.kernel.org
References: <20211002041840.2058647-1-nakato@nakato.io>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <038d2490-0cfd-e68c-2129-b386e1c9d071@redhat.com>
Date:   Mon, 11 Oct 2021 15:46:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20211002041840.2058647-1-nakato@nakato.io>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/2/21 6:18 AM, Sachi King wrote:
> The Surface Laptop 4 AMD has used the AMD0005 to identify this
> controller instead of using the appropriate ACPI ID AMDI0005.  Include
> AMD0005 in the acpi id list.
> 
> Cc: <stable@vger.kernel.org> # 5.14+
> Signed-off-by: Sachi King <nakato@nakato.io>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

I will also include this in my upcoming pdx86-fixes pull-req for 5.15 .

Regards,

Hans

> ---
>  drivers/platform/x86/amd-pmc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index d6a7c896ac86..fc95620101e8 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -476,6 +476,7 @@ static const struct acpi_device_id amd_pmc_acpi_ids[] = {
>  	{"AMDI0006", 0},
>  	{"AMDI0007", 0},
>  	{"AMD0004", 0},
> +	{"AMD0005", 0},
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, amd_pmc_acpi_ids);
> 

