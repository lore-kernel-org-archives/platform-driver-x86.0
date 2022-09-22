Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81D5C6FA82
	for <platform-driver-x86@archiver.kernel.org>; Thu, 22 Sep 2022 13:57:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbiIVN5Y (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbiIVN5U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Sep 2022 09:57:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C95EFA79
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 06:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663855039;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nskChPy4glYBFrIXy8qsZs6L121OHEImDdW1c6/aua4=;
        b=HuOeDY3iFSTzhLw+mEWrEvnEsrkxVAd+D8C6jg1kvwTyh6P1W85S8KYYG8BUUttnMa5qlR
        LznQWNYsKpr1gvBVtQub9Hy5hP39eYLhELdUD1LhPGeBMXblPDuodxnP0zcqlEmB3uCd7P
        vByDNqAVY0MTizEPPLsng3xHZPZ35/I=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-655-vK1gYRzWPgGjfx68stUByg-1; Thu, 22 Sep 2022 09:57:17 -0400
X-MC-Unique: vK1gYRzWPgGjfx68stUByg-1
Received: by mail-ed1-f71.google.com with SMTP id e15-20020a056402190f00b0044f41e776a0so6712853edz.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Sep 2022 06:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=nskChPy4glYBFrIXy8qsZs6L121OHEImDdW1c6/aua4=;
        b=futkj9ywbJhkh9XGMg8egIP6jpxl8gQyLGPQUSuxFWOlvvCzvIGNll5d1i9N0e3cwZ
         uj/KlCnD7F/nNJtU9zUDQ06SwQ1Zi6wPyAlsRTJCHIVogpSH7lNhAYqmB4xR1lnOidU/
         T6+sx/Orm4K0p/5BlsV/5uvlYKhke2slGeJ1l8uOh0sqSkfIs8gxsmccvEUnXAQGKeYh
         rT4VuhhCBPuJI3eYUuW4rIWQlDJ5FMVlwwgDVdcprBjO6ZXlLnOgPS0wM9NtBz4oja5c
         4zeShulDY+wwGht0aGCQsFndsm3NnkwqPNwhR9DPK2r2QP8ywnBw7gzVEzOxa/bpA8ck
         n+zg==
X-Gm-Message-State: ACrzQf26QlKQYzMfFl8W+v7d67wJBH4ThfG2AXjCtdLJXNeAOo64xVft
        c8V+5LxR1DYUisATuhnsOS/WTMhCvpjpBGGHIW4Bn82N7yeJcocKCMdmw6tDqiNdVXkaKYIcram
        mrP1Yzncn2NKLI9Extj4NGGdZ4rphs/qeIw==
X-Received: by 2002:a17:906:2bc7:b0:72f:dc70:a3c6 with SMTP id n7-20020a1709062bc700b0072fdc70a3c6mr2981641ejg.645.1663855036818;
        Thu, 22 Sep 2022 06:57:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7I0THngZa3Z2Cdc3gKejpCxdcSu0xzir8XpH3kEbn752qgqtjkWDU81TtSE4ljywtyDqPCYg==
X-Received: by 2002:a17:906:2bc7:b0:72f:dc70:a3c6 with SMTP id n7-20020a1709062bc700b0072fdc70a3c6mr2981628ejg.645.1663855036633;
        Thu, 22 Sep 2022 06:57:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id jz20-20020a17090775f400b0073d7bef38e3sm2674462ejc.45.2022.09.22.06.57.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 06:57:16 -0700 (PDT)
Message-ID: <aa010c89-2c85-efd0-e24a-a87fc99f37b9@redhat.com>
Date:   Thu, 22 Sep 2022 15:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] platform/x86: int3472/discrete: Drop a forward
 declaration
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Daniel Scally <djrscally@gmail.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
References: <20220920070101.907596-1-u.kleine-koenig@pengutronix.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220920070101.907596-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/20/22 09:01, Uwe Kleine-König wrote:
> By swapping the definition of skl_int3472_discrete_remove() and
> skl_int3472_discrete_probe() the forward declaration of the former can
> be dropped. This is a good thing as it removes code duplication.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

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
> Hello,
> 
> I didn't check in detail, but in my experience calling the remove
> function in the error path of the probe function is prone to cleanup
> errors. I didn't spot anything after a quick glance, but let me point
> out this is unstable. E.g. in an error path of
> skl_int3472_register_clock() the function is left with
> int3472->clock.clk pointing to an unregistered clk and int3472->clock.cl
> == NULL. Someone modifying the return function must be well aware of
> that.
> 
> Best regards
> Uwe
> 
>  drivers/platform/x86/intel/int3472/discrete.c | 34 +++++++++----------
>  1 file changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index ed4c9d760757..974a132db651 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -331,7 +331,22 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
>  	return 0;
>  }
>  
> -static int skl_int3472_discrete_remove(struct platform_device *pdev);
> +static int skl_int3472_discrete_remove(struct platform_device *pdev)
> +{
> +	struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
> +
> +	gpiod_remove_lookup_table(&int3472->gpios);
> +
> +	if (int3472->clock.cl)
> +		skl_int3472_unregister_clock(int3472);
> +
> +	gpiod_put(int3472->clock.ena_gpio);
> +	gpiod_put(int3472->clock.led_gpio);
> +
> +	skl_int3472_unregister_regulator(int3472);
> +
> +	return 0;
> +}
>  
>  static int skl_int3472_discrete_probe(struct platform_device *pdev)
>  {
> @@ -383,23 +398,6 @@ static int skl_int3472_discrete_probe(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -static int skl_int3472_discrete_remove(struct platform_device *pdev)
> -{
> -	struct int3472_discrete_device *int3472 = platform_get_drvdata(pdev);
> -
> -	gpiod_remove_lookup_table(&int3472->gpios);
> -
> -	if (int3472->clock.cl)
> -		skl_int3472_unregister_clock(int3472);
> -
> -	gpiod_put(int3472->clock.ena_gpio);
> -	gpiod_put(int3472->clock.led_gpio);
> -
> -	skl_int3472_unregister_regulator(int3472);
> -
> -	return 0;
> -}
> -
>  static const struct acpi_device_id int3472_device_id[] = {
>  	{ "INT3472", 0 },
>  	{ }
> 
> base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868

