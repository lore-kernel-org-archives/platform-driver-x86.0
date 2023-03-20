Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BA50C7618A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 20 Mar 2023 13:51:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbjCTNv0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 20 Mar 2023 09:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbjCTNvU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Mar 2023 09:51:20 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26AD13518
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 06:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679320224;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AdZsXeBo8uwDfn+rT5MKVk4PImRFABdRL7zjfVCdjDI=;
        b=PgJnjA6mTSh32eX1DNSlS7jWQzzpdB03UJFXSsi+JNV4VVUIDqFY8iT9+97HLZg+JYj5sz
        UGt2yJng4ZBUqQ+h26bZXw6O8yDAy8ucVRKH38l5NB1/NPrUlE1734MHyyiUNSutYeIBN8
        aoS9NcSOq3t6u4fBXhMKskYdNp/UJZM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-MHawT9JiP7m0jNIZtgRkLA-1; Mon, 20 Mar 2023 09:50:23 -0400
X-MC-Unique: MHawT9JiP7m0jNIZtgRkLA-1
Received: by mail-ed1-f69.google.com with SMTP id b1-20020aa7dc01000000b004ad062fee5eso17448060edu.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Mar 2023 06:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679320222;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AdZsXeBo8uwDfn+rT5MKVk4PImRFABdRL7zjfVCdjDI=;
        b=cOE5L0ZERUmNfSqDxQ+3FTOejOZ1+qARKIw3wYeLsPCCeoDdvAn3w7OXi21RnSJ0Bw
         pLt9r+AZXAZTHhTVHyJImzDm/g4HSAm+gECoSFFTuxlPx69CzyUEJScx5Xcr4BtwqQjU
         eW3ArGtGmYVP8G6vclWO1BguIHCJIF40QSwzmzVPKz1vcWwWhMzcgPFqQRNQA/+nVIHp
         hV4fWxtYOPjCfGSuuq9fjjOSpHZl4XPWca6xKix4a1eYatfPjYGxmdaMsTLNU1G/c+Ay
         7l3Lf+0z6b9ds0+rWXTs2S2PJd+q7FtKr4qfisoBUiARrOFBkhHM/NPzRe4BeLjb/UcP
         HQSA==
X-Gm-Message-State: AO0yUKWcyCw8NcHpICQ7cb3Sw/UpNIiiHw+jS0BhS1zvdGdhGm/MtHUb
        fKhFnSw8thV4EvIUSZR25t9Go3uE0tTZmFqLzXtFmZUiLnJutFiRgn/5hk9QvjwoVruKwGsNwpn
        JBvkf1+7rtbxOKl6WN6QhhOkdIC7uHHOSHg==
X-Received: by 2002:a17:907:2121:b0:905:a46b:a725 with SMTP id qo1-20020a170907212100b00905a46ba725mr8326658ejb.16.1679320222457;
        Mon, 20 Mar 2023 06:50:22 -0700 (PDT)
X-Google-Smtp-Source: AK7set//+ocMBPxAJ+oGl7O0hvGDyckPLBuK7NygnKdhNz3yM3r6+sh+5veETrsH1xY0DXNdI1GCeA==
X-Received: by 2002:a17:907:2121:b0:905:a46b:a725 with SMTP id qo1-20020a170907212100b00905a46ba725mr8326644ejb.16.1679320222231;
        Mon, 20 Mar 2023 06:50:22 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id rh26-20020a17090720fa00b00930ba362216sm4516540ejb.176.2023.03.20.06.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 06:50:21 -0700 (PDT)
Message-ID: <22d2e345-3640-c8b4-e913-204f1d96dde3@redhat.com>
Date:   Mon, 20 Mar 2023 14:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] platform: olpc: use SPI device ID data to bind device
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230316160324.78856-1-krzysztof.kozlowski@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230316160324.78856-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/16/23 17:03, Krzysztof Kozlowski wrote:
> The driver defines spi_device_id table for module autoloading, but does
> not use it in id_table which causes W=1 warning:
> 
>   drivers/platform/olpc/olpc-xo175-ec.c:737:35: error: ‘olpc_xo175_ec_id_table’ defined but not used [-Werror=unused-const-variable=]
> 
> Reference the SPI device ID table, so it can be also used for device
> binding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

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


> 
> ---
> 
> Changes since v1:
> 1. Rework the patch - reference the ID table instead of __maybe_unused.
> ---
>  drivers/platform/olpc/olpc-xo175-ec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/olpc/olpc-xo175-ec.c b/drivers/platform/olpc/olpc-xo175-ec.c
> index 4823bd2819f6..62ccbcb15c74 100644
> --- a/drivers/platform/olpc/olpc-xo175-ec.c
> +++ b/drivers/platform/olpc/olpc-xo175-ec.c
> @@ -746,6 +746,7 @@ static struct spi_driver olpc_xo175_ec_spi_driver = {
>  		.of_match_table = olpc_xo175_ec_of_match,
>  		.pm = &olpc_xo175_ec_pm_ops,
>  	},
> +	.id_table	= olpc_xo175_ec_id_table,
>  	.probe		= olpc_xo175_ec_probe,
>  	.remove		= olpc_xo175_ec_remove,
>  };

