Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B63FBC6FD1F
	for <platform-driver-x86@archiver.kernel.org>; Thu, 16 Mar 2023 15:16:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjCPPQf (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 16 Mar 2023 11:16:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230147AbjCPPQe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 11:16:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 251B4D3094
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 08:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678979735;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hdl2zHTfzwxoy7VDxCzRjqYkkFCvLTglkFX9+cjkB6E=;
        b=NcnM9H1G0UGJN1nY3cpsbkSHSxJ/C5rSfhN37OzXB2mylnCV1Zy4jw6YJZUmW03ePGBrup
        tSFCu/+xXq+FZTybScVTBmISK/QXIQ6cD594zrETIgfSywBSKOWJkh03+2/UEMMDI0VCs8
        BW1ayQl1kyJAiz0pkQtaRiUrWmeQVM4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-113-ynOA_MbyPNCmLGh0ybpcCQ-1; Thu, 16 Mar 2023 11:15:33 -0400
X-MC-Unique: ynOA_MbyPNCmLGh0ybpcCQ-1
Received: by mail-ed1-f70.google.com with SMTP id t14-20020a056402240e00b004fb36e6d670so3520537eda.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 08:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678979732;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hdl2zHTfzwxoy7VDxCzRjqYkkFCvLTglkFX9+cjkB6E=;
        b=Oh1UsCsSls8Bf4blmWqyYnyLf6eXMEdWdJq7QrloGnfNOg6FwAoIGbZVBbDbGa0RrE
         //2CmcFRg9w9AYIy2iNnha4lC78+9G/1fgHh+/aYX/5lRDy2f025Y4tYwXU2Y0jQoISB
         Ur38frABgP8tPpoqsaTsUTEw3Oabo8nxiX3trOtfwiCaUpS6R1p8lx4qIl6NGRLEqKL0
         PzbpZ0cq4NKAmLai0PKESYMtEixeW1UAsyclh3by02D2u5Sz/Fc3DWc5dZQezjHWwfh/
         bOy9pOnby0SKA5Um19MfoZm7Su7ZfBb+Svb5VStc4Nt2DcdHEVDfB7bmH6Az67ldyiUA
         tTSg==
X-Gm-Message-State: AO0yUKVDOoIf+6jzobs6WmMeXM8XzNAsMvVYQFP32kVV5bPB/qN5GFl4
        NN15YMUHPZC3g5X7LjIQ3+1v8tGBFlt4pf6YUrfDfwzye+XdMT64czZZ6tXFp1UaWHf3bo1tQR6
        W9QUzRcI2dBwRdV3e/2RzU0kAZqCQjAEzxg==
X-Received: by 2002:a17:906:ee84:b0:930:ff11:a85d with SMTP id wt4-20020a170906ee8400b00930ff11a85dmr1517193ejb.46.1678979732511;
        Thu, 16 Mar 2023 08:15:32 -0700 (PDT)
X-Google-Smtp-Source: AK7set9r8iLDTJljUBtooFQEo+zLouBkuuoX3dTFHvFQcAeBcci82QH9bZAWOTiAtpP3RNMdOVH5Og==
X-Received: by 2002:a17:906:ee84:b0:930:ff11:a85d with SMTP id wt4-20020a170906ee8400b00930ff11a85dmr1517167ejb.46.1678979732225;
        Thu, 16 Mar 2023 08:15:32 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id dt5-20020a170906b78500b008e82cb55195sm3965146ejb.203.2023.03.16.08.15.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 08:15:31 -0700 (PDT)
Message-ID: <7123b49c-1544-5ba0-80bf-94ee0c82d0f5@redhat.com>
Date:   Thu, 16 Mar 2023 16:15:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: pcengines-apuv2: Drop
 platform:pcengines-apuv2 module-alias
Content-Language: en-US, nl
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Enrico Weigelt <lkml@metux.net>
Cc:     Philip Prindeville <philipp@redfish-solutions.com>,
        Ed Wildgoose <lists@wildgooses.com>,
        platform-driver-x86@vger.kernel.org
References: <20230313130241.778146-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230313130241.778146-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/13/23 14:02, Hans de Goede wrote:
> The driver auto-loads based on the DMI modaliases and this platform
> modalias is not necessary and broken:
> 
> 1. Not necessary since the driver itself creates the platform_device,
>    so it is already loaded when the modalias might be used
> 2. From a quick scan of the code it does not create any platform-devices
>    called "platform:pcengines-apuv2"
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

I've added this to my review-hans (soon to be for-next) branch now.

Regards,

Hans


> ---
>  drivers/platform/x86/pcengines-apuv2.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/pcengines-apuv2.c
> index d063d91db9bc..3aa63b18a2e1 100644
> --- a/drivers/platform/x86/pcengines-apuv2.c
> +++ b/drivers/platform/x86/pcengines-apuv2.c
> @@ -291,5 +291,4 @@ MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
>  MODULE_DESCRIPTION("PC Engines APUv2/APUv3 board GPIO/LEDs/keys driver");
>  MODULE_LICENSE("GPL");
>  MODULE_DEVICE_TABLE(dmi, apu_gpio_dmi_table);
> -MODULE_ALIAS("platform:pcengines-apuv2");
>  MODULE_SOFTDEP("pre: platform:" AMD_FCH_GPIO_DRIVER_NAME " platform:leds-gpio platform:gpio_keys_polled");

