Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C88C04A68
	for <platform-driver-x86@archiver.kernel.org>; Thu, 28 Jul 2022 18:44:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231745AbiG1Soi (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 28 Jul 2022 14:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232083AbiG1Soi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 28 Jul 2022 14:44:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1E42A7539A
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659033876;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=i5DZbLJbyft2xfK4rEmaQLiZfAqfd5MekksSTpFvPNo=;
        b=Nw6/R/5pAYigatyEYVPeZRI3CxT34tvswSjl+Hhz+Xi7dvOzUhoEqSp9axHhJQAvdr6MHV
        1WtgbTSmp1NCDJcuixwe0/U2fLLi3WTAyG1PkMI2jH1zhAXiTx76lDVgUQh0/Yb/5dntLC
        qstTL5ElKEprXKDljLLRq5iie2HfFNo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-241-TL4irrUeP9KhsWKZ3ZXUdQ-1; Thu, 28 Jul 2022 14:44:34 -0400
X-MC-Unique: TL4irrUeP9KhsWKZ3ZXUdQ-1
Received: by mail-ej1-f72.google.com with SMTP id oz11-20020a1709077d8b00b0072f2f17c267so923153ejc.16
        for <platform-driver-x86@vger.kernel.org>; Thu, 28 Jul 2022 11:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=i5DZbLJbyft2xfK4rEmaQLiZfAqfd5MekksSTpFvPNo=;
        b=Bh4IX5+85ktgIdRqzrf+NmEynVTnB44yQHMoaDeGckmqOijJELMcFSooah0+C0LcZI
         clQ4v9rCirTzzIuBatXCwJ/qmYXSG4ieJQenIKdz81489O8FFzFR+cXn0WOtANfdUcrR
         1Zod+jKmK3EUkn/UD3EVE2sEdUoc1Ty2TnGkm59HjJ+JReioS1d9ODmX18oY0x3Bn1h5
         +Aq35B8+Rqz0WdOvaoY8XRKBI9qT/19jcDcKy4sG6unlzZyR0nKtzs5oPtXIMYXWuZ6n
         Zlj1o+9EmbYyMlSB2/ruUWwz0HISElXfpgRh/Y6EtYokb36c+onY79i2M0dy51se2U8d
         C3IA==
X-Gm-Message-State: AJIora9MgMLbxE5hRBqwgtE7Tf3Wv1FxLw3+y9ugYJwtDePP2K/vJd/t
        MeV0+cmhwycAVc73QOQJSeiDaIbrnBUsKK7l2gV8uG/fU8mHOGbI8ywohYe9W5fUcacsZrd8n7k
        3w4afG58dkwBGYLY8KYd2RLtFuic8p/OIqA==
X-Received: by 2002:a05:6402:3511:b0:43b:c84c:e233 with SMTP id b17-20020a056402351100b0043bc84ce233mr267138edd.211.1659033873554;
        Thu, 28 Jul 2022 11:44:33 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sDDQj1w6C4bmpLIJZ5NoEIbhdwKazzBeLPMikzRKiO1K6X2FI580MhCxThPTmuwssGg2ZUBg==
X-Received: by 2002:a05:6402:3511:b0:43b:c84c:e233 with SMTP id b17-20020a056402351100b0043bc84ce233mr267129edd.211.1659033873394;
        Thu, 28 Jul 2022 11:44:33 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id a8-20020aa7d908000000b0043bc33530ddsm1153823edr.32.2022.07.28.11.44.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 11:44:32 -0700 (PDT)
Message-ID: <055c43cb-26f3-9a51-8e59-e0133e3839c1@redhat.com>
Date:   Thu, 28 Jul 2022 20:44:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] platform/surface: gpe: Add support for 13" Intel version
 of Surface Laptop 4
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220721121120.2002430-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220721121120.2002430-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/21/22 14:11, Maximilian Luz wrote:
> The 13" Intel version of the Surface Laptop 4 uses the same GPE as the
> Surface Laptop Studio for wakeups via the lid. Set it up accordingly.
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
> index 27365cbe1ee9..c219b840d491 100644
> --- a/drivers/platform/surface/surface_gpe.c
> +++ b/drivers/platform/surface/surface_gpe.c
> @@ -171,6 +171,18 @@ static const struct dmi_system_id dmi_lid_device_table[] = {
>  		},
>  		.driver_data = (void *)lid_device_props_l4D,
>  	},
> +	{
> +		.ident = "Surface Laptop 4 (Intel 13\")",
> +		.matches = {
> +			/*
> +			 * We match for SKU here due to different variants: The
> +			 * AMD (15") version does not rely on GPEs.
> +			 */
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_SKU, "Surface_Laptop_4_1950:1951"),
> +		},
> +		.driver_data = (void *)lid_device_props_l4B,
> +	},
>  	{
>  		.ident = "Surface Laptop Studio",
>  		.matches = {

