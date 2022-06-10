Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C7AC43334
	for <platform-driver-x86@archiver.kernel.org>; Fri, 10 Jun 2022 18:44:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243528AbiFJSof (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 10 Jun 2022 14:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345188AbiFJSod (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jun 2022 14:44:33 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F045E22DFA6
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 11:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654886672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l+bgqEFlNGsSZP0ydOxQikqPn/Ach7Xe4eAsJh69aB0=;
        b=giZGWGfCXmv+rvvVP2eQCVl9CXkhD0kzn3VM90P1QM7F7eLl3ab+Pwp/cgmLEK5xkIFvur
        fxanNy70G1RgQZ3TTUsTBgdgk2z+Lcy4zat1cVNt6lHA31XBx2ojxHEk8R9KREKu7gyHc5
        Ofa6Wffuo23JHAZliYZf7R3fcrsB8F0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-349-iUCFX1TfOUWMv75_RtCK0Q-1; Fri, 10 Jun 2022 14:44:30 -0400
X-MC-Unique: iUCFX1TfOUWMv75_RtCK0Q-1
Received: by mail-ej1-f69.google.com with SMTP id p7-20020a170906614700b006f87f866117so12879269ejl.21
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jun 2022 11:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=l+bgqEFlNGsSZP0ydOxQikqPn/Ach7Xe4eAsJh69aB0=;
        b=CmACaJGVxmvXj8t3CudBL9r/UUwPD3ZG2PcdGxkpxFkiPt0ncks6AwPfOIBhsHD4p0
         wc4cY9cI1RzC9sgpb5Don3FmN+sPd6WTsZxNExOz/zeBzBvxuSLouCJ8tHmsOn5sVqsh
         oKjTJNjTufo5ohpS863QKHUQN4IJ2IMAP3/oqziC9phC1roEtRCt62iTz/Prs6bEXzPf
         P7efwbm4xmFF4Ab5OgbrJEpWDxJ1/o9cjXB7WsGiv4gGI/xibSiEvVo3CLiphAxOjoNK
         73g0nZedlHpW5Ue/STIzMBARHhvTK53cwD3Tkm4rkK8WhpYPQK6L+5GuG1hoO51DfS53
         EqgQ==
X-Gm-Message-State: AOAM530GYPw1Qq56tCRza7Qu186FdaP/Bg4SHE/Se4Qi1F3blyOBqZe5
        d6lbWXwD9Bscl6sqKXPjeu4vszuY/gGRfXxs8F9NRQXpDK1Vniqkr1fMB1o4YJfC+8WOQadvNY8
        Fsutnn94HFeZ9nXPR4iOXFqTFrk1u3btcUw==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id fj2-20020a1709069c8200b006dfbaa29f75mr40953380ejc.762.1654886669651;
        Fri, 10 Jun 2022 11:44:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQ7MrLQnjoc0JgGNtXzN423/UM2kCHjIvtW+kLiqpNKUIPKv7D/umJ9WuGmeePmYkdRi2+dQ==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id fj2-20020a1709069c8200b006dfbaa29f75mr40953372ejc.762.1654886669456;
        Fri, 10 Jun 2022 11:44:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6? (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
        by smtp.gmail.com with ESMTPSA id l21-20020a17090615d500b006feb479fcb4sm12497662ejd.44.2022.06.10.11.44.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jun 2022 11:44:28 -0700 (PDT)
Message-ID: <66b25f33-7988-b615-9816-d4bde5c6bd0c@redhat.com>
Date:   Fri, 10 Jun 2022 20:44:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] platform/mellanox: Spelling s/platfom/platform/
Content-Language: en-US
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Shych <michaelsh@nvidia.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <9c8edde31e271311b7832d7677fe84aba917da8d.1653376503.git.geert@linux-m68k.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9c8edde31e271311b7832d7677fe84aba917da8d.1653376503.git.geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/24/22 09:15, Geert Uytterhoeven wrote:
> Fix a misspelling of the word "platform".
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
>  drivers/platform/mellanox/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/mellanox/Kconfig b/drivers/platform/mellanox/Kconfig
> index 72df4b8f4dd8b5a0..09c7829e95c4b037 100644
> --- a/drivers/platform/mellanox/Kconfig
> +++ b/drivers/platform/mellanox/Kconfig
> @@ -85,7 +85,7 @@ config NVSW_SN2201
>  	depends on I2C
>  	depends on REGMAP_I2C
>  	help
> -	  This driver provides support for the Nvidia SN2201 platfom.
> +	  This driver provides support for the Nvidia SN2201 platform.
>  	  The SN2201 is a highly integrated for one rack unit system with
>  	  L3 management switches. It has 48 x 1Gbps RJ45 + 4 x 100G QSFP28
>  	  ports in a compact 1RU form factor. The system also including a

