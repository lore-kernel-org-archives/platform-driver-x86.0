Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BB0CC001DE
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Aug 2023 20:04:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229731AbjHIUEb (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Aug 2023 16:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjHIUEb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Aug 2023 16:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5592310D8
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Aug 2023 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691611420;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8rnKEWBFLg7YYTkqe0xcAf969fJr0x8Fd+K32gXjng8=;
        b=NvFXS4eE9dwW/xuzg+xB9FP+nsqWjxSlQOy9v+lKVzvWgFUrXTvPfYjLGukW/bnOmFOC3S
        B1Mon9oeMZ9aT5r6LxMEjrPUy+NeOi0BHzjQndQoD07iZiNlqWfcjkdhWS6ojwqDA9xALY
        1xGOEJdvFlk6ir2+CRoVKYrt88E/qKw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-jgh0fgAvMaCRyFbZv1CPsA-1; Wed, 09 Aug 2023 16:03:38 -0400
X-MC-Unique: jgh0fgAvMaCRyFbZv1CPsA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-993eeb3a950so12762966b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Aug 2023 13:03:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691611417; x=1692216217;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rnKEWBFLg7YYTkqe0xcAf969fJr0x8Fd+K32gXjng8=;
        b=crq8RUHR7as7CG4Unf0kNI0bCN7wep2rab9AzO/YbrzZiJPD1Q+ELSNEZBvr307UbQ
         BWY+9sCvfyXaFmzmrUcoaKa2nFtvDGSnqo2TSMgNjLGjKTKFw/cZ2tmNfxdmzDd62HcR
         csLwXSUJeSDsx/2eVX4ic9k03E2whqml/v4Ftu0GBS22lN05wzGrS6rIDdLFB/gXeqOf
         1x/UxtYnOYof7/ibz2vlfSSzqHsnLUxe2NYY7WqpsgMEGzrWPYklwYbV+AIPTGgkOz41
         Ud9aLrsHpzzwH1MrEhoX9E3rXbtN/s/YRiBsJ0WnMptp6Ic2te+TzsTqGPitzxZIBZXq
         juyA==
X-Gm-Message-State: AOJu0Yw4KbYoGLkLip72h20HgH8v+mVgnJ77cSgN65ZXBjDUchZc2yhi
        vbP1TnPoSXruze8qkWvLCFLSnUfYLgNfeyijEH/o55bJ8wQbfjfUhvPnMcOWgzKex2/KIvpqtsb
        O6zHhWY/uH15Udqp+0L0FDClyh1cyvzOjSg==
X-Received: by 2002:a17:906:76d0:b0:94e:4489:f24d with SMTP id q16-20020a17090676d000b0094e4489f24dmr112001ejn.61.1691611417792;
        Wed, 09 Aug 2023 13:03:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmX8bb9KtcMZxHa4yaIj2lp52XlnNj3tMr9xCYD+5Y3XIPawZIIk2tzBaI7RFxdJjvy1Mivw==
X-Received: by 2002:a17:906:76d0:b0:94e:4489:f24d with SMTP id q16-20020a17090676d000b0094e4489f24dmr111989ejn.61.1691611417514;
        Wed, 09 Aug 2023 13:03:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id la4-20020a170906ad8400b0099bd682f317sm8253188ejb.206.2023.08.09.13.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 13:03:35 -0700 (PDT)
Message-ID: <31565090-2ccd-3ceb-bfff-c944e0399b20@redhat.com>
Date:   Wed, 9 Aug 2023 22:03:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] platform/x86/siemens: simatic-ipc-batt: fix wrong
 pointer pass to PTR_ERR()
Content-Language: en-US, nl
To:     Yang Yingliang <yangyingliang@huawei.com>,
        platform-driver-x86@vger.kernel.org
Cc:     markgross@kernel.org, henning.schild@siemens.com
References: <20230809081227.1221267-1-yangyingliang@huawei.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230809081227.1221267-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/9/23 10:12, Yang Yingliang wrote:
> Fix wrong pointer pass to PTR_ERR() if devm_gpiod_get_index() fails.
> 
> Fixes: 917f54340794 ("platform/x86: simatic-ipc: add CMOS battery monitoring")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

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
>  drivers/platform/x86/siemens/simatic-ipc-batt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/siemens/simatic-ipc-batt.c b/drivers/platform/x86/siemens/simatic-ipc-batt.c
> index d66b9969234b..15c08c4900b8 100644
> --- a/drivers/platform/x86/siemens/simatic-ipc-batt.c
> +++ b/drivers/platform/x86/siemens/simatic-ipc-batt.c
> @@ -198,7 +198,7 @@ int simatic_ipc_batt_probe(struct platform_device *pdev, struct gpiod_lookup_tab
>  			flags = GPIOD_OUT_LOW;
>  		priv.gpios[2] = devm_gpiod_get_index(dev, "CMOSBattery meter", 2, flags);
>  		if (IS_ERR(priv.gpios[2])) {
> -			err = PTR_ERR(priv.gpios[1]);
> +			err = PTR_ERR(priv.gpios[2]);
>  			priv.gpios[2] = NULL;
>  			goto out;
>  		}

