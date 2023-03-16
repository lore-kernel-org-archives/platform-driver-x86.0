Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E314FC74A5B
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 14:07:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230227AbjCPOHa (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 10:07:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231142AbjCPOHY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 10:07:24 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48A4AD5A44
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:07:13 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r11so8192564edd.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 07:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678975632;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vl2G8fQRahhPon9XEcdzVyB1ry8SBgpUDqgOjczwYZY=;
        b=DoiYPLq9l9cP6YEznSL9+XtbHnikXbrNugbzt/uUvVQHwZzjDlfrhYnrzpSUboZ5SR
         lkw0BRqfynW4n0i3TGbEvABAMz5yNuRgQXhnKev5WJ2BAdYL5oFqjfUfNwG2zkj3xP7C
         cWNUD/Vr9hJXJpuLJFaGWM3DTUtvAjDo/PuSUIbpsXhOuAMoxU3JDTwCEkF/kWc8LEYw
         icLtmsMCMOSKz8cEXjb121u5jd9q+yCOPo+kCkluI5eJ0B+IGDIBiV+fd5QFT/taElUU
         Ump3eYx9GmGnzBsuFKbiTfPLqT7Ew4JLx194MJAxcWoEgVXhmUGm8QA5ggMCJQQyu/nq
         Bokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678975632;
        h=content-transfer-encoding:in-reply-to:cc:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vl2G8fQRahhPon9XEcdzVyB1ry8SBgpUDqgOjczwYZY=;
        b=AGE2HsFGoYNETDUQO8EOmvUQE+Norqrqc8wjuN+vs+Bgzmm7BkGkjj5gIy21ZJp2pL
         wbFhKWF9pZiRa3GII/xQ/AESOXfN7ZiFi7F0tashDdtZ4knTs7K2S6+SoIW95E/6HGjI
         dVp6Zmb+vFrMx3lv18uiiagqdDVHpJ3Go21HnBy/NUFQ01ayGLOPO9WDw9/a1mWrChCd
         9/qvot5iJRLfwdNjHYAZsF6hssJ3MQYyew4vh28KXlAQN3UlgUHagVIF3xeJDDpPwhT0
         qVMAR/WEQHzNeAi0POowWXtkR0VEEcfvp7Z1Tx+veuGqO2PmZAYcQXjDUylVo3e9FINj
         iuiQ==
X-Gm-Message-State: AO0yUKV5DPSjjVJxEnAQ70rxpRGKOcTfpEoi1aJ3R240GozVnCzZQqiA
        nb82o31Cg3hzZcUkC/Ptdx/Z+w==
X-Google-Smtp-Source: AK7set+eOw09OaHj/BkhCQOeEUdqEC+QfrZvzNMU+DOME1nyb5o4GzOQAe2V475ttHJinEpvGwu+9A==
X-Received: by 2002:a17:906:131a:b0:8b1:7eb7:d53d with SMTP id w26-20020a170906131a00b008b17eb7d53dmr10056239ejb.49.1678975631786;
        Thu, 16 Mar 2023 07:07:11 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id op13-20020a170906bced00b008c607dd7cefsm3899196ejb.79.2023.03.16.07.07.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 07:07:11 -0700 (PDT)
Message-ID: <f9408067-ee3c-9f5b-d1b3-7017113c8026@linaro.org>
Date:   Thu, 16 Mar 2023 15:07:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/3] platform: olpc: mark SPI related data as maybe unused
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>,
        Daniel Oliveira Nascimento <don@syst.com.br>,
        Mattia Dongili <malattia@linux.it>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230312132624.352703-1-krzysztof.kozlowski@linaro.org>
 <63814b1b-1297-da4d-79fe-8f2e58e30482@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <63814b1b-1297-da4d-79fe-8f2e58e30482@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 16/03/2023 13:50, Hans de Goede wrote:
> Hi Krzysztof,
> 
> On 3/12/23 14:26, Krzysztof Kozlowski wrote:
>> The driver can be compile tested as built-in making certain data unused:
>>
>>   drivers/platform/olpc/olpc-xo175-ec.c:737:35: error: ‘olpc_xo175_ec_id_table’ defined but not used [-Werror=unused-const-variable=]
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  drivers/platform/olpc/olpc-xo175-ec.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/olpc/olpc-xo175-ec.c b/drivers/platform/olpc/olpc-xo175-ec.c
>> index 4823bd2819f6..04573495ef5a 100644
>> --- a/drivers/platform/olpc/olpc-xo175-ec.c
>> +++ b/drivers/platform/olpc/olpc-xo175-ec.c
>> @@ -734,7 +734,7 @@ static const struct of_device_id olpc_xo175_ec_of_match[] = {
>>  };
>>  MODULE_DEVICE_TABLE(of, olpc_xo175_ec_of_match);
>>  
>> -static const struct spi_device_id olpc_xo175_ec_id_table[] = {
>> +static const struct spi_device_id olpc_xo175_ec_id_table[] __maybe_unused = {
>>  	{ "xo1.75-ec", 0 },
>>  	{}
>>  };
>>  MODULE_DEVICE_TABLE(spi, olpc_xo175_ec_id_table);
> 
> The whole presence of the olpc_xo175_ec_id_table[] seems to make little sense.
> 
> This should be referenced by:
> 
> static struct spi_driver olpc_xo175_ec_spi_driver = {
> 
> Like this:
> 
>         .probe          = olpc_xo175_ec_probe,
>         .remove         = olpc_xo175_ec_remove,
> +       .id_table       = olpc_xo175_ec_id_table,

Yes, it should.

> 
> Otherwise those ids cannot be used to load the driver the non DT/of way. Since the driver assumingly does actually bind already this means that it is only used the DT/of way and it seems to me that the whole olpc_xo175_ec_id_table[] can be removed entirely.
> 
> Exposing modaliases for a non supported way of binding the driver does not really seem useful ?

However binding the device and module loading (uevent) uses sometimes
different pieces. Maybe something changed in kernel, but sometime ago
certain buses where sending uevent for module loading with one ID (e.g.
platform or spi bus) but device matching would be according to OF. Thus
if you did not have entries in spi_device_id, the module would not autoload.

It was exactly the case for example here:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c46ed2281bbe4b84e6f3d4bdfb0e4e9ab813fa9d&context=30&ignorews=0&dt=0

You needed spi_device_id for proper module autoloading.

Unless something change in between in the kernel?

(+CC Javier, author of that commit)

Best regards,
Krzysztof

