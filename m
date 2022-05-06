Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED9A0C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 May 2022 10:16:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390851AbiEFKUg (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 May 2022 06:20:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1390848AbiEFKUf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 May 2022 06:20:35 -0400
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [170.10.133.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 98C355DD2C
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 May 2022 03:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651832210;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tM5VN0ATAMzYwd7+G6hmsXHkP9dQZ3A5Jp9H7C9hUA0=;
        b=C5nRMnD4dmzG0oVaP8q9AGXBKguaHL+aZ4LaHmRP7FJnME2Jm7o0IfoQWcYUtY4XwVPihA
        2AxR9kSRHXRBRK5jltY2lkqWkxmPINyOPg1dSNGng4bmlskMj1/70b5kU9uSV+kMdGEZPj
        9Crs05m0DIzxYgcynuiiMmEPP9Mm7OE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-SiGJaPEZMQSZKxN6iwVaoQ-1; Fri, 06 May 2022 06:16:47 -0400
X-MC-Unique: SiGJaPEZMQSZKxN6iwVaoQ-1
Received: by mail-ed1-f72.google.com with SMTP id cw28-20020a056402229c00b00425dda4b67dso3773328edb.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 May 2022 03:16:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tM5VN0ATAMzYwd7+G6hmsXHkP9dQZ3A5Jp9H7C9hUA0=;
        b=5for16hDrZE7KLFPMPrXvdQq3lA9lcT9VXo0v6kN9aizbqTq0lpA3Bog4Ou/jL4YcE
         e1Te/5zBEhjwNnWGD6b5jXBTQnelLlWNVFlRPsYhp3fNgiShzfxc9KhhbT9gf4bga003
         XEwDOHvDNuqOWlM2w6RROMU7IiYTwwCtdyVeTvQkZTY67BL5rCpfkBziAg9NgQ2PJEAA
         /Q1vmKlHy9g5xzmzxZoPAS7a545MIy6qZpioS03wZSOttuVw9HB+Vk4ut0IUOmegapcM
         SqSPFQoQhgGhA/Eve4FxP3d/JZ3Vh9wX6qjdL+bMdrMj1Kniy4OL+CTZGO/HbU9AnDyK
         BsPA==
X-Gm-Message-State: AOAM5329yfJN4dpTAk7n/OBwGTfddl6PLbwCLIdSUZLha9JZDZXsQaAn
        jQdWHgA1WUJXytKoevWgjwJlIooLS6NLVihzTdTN92foeQ8jerJp6CdB9YdtiF4erZRZC8/Xqxa
        Pwvsr9RWrWwGqGFaiLQijnQrwiAvePHtHvg==
X-Received: by 2002:a50:d4d4:0:b0:425:e6bf:8b81 with SMTP id e20-20020a50d4d4000000b00425e6bf8b81mr2571833edj.209.1651832203223;
        Fri, 06 May 2022 03:16:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztqXy5fhF7ceR+Z8bS5eeVTHDlaEHIyOQuT0Xd5ol9rFG9XdmWgKfNC8izEQX5i2MzYsCSrQ==
X-Received: by 2002:a50:d4d4:0:b0:425:e6bf:8b81 with SMTP id e20-20020a50d4d4000000b00425e6bf8b81mr2571815edj.209.1651832203004;
        Fri, 06 May 2022 03:16:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id lr9-20020a170906fb8900b006f3ef214dd9sm1758552ejb.63.2022.05.06.03.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 03:16:42 -0700 (PDT)
Message-ID: <f6c17be0-5ad4-0be8-2f85-6f95d4bbccfa@redhat.com>
Date:   Fri, 6 May 2022 12:16:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/surface: gpe: Add support for Surface Pro 8
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220429180049.1282447-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220429180049.1282447-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/29/22 20:00, Maximilian Luz wrote:
> The new Surface Pro 8 uses GPEs for lid events as well. Add an entry for
> that so that the lid can be used to wake the device. Note that this is a
> device with a keyboard type-cover, where this acts as the "lid".
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
>  drivers/platform/surface/surface_gpe.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
> index c1775db29efb..ec66fde28e75 100644
> --- a/drivers/platform/surface/surface_gpe.c
> +++ b/drivers/platform/surface/surface_gpe.c
> @@ -99,6 +99,14 @@ static const struct dmi_system_id dmi_lid_device_table[] = {
>  		},
>  		.driver_data = (void *)lid_device_props_l4D,
>  	},
> +	{
> +		.ident = "Surface Pro 8",
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Surface Pro 8"),
> +		},
> +		.driver_data = (void *)lid_device_props_l4B,
> +	},
>  	{
>  		.ident = "Surface Book 1",
>  		.matches = {

