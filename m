Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCD5C001B0
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Jul 2023 14:19:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234556AbjGZOTX (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Jul 2023 10:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235072AbjGZOTE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Jul 2023 10:19:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D0F1448C
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690381038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=eSalCi6glzfTgG5uK7V7MEndFxat2B7581xZZuweQRQ=;
        b=ZGXrMRoWXj6U8F4/u+14flPKfcoMA9KvXYCMXPyMRR8XO+gPViy5M1QMH2IJHCr4KSGbuB
        SLtTjhSthZAUyNFPalKhaeLM47Op68FaIbQpAt1Qyb9jbH4flSyvCsO1p0M2UdL+1hIM6T
        2+x/tH3YNiFZasokHkQejIsC4pRQ5ak=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-GGDcXw2NP_KAbebzDOORAA-1; Wed, 26 Jul 2023 10:17:17 -0400
X-MC-Unique: GGDcXw2NP_KAbebzDOORAA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-99bcf6ae8e1so14569666b.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Jul 2023 07:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690381035; x=1690985835;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eSalCi6glzfTgG5uK7V7MEndFxat2B7581xZZuweQRQ=;
        b=guEgcA5hnmnAAInsYSOyrQOAycfeIkwRZv/FnA6mBYv/wBhOsWGPdOofIP53ul0FPC
         xEFqGzOlI3FVb+j8qMerTJTZYKhleM5o5R+Nfpl5eMEk+ilDcX4AmsW3JLxt4/TsenDg
         AUpQRWoHItSa+aIy19yd1WdGjo+Om6m4R4uxeMalvbYmn6I/Kc4WeFP3B1l9sXmqurKp
         W+LNN+FOr2LvsAQeSxOIyVjkqlyDTTN/LOVorwzhvhBRkkIW5Vjg/ITiLkA9Z0AmVtbA
         xkHsddI4vUTCThEMDWCPWCJmcDwCzChOac2xoSn1DofnH+7kLSkqeFBWXwEzCUQqfhzP
         AAAA==
X-Gm-Message-State: ABy/qLajqcDjLGJnBtfWHUyNZgy/3wZ9HGISkh/WZD8B9FEKMeMhM+7Q
        sKlFjkJsL5UR2SqQhXral68HDgU6UTEKxOP9+pYklznShu3ACSCLnevMo3Kbs7LWLDke3aMxsQj
        YhEiFm57T5nNxSh4AX03pr8z1EpAUIoNzxoCVv4zglg==
X-Received: by 2002:a17:907:77c1:b0:99b:4867:5e1a with SMTP id kz1-20020a17090777c100b0099b48675e1amr1693636ejc.41.1690381035541;
        Wed, 26 Jul 2023 07:17:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFzwVzYhIJKrbWH0uTb/rp+H6gY0SxUXduNWI+NgdvL6tG3lphQLT14y2Of7kie8hiukdNYDg==
X-Received: by 2002:a17:907:77c1:b0:99b:4867:5e1a with SMTP id kz1-20020a17090777c100b0099b48675e1amr1693619ejc.41.1690381035209;
        Wed, 26 Jul 2023 07:17:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k27-20020a1709063e1b00b00982842ea98bsm9536631eji.195.2023.07.26.07.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jul 2023 07:17:14 -0700 (PDT)
Message-ID: <3b62fee2-0768-d662-1f6c-9229f59b1776@redhat.com>
Date:   Wed, 26 Jul 2023 16:17:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] platform/x86: hp-bioscfg: fix a signedness bug in
 hp_wmi_perform_query()
Content-Language: en-US, nl
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        Jorge Lopez <jorge.lopez2@hp.com>
Cc:     Mark Gross <markgross@kernel.org>,
        =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <linux@weissschuh.net>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <ad0a6ad9-099b-40a4-ae91-b9dca622ff4e@moroto.mountain>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ad0a6ad9-099b-40a4-ae91-b9dca622ff4e@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/18/23 09:05, Dan Carpenter wrote:
> The error handling won't work if "mid" is unsigned.  "ret" is used to
> store negative error codes and declaring it as a u32 won't cause a bug
> but it's ugly.  The "actual_outsize" variable is a number between 0-4096
> so it can be declared as int as well.
> 
> Fixes: 69ea03e38f24 ("platform/x86: hp-bioscfg: biosattr-interface")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Thank you for your patch-series, I've applied the series to my
review-hans branch:
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
>  drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> index 1d59ad600b84..dea54f35b8b5 100644
> --- a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> +++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
> @@ -123,7 +123,7 @@ int hp_wmi_perform_query(int query, enum hp_wmi_command command, void *buffer,
>  	struct bios_return *bios_return;
>  	union acpi_object *obj = NULL;
>  	struct bios_args *args = NULL;
> -	u32 mid, actual_outsize, ret;
> +	int mid, actual_outsize, ret;
>  	size_t bios_args_size;
>  
>  	mid = hp_encode_outsize_for_pvsz(outsize);

