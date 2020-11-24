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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968DAC56201
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 12:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D1722076B
	for <platform-driver-x86@archiver.kernel.org>; Tue, 24 Nov 2020 12:07:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WGDxhVps"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733236AbgKXMHh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 24 Nov 2020 07:07:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30698 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729172AbgKXMHg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 24 Nov 2020 07:07:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606219655;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jUepnH/BY2weycp09UNa2ieOA6E5qsUEEiisaW54yy4=;
        b=WGDxhVpsNn54JKS+9qmcajLMEXBVb1VjV8MiRCuWBIMRSfDQslwcs4fFTA1CUZugWwKyx0
        496tB2dXmoZ/4JcLL9/frFnW1hmqkC0/yLiSFkowgnrffa/ZCuKZGepEZxoShee1nmovFK
        BUniZwTugDbm+kYyNOK8DuvKOm5Dnf0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-iwcBy7VkOla1T3rCXD4m-g-1; Tue, 24 Nov 2020 07:07:33 -0500
X-MC-Unique: iwcBy7VkOla1T3rCXD4m-g-1
Received: by mail-ej1-f72.google.com with SMTP id dx19so6740891ejb.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 24 Nov 2020 04:07:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jUepnH/BY2weycp09UNa2ieOA6E5qsUEEiisaW54yy4=;
        b=nQUOXGOv9T9sabHkZvZcfl/+XfRtl0Eb1e2rq69YwQ7ucSCkM9Xl0Y6EjXkCkvvMEf
         xSFsuWgSRNL6FmnurBlqdFWbsZ71J/Tg+ANKOhDaK/5YcNZYNDnQvUYWwttsIOsPawr9
         3WO3v/2uz5j13MVNgfqP76a8a6e2ybtMaUUbX7PStUiNqzTQd0/tVUn/8wQgfLPONGcw
         Bg3gsd7McisWWVUnvdJKODzqO6qM+5j0jDphGNTuj/6h7ljweOfuafUyZQEr2GzemieW
         V0bNkhy9cXLppW1XbbjMc9PSmUYU55SlyzTFBe6yy9tzE5SuB7ImPQjnAw/PXWVkjPsY
         CsQQ==
X-Gm-Message-State: AOAM532oSQhwn986dLlHtN2uS6EJCtcBcUV1h1gqf8TTjkRc/kumHOXD
        7csdh0UZqP1TZwaSdzzOnPyC94av4QmjrC6u2B1E1L14lkEO20i1ZaIWVRk6BrFdQNZwIreqbDU
        1tpkbOVYHNY4QXdueGwiFjBz7HvJRjrmzVg==
X-Received: by 2002:aa7:d801:: with SMTP id v1mr3507233edq.252.1606219651924;
        Tue, 24 Nov 2020 04:07:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoJogVcFvQbdPqObhJFAsKvlWD4bs/ji5r0zZThKsuDDMBWN5+EhaXd9jsoqJ8+JF7NrcKKA==
X-Received: by 2002:aa7:d801:: with SMTP id v1mr3507213edq.252.1606219651736;
        Tue, 24 Nov 2020 04:07:31 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id j9sm6690121ejf.105.2020.11.24.04.07.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 04:07:31 -0800 (PST)
Subject: Re: [PATCH] platform/surface: gpe: Add support for 15" Intel version
 of Surface Laptop 3
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        platform-driver-x86@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>, linux-kernel@vger.kernel.org
References: <20201113223935.2073847-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <265fc25c-c6f8-e1df-ccc5-fa4f55c42f39@redhat.com>
Date:   Tue, 24 Nov 2020 13:07:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113223935.2073847-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/13/20 11:39 PM, Maximilian Luz wrote:
> In addition to a 13" version, there is also a 15" (business) version of
> the Surface Laptop 3 based on Intel CPUs. This version also handles
> wakeup by lid via (unmarked) GPEs, so add support for it as well.
> 
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

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
>  drivers/platform/surface/surface_gpe.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
> index 0f44a52d3a9b..e49e5d6d5d4e 100644
> --- a/drivers/platform/surface/surface_gpe.c
> +++ b/drivers/platform/surface/surface_gpe.c
> @@ -146,6 +146,18 @@ static const struct dmi_system_id dmi_lid_device_table[] = {
>  		},
>  		.driver_data = (void *)lid_device_props_l4D,
>  	},
> +	{
> +		.ident = "Surface Laptop 3 (Intel 15\")",
> +		.matches = {
> +			/*
> +			 * We match for SKU here due to different variants: The
> +			 * AMD (15") version does not rely on GPEs.
> +			 */
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "Surface_Laptop_3_1872"),
> +		},
> +		.driver_data = (void *)lid_device_props_l4D,
> +	},
>  	{ }
>  };
>  
> 

