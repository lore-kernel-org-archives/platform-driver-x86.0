Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 993DCC6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 15:15:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbjCPPPZ (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 11:15:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230258AbjCPPPY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 11:15:24 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95000BE5C4
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 08:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678979672;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rgNFu0HUYKtw8RWi6zJrI5fEIZ3MEylYsjpsor26NCE=;
        b=XtR/IB2MgH3A5q5CL3NaAj6ovGLAf63xkENK9uJSL1vg4ehrqfqy7VstKhL5GKX6+poGO6
        Qmh4xMOWWzvdO4X0b9X80Ru7oyRp4ORqGn1M8gGjFLYaMYhkOzuMVFgHlLYwcUAn3XnkbM
        lmHCFCzVNR+lspLUbkjQxoYA47Qxri8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-Ii-XcVcUMdG1rwYjyqIH2A-1; Thu, 16 Mar 2023 11:14:31 -0400
X-MC-Unique: Ii-XcVcUMdG1rwYjyqIH2A-1
Received: by mail-ed1-f72.google.com with SMTP id fi8-20020a056402550800b004a26cc7f6cbso3534829edb.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 08:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678979669;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rgNFu0HUYKtw8RWi6zJrI5fEIZ3MEylYsjpsor26NCE=;
        b=lmfBqead1X9BeHy3qZzh5mH3qvioo8/dir3O1EWyumXu7jy/Lq1/tsr1PHkZibDoqp
         YyUgGCHXY2yOSwWHLN3S9nO0jVIeClZ+zK+YVKX9ewoAA3fOpJJpTX4xwBaTFoeyycvk
         0ktOJRwbHEHwrou/fL2mI02LYhgbtuhNSedMw8PCg6K+a4yzNsybHIbQk7/VzjXrhRJD
         MbPfJgAVWFJhcE9wJG3fElq4YfaJUW8bD34fJN9Oi6IrNiMTz8uKf9c/BUpGzhCT4RgJ
         zR2G+EV6QjPJhlPBtHJHSbGHImjlv/CeUnWgblqu+YuL/3Bg6kGABhMNbGy0xqbkP9yk
         FlFA==
X-Gm-Message-State: AO0yUKXjwRedot5MfYuo51UcX2JKws11NMyPvfmSTVOZJ+rMhimwUK2O
        a9axprgVbxfPAMmjyW4ZhP8fNydGhM/5npNCeOqw/I+aSmAJr3FMUcrJGd51sPoGZQ764gAEjaF
        FiXBvX6WCPmdJx5n4UZN92E+b8SxhF2LklD6rnWx5og==
X-Received: by 2002:aa7:cd94:0:b0:4fb:de7d:b05a with SMTP id x20-20020aa7cd94000000b004fbde7db05amr5654690edv.40.1678979669846;
        Thu, 16 Mar 2023 08:14:29 -0700 (PDT)
X-Google-Smtp-Source: AK7set+XIgp7QXQ3ba0FT49wfaNVrxVtnOUdiaK2i2AZkhtOMIBtu2Us/b2gwSqe74sClFcf3ZR6EA==
X-Received: by 2002:aa7:cd94:0:b0:4fb:de7d:b05a with SMTP id x20-20020aa7cd94000000b004fbde7db05amr5654664edv.40.1678979669562;
        Thu, 16 Mar 2023 08:14:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f16-20020a170906739000b008b1797b77b2sm3928248ejl.221.2023.03.16.08.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 08:14:29 -0700 (PDT)
Message-ID: <81eeac36-f80b-0f9f-2524-189d41b257a5@redhat.com>
Date:   Thu, 16 Mar 2023 16:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] platform: classmate: mark SPI related data as maybe
 unused
Content-Language: en-US, nl
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Thadeu Lima de Souza Cascardo <cascardo@holoscopio.com>,
        Daniel Oliveira Nascimento <don@syst.com.br>,
        Mattia Dongili <malattia@linux.it>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230312132624.352703-1-krzysztof.kozlowski@linaro.org>
 <20230312132624.352703-2-krzysztof.kozlowski@linaro.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230312132624.352703-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/12/23 14:26, Krzysztof Kozlowski wrote:
> The driver can be compile tested as built-in making certain data unused:
> 
>   drivers/platform/x86/classmate-laptop.c:1137:36: error: ‘cmpc_device_ids’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thank you for your patch, I've applied this patch and patch 3/3
to my review-hans branch:
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
>  drivers/platform/x86/classmate-laptop.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/classmate-laptop.c b/drivers/platform/x86/classmate-laptop.c
> index 8b6a14611859..2edaea2492df 100644
> --- a/drivers/platform/x86/classmate-laptop.c
> +++ b/drivers/platform/x86/classmate-laptop.c
> @@ -1134,7 +1134,7 @@ static void cmpc_exit(void)
>  module_init(cmpc_init);
>  module_exit(cmpc_exit);
>  
> -static const struct acpi_device_id cmpc_device_ids[] = {
> +static const struct acpi_device_id cmpc_device_ids[] __maybe_unused = {
>  	{CMPC_ACCEL_HID, 0},
>  	{CMPC_ACCEL_HID_V4, 0},
>  	{CMPC_TABLET_HID, 0},

