Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60963C433EF
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 10:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237660AbiAKKI2 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 05:08:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37776 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237384AbiAKKI2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 05:08:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641895707;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1iyWqbcZvCn+TpKBR83f0dPFYWebeIK5z5+d0N8lXJM=;
        b=SJqPTCl9xFcTMy/22amtU692dvMZ2AitqGl34ClWRgn3RN9qkMz6ZmBLplB/3LIMZ2eEYb
        KdIUb3XevBZspoXKm6DmXuaHUy/Ob4R892tOHpRp0NmtsGpvePX1U4yaNH2XcEW/6/ka/Y
        OPKhp44h8BzRH9Ml6/UwW1BX6kF1eio=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-J3SzXSIPMfqIz7mrj7hCSA-1; Tue, 11 Jan 2022 05:08:26 -0500
X-MC-Unique: J3SzXSIPMfqIz7mrj7hCSA-1
Received: by mail-ed1-f72.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso12812097edt.20
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 02:08:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1iyWqbcZvCn+TpKBR83f0dPFYWebeIK5z5+d0N8lXJM=;
        b=kcIvIjx19cuVSt1qzAbTKUux2nyhon6EERcV3iE3bOJfItacuNCyFUJ25w4Af/s/f+
         89sCnm9p0iRMJU/FPJ2JMasVVIQlLBxOlrv/hHCBz7zUayF6osyia4We/eQUcb4GEAY7
         wzQlZM2+7oerNKtSGASBDKPhItyGW3/ok4pvQhUE4qWgCyaVPgt7NYHRmrR2CQDBPuv1
         Cts9XPZlTesgJYJJcBePN2TIYLZkA/PKtH8t5gr+MF/DYxkahzIg9B39n/FJihbB5O+K
         ijG+2TmRX66VjJOLiHs+QNBklScHV9o7d4tkDSVtcnIemf7viNT+MRTYBxqbcDyE9g6s
         hziQ==
X-Gm-Message-State: AOAM533csD6QmDARdmNvHO/2D8wU/fOVOyQtmURorDuSReT3hi4EmRsu
        VnY3rq8jy8OaSAFNMd7Pty2ulYFl73CwLrYGxOLDwYGQ8AF8tD0KK6AuRw7Lv/8iM2g+dzNs2QM
        1wyUCMD3azWMwTTil98FBmUcMgv7iY81Rgw==
X-Received: by 2002:a17:907:3d94:: with SMTP id he20mr2924400ejc.14.1641895704990;
        Tue, 11 Jan 2022 02:08:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzvC/+Bt8m8W7TM69rwAdb1fVWT4Xee2q6VcoYijsrK36f6D6uCjZrLiwdUcNTFJDFZBhEMWw==
X-Received: by 2002:a17:907:3d94:: with SMTP id he20mr2924384ejc.14.1641895704836;
        Tue, 11 Jan 2022 02:08:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id lv23sm3393373ejb.125.2022.01.11.02.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 02:08:24 -0800 (PST)
Message-ID: <f70585d0-f92e-6efb-48fa-4656ac71cebd@redhat.com>
Date:   Tue, 11 Jan 2022 11:08:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: x86-android-tablets: Correct
 crystal_cove_charger module name
Content-Language: en-US
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <20220111100708.38585-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220111100708.38585-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/11/22 11:07, Hans de Goede wrote:
> The module was renamed to intel_crystal_cove_charger before it was
> merged, updated bq24190_modules to match.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (eventually to be for-next) branch now.

Regards,

Hans

> ---
>  drivers/platform/x86/x86-android-tablets.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
> index 7dac9edc74bf..a044b1a27055 100644
> --- a/drivers/platform/x86/x86-android-tablets.c
> +++ b/drivers/platform/x86/x86-android-tablets.c
> @@ -206,8 +206,8 @@ static struct bq24190_platform_data bq24190_pdata = {
>  };
>  
>  static const char * const bq24190_modules[] __initconst = {
> -	"crystal_cove_charger", /* For the bq24190 IRQ */
> -	"bq24190_charger",      /* For the Vbus regulator for intel-int3496 */
> +	"intel_crystal_cove_charger", /* For the bq24190 IRQ */
> +	"bq24190_charger",            /* For the Vbus regulator for intel-int3496 */
>  	NULL
>  };
>  
> 

