Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FA14C433EF
	for <platform-driver-x86@archiver.kernel.org>; Thu, 14 Jul 2022 19:49:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240749AbiGNTtL (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 14 Jul 2022 15:49:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240773AbiGNTtJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Jul 2022 15:49:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AF5B02A40D
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 12:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1657828146;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iO6/U5jvOEkMN6+5jOvymgFCuk9/AsH1Vqtm0cSdhzI=;
        b=Ii0ARlZ6xk1nrF4/5KnEGFOpBnr7xUgUpOXm5afNXNAhsVKSybLRBxyZf4g/DcDIDyQhPw
        OMsD+u4XM0AnnnIfOC5uy3knZ8sNoLptwnDTObnpD4aUvuOv9Z9w9hBjApEeRI7uFgsOGG
        kf4i83eHzRxkjDnH4DNuq/et04a5who=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-Ov80pzzjNBm3ZGF1e54-qA-1; Thu, 14 Jul 2022 15:49:05 -0400
X-MC-Unique: Ov80pzzjNBm3ZGF1e54-qA-1
Received: by mail-ed1-f69.google.com with SMTP id z20-20020a05640240d400b0043a82d9d65fso2091450edb.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Jul 2022 12:49:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iO6/U5jvOEkMN6+5jOvymgFCuk9/AsH1Vqtm0cSdhzI=;
        b=LPyFmQgPdUl5bwLGfkRuKXNAkP4SH18r1Lz/iWdflHvhiQeBvw/pzqECn4KhpjY8bE
         5eWR/nmRKuHGyYuBzMFR3Y3nOIwOst783w0C6WQGiIICN8cEjKgcl5P5w5yLFqOmhtlz
         WK6LcK1BRIDnJlHPxnBEhBOqrXGWV8bZTgZTsqSDXJVXA3tNcocQk4o/3zefeNSUJjHe
         WDNIbkJ+MAnEWEF1iCHfAjCCA7+W1hhj638qOu1ppBt4Ykef2UD+psRtdqRWZbcaIfgr
         9mFrVJ/6SqNZ9gbELxaVx36IUJSTomBRr2ZlHQYrPS4s4YClzB+iB1qSQbN5FvrOov2T
         To4g==
X-Gm-Message-State: AJIora9GuvHUAUDsfd8f1ycmbrO5SGCIZQ4Eu+2oEw9SfEe/ZP2PYjb8
        SGacNTd+M0fMFxJoEhOF1m6JSBam3q8+yR9gVRs+5Uh1NUeghDivV1ZiVH6cgAljlkw6A8XLVAx
        WTSPX5CZT/1hBWp/kxhPiQVoXrbilRI7wjw==
X-Received: by 2002:a05:6402:2b93:b0:43a:5aad:73c2 with SMTP id fj19-20020a0564022b9300b0043a5aad73c2mr14541020edb.300.1657828144208;
        Thu, 14 Jul 2022 12:49:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t6OV1MCd6iZ5F7vvMF70fnIVQq31vYx/5mlv1ubca/PFvaEM7yPGw1QWqENjFZz6d/CKYr4w==
X-Received: by 2002:a05:6402:2b93:b0:43a:5aad:73c2 with SMTP id fj19-20020a0564022b9300b0043a5aad73c2mr14541003edb.300.1657828143987;
        Thu, 14 Jul 2022 12:49:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id a8-20020a056402168800b00435726bd375sm1596009edv.57.2022.07.14.12.49.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 12:49:03 -0700 (PDT)
Message-ID: <2c7d7615-9861-2b1c-d086-2c3eae3e6f82@redhat.com>
Date:   Thu, 14 Jul 2022 21:49:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] MAINTAINERS: repair file entry in MICROSOFT SURFACE
 AGGREGATOR TABLET-MODE SWITCH
Content-Language: en-US
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220713040916.1767-1-lukas.bulwahn@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220713040916.1767-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/13/22 06:09, Lukas Bulwahn wrote:
> Commit 9f794056db5b ("platform/surface: Add KIP/POS tablet-mode switch
> driver") adds the section MICROSOFT SURFACE AGGREGATOR TABLET-MODE SWITCH
> with a file entry, but the file that is added with this commit is actually
> named slightly differently.
> 
>   file entry name: drivers/platform/surface/surface_aggregator_tablet_switch.c
>   added file name: drivers/platform/surface/surface_aggregator_tabletsw.c
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
> broken reference.
> 
> Repair this file entry to the actual file name added with the commit above.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

With the requested Fixes tag added.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9bfd69e2b83d..9ec738419526 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13440,7 +13440,7 @@ MICROSOFT SURFACE AGGREGATOR TABLET-MODE SWITCH
>  M:	Maximilian Luz <luzmaximilian@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> -F:	drivers/platform/surface/surface_aggregator_tablet_switch.c
> +F:	drivers/platform/surface/surface_aggregator_tabletsw.c
>  
>  MICROSOFT SURFACE BATTERY AND AC DRIVERS
>  M:	Maximilian Luz <luzmaximilian@gmail.com>

