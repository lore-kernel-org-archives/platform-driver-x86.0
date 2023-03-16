Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1ABC6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 12:51:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjCPMvP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 08:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbjCPMvO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 08:51:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B925839BA4
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 05:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678971014;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RPdjSzj6jsV5topoFHb/CW9wwLlrUfcPQ2AkSEnDD0g=;
        b=c7Q5+w0yhCsCA3PnL8AnHJDVnPURr+9A0HhBO+sY7WFoV+tjUYGEoafVXvRCOe+pGUQ/AP
        Zj9S35ryuV1/a3cLtRTYPJYbZus4YNtvvoO0BJ3rdJaHByzaMcmYGKr7jVeF7PbjD+Who0
        U4eN7T/KJbCdVoPGUmV85s/nvgPNbPU=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-wBwrLo8XMA2A_5-wAGohKw-1; Thu, 16 Mar 2023 08:50:13 -0400
X-MC-Unique: wBwrLo8XMA2A_5-wAGohKw-1
Received: by mail-ed1-f69.google.com with SMTP id t14-20020a056402240e00b004fb36e6d670so2901722eda.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 05:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678971012;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RPdjSzj6jsV5topoFHb/CW9wwLlrUfcPQ2AkSEnDD0g=;
        b=m1Y+8jIOqeWak8iG+uEkxjcuimxkEqpKH8Uu4wJbE4wxOa5LW2MMykuOLiN9vSw3fh
         6iTsPURWyAf5hkhzDdcf7QzxcxGsRs8Vw+ty71kOOEa6UFD8ABwUSmfZuOIQGAzqwL/e
         9O/abjNiuB+jL4WMYBOXeAwUZmvy5/N8C7/pPCgDXxFv7jmkBspunhTjBLnSaLGfWmaE
         F0yZ2+VxPy1AhPlhZYj22PNvXBB9bX7a0AUW6+E49FjUplo7g+7K5LNZ9P9eiWFAtBya
         3vLAPH/1Nbxyuw2AaEY39CUllCOpd8AqR2Brf5Vz937nI6ljqMi/FpvWCPeMHk1pIX5U
         aD6A==
X-Gm-Message-State: AO0yUKWxYxmVQ2UOeWpTdCxqSjOUmvrttkDI2zJ2AYEAbmtpSOGrgJNz
        Pk5VSx3VNtKuxQFwNK4L1RfQI8ucKNYWHaaMWMuVgzsqT7H1siorO/nmOo5ttpj/pVfYjSmPn+z
        DDl8sXGgT5UlvcJ3nvlPjpflNQS3/dQFxQB4ECmbKjA==
X-Received: by 2002:a17:907:2130:b0:930:f1b4:c033 with SMTP id qo16-20020a170907213000b00930f1b4c033mr1066576ejb.11.1678971011922;
        Thu, 16 Mar 2023 05:50:11 -0700 (PDT)
X-Google-Smtp-Source: AK7set++DOjx83OQ0JfoGdfQG9v8lmgkiW061sRJeYdjos2LTGanTGZWCP0iNKnh4yf+Lz3jt0zw6A==
X-Received: by 2002:a17:907:2130:b0:930:f1b4:c033 with SMTP id qo16-20020a170907213000b00930f1b4c033mr1066562ejb.11.1678971011661;
        Thu, 16 Mar 2023 05:50:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id d7-20020a50f687000000b004fe9386b259sm3293507edn.41.2023.03.16.05.50.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 05:50:11 -0700 (PDT)
Message-ID: <63814b1b-1297-da4d-79fe-8f2e58e30482@redhat.com>
Date:   Thu, 16 Mar 2023 13:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/3] platform: olpc: mark SPI related data as maybe unused
Content-Language: en-US, nl
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>,
        Daniel Oliveira Nascimento <don@syst.com.br>,
        Mattia Dongili <malattia@linux.it>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230312132624.352703-1-krzysztof.kozlowski@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230312132624.352703-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Krzysztof,

On 3/12/23 14:26, Krzysztof Kozlowski wrote:
> The driver can be compile tested as built-in making certain data unused:
> 
>   drivers/platform/olpc/olpc-xo175-ec.c:737:35: error: ‘olpc_xo175_ec_id_table’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/platform/olpc/olpc-xo175-ec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/olpc/olpc-xo175-ec.c b/drivers/platform/olpc/olpc-xo175-ec.c
> index 4823bd2819f6..04573495ef5a 100644
> --- a/drivers/platform/olpc/olpc-xo175-ec.c
> +++ b/drivers/platform/olpc/olpc-xo175-ec.c
> @@ -734,7 +734,7 @@ static const struct of_device_id olpc_xo175_ec_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, olpc_xo175_ec_of_match);
>  
> -static const struct spi_device_id olpc_xo175_ec_id_table[] = {
> +static const struct spi_device_id olpc_xo175_ec_id_table[] __maybe_unused = {
>  	{ "xo1.75-ec", 0 },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(spi, olpc_xo175_ec_id_table);

The whole presence of the olpc_xo175_ec_id_table[] seems to make little sense.

This should be referenced by:

static struct spi_driver olpc_xo175_ec_spi_driver = {

Like this:

        .probe          = olpc_xo175_ec_probe,
        .remove         = olpc_xo175_ec_remove,
+       .id_table       = olpc_xo175_ec_id_table,

Otherwise those ids cannot be used to load the driver the non DT/of way. Since the driver assumingly does actually bind already this means that it is only used the DT/of way and it seems to me that the whole olpc_xo175_ec_id_table[] can be removed entirely.

Exposing modaliases for a non supported way of binding the driver does not really seem useful ?

Patches 2/3 and 3/3 do make sense, I'll merge those soonish.

Regards,

Hans






